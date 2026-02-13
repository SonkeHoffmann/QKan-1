import os
from typing import Callable, Optional

from qgis.PyQt import uic
from qgis.PyQt.QtCore import Qt, QSettings
from qgis.PyQt.QtWidgets import (
    QDialog,
    QDialogButtonBox,
    QListWidget,
    QMessageBox,
    QPushButton,
    QWidget,
)

from qkan import QKan
from qkan.utils import get_logger

from .database_dialog import UploadPostgisDatabaseDialog
from .connection_dialog import PostgisConnectionDialog, normalize_hostname

logger = get_logger("QKan.uploadPostgis.application_dialog")


class _Dialog(QDialog):
    def __init__(
        self,
        default_dir: str,
        tr: Callable,
        parent: Optional[QWidget] = None,
    ):
        # noinspection PyArgumentList
        super().__init__(parent)
        self.setupUi(self)
        self.default_dir = default_dir
        self.tr = tr


IMPORT_CLASS, _ = uic.loadUiType(
    os.path.join(os.path.dirname(__file__), "res", "uploadPostgis_dialog_base.ui")
)


class UploadPostgisDialog(_Dialog, IMPORT_CLASS):  # type: ignore
    # Server-Auswahl UI-Elemente
    listWidget_servers: QListWidget
    pb_new_connection: QPushButton
    pb_edit_connection: QPushButton
    pb_delete_connection: QPushButton
    pb_test_connection: QPushButton
    
    # Weiter-Button zum zweiten Schritt
    pb_next: QPushButton
    
    # Button-Box mit Hilfe und Abbrechen
    button_box: QDialogButtonBox

    def __init__(
        self,
        default_dir: str,
        tr: Callable,
        parent: Optional[QWidget] = None,
    ):
        # noinspection PyCallByClass,PyArgumentList
        super().__init__(default_dir, tr, parent)

        # Attach events für Server-Management
        self.pb_new_connection.clicked.connect(self.new_connection)
        self.pb_edit_connection.clicked.connect(self.edit_connection)
        self.pb_delete_connection.clicked.connect(self.delete_connection)
        self.pb_test_connection.clicked.connect(self.test_connection)
        
        # Server-Auswahl Event
        self.listWidget_servers.itemSelectionChanged.connect(self.on_server_selected)
        
        # Weiter-Button Event
        self.pb_next.clicked.connect(self.go_to_database_selection)
        
        # Button-Box Events
        self.button_box.helpRequested.connect(self.show_help)

        # Init fields
        self.load_server_connections()
        
        # Initial state - buttons deaktivieren
        self.pb_next.setEnabled(False)
        self.pb_edit_connection.setEnabled(False)
        self.pb_delete_connection.setEnabled(False)

    def new_connection(self):
        """Neue PostGIS-Verbindung erstellen"""
        connection_dialog = PostgisConnectionDialog(
            connection_name=None,
            default_dir=self.default_dir,
            tr=self.tr,
            parent=self
        )
        
        if connection_dialog.exec_() == QDialog.Accepted:
            # Verbindung wurde gespeichert, Liste aktualisieren
            self.load_server_connections()
            
            # Neue Verbindung in der Liste auswählen
            connection_name = connection_dialog.get_connection_name()
            items = self.listWidget_servers.findItems(connection_name, Qt.MatchContains)
            if items:
                self.listWidget_servers.setCurrentItem(items[0])

    def edit_connection(self):
        """Bestehende PostGIS-Verbindung bearbeiten"""
        current_item = self.listWidget_servers.currentItem()
        if not current_item:
            return
            
        # Verbindungsname aus der Auswahl extrahieren
        connection_text = current_item.text()
        # Annahme: Format ist "Verbindungsname (host:port)" 
        connection_name = connection_text.split(' (')[0] if ' (' in connection_text else connection_text
        
        connection_dialog = PostgisConnectionDialog(
            connection_name=connection_name,
            default_dir=self.default_dir,
            tr=self.tr,
            parent=self
        )
        
        if connection_dialog.exec_() == QDialog.Accepted:
            # Verbindung wurde aktualisiert, Liste neu laden
            self.load_server_connections()
            
            # Bearbeitete Verbindung wieder auswählen
            new_connection_name = connection_dialog.get_connection_name()
            items = self.listWidget_servers.findItems(new_connection_name, Qt.MatchContains)
            if items:
                self.listWidget_servers.setCurrentItem(items[0])
    
    def go_to_database_selection(self):
        """Öffnet den zweiten Dialog für Datenbank-Auswahl"""
        current_item = self.listWidget_servers.currentItem()
        if not current_item:
            return
        
        # Verbindungsname aus der Auswahl extrahieren
        connection_text = current_item.text()
        connection_name = connection_text.split(' (')[0] if ' (' in connection_text else connection_text
        
        # Zweiten Dialog öffnen
        database_dialog = UploadPostgisDatabaseDialog(
            connection_name=connection_name,
            default_dir=self.default_dir,
            tr=self.tr,
            parent=self
        )
        
        # Wenn der zweite Dialog erfolgreich abgeschlossen wurde,
        # schließen wir den ersten Dialog auch
        if database_dialog.exec_() == QDialog.Accepted:
            self.accept()

    def delete_connection(self):
        """Ausgewählte PostGIS-Verbindung löschen"""
        current_item = self.listWidget_servers.currentItem()
        if not current_item:
            QMessageBox.warning(
                self,
                "Verbindung löschen",
                "Bitte wählen Sie zuerst eine Verbindung aus."
            )
            return
        
        # Verbindungsname aus der Auswahl extrahieren
        connection_text = current_item.text()
        connection_name = connection_text.split(' (')[0] if ' (' in connection_text else connection_text
        
        # Localhost kann nicht gelöscht werden
        if connection_name.lower() == "localhost":
            QMessageBox.information(
                self,
                "Verbindung löschen",
                "Die Standard-Localhost-Verbindung kann nicht gelöscht werden."
            )
            return
        
        # Bestätigung abfragen
        reply = QMessageBox.question(
            self,
            "Verbindung löschen",
            f"Möchten Sie die Verbindung '{connection_name}' wirklich löschen?",
            QMessageBox.Yes | QMessageBox.No,
            QMessageBox.No
        )
        
        if reply == QMessageBox.Yes:
            # Verbindung aus den Einstellungen löschen
            settings = QSettings()
            
            logger.info(f"Lösche Verbindung '{connection_name}' aus PostgreSQL/connections")
            
            # Alle Schlüssel für diese Verbindung entfernen
            settings.beginGroup("PostgreSQL/connections")
            settings.beginGroup(connection_name)
            settings.remove("")  # Entfernt alle Untergruppen und Werte
            settings.endGroup()
            settings.endGroup()
            
            logger.info(f"Verbindung '{connection_name}' wurde aus den Einstellungen gelöscht")
            
            logger.info(f"Verbindung '{connection_name}' wurde gelöscht")
            
            # Server-Liste neu laden
            self.load_server_connections()
            
            QMessageBox.information(
                self,
                "Verbindung gelöscht",
                f"Die Verbindung '{connection_name}' wurde erfolgreich gelöscht."
            )

    def test_connection(self):
        """PostGIS-Verbindung testen"""
        current_item = self.listWidget_servers.currentItem()
        if not current_item:
            QMessageBox.warning(
                self,
                "Verbindungstest",
                "Bitte wählen Sie zuerst eine Verbindung aus."
            )
            return
        
        # Verbindungsname aus der Auswahl extrahieren
        connection_text = current_item.text()
        connection_name = connection_text.split(' (')[0] if ' (' in connection_text else connection_text
        
        # Standard-Werte für localhost
        if connection_name.lower() == "localhost":
            import getpass
            host = "localhost"
            port = 5432
            database = "postgres"
            username = getpass.getuser()  # Aktueller Benutzer für macOS/Homebrew PostgreSQL
            password = ""
            ssl_mode = "prefer"
        else:
            # Verbindungsparameter aus QSettings laden
            settings = QSettings()
            base_key = f"PostgreSQL/connections/{connection_name}"
            
            host_raw = settings.value(f"{base_key}/host", "localhost")
            # Hostname normalisieren (entfernt URL-Präfixe etc.)
            host = normalize_hostname(host_raw)
            if host != host_raw:
                logger.info(f"Hostname normalisiert: '{host_raw}' -> '{host}'")
            
            port = settings.value(f"{base_key}/port", 5432)
            database = settings.value(f"{base_key}/database", "postgres")
            username = settings.value(f"{base_key}/username", "")
            password = settings.value(f"{base_key}/password", "")
            ssl_mode = settings.value(f"{base_key}/sslmode", "prefer")
        
        if not username:
            QMessageBox.warning(
                self,
                "Verbindungstest",
                f"Kein Benutzername für Verbindung '{connection_name}' konfiguriert."
            )
            return
        
        try:
            import psycopg2
            import socket
            
            # DNS-Auflösung vorab testen
            try:
                # Versuche IPv4-Auflösung zu erzwingen
                ip = socket.getaddrinfo(host, port, socket.AF_INET)[0][4][0]
                resolved_host = ip
                print(f"DNS aufgelöst: {host} -> {ip}")
            except socket.gaierror:
                # Falls IPv4 fehlschlägt, versuche IPv6
                try:
                    ip = socket.getaddrinfo(host, port, socket.AF_INET6)[0][4][0]
                    resolved_host = ip
                    print(f"DNS aufgelöst (IPv6): {host} -> {ip}")
                except socket.gaierror:
                    # Falls beides fehlschlägt, verwende ursprünglichen Hostnamen
                    resolved_host = host
                    print(f"DNS-Warnung: Verwende {host} direkt")
            
            # Verbindungsstring mit aufgelöster IP oder Hostname aufbauen
            conn_string = f"host='{resolved_host}' port={port} dbname='{database}' user='{username}' password='{password}' sslmode='{ssl_mode}' connect_timeout=10"
            
            # Verbindung testen
            conn = psycopg2.connect(conn_string)
            conn.autocommit = True  # Verhindert Transaktionsprobleme
            cursor = conn.cursor()
            
            # Grundlegende Verbindung testen
            cursor.execute("SELECT version()")
            postgres_version = cursor.fetchone()[0]
            
            # PostGIS-Version prüfen (falls verfügbar)
            postgis_info = ""
            try:
                cursor.execute("SELECT PostGIS_Version()")
                postgis_version = cursor.fetchone()[0]
                postgis_info = f"\nPostGIS Version: {postgis_version}"
            except psycopg2.Error as e:
                # PostGIS ist nicht installiert/aktiviert - autocommit macht rollback unnötig
                try:
                    cursor.execute("SELECT EXISTS(SELECT 1 FROM pg_available_extensions WHERE name = 'postgis')")
                    postgis_available = cursor.fetchone()[0]
                    if postgis_available:
                        postgis_info = "\nPostGIS: Verfügbar (nicht aktiviert)"
                    else:
                        postgis_info = "\nPostGIS: Nicht installiert"
                except psycopg2.Error:
                    # Fallback falls auch das fehlschlägt
                    postgis_info = "\nPostGIS: Status unbekannt"
            
            cursor.close()
            conn.close()
            
            QMessageBox.information(
                self,
                "Verbindungstest erfolgreich",
                f"Verbindung zu '{connection_name}' erfolgreich!\n\nPostgreSQL: {postgres_version.split(' on ')[0]}{postgis_info}"
            )
            
        except ImportError:
            QMessageBox.critical(
                self,
                "Verbindungstest fehlgeschlagen",
                "psycopg2 Python-Paket ist nicht installiert.\n\nBitte installieren Sie psycopg2 für PostgreSQL-Verbindungen."
            )
        except Exception as e:
            QMessageBox.critical(
                self,
                "Verbindungstest fehlgeschlagen",
                f"Fehler beim Verbinden zu '{connection_name}':\n\n{str(e)}"
            )

    def load_server_connections(self):
        """Verfügbare PostGIS-Verbindungen laden"""
        self.listWidget_servers.clear()
        
        # Immer localhost als Standard-Option hinzufügen
        self.listWidget_servers.addItem("localhost (localhost:5432)")
        
        # Verbindungen aus QSettings laden
        settings = QSettings()
        settings.beginGroup("PostgreSQL/connections")
        connection_names = settings.childGroups()
        settings.endGroup()
        
        logger.info(f"Lade Server-Verbindungen: {connection_names}")
        
        for connection_name in connection_names:
            # localhost überspringen, da bereits hinzugefügt
            if connection_name.lower() == "localhost":
                continue
                
            base_key = f"PostgreSQL/connections/{connection_name}"
            host = settings.value(f"{base_key}/host", "localhost")
            port = settings.value(f"{base_key}/port", 5432)
            
            # Anzeige-Text: "Verbindungsname (host:port)"
            display_text = f"{connection_name} ({host}:{port})"
            self.listWidget_servers.addItem(display_text)
            logger.info(f"Server hinzugefügt: {display_text}")

    def on_server_selected(self):
        """Wird aufgerufen wenn ein Server ausgewählt wird"""
        current_item = self.listWidget_servers.currentItem()
        has_valid_selection = current_item is not None
        
        # Weiter-Button aktivieren wenn Server ausgewählt
        self.pb_next.setEnabled(has_valid_selection)
        
        # Edit- und Delete-Button nur aktivieren wenn konfigurierte Verbindung ausgewählt (nicht localhost)
        if current_item:
            connection_text = current_item.text()
            connection_name = connection_text.split(' (')[0] if ' (' in connection_text else connection_text
            is_localhost = connection_name.lower() == "localhost"
            self.pb_edit_connection.setEnabled(has_valid_selection and not is_localhost)
            self.pb_delete_connection.setEnabled(has_valid_selection and not is_localhost)
        else:
            self.pb_edit_connection.setEnabled(False)
            self.pb_delete_connection.setEnabled(False)

    def get_selected_server(self):
        """Ausgewählten Server zurückgeben"""
        current_item = self.listWidget_servers.currentItem()
        if current_item:
            return current_item.text()
        return None

    def show_help(self):
        """Hilfe-Dialog anzeigen"""
        help_text = """
QKan Upload zu PostGIS - Schritt 1: Server auswählen

Dieser Dialog ermöglicht Ihnen die Auswahl eines PostGIS-Servers für den Upload Ihrer QKan-Datenbank.

Schritte:
1. Wählen Sie eine PostGIS-Server-Verbindung aus der Liste
2. Verwenden Sie "Neue Verbindung" um eine neue Verbindung zu erstellen  
3. Bearbeiten Sie bestehende Verbindungen mit "Verbindung bearbeiten"
4. Testen Sie die Verbindung mit "Verbindung testen"
5. Klicken Sie "Datenbank für Upload auswählen" um fortzufahren

Verbindungsparameter:
- Host: Server-Adresse (z.B. localhost oder IP-Adresse)
- Port: Standardmäßig 5432 für PostgreSQL
- Datenbank: Name der Zieldatenbank
- Benutzername/Passwort: Anmeldedaten für den Server
- SSL-Modus: Verschlüsselungseinstellungen

Die Verbindungseinstellungen werden in den QGIS-Einstellungen gespeichert.
        """
        
        QMessageBox.information(
            self,
            "Hilfe - QKan Upload zu PostGIS",
            help_text.strip()
        )

    def _load_uploadPostgis_config(self):
        """Konfiguration laden"""
        # Server-Verbindungen laden
        self.load_server_connections()

        # Versuche zuletzt verwendete Verbindung zu lesen
        last_connection = ''
        try:
            cfg = getattr(QKan.config, 'uploadPostgis', None)
            if cfg is None:
                # Fallback: QSettings
                settings = QSettings()
                last_connection = settings.value('qkan/uploadPostgis/last_connection', '') or ''
            else:
                # cfg kann dict-ähnlich oder ein Objekt sein
                if isinstance(cfg, dict):
                    last_connection = cfg.get('last_connection', '') or ''
                else:
                    try:
                        last_connection = cfg.get('last_connection', '') or ''
                    except Exception:
                        last_connection = getattr(cfg, 'last_connection', '') or ''
        except Exception:
            # Silently ignore config read errors and leave last_connection empty
            last_connection = ''

        if last_connection:
            items = self.listWidget_servers.findItems(last_connection, Qt.MatchContains)
            if items:
                self.listWidget_servers.setCurrentItem(items[0])

    def _save_uploadPostgis_config(self):
        """Konfiguration speichern"""
        # Aktuell ausgewählte Verbindung speichern
        selected_server = self.get_selected_server()
        connection_name = ''
        if selected_server:
            # Nur den Verbindungsnamen speichern (ohne host:port)
            connection_name = selected_server.split(' (')[0] if ' (' in selected_server else selected_server

        # Versuche in QKan.config zu schreiben, fallback auf QSettings
        try:
            cfg = getattr(QKan.config, 'uploadPostgis', None)
            if cfg is None:
                settings = QSettings()
                settings.setValue('qkan/uploadPostgis/last_connection', connection_name)
            else:
                if isinstance(cfg, dict):
                    cfg['last_connection'] = connection_name
                else:
                    # versuche dict-like get/set
                    try:
                        cfg['last_connection'] = connection_name
                    except Exception:
                        try:
                            setattr(cfg, 'last_connection', connection_name)
                        except Exception:
                            # fallback to QSettings
                            settings = QSettings()
                            settings.setValue('qkan/uploadPostgis/last_connection', connection_name)
        except Exception:
            settings = QSettings()
            settings.setValue('qkan/uploadPostgis/last_connection', connection_name)

        # Versuche die Standard-Config-Save aufzurufen falls vorhanden
        try:
            QKan.config.save()
        except Exception:
            # Ignore save errors from config
            pass
