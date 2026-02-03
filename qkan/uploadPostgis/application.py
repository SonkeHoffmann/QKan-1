from qgis.core import Qgis
from qgis.gui import QgisInterface

from qkan import QKan
from qkan.plugin import QKanPlugin
from qkan.tools.qkan_utils import get_default_dir
from qkan.utils import get_logger

logger = get_logger("QKan.uploadPostgis.application")

from ._uploadPostgis import UploadPostgisTask
from .application_dialog import UploadPostgisDialog

# noinspection PyUnresolvedReferences
from . import resources  # noqa: F401


class UploadPostgis(QKanPlugin):
    """
    Plugin zum Upload einer SQLite-Datenbank auf PostGIS WebSuite.
    
    Ermöglicht den Transfer aller geometrischen Objekte aus einer QKan
    SQLite-Datenbank auf einen PostGIS-Server für die Kartendarstellung
    in der WebSuite.
    """
    
    def __init__(self, iface: QgisInterface):
        super().__init__(iface)

        default_dir = get_default_dir()
        self.uploadPostgis_dlg = UploadPostgisDialog(default_dir, tr=self.tr)

    # noinspection PyPep8Naming
    def initGui(self) -> None:
        icon_uploadPostgis = ":/plugins/qkan/uploadPostgis/res/icon_uploadPostgis.png"
        QKan.instance.add_action(
            icon_uploadPostgis,
            text=self.tr("Upload nach PostGIS WebSuite"),
            callback=self.openform_uploadPostgis,
            parent=self.iface.mainWindow(),
        )

    def unload(self) -> None:
        self.uploadPostgis_dlg.close()

    def openform_uploadPostgis(self) -> None:
        """Anzeigen des Formulars für den Upload zu PostGIS WebSuite"""

        self.uploadPostgis_dlg._load_uploadPostgis_config()

        self.uploadPostgis_dlg.show()

        if self.uploadPostgis_dlg.exec_():
            self.uploadPostgis_dlg._save_uploadPostgis_config()
            
            # Upload wird im Dialog gestartet (über DatabaseDialog)
            self.log.info("Upload-Dialog abgeschlossen")

    def _runuploadPostgis(self, source_database: str = None, 
                         target_database: str = "qkan_upload",
                         schema_name: str = "qkan",
                         overwrite: bool = True,
                         add_layers: bool = True) -> bool:
        """
        Start des Upload-Moduls für eine einzelne Datenbank.
        
        Args:
            source_database: Pfad zur SQLite-Quelldatenbank (optional, verwendet aktuelle QKan-DB wenn nicht angegeben)
            target_database: Name der Zieldatenbank auf PostGIS
            schema_name: PostGIS-Schema für die Tabellen
            overwrite: Bestehende Tabellen überschreiben
            add_layers: Layer nach Upload zu QGIS hinzufügen
            
        Returns:
            bool: True wenn erfolgreich
        """

        self.log.debug("UploadPostgis gestartet")

        # Parameter aus Dialog abrufen
        selected_server = self.uploadPostgis_dlg.get_selected_server()
        if not selected_server:
            self.log.error("Kein Server ausgewählt")
            return False

        # Quelldatenbank ermitteln
        if source_database is None:
            source_database = QKan.config.database.qkan
            
        if not source_database:
            self.log.error("Keine Quelldatenbank angegeben")
            return False
        
        # Progress Bar erstellen
        iface = QKan.instance.iface
        progress_bar = None
        status_message = None
        
        if iface:
            from qgis.PyQt.QtWidgets import QProgressBar
            progress_bar = QProgressBar(iface.messageBar())
            progress_bar.setRange(0, 100)

            status_message = iface.messageBar().createMessage(
                "", "Upload zu PostGIS WebSuite läuft. Bitte warten..."
            )
            status_message.layout().addWidget(progress_bar)
            iface.messageBar().pushWidget(status_message, Qgis.Info, 30)

        success = False
        try:
            task = UploadPostgisTask(
                server_connection=selected_server,
                target_database=target_database,
                source_database_file=source_database,
                schema_name=schema_name,
                overwrite=overwrite,
                progress_bar=progress_bar,
                add_layers_to_qgis=add_layers
            )
            
            success = task.run()
            
            if success:
                self.log.info("UploadPostgis erfolgreich abgeschlossen!")
                
                # Zusammenfassung der hochgeladenen Tabellen
                geom_tables = [t for t in task.uploaded_tables if t.get('has_geometry')]
                total_records = sum(t.get('records', 0) for t in task.uploaded_tables)
                
                self.log.info(f"Zusammenfassung: {len(task.uploaded_tables)} Tabellen, "
                             f"davon {len(geom_tables)} mit Geometrie, "
                             f"insgesamt {total_records} Datensätze")
            else:
                self.log.error("UploadPostgis ist mit Fehlern beendet!")
                
        except Exception as e:
            self.log.error(f"UploadPostgis Fehler: {str(e)}")
            success = False
            
        finally:
            # Status message entfernen
            if iface and status_message:
                iface.messageBar().clearWidgets()
            
        return success

