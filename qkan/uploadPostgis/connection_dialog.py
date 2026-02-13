import os
from typing import Callable, Optional
from urllib.parse import urlparse

from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import (
    QCheckBox,
    QComboBox,
    QDialog,
    QLabel,
    QLineEdit,
    QPushButton,
    QSpinBox,
    QWidget,
)
from qgis.PyQt.QtCore import QSettings

from qkan.utils import get_logger

logger = get_logger("QKan.uploadPostgis.connection_dialog")


def normalize_hostname(host_input: str) -> str:
    """
    Normalisiert Hostname-Eingaben und entfernt URL-Präfixe.
    
    Beispiele:
    - "https://db.example.com" -> "db.example.com"
    - "http://server.com:5432" -> "server.com"
    - "postgres://user@host/db" -> "host"
    - "db.example.com" -> "db.example.com"
    - "192.168.1.1" -> "192.168.1.1"
    """
    if not host_input:
        return host_input
    
    host_input = host_input.strip()
    
    # Entferne führende/folgende Slashes
    host_input = host_input.strip('/')
    
    # Prüfe ob es eine URL mit Protokoll ist
    if '://' in host_input:
        try:
            parsed = urlparse(host_input)
            # Extrahiere Hostname (ohne Port)
            hostname = parsed.hostname or parsed.netloc.split(':')[0]
            if hostname:
                logger.info(f"Hostname aus URL extrahiert: {host_input} -> {hostname}")
                return hostname
        except Exception as e:
            logger.warning(f"URL-Parsing fehlgeschlagen für {host_input}: {e}")
    
    # Entferne Port falls vorhanden (wird separat konfiguriert)
    if ':' in host_input and not host_input.startswith('['):  # IPv6-Adressen behalten
        # IPv4 oder Hostname mit Port
        host_input = host_input.split(':')[0]
    
    # Entferne alles nach einem Slash (Pfad-Komponenten)
    if '/' in host_input:
        host_input = host_input.split('/')[0]
    
    # Entferne Benutzernamen (user@host Format)
    if '@' in host_input:
        host_input = host_input.split('@')[-1]
    
    return host_input.strip()


class _ConnectionDialog(QDialog):
    def __init__(
        self,
        connection_name: Optional[str] = None,
        default_dir: str = "",
        tr: Callable = lambda x: x,
        parent: Optional[QWidget] = None,
    ):
        # noinspection PyArgumentList
        super().__init__(parent)
        self.setupUi(self)
        self.connection_name = connection_name
        self.default_dir = default_dir
        self.tr = tr
        self.is_edit_mode = bool(connection_name)


CONNECTION_DIALOG_CLASS, _ = uic.loadUiType(
    os.path.join(os.path.dirname(__file__), "res", "postgis_connection_dialog.ui")
)


