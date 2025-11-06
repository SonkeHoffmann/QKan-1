import os
from typing import Callable, Optional

from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import (
    QCheckBox,
    QDialog,
    QLabel,
    QLineEdit,
    QListWidget,
    QMessageBox,
    QPushButton,
    QWidget,
    QFileDialog,
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
    le_database_file: QLineEdit
    pb_select_database: QPushButton
    listWidget_source_databases: QListWidget  # NEU: Liste der ausgewählten Quelldatenbanken
    pb_add_database: QPushButton              # NEU: Button zum Hinzufügen weiterer DBs
    pb_remove_database: QPushButton           # NEU: Button zum Entfernen von DBs
    
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
    
    # Info labels
    label_server_info: QLabel  # Label für Server-Info

    def __init__(
        self,
        connection_name: str,
        default_dir: str,
        tr: Callable,
        parent: Optional[QWidget] = None,
    ):
        super().__init__(connection_name, default_dir, tr, parent)
        
        # Set server info in label  
        self.label_server_info.setText(f"Verbunden mit Server: {connection_name}")
        
        # Liste für Quelldatenbanken initialisieren
        self.source_databases = []
        
        # Connect source database signals
        self.pb_select_database.clicked.connect(self.select_database_files)
        self.pb_add_database.clicked.connect(self.add_database_files)
        self.pb_remove_database.clicked.connect(self.remove_selected_databases)
        self.listWidget_source_databases.itemSelectionChanged.connect(self.on_source_selection_changed)
        # Alte Signal-Verbindung entfernt
        # self.le_database_file.textChanged.connect(self.on_database_file_changed)
        
        # Connect target database signals
        self.pb_refresh_databases.clicked.connect(self.refresh_databases)
        self.cb_create_new_database.toggled.connect(self.toggle_new_database)
        self.listWidget_databases.itemSelectionChanged.connect(self.on_database_selected)
        self.le_new_database_name.textChanged.connect(self.update_upload_button_state)
        
        # Connect control buttons
        self.pb_help.clicked.connect(self.show_help)
        self.pb_cancel.clicked.connect(self.reject)
        self.pb_upload.clicked.connect(self.start_upload)
        
        # Load available databases
        self.load_databases()
        
        # Initial state - upload button disabled
        self.pb_upload.setEnabled(False)
        self.pb_remove_database.setEnabled(False)

    def select_database_files(self):
        """Mehrere SQLite-Datenbank-Dateien auswählen (ersetzt bestehende Liste)"""
        file_dialog = QFileDialog()
        file_dialog.setWindowTitle("QKan SQLite-Datenbanken auswählen")
        file_dialog.setFileMode(QFileDialog.ExistingFiles)  # Mehrfachauswahl
        file_dialog.setNameFilter("SQLite-Datenbanken (*.sqlite *.db);;Alle Dateien (*)")

        # Standard-Ordner setzen
        if self.default_dir and os.path.exists(self.default_dir):
            file_dialog.setDirectory(self.default_dir)
        
        if file_dialog.exec_() == QFileDialog.Accepted:
            selected_files = file_dialog.selectedFiles()
            if selected_files:
                # Liste komplett ersetzen
                self.source_databases = selected_files
                self.update_source_database_list()
                logger.info(f"{len(selected_files)} Datenbank-Datei(en) ausgewählt")

    def add_database_files(self):
        """Weitere SQLite-Datenbank-Dateien hinzufügen"""
        file_dialog = QFileDialog()
        file_dialog.setWindowTitle("Weitere QKan SQLite-Datenbanken hinzufügen")
        file_dialog.setFileMode(QFileDialog.ExistingFiles)  # Mehrfachauswahl
        file_dialog.setNameFilter("SQLite-Datenbanken (*.sqlite *.db);;Alle Dateien (*)")

        # Standard-Ordner setzen
        if self.default_dir and os.path.exists(self.default_dir):
            file_dialog.setDirectory(self.default_dir)
        
        if file_dialog.exec_() == QFileDialog.Accepted:
            selected_files = file_dialog.selectedFiles()
            if selected_files:
                # Nur neue Dateien hinzufügen (Duplikate vermeiden)
                for file_path in selected_files:
                    if file_path not in self.source_databases:
                        self.source_databases.append(file_path)
                
                self.update_source_database_list()
                logger.info(f"{len(selected_files)} Datenbank-Datei(en) hinzugefügt")

    def remove_selected_databases(self):
        """Ausgewählte Quelldatenbanken aus der Liste entfernen"""
        selected_items = self.listWidget_source_databases.selectedItems()
        if not selected_items:
            return
        
        # Indizes der ausgewählten Items sammeln
        indices_to_remove = []
        for item in selected_items:
            row = self.listWidget_source_databases.row(item)
            indices_to_remove.append(row)
        
        # Von hinten nach vorne löschen, um Index-Verschiebungen zu vermeiden
        for index in sorted(indices_to_remove, reverse=True):
            if 0 <= index < len(self.source_databases):
                del self.source_databases[index]
        
        self.update_source_database_list()
        logger.info(f"{len(indices_to_remove)} Datenbank(en) entfernt")

    def update_source_database_list(self):
        """Aktualisiert die Anzeige der Quelldatenbanken"""
        self.listWidget_source_databases.clear()
        
        for db_path in self.source_databases:
            # Nur Dateinamen anzeigen, nicht den vollständigen Pfad
            filename = os.path.basename(db_path)
            self.listWidget_source_databases.addItem(filename)
        
        # Upload-Button-Status aktualisieren
        self.update_upload_button_state()

    def on_source_selection_changed(self):
        """Reagiert auf Änderungen in der Auswahl der Quelldatenbanken"""
        has_selection = len(self.listWidget_source_databases.selectedItems()) > 0
        self.pb_remove_database.setEnabled(has_selection)

    def on_database_selected(self):
        """Reagiert auf Auswahl einer Zieldatenbank"""
        self.update_upload_button_state()

    def update_upload_button_state(self):
        """Upload-Button aktivieren/deaktivieren je nach Eingaben"""
        has_source = len(self.source_databases) > 0
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

    def show_help(self):
        """Hilfe anzeigen"""
        help_text = """
QKan PostGIS Datenbank-Upload

Quelldatenbanken auswählen:
• "Datenbanken wählen": Mehrere SQLite-Datenbanken auswählen (ersetzt die Liste)
• "Hinzufügen": Weitere Datenbanken zur Liste hinzufügen
• "Entfernen": Ausgewählte Datenbanken aus der Liste entfernen

Zieldatenbank wählen:
• Bestehende Datenbank: Wählen Sie aus der Liste
• Neue Datenbank: Aktivieren Sie die Option und geben Sie einen Namen ein

Upload mehrerer Datenbanken:
• Bei mehreren Quelldatenbanken werden diese nacheinander hochgeladen
• Jede Datenbank erhält automatisch einen eigenen Namen (basierend auf Dateiname)
• Format: [Zielname]_[Dateiname]

Optionen:
• Bestehende Tabellen überschreiben: Löscht vorhandene QKan-Tabellen vor dem Import

Hinweise:
• Der Benutzer muss Berechtigung haben, Datenbanken zu erstellen (falls neue DB)
• PostGIS-Erweiterung wird automatisch installiert falls nicht vorhanden
• Bestehende Daten gehen bei "Überschreiben" verloren
        """
        
        QMessageBox.information(
            self,
            "Hilfe - PostGIS Upload",
            help_text
        )

    def start_upload(self):
        """Upload-Prozess starten"""
        # Quelldatenbanken validieren
        if not self.source_databases:
            QMessageBox.warning(
                self,
                "Validierungsfehler",
                "Bitte wählen Sie mindestens eine QKan SQLite-Quelldatenbank aus."
            )
            return
        
        # Alle ausgewählten Dateien prüfen
        missing_files = []
        for source_file in self.source_databases:
            if not os.path.exists(source_file):
                missing_files.append(os.path.basename(source_file))
        
        if missing_files:
            QMessageBox.warning(
                self,
                "Validierungsfehler",
                f"Die folgenden Dateien existieren nicht:\n" + "\n".join(missing_files)
            )
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
        
        # Upload starten mit den gesammelten Informationen
        try:
            # Info-Dialog bei mehreren Datenbanken
            if len(self.source_databases) > 1:
                info_msg = f"Es werden {len(self.source_databases)} Datenbanken nacheinander hochgeladen:\n\n"
                info_msg += "\n".join([os.path.basename(f) for f in self.source_databases[:5]])
                if len(self.source_databases) > 5:
                    info_msg += f"\n... und {len(self.source_databases) - 5} weitere"
                
                QMessageBox.information(
                    self,
                    "Mehrere Datenbanken",
                    info_msg
                )
            
            # Alle Datenbanken hochladen
            successful_uploads = 0
            failed_uploads = []
            
            for idx, source_file in enumerate(self.source_databases, 1):
                db_name = os.path.basename(source_file)
                logger.info(f"Upload {idx}/{len(self.source_databases)}: {db_name}")
                
                try:
                    # Bei mehreren DBs: Target-Datenbank automatisch benennen
                    if len(self.source_databases) > 1 and not self.cb_create_new_database.isChecked():
                        # Dateiname ohne Erweiterung als DB-Name verwenden
                        db_basename = os.path.splitext(db_name)[0]
                        current_target = f"{target_database}_{db_basename}"
                    else:
                        current_target = target_database
                    
                    self.perform_upload(
                        connection_name=self.connection_name,
                        target_database=current_target,
                        source_file=source_file,
                        overwrite=self.cb_overwrite_existing.isChecked()
                    )
                    successful_uploads += 1
                    
                except Exception as e:
                    failed_uploads.append((db_name, str(e)))
                    logger.error(f"Upload fehlgeschlagen für {db_name}: {str(e)}")
            
            # Zusammenfassung anzeigen
            summary = f"Upload abgeschlossen:\n\n"
            summary += f"✓ Erfolgreich: {successful_uploads} von {len(self.source_databases)}\n"
            
            if failed_uploads:
                summary += f"✗ Fehlgeschlagen: {len(failed_uploads)}\n\n"
                summary += "Fehlerhafte Datenbanken:\n"
                for db_name, error in failed_uploads[:3]:
                    summary += f"• {db_name}: {error[:50]}...\n"
                if len(failed_uploads) > 3:
                    summary += f"... und {len(failed_uploads) - 3} weitere"
                
                QMessageBox.warning(
                    self,
                    "Upload teilweise erfolgreich",
                    summary
                )
            else:
                QMessageBox.information(
                    self,
                    "Upload erfolgreich",
                    summary
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
        """Führt den Upload durch"""
        from ._uploadPostgis import UploadPostgisTask
        from qkan import QKan
        from qgis.core import Qgis
        from qgis.PyQt.QtWidgets import QProgressBar
        
        # Progress Bar für den Upload-Task
        iface = QKan.instance.iface if hasattr(QKan, 'instance') and QKan.instance else None
        progress_bar = None
        status_message = None
        
        try:
            if iface:
                progress_bar = QProgressBar(iface.messageBar())
                progress_bar.setRange(0, 100)

                status_message = iface.messageBar().createMessage(
                    "", f"Upload zu PostGIS läuft ({target_database}). Bitte warten..."
                )
                status_message.layout().addWidget(progress_bar)
                iface.messageBar().pushWidget(status_message, Qgis.Info, 30)
            
            # Upload-Task erstellen und ausführen
            task = UploadPostgisTask(
                server_connection=f"{connection_name} ({self.connection_name})",
                target_database=target_database,
                source_database_file=source_file,
                schema_name="qkan",
                overwrite=overwrite,
                progress_bar=progress_bar
            )
            
            success = task.run()
            
            if not success:
                from qkan.utils import QkanError
                raise QkanError("Upload-Task wurde nicht erfolgreich abgeschlossen")
                
        finally:
            # Status message entfernen
            if iface and status_message:
                iface.messageBar().clearWidgets()
        
        logger.info("Upload-Prozess erfolgreich abgeschlossen")
    
    def is_valid_database_name(self, name: str) -> bool:
        """Validiert einen Datenbanknamen"""
        import re
        # PostgreSQL Datenbankname-Regeln
        pattern = r'^[a-zA-Z_][a-zA-Z0-9_]*$'
        return bool(re.match(pattern, name)) and len(name) <= 63

    def load_databases(self):
        """Verfügbare Datenbanken laden"""
        self.listWidget_databases.clear()
        
        # Verbindungsparameter aus QSettings laden
        settings = QSettings()
        base_key = f"PostgreSQL/connections/{self.connection_name}"
        
        host = settings.value(f"{base_key}/host", "localhost")
        port = settings.value(f"{base_key}/port", 5432)
        username = settings.value(f"{base_key}/username", "")
        password = settings.value(f"{base_key}/password", "")
        ssl_mode = settings.value(f"{base_key}/sslmode", "prefer")
        
        if not username:
            self.listWidget_databases.addItem("Fehler: Kein Benutzername konfiguriert")
            return
        
        try:
            import psycopg2
            
            # Verbindung zu postgres-Datenbank (für Liste aller DBs)
            conn_string = f"host='{host}' port={port} dbname='postgres' user='{username}' password='{password}' sslmode='{ssl_mode}'"
            conn = psycopg2.connect(conn_string)
            cursor = conn.cursor()
            
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
                for db in databases:
                    self.listWidget_databases.addItem(db[0])
            else:
                self.listWidget_databases.addItem("Keine Benutzer-Datenbanken gefunden")
            
            cursor.close()
            conn.close()
            
        except ImportError:
            self.listWidget_databases.addItem("Fehler: psycopg2 nicht installiert")
        except Exception as e:
            self.listWidget_databases.addItem(f"Verbindungsfehler: {str(e)}")
            logger.error(f"Fehler beim Laden der Datenbanken: {e}")

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