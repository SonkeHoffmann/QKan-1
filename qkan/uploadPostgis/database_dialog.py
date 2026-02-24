import os
from typing import Callable, List, Optional

from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import (
    QCheckBox,
    QDialog,
    QLabel,
    QLineEdit,
    QListWidget,
    QMessageBox,
    QProgressBar,
    QPushButton,
    QWidget,
    QFileDialog,
    QApplication,
)
from qgis.PyQt.QtCore import QSettings

from qkan.utils import get_logger

logger = get_logger("QKan.uploadPostgis.database_dialog")


class _DatabaseDialog(QDialog):
    def __init__(
        self,
        connection_name: str,
        default_dir: str,
        tr: Callable,
        parent: Optional[QWidget] = None,
    ):
        # noinspection PyArgumentList
        super().__init__(parent)
        self.setupUi(self)
        self.connection_name = connection_name
        self.default_dir = default_dir
        self.tr = tr


DATABASE_DIALOG_CLASS, _ = uic.loadUiType(
    os.path.join(os.path.dirname(__file__), "res", "uploadPostgis_database_dialog.ui")
)


class UploadPostgisDatabaseDialog(_DatabaseDialog, DATABASE_DIALOG_CLASS):  # type: ignore
    # Quelldatenbank-Auswahl
    listWidget_source_files: QListWidget
    pb_select_database: QPushButton
    pb_remove_file: QPushButton
    
    # Ziel-Schema-Auswahl
    listWidget_schemas: QListWidget
    pb_refresh_schemas: QPushButton
    cb_create_new_schema: QCheckBox
    le_new_schema_name: QLineEdit
    cb_overwrite_existing: QCheckBox
    
    # QGIS-Projekt Upload (Optional)
    cb_upload_project: QCheckBox
    le_project_file: QLineEdit
    pb_select_project: QPushButton
    le_project_name: QLineEdit
    label_project_name: QLabel
    
    # Control buttons
    pb_help: QPushButton
    pb_cancel: QPushButton
    pb_upload: QPushButton
    # SQL-Dump: pb_export_sql: QPushButton  # Neuer Button für SQL-Export
    
    # Info labels
    label_server_info: QLabel  # Label für Server-Info
    label_progress_tables: QLabel
    label_progress_records: QLabel
    
    # Progress bars
    progressBar_upload: QProgressBar  # Tabellen-Fortschritt
    progressBar_records: QProgressBar  # Datensatz-Fortschritt
    
    # Internal list to track selected files
    selected_files: List[str]
    
    # Connection status
    connection_available: bool
    
    # Aktive Datenbank (wird automatisch ermittelt)
    target_database: str
    
    # Projekt-Upload
    project_file_path: Optional[str]

    def __init__(
        self,
        connection_name: str,
        default_dir: str,
        tr: Callable,
        parent: Optional[QWidget] = None,
    ):
        super().__init__(connection_name, default_dir, tr, parent)
        
        # Initialize file list
        self.selected_files = []
        self.connection_available = False
        self.target_database = ""  # Wird beim Laden der Schemata gesetzt
        self.project_file_path = None  # Pfad zur QGIS-Projektdatei
        
        # Get actual host from settings for display
        settings = QSettings()
        if connection_name.lower() == "localhost":
            actual_host = "localhost:5432"
        else:
            base_key = f"PostgreSQL/connections/{connection_name}"
            host = settings.value(f"{base_key}/host", "unbekannt")
            port = settings.value(f"{base_key}/port", 5432)
            actual_host = f"{host}:{port}"
        
        # Set server info in label with actual host
        self.label_server_info.setText(f"Server: {connection_name} ({actual_host})")
        
        # Connect source database signals
        self.pb_select_database.clicked.connect(self.select_database_files)
        self.pb_remove_file.clicked.connect(self.remove_selected_file)
        self.listWidget_source_files.itemSelectionChanged.connect(self.on_source_file_selected)
        
        # Connect target schema signals
        self.pb_refresh_schemas.clicked.connect(self.refresh_schemas)
        self.cb_create_new_schema.toggled.connect(self.toggle_new_schema)
        self.listWidget_schemas.itemSelectionChanged.connect(self.on_schema_selected)
        self.le_new_schema_name.textChanged.connect(self.update_upload_button_state)
        
        # Connect control buttons
        self.pb_help.clicked.connect(self.show_help)
        self.pb_cancel.clicked.connect(self.reject)
        self.pb_upload.clicked.connect(self.start_upload)
        # SQL-Dump: self.pb_export_sql.clicked.connect(self.export_to_sql_dump)
        
        # Connect QGIS project upload signals
        self.cb_upload_project.toggled.connect(self.toggle_project_upload)
        self.pb_select_project.clicked.connect(self.select_project_file)
        self.le_project_file.textChanged.connect(self.on_project_file_changed)
        
        # Load available schemas
        self.load_schemas()
        
        # Initial state - upload button and remove button disabled
        self.pb_upload.setEnabled(False)
        self.pb_remove_file.setEnabled(False)
        
        # Initialize progress bars
        self.progressBar_upload.setValue(0)
        self.progressBar_upload.setFormat("%v / %m Tabellen")
        self.progressBar_records.setValue(0)
        self.progressBar_records.setFormat("%v / %m Datensätze")
        self.label_progress_tables.setText("Tabellen:")
        self.label_progress_records.setText("Datensätze:")

    def toggle_project_upload(self, checked: bool):
        """QGIS-Projekt-Upload Option umschalten"""
        self.le_project_file.setEnabled(checked)
        self.pb_select_project.setEnabled(checked)
        self.le_project_name.setEnabled(checked)
        self.label_project_name.setEnabled(checked)
        
        if checked:
            # Versuche aktuelles Projekt zu ermitteln
            from qgis.core import QgsProject
            current_project = QgsProject.instance()
            
            if current_project and current_project.fileName():
                # Aktuelles Projekt ist vorhanden
                self.le_project_file.setText(f"[Aktuelles Projekt: {os.path.basename(current_project.fileName())}]")
                self.le_project_file.setStyleSheet("color: green;")
                self.project_file_path = None  # None bedeutet "aktuelles Projekt verwenden"
                
                # Projektname aus Datei ableiten
                if not self.le_project_name.text():
                    project_base_name = os.path.splitext(os.path.basename(current_project.fileName()))[0]
                    self.le_project_name.setText(project_base_name)
            else:
                self.le_project_file.setPlaceholderText("Kein Projekt geöffnet - bitte Datei auswählen")
                self.le_project_file.setStyleSheet("")
        else:
            self.le_project_file.setStyleSheet("")
            self.project_file_path = None
        
        # Button-State aktualisieren, da Projekt als Quelle gilt
        self.update_upload_button_state()

    def select_project_file(self):
        """QGIS-Projektdatei auswählen"""
        file_dialog = QFileDialog()
        file_dialog.setWindowTitle("QGIS-Projektdatei auswählen")
        file_dialog.setFileMode(QFileDialog.ExistingFile)
        file_dialog.setNameFilter("QGIS-Projekte (*.qgs *.qgz);;Alle Dateien (*.*)")

        if self.default_dir and os.path.exists(self.default_dir):
            file_dialog.setDirectory(self.default_dir)
        
        if file_dialog.exec_() == QFileDialog.Accepted:
            selected_file = file_dialog.selectedFiles()[0]
            if selected_file:
                self.project_file_path = selected_file
                self.le_project_file.setText(selected_file)
                self.le_project_file.setStyleSheet("color: blue;")
                
                # Projektname aus Datei ableiten falls leer
                if not self.le_project_name.text():
                    project_base_name = os.path.splitext(os.path.basename(selected_file))[0]
                    self.le_project_name.setText(project_base_name)
                
                logger.info(f"QGIS-Projektdatei ausgewählt: {selected_file}")

    def on_project_file_changed(self, text: str):
        """Reagiert auf Änderung der Projektdatei"""
        # Wenn Projekt-Upload aktiv ist, aber keine Datei und kein aktuelles Projekt
        if self.cb_upload_project.isChecked():
            from qgis.core import QgsProject
            current_project = QgsProject.instance()
            
            has_project = (bool(text and text != "") or 
                          (current_project and current_project.fileName()))
            
            if not has_project:
                self.le_project_file.setStyleSheet("color: red;")
            elif text.startswith("[Aktuelles Projekt"):
                self.le_project_file.setStyleSheet("color: green;")
            else:
                self.le_project_file.setStyleSheet("color: blue;")

    def select_database_files(self):
        """Mehrere QKan-SQLite-Datenbank-Dateien auswählen"""
        file_dialog = QFileDialog()
        file_dialog.setWindowTitle("QKan SQLite-Datenbanken auswählen")
        file_dialog.setFileMode(QFileDialog.ExistingFiles)  # Mehrere Dateien erlauben
        # Erweitere Filter um alle gängigen SQLite-Endungen
        file_dialog.setNameFilter("SQLite-Datenbanken (*.sqlite *.sqlite3 *.db *.gpkg);;Alle Dateien (*.*)")

        # Standard-Ordner setzen
        if self.default_dir and os.path.exists(self.default_dir):
            file_dialog.setDirectory(self.default_dir)
        
        if file_dialog.exec_() == QFileDialog.Accepted:
            new_files = file_dialog.selectedFiles()
            if new_files:
                # Nur neue Dateien hinzufügen (keine Duplikate)
                for file_path in new_files:
                    if file_path not in self.selected_files:
                        self.selected_files.append(file_path)
                        # Zeige vollständigen Pfad für Klarheit
                        self.listWidget_source_files.addItem(file_path)
                        logger.info(f"Datenbank-Datei hinzugefügt: {file_path}")
                
                self.update_upload_button_state()

    def remove_selected_file(self):
        """Ausgewählte Datei aus der Liste entfernen"""
        current_item = self.listWidget_source_files.currentItem()
        if current_item:
            current_row = self.listWidget_source_files.row(current_item)
            # Entferne aus der internen Liste
            if 0 <= current_row < len(self.selected_files):
                removed_file = self.selected_files.pop(current_row)
                logger.info(f"Datenbank-Datei entfernt: {removed_file}")
            
            # Entferne aus der UI-Liste
            self.listWidget_source_files.takeItem(current_row)
            self.update_upload_button_state()

    def on_source_file_selected(self):
        """Reagiert auf Auswahl einer Quelldatei in der Liste"""
        has_selection = self.listWidget_source_files.currentItem() is not None
        self.pb_remove_file.setEnabled(has_selection)

    def on_schema_selected(self):
        """Reagiert auf Auswahl eines Ziel-Schemas"""
        self.update_upload_button_state()

    def update_upload_button_state(self):
        """Upload-Button aktivieren/deaktivieren je nach Eingaben"""
        # Mindestens eine Quelle muss vorhanden sein: SQLite-Dateien ODER QGIS-Projekt
        has_source = len(self.selected_files) > 0 or self.cb_upload_project.isChecked()
        has_target = (self.listWidget_schemas.currentItem() is not None or 
                      self.cb_create_new_schema.isChecked())
        
        if self.cb_create_new_schema.isChecked():
            has_target = bool(self.le_new_schema_name.text().strip())
        
        self.pb_upload.setEnabled(has_source and has_target)

    def refresh_schemas(self):
        """Schema-Liste aktualisieren"""
        self.load_schemas()

    def toggle_new_schema(self, checked: bool):
        """Neues Schema-Option umschalten"""
        self.le_new_schema_name.setEnabled(checked)
        if checked:
            self.le_new_schema_name.setFocus()
        self.update_upload_button_state()

    # SQL-Dump: Gesamte Methode export_to_sql_dump() deaktiviert
    # def export_to_sql_dump(self):
    #     """Exportiert SQLite-Dateien als SQL-Dump für GBD WebSuite"""
    #     if not self.selected_files:
    #         QMessageBox.warning(
    #             self,
    #             "SQL-Export",
    #             "Bitte wählen Sie zuerst mindestens eine SQLite-Datenbank aus."
    #         )
    #         return
    #
    #     from .export_sql_dump import export_to_sql_dump
    #
    #     exported_files = []
    #
    #     for source_file in self.selected_files:
    #         # Ausgabedatei-Namen generieren
    #         base_name = os.path.splitext(source_file)[0]
    #         default_output = f"{base_name}_websuite.sql"
    #
    #         # Datei-Dialog für Ausgabe
    #         output_file, _ = QFileDialog.getSaveFileName(
    #             self,
    #             f"SQL-Dump speichern für: {os.path.basename(source_file)}",
    #             default_output,
    #             "SQL-Dateien (*.sql);;Alle Dateien (*.*)"
    #         )
    #
    #         if not output_file:
    #             logger.info(f"Export abgebrochen für {source_file}")
    #             continue
    #
    #         try:
    #             logger.info(f"Exportiere {source_file} nach {output_file}")
    #             success = export_to_sql_dump(source_file, output_file, schema_name="qkan")
    #
    #             if success:
    #                 exported_files.append(output_file)
    #                 logger.info(f"✓ Export erfolgreich: {output_file}")
    #
    #         except Exception as e:
    #             QMessageBox.critical(
    #                 self,
    #                 "Export fehlgeschlagen",
    #                 f"Fehler beim Exportieren von {os.path.basename(source_file)}:\n\n{str(e)}"
    #             )
    #             logger.error(f"SQL-Export fehlgeschlagen für {source_file}: {e}")
    #
    #     # Zusammenfassung anzeigen
    #     if exported_files:
    #         file_list = "\n".join([f"• {os.path.basename(f)}" for f in exported_files])
    #
    #         QMessageBox.information(
    #             self,
    #             "Export erfolgreich",
    #             f"✓ {len(exported_files)} SQL-Dump(s) erfolgreich erstellt:\n\n{file_list}\n\n"
    #             f"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    #             f"NÄCHSTE SCHRITTE (GBD WebSuite):\n"
    #             f"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n"
    #             f"1. Datei auf Server kopieren:\n"
    #             f"   scp datei.sql user@server:/tmp/\n\n"
    #             f"2. Per SSH verbinden:\n"
    #             f"   ssh user@server\n\n"
    #             f"3. SQL-Dump importieren:\n"
    #             f"   psql -d websuite_db -f /tmp/datei.sql\n\n"
    #             f"4. Tabellen prüfen:\n"
    #             f"   psql -d websuite_db -c '\\dt qkan.*'\n\n"
    #             f"Alternativ: Import über pgAdmin, DBeaver\n"
    #             f"oder WebSuite Admin-Interface (falls vorhanden)"
    #         )

    def show_help(self):
        """Hilfe anzeigen"""
        help_text = """
QKan PostGIS Datenbank-Upload / SQL-Export

=== FÜR GBD WEBSUITE ===
Wenn Sie eine GBD WebSuite verwenden und KEINEN direkten PostgreSQL-Zugriff 
haben, wenden Sie sich an den Administrator.

QUELLDATENBANKEN AUSWÄHLEN:
• Klicken Sie auf "Hinzufügen..." um QKan SQLite-Datenbanken auszuwählen
• Unterstützte Formate: .sqlite, .sqlite3, .db, .gpkg
• Mehrere Dateien können gleichzeitig ausgewählt werden
• Mit "Entfernen" können Sie Dateien aus der Liste löschen
• OPTIONAL: Sie können auch NUR ein QGIS-Projekt hochladen (siehe unten)

QGIS-PROJEKT HOCHLADEN (Optional):
• Aktivieren Sie "QGIS-Projekt hochladen"
• Verwenden Sie das aktuell geöffnete Projekt ODER wählen Sie eine .qgs/.qgz Datei
• Kann zusammen mit Datenbanken ODER alleine hochgeladen werden
• Nur eine Projektdatei wird pro Schema gespeichert (alte wird überschrieben)

ZIEL-SCHEMA AUSWÄHLEN:
• Die Zieldatenbank wird automatisch ermittelt (erste verfügbare)
• Wählen Sie ein bestehendes Schema aus der Liste ODER
• Erstellen Sie ein neues Schema (nur Buchstaben, Zahlen, Unterstriche)
• Mit "Bestehende Tabellen überschreiben" werden vorhandene Daten ersetzt

OPTION 1: DIREKTER UPLOAD (wenn PostgreSQL-Port erreichbar)
• Schema aus der Liste wählen ODER neues Schema erstellen
• Wählen Sie SQLite-Datenbanken UND/ODER QGIS-Projekt
• Klicken Sie "Upload starten"

OPTIONEN:
• Bestehende Tabellen überschreiben: Löscht vorhandene Tabellen im Schema
  vor dem Import (ACHTUNG: Datenverlust!)

UPLOAD-PROZESS (Direkter Upload):
1. SQLite-Datenbank analysieren (falls ausgewählt)
2. PostGIS-Tabellen im gewählten Schema erstellen
3. Geometrien konvertieren und übertragen
4. Spatial-Indizes erstellen
5. QGIS-Projekt hochladen (falls aktiviert)
6. Layer zu QGIS hinzufügen (optional)

HINWEISE:
• PostGIS-Erweiterung wird automatisch aktiviert falls nötig
• Geometrien werden mit korrektem SRID übertragen
• Der Upload kann je nach Datenmenge einige Minuten dauern
• Sie können NUR ein Projekt, NUR Datenbanken oder BEIDES hochladen

GBD WEBSUITE SPEZIFISCH:
• Bei Verbindungsproblemen: Prüfen Sie Firewall/SSH-Tunnel
• Standard-Port: 5432 (oft nur über VPN/SSH erreichbar)
        """
        
        QMessageBox.information(
            self,
            "Hilfe - PostGIS Upload",
            help_text
        )

    def start_upload(self):
        """Upload-Prozess für mehrere Dateien starten"""
        # Validierung: Mindestens SQLite-Dateien ODER QGIS-Projekt muss ausgewählt sein
        has_database_files = len(self.selected_files) > 0
        has_project = self.cb_upload_project.isChecked()
        
        if not has_database_files and not has_project:
            QMessageBox.warning(
                self,
                "Validierungsfehler",
                "Bitte wählen Sie mindestens eine QKan SQLite-Quelldatenbank aus\nODER aktivieren Sie den QGIS-Projekt-Upload."
            )
            return
        
        # Prüfe ob alle Dateien existieren (falls welche ausgewählt wurden)
        if has_database_files:
            missing_files = [f for f in self.selected_files if not os.path.exists(f)]
            if missing_files:
                QMessageBox.warning(
                    self,
                    "Validierungsfehler",
                    f"Folgende Dateien existieren nicht:\n" + "\n".join(missing_files)
                )
                return
        
        # SQL-Dump: Fallback auf SQL-Dump Export deaktiviert
        # if not self.connection_available and has_database_files:
        #     reply = QMessageBox.question(
        #         self,
        #         "Keine Datenbankverbindung",
        #         "Es konnte keine Verbindung zum PostgreSQL-Server hergestellt werden.\n\n"
        #         "Möchten Sie stattdessen einen SQL-Dump exportieren?\n"
        #         "Dieser kann dann manuell auf dem Server importiert werden.",
        #         QMessageBox.Yes | QMessageBox.No,
        #         QMessageBox.Yes
        #     )
        #
        #     if reply == QMessageBox.Yes:
        #         self.export_to_sql_dump()
        #     return
        if not self.connection_available and has_database_files:
            QMessageBox.critical(
                self,
                "Keine Datenbankverbindung",
                "Es konnte keine Verbindung zum PostgreSQL-Server hergestellt werden.\n\n"
                "Bitte prüfen Sie die Verbindungseinstellungen."
            )
            return
        elif not self.connection_available:
            # Nur Projekt-Upload, aber keine Verbindung
            QMessageBox.critical(
                self,
                "Keine Datenbankverbindung",
                "Es konnte keine Verbindung zum PostgreSQL-Server hergestellt werden.\n\n"
                "Für den Projekt-Upload ist eine aktive Verbindung erforderlich."
            )
            return
        
        # Ziel-Schema validieren
        target_schema = None
        if self.cb_create_new_schema.isChecked():
            new_schema_name = self.le_new_schema_name.text().strip()
            if not new_schema_name:
                QMessageBox.warning(
                    self,
                    "Validierungsfehler",
                    "Bitte geben Sie einen Namen für das neue Schema ein."
                )
                self.le_new_schema_name.setFocus()
                return
            
            # Validierung des Schema-Namens
            if not self.is_valid_schema_name(new_schema_name):
                QMessageBox.warning(
                    self,
                    "Validierungsfehler", 
                    "Ungültiger Schema-Name. Verwenden Sie nur Buchstaben, Zahlen und Unterstriche.\nDer Name darf nicht mit einer Zahl beginnen."
                )
                self.le_new_schema_name.setFocus()
                return
            
            target_schema = new_schema_name
        else:
            # Bestehendes Schema ausgewählt
            if not self.listWidget_schemas.currentItem():
                QMessageBox.warning(
                    self,
                    "Validierungsfehler",
                    "Bitte wählen Sie ein Schema aus der Liste aus."
                )
                return
            target_schema = self.listWidget_schemas.currentItem().text()
        
        # Warnung bei Überschreiben
        if self.cb_overwrite_existing.isChecked():
            reply = QMessageBox.question(
                self,
                "Bestätigung erforderlich",
                f"ACHTUNG: Bestehende Tabellen im Schema '{target_schema}' werden überschrieben!\n\nAlle vorhandenen Daten im Schema gehen verloren.\n\nMöchten Sie fortfahren?",
                QMessageBox.Yes | QMessageBox.No,
                QMessageBox.No
            )
            
            if reply != QMessageBox.Yes:
                return
        
        # Upload aller Dateien starten
        try:
            successful_uploads = 0
            failed_uploads = []
            total_files = len(self.selected_files)
            
            # UI während Upload deaktivieren
            self.pb_upload.setEnabled(False)
            self.pb_cancel.setEnabled(False)
            
            # Nur SQLite-Dateien hochladen wenn welche vorhanden sind
            if has_database_files:
                for file_index, source_file in enumerate(self.selected_files):
                    try:
                        # Fortschrittsanzeige für mehrere Dateien
                        if total_files > 1:
                            self.label_progress_tables.setText(f"Datei {file_index + 1}/{total_files}: {os.path.basename(source_file)}")
                            QApplication.processEvents()
                        
                        logger.info(f"Starte Upload von: {source_file}")
                        self.perform_upload(
                            connection_name=self.connection_name,
                            target_database=self.target_database,
                            target_schema=target_schema,
                            source_file=source_file,
                            overwrite=self.cb_overwrite_existing.isChecked()
                        )
                        successful_uploads += 1
                    except Exception as e:
                        failed_uploads.append((os.path.basename(source_file), str(e)))
                        logger.error(f"Upload fehlgeschlagen für {source_file}: {str(e)}")
            
            # UI wieder aktivieren
            self.pb_upload.setEnabled(True)
            self.pb_cancel.setEnabled(True)
            
            # Zusammenfassung anzeigen (nur bei Fehlern)
            if failed_uploads:
                error_details = "\n".join([f"• {name}: {error}" for name, error in failed_uploads])
                QMessageBox.warning(
                    self,
                    "Upload teilweise erfolgreich",
                    f"Erfolgreich hochgeladen: {successful_uploads} von {total_files} Dateien\n\n"
                    f"Fehlgeschlagene Uploads:\n{error_details}"
                )
            # Bei Erfolg: Kein Dialog, nur Logging
            elif has_database_files:
                logger.info(f"Upload erfolgreich: {successful_uploads} Datenbank(en) nach '{self.target_database}.{target_schema}' hochgeladen")
            
            # QGIS-Projekt hochladen (optional, wenn aktiviert)
            # Erlaubt jetzt auch Projekt-Upload OHNE vorherige Daten-Uploads
            if self.cb_upload_project.isChecked():
                try:
                    self.upload_qgis_project(target_schema)
                    if not has_database_files:
                        # Nur Projekt wurde hochgeladen
                        logger.info(f"Projekt-Upload erfolgreich nach '{self.target_database}.{target_schema}'")
                except Exception as proj_error:
                    error_message = f"Projekt-Upload fehlgeschlagen:\n\n{str(proj_error)}"
                    if has_database_files and successful_uploads > 0:
                        error_message = f"Die Daten wurden erfolgreich hochgeladen, aber der Projekt-Upload ist fehlgeschlagen:\n\n{str(proj_error)}"
                    QMessageBox.warning(
                        self,
                        "Projekt-Upload fehlgeschlagen",
                        error_message
                    )
                    logger.error(f"QGIS-Projekt-Upload fehlgeschlagen: {str(proj_error)}")
            
            self.accept()
            
        except Exception as e:
            QMessageBox.critical(
                self,
                "Upload fehlgeschlagen",
                f"Fehler beim Upload:\n\n{str(e)}"
            )
            logger.error(f"Upload fehlgeschlagen: {str(e)}")
    
    def perform_upload(self, connection_name: str, target_database: str, target_schema: str, source_file: str, overwrite: bool):
        """Führt den Upload durch mit Fortschrittsanzeige"""
        from ._uploadPostgis import UploadPostgisTask
        
        logger.info(f"perform_upload aufgerufen: connection={connection_name}, db={target_database}, schema={target_schema}, file={source_file}")
        
        # Reset progress bars
        self.progressBar_upload.setValue(0)
        self.progressBar_records.setValue(0)
        self.label_progress_tables.setText(f"Starte Upload: {os.path.basename(source_file)}")
        self.label_progress_records.setText("Datensätze: bereit")
        QApplication.processEvents()
        
        # Upload-Task erstellen mit Callbacks für Fortschritt
        task = UploadPostgisTask(
            server_connection=connection_name,
            target_database=target_database,
            source_database_file=source_file,
            schema_name=target_schema,
            overwrite=overwrite,
            progress_bar=self.progressBar_upload,
            progress_callback=self.update_progress_status,
        )
        
        # Zweite Progress Bar für Datensätze an Task übergeben
        task.progress_bar_records = self.progressBar_records
        task.record_progress_callback = self.update_record_progress
        
        success = task.run()
        
        if not success:
            from qkan.utils import QkanError
            raise QkanError("Upload-Task wurde nicht erfolgreich abgeschlossen")
        
        # Upload abgeschlossen
        self.progressBar_upload.setValue(self.progressBar_upload.maximum())
        self.progressBar_records.setValue(self.progressBar_records.maximum())
        self.label_progress_tables.setText("Tabellen: Upload abgeschlossen!")
        self.label_progress_records.setText("Datensätze: Upload abgeschlossen!")
        QApplication.processEvents()
        
        # Detaillierte Zusammenfassung im Log und Dialog anzeigen
        logger.info("=" * 60)
        logger.info("UPLOAD-ZUSAMMENFASSUNG für: " + os.path.basename(source_file))
        logger.info("=" * 60)
        logger.info(f"Tabellen mit Daten:         {len(task.tables_with_data)}")
        logger.info(f"Tabellen ohne Daten (leer): {len(task.tables_empty)}")
        logger.info(f"Tabellen übersprungen:      {len(task.tables_skipped)}")
        logger.info(f"Tabellen fehlgeschlagen:    {len(task.tables_failed)}")
        
        # Tabellen mit Daten
        if task.tables_with_data:
            logger.info("-" * 60)
            logger.info("GEFÜLLTE TABELLEN:")
            total_records = 0
            for t in sorted(task.tables_with_data, key=lambda x: x['name']):
                geom_marker = " [Geometrie]" if t['has_geometry'] else ""
                logger.info(f"  ✓ {t['name']}: {t['records']} Datensätze{geom_marker}")
                total_records += t['records']
            logger.info(f"  → Gesamt: {total_records} Datensätze")
        
        # Leere Tabellen
        if task.tables_empty:
            logger.info("-" * 60)
            logger.info("LEERE TABELLEN (Struktur übertragen, keine Daten):")
            for name in sorted(task.tables_empty):
                logger.info(f"  ○ {name}")
        
        # Übersprungene Tabellen
        if task.tables_skipped:
            logger.info("-" * 60)
            logger.info("ÜBERSPRUNGENE TABELLEN:")
            for t in sorted(task.tables_skipped, key=lambda x: x['name']):
                logger.info(f"  - {t['name']}: {t['reason']}")
        
        # Fehlgeschlagene Tabellen
        if task.tables_failed:
            logger.info("-" * 60)
            logger.info("FEHLGESCHLAGENE TABELLEN:")
            for t in sorted(task.tables_failed, key=lambda x: x['name']):
                logger.info(f"  ✗ {t['name']}: {t['reason']}")
        
        logger.info("=" * 60)
        logger.info("Upload-Prozess erfolgreich abgeschlossen")
    
    def update_progress_status(self, current: int, total: int, message: str):
        """Callback für Fortschrittsupdate von UploadPostgisTask"""
        self.progressBar_upload.setMaximum(total)
        self.progressBar_upload.setValue(current)
        self.label_progress_tables.setText(message)
        QApplication.processEvents()
    
    def update_record_progress(self, current: int, total: int, table_name: str):
        """Callback für Datensatz-Fortschrittsupdate"""
        self.progressBar_records.setMaximum(total)
        self.progressBar_records.setValue(current)
        self.label_progress_records.setText(f"{table_name}: {current}/{total} Datensätze")
        QApplication.processEvents()
    
    def is_valid_schema_name(self, name: str) -> bool:
        """Validiert einen Schema-Namen"""
        import re
        # PostgreSQL Schema-Name-Regeln (gleich wie Datenbankname)
        pattern = r'^[a-zA-Z_][a-zA-Z0-9_]*$'
        return bool(re.match(pattern, name)) and len(name) <= 63

    def load_schemas(self):
        """Verfügbare Schemata vom PostGIS-Server laden"""
        self.listWidget_schemas.clear()
        
        # Verbindungsparameter aus QSettings laden
        settings = QSettings()
        
        # Für localhost: Aktuellen Benutzer verwenden
        if self.connection_name.lower() == "localhost":
            import getpass
            host = "localhost"
            port = 5432
            database = 'postgres'
            username = getpass.getuser()
            password = ""
            ssl_mode = "prefer"
            self.target_database = database
            logger.info(f"Localhost-Verbindung: {username}@{host}:{port}")
        else:
            base_key = f"PostgreSQL/connections/{self.connection_name}"
            host = settings.value(f"{base_key}/host", "")
            port = int(settings.value(f"{base_key}/port", 5432))
            self.target_database = settings.value(f"{base_key}/database", "")
            # Fallback: wenn keine Datenbank konfiguriert, postgres-Systemdatenbank verwenden
            if not self.target_database:
                self.target_database = "postgres"
                logger.info("Keine Datenbank in Verbindungseinstellungen - verwende 'postgres' als Fallback")
            database = self.target_database
            username = settings.value(f"{base_key}/username", "")
            password = settings.value(f"{base_key}/password", "")
            ssl_mode = settings.value(f"{base_key}/sslmode", "prefer")
            
            logger.info(f"WebSuite-Verbindung: {username}@{host}:{port} (sslmode={ssl_mode})")
        
        if not host:
            self.listWidget_schemas.addItem("Fehler: Kein Host konfiguriert")
            logger.error(f"Kein Host für Verbindung '{self.connection_name}' gefunden")
            return
            
        if not username:
            self.listWidget_schemas.addItem("Fehler: Kein Benutzername konfiguriert")
            logger.error(f"Kein Benutzername für Verbindung '{self.connection_name}' gefunden")
            return
        
        try:
            import psycopg2
            import socket
            
            # DNS-Auflösung testen und protokollieren
            resolved_host = host
            try:
                ip_info = socket.getaddrinfo(host, port, socket.AF_INET)
                if ip_info:
                    resolved_ip = ip_info[0][4][0]
                    logger.info(f"DNS aufgelöst: {host} -> {resolved_ip}")
                    # Verwende aufgelöste IP für Verbindung
                    resolved_host = resolved_ip
            except socket.gaierror as dns_error:
                logger.warning(f"DNS-Auflösung fehlgeschlagen für {host}: {dns_error}")
                # Verwende Original-Hostname
            
            # # Schritt 1: Verbindung zu postgres-Datenbank um erste verfügbare DB zu finden
            # conn_string = (
            #     f"host='{resolved_host}' "
            #     f"port={port} "
            #     f"dbname='{database}' "
            #     f"user='{username}' "
            #     f"password='{password}' "
            #     f"sslmode='{ssl_mode}' "
            #     f"connect_timeout=10"
            # )
            #
            # logger.info(f"Verbinde zu: {username}@{resolved_host}:{port}/postgres")
            #
            # conn = psycopg2.connect(conn_string)
            # cursor = conn.cursor()
            
            # # Server-Version für Debug
            # cursor.execute("SELECT version()")
            # server_version = cursor.fetchone()[0]
            # logger.info(f"Verbunden mit: {server_version[:50]}...")
            #
            # # Erste verfügbare Benutzer-Datenbank finden
            # parameters = {'database': }
            # cursor.execute("""
            #     SELECT datname
            #     FROM pg_database
            #     WHERE datistemplate = false
            #     AND datname NOT IN ('postgres', 'template0', 'template1')
            #     AND datname = ':database'
            #     ORDER BY datname
            #     LIMIT 1
            # """, )
            #
            # db_result = cursor.fetchone()
            # cursor.close()
            # conn.close()
            #
            # if not db_result:
            #     self.listWidget_schemas.addItem("(Keine Benutzer-Datenbanken gefunden)")
            #     logger.info(f"Keine Benutzer-Datenbanken auf {host} gefunden")
            #     return
            
            # Zieldatenbank setzen
            # self.target_database = db_result[0]
            logger.info(f"Verwende Datenbank: {self.target_database}")
            
            # Server-Info Label aktualisieren mit Datenbank
            self.label_server_info.setText(
                f"Server: {self.connection_name} ({host}:{port}) - Datenbank: {self.target_database}"
            )
            
            # Schritt 2: Mit Zieldatenbank verbinden und Schemata laden
            conn_string = (
                f"host='{resolved_host}' "
                f"port={port} "
                f"dbname='{self.target_database}' "
                f"user='{username}' "
                f"password='{password}' "
                f"sslmode='{ssl_mode}' "
                f"connect_timeout=10"
            )
            
            conn = psycopg2.connect(conn_string)
            cursor = conn.cursor()
            
            # Alle Benutzer-Schemata abfragen (außer System-Schemata)
            cursor.execute("""
                SELECT schema_name 
                FROM information_schema.schemata 
                WHERE schema_name NOT IN ('pg_catalog', 'information_schema', 'pg_toast', 'pg_temp_1', 'pg_toast_temp_1')
                AND schema_name NOT LIKE 'pg_%'
                ORDER BY schema_name
            """)
            
            schemas = cursor.fetchall()
            
            if schemas:
                logger.info(f"Gefundene Schemata in {self.target_database}: {[s[0] for s in schemas]}")
                for schema in schemas:
                    self.listWidget_schemas.addItem(schema[0])
            else:
                self.listWidget_schemas.addItem("(Keine Benutzer-Schemata gefunden)")
                logger.info(f"Keine Benutzer-Schemata in {self.target_database} gefunden")
            
            cursor.close()
            conn.close()
            
            # Verbindung war erfolgreich
            self.connection_available = True
            
        except ImportError:
            self.listWidget_schemas.addItem("Fehler: psycopg2 nicht installiert")
            logger.error("psycopg2 nicht installiert")
            self.connection_available = False
            # SQL-Dump: self._show_sql_export_hint()
        except psycopg2.OperationalError as e:
            error_msg = str(e)
            self.listWidget_schemas.addItem(f"Verbindungsfehler: {error_msg[:50]}...")
            # SQL-Dump: self.listWidget_schemas.addItem("💡 Tipp: Verwenden Sie 'Als SQL-Dump exportieren'")
            logger.error(f"PostGIS Verbindungsfehler zu {host}:{port}: {error_msg}")
            self.connection_available = False
            # SQL-Dump: self._show_sql_export_hint()
        except Exception as e:
            self.listWidget_schemas.addItem(f"Fehler: {str(e)[:50]}...")
            # SQL-Dump: self.listWidget_schemas.addItem("💡 Tipp: Verwenden Sie 'Als SQL-Dump exportieren'")
            logger.error(f"Unerwarteter Fehler beim Laden der Schemata von {host}: {e}")
            self.connection_available = False
            # SQL-Dump: self._show_sql_export_hint()
    
    # SQL-Dump: Gesamte Methode _show_sql_export_hint() deaktiviert
    # def _show_sql_export_hint(self):
    #     """Zeigt Hinweis für SQL-Export bei Verbindungsproblemen"""
    #     # Update Label mit Hinweis
    #     current_text = self.label_server_info.text()
    #     if "Kein direkter Zugriff" not in current_text:
    #         self.label_server_info.setText(
    #             f"{current_text} - Kein direkter Zugriff möglich"
    #         )

    def upload_qgis_project(self, schema: str):
        """Lädt das QGIS-Projekt in die PostgreSQL-Datenbank hoch."""
        from qgis.core import QgsProject
        import psycopg2
        import gzip
        import json
        from datetime import datetime
        
        logger.info("Starte QGIS-Projekt-Upload...")
        
        # Projektname ermitteln mit websuite_ Präfix
        project_name = self.le_project_name.text().strip()
        if not project_name:
            project_name = f"qkan_project_{schema}"
        
        # Füge websuite_ Präfix hinzu falls nicht vorhanden
        if not project_name.startswith('websuite_'):
            project_name = f"websuite_{project_name}"
        
        # Projekt-XML ermitteln
        project_xml = None
        
        if self.project_file_path:
            # Von Datei laden
            logger.info(f"Lade Projekt aus Datei: {self.project_file_path}")
            
            if self.project_file_path.endswith('.qgz'):
                import zipfile, tempfile
                with zipfile.ZipFile(self.project_file_path, 'r') as zip_ref:
                    qgs_files = [f for f in zip_ref.namelist() if f.endswith('.qgs')]
                    if not qgs_files:
                        raise Exception("Keine .qgs-Datei in .qgz gefunden")
                    
                    with tempfile.TemporaryDirectory() as temp_dir:
                        zip_ref.extract(qgs_files[0], temp_dir)
                        with open(os.path.join(temp_dir, qgs_files[0]), 'r', encoding='utf-8') as f:
                            project_xml = f.read()
            else:
                with open(self.project_file_path, 'r', encoding='utf-8') as f:
                    project_xml = f.read()
        else:
            # Aktuelles Projekt verwenden
            current_project = QgsProject.instance()
            if not current_project or not current_project.fileName():
                raise Exception("Kein QGIS-Projekt geöffnet")
            project_xml = current_project.write()
            if not project_xml:
                raise Exception("Projekt konnte nicht als XML exportiert werden")
        
        if not project_xml:
            raise Exception("Kein Projekt-XML verfügbar")
        
        # XML zu Bytes konvertieren und mit gzip komprimieren
        project_bytes = project_xml.encode('utf-8')
        compressed_content = gzip.compress(project_bytes)
        
        # Verbindung herstellen
        settings = QSettings()
        if self.connection_name.lower() == "localhost":
            import getpass
            host, port, username, password = "localhost", 5432, getpass.getuser(), ""
        else:
            base_key = f"PostgreSQL/connections/{self.connection_name}"
            host = settings.value(f"{base_key}/host", "localhost")
            port = int(settings.value(f"{base_key}/port", 5432))
            username = settings.value(f"{base_key}/username", "postgres")
            password = settings.value(f"{base_key}/password", "")
        
        # Aktuellen Benutzernamen ermitteln
        current_user = settings.value(f"PostgreSQL/connections/{self.connection_name}/username", username)
        
        conn = psycopg2.connect(
            f"host='{host}' port={port} dbname='{self.target_database}' "
            f"user='{username}' password='{password}' connect_timeout=10"
        )
        conn.autocommit = True
        cursor = conn.cursor()
        
        try:
            # Tabelle erstellen - content als BYTEA statt TEXT
            cursor.execute(f"""
                CREATE TABLE IF NOT EXISTS {schema}.qgis_projects (
                    name VARCHAR(255) PRIMARY KEY,
                    metadata JSONB,
                    content BYTEA NOT NULL
                )
            """)
            
            # Tabelle vorher leeren, sodass immer nur eine Projektdatei im Schema liegt
            cursor.execute(f"""
                DELETE FROM {schema}.qgis_projects
            """)
            logger.info(f"qgis_projects Tabelle in Schema '{schema}' geleert")
            
            # Metadaten im gewünschten Format
            metadata_json = json.dumps({
                'last_modified_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S.%f'),
                'last_modified_user': current_user
            })
            
            # Projekt speichern mit komprimiertem Content (jetzt als INSERT ohne ON CONFLICT)
            cursor.execute(f"""
                INSERT INTO {schema}.qgis_projects (name, content, metadata)
                VALUES (%s, %s, %s::jsonb)
            """, (project_name, psycopg2.Binary(compressed_content), metadata_json))
            
            #logger.info(f"✓ QGIS-Projekt '{project_name}' hochgeladen")
            #logger.info(f"  Original: {len(project_bytes)/1024:.1f} KB")
            #logger.info(f"  Komprimiert: {len(compressed_content)/1024:.1f} KB")
            #logger.info(f"  Zum Laden in QGIS: Projekt → Öffnen von → PostgreSQL")
        finally:
            cursor.close()
            conn.close()
