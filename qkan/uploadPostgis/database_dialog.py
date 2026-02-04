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
    
    # Zieldatenbank-Auswahl
    listWidget_databases: QListWidget
    pb_refresh_databases: QPushButton
    cb_create_new_database: QCheckBox
    le_new_database_name: QLineEdit
    cb_overwrite_existing: QCheckBox
    
    # Control buttons
    pb_help: QPushButton
    pb_cancel: QPushButton
    pb_upload: QPushButton
    pb_export_sql: QPushButton  # Neuer Button für SQL-Export
    
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
        
        # Connect target database signals
        self.pb_refresh_databases.clicked.connect(self.refresh_databases)
        self.cb_create_new_database.toggled.connect(self.toggle_new_database)
        self.listWidget_databases.itemSelectionChanged.connect(self.on_database_selected)
        self.le_new_database_name.textChanged.connect(self.update_upload_button_state)
        
        # Connect control buttons
        self.pb_help.clicked.connect(self.show_help)
        self.pb_cancel.clicked.connect(self.reject)
        self.pb_upload.clicked.connect(self.start_upload)
        self.pb_export_sql.clicked.connect(self.export_to_sql_dump)
        
        # Load available databases
        self.load_databases()
        
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

    def on_database_selected(self):
        """Reagiert auf Auswahl einer Zieldatenbank"""
        self.update_upload_button_state()

    def update_upload_button_state(self):
        """Upload-Button aktivieren/deaktivieren je nach Eingaben"""
        has_source = len(self.selected_files) > 0
        has_target = (self.listWidget_databases.currentItem() is not None or 
                      self.cb_create_new_database.isChecked())
        
        if self.cb_create_new_database.isChecked():
            has_target = bool(self.le_new_database_name.text().strip())
        
        self.pb_upload.setEnabled(has_source and has_target)

    def refresh_databases(self):
        """Datenbankliste aktualisieren"""
        self.load_databases()

    def toggle_new_database(self, checked: bool):
        """Neue Datenbank-Option umschalten"""
        self.le_new_database_name.setEnabled(checked)
        if checked:
            self.le_new_database_name.setFocus()
        self.update_upload_button_state()

    def export_to_sql_dump(self):
        """Exportiert SQLite-Dateien als SQL-Dump für GBD WebSuite"""
        if not self.selected_files:
            QMessageBox.warning(
                self,
                "SQL-Export",
                "Bitte wählen Sie zuerst mindestens eine SQLite-Datenbank aus."
            )
            return
        
        from .export_sql_dump import export_to_sql_dump
        from qgis.PyQt.QtWidgets import QFileDialog
        
        exported_files = []
        
        for source_file in self.selected_files:
            # Ausgabedatei-Namen generieren
            base_name = os.path.splitext(source_file)[0]
            default_output = f"{base_name}_websuite.sql"
            
            # Datei-Dialog für Ausgabe
            output_file, _ = QFileDialog.getSaveFileName(
                self,
                f"SQL-Dump speichern für: {os.path.basename(source_file)}",
                default_output,
                "SQL-Dateien (*.sql);;Alle Dateien (*.*)"
            )
            
            if not output_file:
                logger.info(f"Export abgebrochen für {source_file}")
                continue
            
            try:
                logger.info(f"Exportiere {source_file} nach {output_file}")
                success = export_to_sql_dump(source_file, output_file, schema_name="qkan")
                
                if success:
                    exported_files.append(output_file)
                    logger.info(f"✓ Export erfolgreich: {output_file}")
                    
            except Exception as e:
                QMessageBox.critical(
                    self,
                    "Export fehlgeschlagen",
                    f"Fehler beim Exportieren von {os.path.basename(source_file)}:\n\n{str(e)}"
                )
                logger.error(f"SQL-Export fehlgeschlagen für {source_file}: {e}")
        
        # Zusammenfassung anzeigen
        if exported_files:
            file_list = "\n".join([f"• {os.path.basename(f)}" for f in exported_files])
            
            QMessageBox.information(
                self,
                "Export erfolgreich",
                f"✓ {len(exported_files)} SQL-Dump(s) erfolgreich erstellt:\n\n{file_list}\n\n"
                f"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
                f"NÄCHSTE SCHRITTE (GBD WebSuite):\n"
                f"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n"
                f"1. Datei auf Server kopieren:\n"
                f"   scp datei.sql user@server:/tmp/\n\n"
                f"2. Per SSH verbinden:\n"
                f"   ssh user@server\n\n"
                f"3. SQL-Dump importieren:\n"
                f"   psql -d websuite_db -f /tmp/datei.sql\n\n"
                f"4. Tabellen prüfen:\n"
                f"   psql -d websuite_db -c '\\dt qkan.*'\n\n"
                f"Alternativ: Import über pgAdmin, DBeaver\n"
                f"oder WebSuite Admin-Interface (falls vorhanden)"
            )

    def show_help(self):
        """Hilfe anzeigen"""
        help_text = """
QKan PostGIS Datenbank-Upload / SQL-Export

=== FÜR GBD WEBSUITE ===
Wenn Sie eine GBD WebSuite verwenden und KEINEN direkten PostgreSQL-Zugriff 
haben, nutzen Sie die SQL-Dump-Export-Funktion (siehe unten).

QUELLDATENBANKEN AUSWÄHLEN:
• Klicken Sie auf "Hinzufügen..." um QKan SQLite-Datenbanken auszuwählen
• Unterstützte Formate: .sqlite, .sqlite3, .db, .gpkg
• Mehrere Dateien können gleichzeitig ausgewählt werden
• Mit "Entfernen" können Sie Dateien aus der Liste löschen

OPTION 1: DIREKTER UPLOAD (wenn PostgreSQL-Port erreichbar)
• Zieldatenbank wählen aus der Liste ODER
• Neue Datenbank erstellen (nur Buchstaben, Zahlen, Unterstriche, max. 63 Zeichen)
• Klicken Sie "Upload starten"

OPTION 2: SQL-DUMP EXPORT (für GBD WebSuite OHNE direkten DB-Zugriff)
• Wählen Sie SQLite-Datenbank(en) aus
• Im Dialog gibt es einen "Als SQL-Dump exportieren" Button
• Laden Sie den generierten .sql-Dump auf Ihren WebSuite-Server hoch
• Importieren per SSH: psql -d datenbank -f dump.sql

OPTIONEN:
• Bestehende Tabellen überschreiben: Löscht vorhandene QKan-Tabellen 
  vor dem Import (ACHTUNG: Datenverlust!)

UPLOAD-PROZESS (Direkter Upload):
1. SQLite-Datenbank analysieren
2. PostGIS-Tabellen erstellen
3. Geometrien konvertieren und übertragen
4. Spatial-Indizes erstellen
5. Layer zu QGIS hinzufügen (optional)

HINWEISE:
• PostGIS-Erweiterung wird automatisch aktiviert falls nötig
• Geometrien werden mit korrektem SRID übertragen
• Der Upload kann je nach Datenmenge einige Minuten dauern

GBD WEBSUITE SPEZIFISCH:
• Falls der direkte PostgreSQL-Zugriff blockiert ist, verwenden Sie SQL-Dump
• Bei Verbindungsproblemen: Prüfen Sie Firewall/SSH-Tunnel
• Standard-Port: 5432 (oft nur über VPN/SSH erreichbar)

OPTIONEN:
• Bestehende Tabellen überschreiben: Löscht vorhandene QKan-Tabellen 
  vor dem Import (ACHTUNG: Datenverlust!)

UPLOAD-PROZESS:
1. SQLite-Datenbank analysieren
2. PostGIS-Tabellen erstellen
3. Geometrien konvertieren und übertragen
4. Spatial-Indizes erstellen
5. Layer zu QGIS hinzufügen (optional)

HINWEISE:
• PostGIS-Erweiterung wird automatisch aktiviert falls nötig
• Geometrien werden mit korrektem SRID übertragen
• Der Upload kann je nach Datenmenge einige Minuten dauern
        """
        
        QMessageBox.information(
            self,
            "Hilfe - PostGIS Upload",
            help_text
        )

    def start_upload(self):
        """Upload-Prozess für mehrere Dateien starten"""
        # Quelldatenbanken validieren
        if not self.selected_files:
            QMessageBox.warning(
                self,
                "Validierungsfehler",
                "Bitte wählen Sie mindestens eine QKan SQLite-Quelldatenbank aus."
            )
            return
        
        # Prüfe ob alle Dateien existieren
        missing_files = [f for f in self.selected_files if not os.path.exists(f)]
        if missing_files:
            QMessageBox.warning(
                self,
                "Validierungsfehler",
                f"Folgende Dateien existieren nicht:\n" + "\n".join(missing_files)
            )
            return
        
        # Wenn keine Verbindung möglich ist, SQL-Export vorschlagen
        if not self.connection_available:
            reply = QMessageBox.question(
                self,
                "Keine Datenbankverbindung",
                "Es konnte keine Verbindung zum PostgreSQL-Server hergestellt werden.\n\n"
                "Möchten Sie stattdessen einen SQL-Dump exportieren?\n"
                "Dieser kann dann manuell auf dem Server importiert werden.",
                QMessageBox.Yes | QMessageBox.No,
                QMessageBox.Yes
            )
            
            if reply == QMessageBox.Yes:
                self.export_to_sql_dump()
            return
        
        # Zieldatenbank validieren
        target_database = None
        if self.cb_create_new_database.isChecked():
            new_db_name = self.le_new_database_name.text().strip()
            if not new_db_name:
                QMessageBox.warning(
                    self,
                    "Validierungsfehler",
                    "Bitte geben Sie einen Namen für die neue Datenbank ein."
                )
                self.le_new_database_name.setFocus()
                return
            
            # Validierung des Datenbanknamens
            if not self.is_valid_database_name(new_db_name):
                QMessageBox.warning(
                    self,
                    "Validierungsfehler", 
                    "Ungültiger Datenbankname. Verwenden Sie nur Buchstaben, Zahlen und Unterstriche.\nDer Name darf nicht mit einer Zahl beginnen."
                )
                self.le_new_database_name.setFocus()
                return
            
            target_database = new_db_name
        else:
            # Bestehende Datenbank ausgewählt
            if not self.listWidget_databases.currentItem():
                QMessageBox.warning(
                    self,
                    "Validierungsfehler",
                    "Bitte wählen Sie eine Datenbank aus der Liste aus."
                )
                return
            target_database = self.listWidget_databases.currentItem().text()
        
        # Warnung bei Überschreiben
        if self.cb_overwrite_existing.isChecked():
            reply = QMessageBox.question(
                self,
                "Bestätigung erforderlich",
                "ACHTUNG: Bestehende QKan-Tabellen werden überschrieben!\n\nAlle vorhandenen QKan-Daten in der Zieldatenbank gehen verloren.\n\nMöchten Sie fortfahren?",
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
            
            for file_index, source_file in enumerate(self.selected_files):
                try:
                    # Fortschrittsanzeige für mehrere Dateien
                    if total_files > 1:
                        self.label_progress_status.setText(f"Datei {file_index + 1}/{total_files}: {os.path.basename(source_file)}")
                        QApplication.processEvents()
                    
                    logger.info(f"Starte Upload von: {source_file}")
                    self.perform_upload(
                        connection_name=self.connection_name,
                        target_database=target_database,
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
            
            # Zusammenfassung anzeigen
            if failed_uploads:
                error_details = "\n".join([f"• {name}: {error}" for name, error in failed_uploads])
                QMessageBox.warning(
                    self,
                    "Upload teilweise erfolgreich",
                    f"Erfolgreich hochgeladen: {successful_uploads} von {len(self.selected_files)} Dateien\n\n"
                    f"Fehlgeschlagene Uploads:\n{error_details}"
                )
            else:
                QMessageBox.information(
                    self,
                    "Upload erfolgreich",
                    f"Alle {successful_uploads} QKan-Datenbanken wurden erfolgreich zu '{target_database}' hochgeladen."
                )
            
            self.accept()
            
        except Exception as e:
            QMessageBox.critical(
                self,
                "Upload fehlgeschlagen",
                f"Fehler beim Upload:\n\n{str(e)}"
            )
            logger.error(f"Upload fehlgeschlagen: {str(e)}")
    
    def perform_upload(self, connection_name: str, target_database: str, source_file: str, overwrite: bool):
        """Führt den Upload durch mit Fortschrittsanzeige"""
        from ._uploadPostgis import UploadPostgisTask
        
        logger.info(f"perform_upload aufgerufen: connection={connection_name}, db={target_database}, file={source_file}")
        
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
            schema_name="qkan",
            overwrite=overwrite,
            progress_bar=self.progressBar_upload,
            progress_callback=self.update_progress_status,
            add_layers_to_qgis=True
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
    
    def is_valid_database_name(self, name: str) -> bool:
        """Validiert einen Datenbanknamen"""
        import re
        # PostgreSQL Datenbankname-Regeln
        pattern = r'^[a-zA-Z_][a-zA-Z0-9_]*$'
        return bool(re.match(pattern, name)) and len(name) <= 63

    def load_databases(self):
        """Verfügbare Datenbanken vom PostGIS-Server laden"""
        self.listWidget_databases.clear()
        
        # Verbindungsparameter aus QSettings laden
        settings = QSettings()
        
        # Für localhost: Aktuellen Benutzer verwenden
        if self.connection_name.lower() == "localhost":
            import getpass
            host = "localhost"
            port = 5432
            username = getpass.getuser()
            password = ""
            ssl_mode = "prefer"
            logger.info(f"Localhost-Verbindung: {username}@{host}:{port}")
        else:
            base_key = f"PostgreSQL/connections/{self.connection_name}"
            host = settings.value(f"{base_key}/host", "")
            port = int(settings.value(f"{base_key}/port", 5432))
            username = settings.value(f"{base_key}/username", "")
            password = settings.value(f"{base_key}/password", "")
            ssl_mode = settings.value(f"{base_key}/sslmode", "prefer")
            
            logger.info(f"WebSuite-Verbindung: {username}@{host}:{port} (sslmode={ssl_mode})")
        
        if not host:
            self.listWidget_databases.addItem("Fehler: Kein Host konfiguriert")
            logger.error(f"Kein Host für Verbindung '{self.connection_name}' gefunden")
            return
            
        if not username:
            self.listWidget_databases.addItem("Fehler: Kein Benutzername konfiguriert")
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
            
            # Verbindung zu postgres-Datenbank (für Liste aller DBs)
            conn_string = (
                f"host='{resolved_host}' "
                f"port={port} "
                f"dbname='postgres' "
                f"user='{username}' "
                f"password='{password}' "
                f"sslmode='{ssl_mode}' "
                f"connect_timeout=10"
            )
            
            logger.info(f"Verbinde zu: {username}@{resolved_host}:{port}/postgres")
            
            conn = psycopg2.connect(conn_string)
            cursor = conn.cursor()
            
            # Server-Version für Debug
            cursor.execute("SELECT version()")
            server_version = cursor.fetchone()[0]
            logger.info(f"Verbunden mit: {server_version[:50]}...")
            
            # Alle Datenbanken abfragen (außer System-DBs)
            cursor.execute("""
                SELECT datname 
                FROM pg_database 
                WHERE datistemplate = false 
                AND datname NOT IN ('postgres', 'template0', 'template1')
                ORDER BY datname
            """)
            
            databases = cursor.fetchall()
            
            if databases:
                logger.info(f"Gefundene Datenbanken auf {host}: {[db[0] for db in databases]}")
                for db in databases:
                    self.listWidget_databases.addItem(db[0])
            else:
                self.listWidget_databases.addItem("(Keine Benutzer-Datenbanken gefunden)")
                logger.info(f"Keine Benutzer-Datenbanken auf {host} gefunden")
            
            cursor.close()
            conn.close()
            
            # Verbindung war erfolgreich
            self.connection_available = True
            
        except ImportError:
            self.listWidget_databases.addItem("Fehler: psycopg2 nicht installiert")
            logger.error("psycopg2 nicht installiert")
            self.connection_available = False
            self._show_sql_export_hint()
        except psycopg2.OperationalError as e:
            error_msg = str(e)
            self.listWidget_databases.addItem(f"Verbindungsfehler: {error_msg[:50]}...")
            self.listWidget_databases.addItem("💡 Tipp: Verwenden Sie 'Als SQL-Dump exportieren'")
            logger.error(f"PostGIS Verbindungsfehler zu {host}:{port}: {error_msg}")
            self.connection_available = False
            self._show_sql_export_hint()
        except Exception as e:
            self.listWidget_databases.addItem(f"Fehler: {str(e)[:50]}...")
            self.listWidget_databases.addItem("💡 Tipp: Verwenden Sie 'Als SQL-Dump exportieren'")
            logger.error(f"Unerwarteter Fehler beim Laden der Datenbanken von {host}: {e}")
            self.connection_available = False
            self._show_sql_export_hint()
    
    def _show_sql_export_hint(self):
        """Zeigt Hinweis für SQL-Export bei Verbindungsproblemen"""
        # Update Label mit Hinweis
        current_text = self.label_server_info.text()
        if "Kein direkter Zugriff" not in current_text:
            self.label_server_info.setText(
                f"{current_text} - ⚠️ Kein direkter Zugriff möglich"
            )

    def get_selected_database(self):
        """Ausgewählte Datenbank zurückgeben"""
        if self.cb_create_new_database.isChecked():
            return self.le_new_database_name.text().strip()
        else:
            current_item = self.listWidget_databases.currentItem()
            if current_item:
                return current_item.text()
        return None

    def should_overwrite(self):
        """Überprüfen, ob bestehende Tabellen überschrieben werden sollen"""
        return self.cb_overwrite_existing.isChecked()