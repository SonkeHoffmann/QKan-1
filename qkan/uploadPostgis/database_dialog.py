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
        
        # Connect source database signals
        self.pb_select_database.clicked.connect(self.select_database_file)
        self.le_database_file.textChanged.connect(self.on_database_file_changed)
        
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

    def select_database_file(self):
        """PostgreSQL-Datenbank-Datei auswählen"""
        file_dialog = QFileDialog()
        file_dialog.setWindowTitle("QKan PostgreSQL-Datenbank auswählen")
        file_dialog.setFileMode(QFileDialog.ExistingFile)
        file_dialog.setNameFilter("PostgreSQL-Datenbanken (*.pgsql *.db);;Alle Dateien (*)")

        # Standard-Ordner setzen
        if self.default_dir and os.path.exists(self.default_dir):
            file_dialog.setDirectory(self.default_dir)
        
        if file_dialog.exec_() == QFileDialog.Accepted:
            selected_files = file_dialog.selectedFiles()
            if selected_files:
                file_path = selected_files[0]
                self.le_database_file.setText(file_path)
                logger.info(f"Datenbank-Datei ausgewählt: {file_path}")

    def on_database_file_changed(self):
        """Reagiert auf Änderungen im Quelldatenbank-Feld"""
        self.update_upload_button_state()

    def on_database_selected(self):
        """Reagiert auf Auswahl einer Zieldatenbank"""
        self.update_upload_button_state()

    def update_upload_button_state(self):
        """Upload-Button aktivieren/deaktivieren je nach Eingaben"""
        has_source = bool(self.le_database_file.text().strip())
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

Wählen Sie eine Zieldatenbank für den Upload:

• Bestehende Datenbank: Wählen Sie aus der Liste
• Neue Datenbank: Aktivieren Sie die Option und geben Sie einen Namen ein

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
        # Quelldatenbank validieren
        source_file = self.le_database_file.text().strip()
        if not source_file:
            QMessageBox.warning(
                self,
                "Validierungsfehler",
                "Bitte wählen Sie eine QKan SQLite-Quelldatenbank aus."
            )
            return
        
        if not os.path.exists(source_file):
            QMessageBox.warning(
                self,
                "Validierungsfehler",
                f"Die ausgewählte Datei existiert nicht:\n{source_file}"
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
            self.perform_upload(
                connection_name=self.connection_name,
                target_database=target_database,
                source_file=source_file,
                overwrite=self.cb_overwrite_existing.isChecked()
            )
            
            QMessageBox.information(
                self,
                "Upload erfolgreich",
                f"Die QKan-Datenbank wurde erfolgreich zu '{target_database}' hochgeladen."
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