class PostgisConnectionDialog(_ConnectionDialog, CONNECTION_DIALOG_CLASS):  # type: ignore
    # UI Elements
    le_connection_name: QLineEdit
    le_host: QLineEdit
    sb_port: QSpinBox
    le_database: QLineEdit
    le_username: QLineEdit
    le_password: QLineEdit
    cb_save_password: QCheckBox
    cb_ssl_mode: QComboBox
    pb_test_connection: QPushButton
    label_connection_status: QLabel
    pb_help: QPushButton
    pb_cancel: QPushButton
    pb_save: QPushButton

    def __init__(
        self,
        connection_name: Optional[str] = None,
        default_dir: str = "",
        tr: Callable = lambda x: x,
        parent: Optional[QWidget] = None,
    ):
        super().__init__(connection_name, default_dir, tr, parent)
        
        # Set window title based on mode
        if self.is_edit_mode:
            self.setWindowTitle("PostGIS Verbindung bearbeiten")
        else:
            self.setWindowTitle("Neue PostGIS Verbindung erstellen")
        
        # Connect signals
        self.pb_test_connection.clicked.connect(self.test_connection)
        self.pb_help.clicked.connect(self.show_help)
        self.pb_cancel.clicked.connect(self.reject)
        self.pb_save.clicked.connect(self.save_connection)
        
        # Load existing connection if in edit mode
        if self.is_edit_mode:
            self.load_connection(connection_name)

    def load_connection(self, connection_name: str):
        """Lädt eine bestehende Verbindung zum Bearbeiten"""
        settings = QSettings()
        base_key = f"PostgreSQL/connections/{connection_name}"
        
        # Verbindungsparameter laden
        self.le_connection_name.setText(connection_name)
        self.le_host.setText(settings.value(f"{base_key}/host", "localhost"))
        self.sb_port.setValue(int(settings.value(f"{base_key}/port", 5432)))
        self.le_database.setText(settings.value(f"{base_key}/database", ""))
        self.le_username.setText(settings.value(f"{base_key}/username", ""))
        
        # Passwort laden wenn gespeichert
        save_password = settings.value(f"{base_key}/savePassword", False, type=bool)
        self.cb_save_password.setChecked(save_password)
        if save_password:
            self.le_password.setText(settings.value(f"{base_key}/password", ""))
        
        # SSL-Modus laden
        ssl_mode = settings.value(f"{base_key}/sslmode", "prefer")
        index = self.cb_ssl_mode.findText(ssl_mode)
        if index >= 0:
            self.cb_ssl_mode.setCurrentIndex(index)

    def save_connection(self):
        """Speichert die Verbindungsparameter"""
        connection_name = self.le_connection_name.text().strip()
        
        if not connection_name:
            # TODO: Fehlermeldung - Verbindungsname erforderlich
            self.label_connection_status.setText("Fehler: Verbindungsname erforderlich")
            return
        
        if not self.le_host.text().strip():
            # TODO: Fehlermeldung - Host erforderlich
            self.label_connection_status.setText("Fehler: Host erforderlich")
            return
        
        if not self.le_username.text().strip():
            # TODO: Fehlermeldung - Benutzername erforderlich
            self.label_connection_status.setText("Fehler: Benutzername erforderlich")
            return
        
        # Verbindung in QSettings speichern
        settings = QSettings()
        base_key = f"PostgreSQL/connections/{connection_name}"
        
        # Hostname normalisieren (entfernt URL-Präfixe etc.)
        normalized_host = normalize_hostname(self.le_host.text().strip())
        settings.setValue(f"{base_key}/host", normalized_host)
        settings.setValue(f"{base_key}/port", self.sb_port.value())
        settings.setValue(f"{base_key}/database", self.le_database.text().strip())
        settings.setValue(f"{base_key}/username", self.le_username.text().strip())
        settings.setValue(f"{base_key}/sslmode", self.cb_ssl_mode.currentText())
        
        # Passwort speichern wenn gewünscht
        save_password = self.cb_save_password.isChecked()
        settings.setValue(f"{base_key}/savePassword", save_password)
        if save_password:
            settings.setValue(f"{base_key}/password", self.le_password.text())
        else:
            settings.remove(f"{base_key}/password")
        
        self.accept()

    def test_connection(self):
        """Testet die Verbindung zum PostGIS-Server"""
        host_input = self.le_host.text().strip()
        
        if not host_input:
            self.label_connection_status.setText("Fehler: Host erforderlich")
            return
        
        # Hostname normalisieren (entfernt URL-Präfixe, Ports, etc.)
        host = normalize_hostname(host_input)
        
        if host != host_input:
            logger.info(f"Hostname normalisiert: '{host_input}' -> '{host}'")
            self.label_connection_status.setText(f"Normalisiere: {host_input} -> {host}")
        
        port = self.sb_port.value()
        database = self.le_database.text().strip() or "postgres"
        username = self.le_username.text().strip()
        password = self.le_password.text()
        ssl_mode = self.cb_ssl_mode.currentText()
        
        if not username:
            self.label_connection_status.setText("Fehler: Benutzername erforderlich")
            return
        
        try:
            import psycopg2
            import socket
            
            # DNS-Auflösung vorab testen
            try:
                # Versuche IPv4-Auflösung zu erzwingen
                ip = socket.getaddrinfo(host, port, socket.AF_INET)[0][4][0]
                resolved_host = ip
                self.label_connection_status.setText(f"DNS aufgelöst: {host} -> {ip}")
            except socket.gaierror:
                # Falls IPv4 fehlschlägt, versuche IPv6
                try:
                    ip = socket.getaddrinfo(host, port, socket.AF_INET6)[0][4][0]
                    resolved_host = ip
                    self.label_connection_status.setText(f"DNS aufgelöst (IPv6): {host} -> {ip}")
                except socket.gaierror:
                    # Falls beides fehlschlägt, verwende ursprünglichen Hostnamen
                    resolved_host = host
                    self.label_connection_status.setText(f"DNS-Warnung: Verwende {host} direkt")
            
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
            status_message = "Verbindung erfolgreich"
            try:
                cursor.execute("SELECT PostGIS_Version()")
                postgis_version = cursor.fetchone()[0]
                status_message = f"Erfolg: PostGIS {postgis_version}"
            except psycopg2.Error as e:
                # PostGIS ist nicht installiert/aktiviert - autocommit macht rollback unnötig
                try:
                    cursor.execute("SELECT EXISTS(SELECT 1 FROM pg_available_extensions WHERE name = 'postgis')")
                    postgis_available = cursor.fetchone()[0]
                    if postgis_available:
                        status_message = "Erfolg: PostGIS verfügbar (nicht aktiviert)"
                    else:
                        status_message = "Erfolg: PostGIS nicht installiert"
                except psycopg2.Error:
                    # Fallback falls auch das fehlschlägt
                    status_message = "Verbindung erfolgreich (PostGIS-Status unbekannt)"
            
            cursor.close()
            conn.close()
            
            self.label_connection_status.setText(status_message)
            
        except ImportError:
            self.label_connection_status.setText("Fehler: psycopg2 nicht installiert")
        except Exception as e:
            self.label_connection_status.setText(f"Fehler: {str(e)}")

    def show_help(self):
        """Zeigt Hilfe für PostGIS-Verbindungen"""
        help_text = """PostGIS-Verbindungsparameter:

• Verbindungsname: Ein eindeutiger Name für diese Verbindung
• Host: Server-Hostname oder IP-Adresse des PostGIS-Servers  
• Port: Port des PostgreSQL-Servers (Standard: 5432)
• Datenbank: Name der Standard-Datenbank (meist 'postgres')
• Benutzername: PostgreSQL-Benutzername
• Passwort: PostgreSQL-Passwort
• SSL-Modus: Sicherheitsstufe für die Verbindung

SSL-Modi:
• disable: Keine SSL-Verschlüsselung
• allow: SSL wenn Server unterstützt
• prefer: SSL bevorzugt (Standard)
• require: SSL erforderlich
• verify-ca: SSL mit CA-Verifikation
• verify-full: SSL mit vollständiger Verifikation

Tipp: Testen Sie die Verbindung bevor Sie speichern."""
        
        from qgis.PyQt.QtWidgets import QMessageBox
        QMessageBox.information(
            self,
            "Hilfe - PostGIS Verbindung",
            help_text
        )

    def get_connection_name(self) -> str:
        """Gibt den Namen der Verbindung zurück"""
        return self.le_connection_name.text().strip()

    def get_connection_parameters(self) -> dict:
        """Gibt alle Verbindungsparameter zurück"""
        return {
            'name': self.le_connection_name.text().strip(),
            'host': self.le_host.text().strip(),
            'port': self.sb_port.value(),
            'database': self.le_database.text().strip(),
            'username': self.le_username.text().strip(),
            'password': self.le_password.text(),
            'save_password': self.cb_save_password.isChecked(),
            'ssl_mode': self.cb_ssl_mode.currentText()
        }