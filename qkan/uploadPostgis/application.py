from qgis.core import Qgis
from qgis.gui import QgisInterface

from qkan import QKan, get_default_dir
from qkan.plugin import QKanPlugin
from qkan.utils import get_logger

logger = get_logger("QKan.uploadPostgis.application")

from ._uploadPostgis import UploadPostgisTask
from .application_dialog import UploadPostgisDialog

# noinspection PyUnresolvedReferences


class UploadPostgis(QKanPlugin):
    def __init__(self, iface: QgisInterface):
        super().__init__(iface)

        default_dir = get_default_dir()                                     # dient dazu, dass bei der Dateiauswahl die Suche
                                                                            # im selben Verzeichnis zu starten
        self.uploadPostgis_dlg = UploadPostgisDialog(default_dir, tr=self.tr)         # Formularinstanz

    # noinspection PyPep8Naming
    def initGui(self) -> None:
        icon_uploadPostgis = ":/plugins/qkan/uploadPostgis/res/icon_uploadPostgis.png"
        QKan.instance.add_action(
            icon_uploadPostgis,
            text=self.tr("Upload nach PostGIS"),
            callback=self.openform_uploadPostgis,
            parent=self.iface.mainWindow(),
        )

    def unload(self) -> None:
        self.uploadPostgis_dlg.close()

    def openform_uploadPostgis(self) -> None:
        """Anzeigen des Formulars und anschließender Aufruf von _runuploadPostgis"""

        self.uploadPostgis_dlg._load_uploadPostgis_config()

        self.uploadPostgis_dlg.show()

        if self.uploadPostgis_dlg.exec_():
            self.uploadPostgis_dlg._save_uploadPostgis_config()
            
            self._runuploadPostgis()

    def _runuploadPostgis(self) -> bool:
        """Start des Moduls

        Einspringpunkt für Test
        """

        self.log.debug("UploadPostgis gestartet")

        # Parameter aus Dialog abrufen
        selected_server = self.uploadPostgis_dlg.get_selected_server()
        if not selected_server:
            self.log.error("Kein Server ausgewählt")
            return False

        # Für diese Implementation nehmen wir an, dass die Zieldatenbank
        # bereits im Dialog-Workflow bestimmt wurde
        # In einer vollständigen Implementation würde dies aus dem DatabaseDialog kommen
        target_database = "qkan_upload"  # Standard-Datenbankname
        schema_name = "qkan"  # Standard-Schema
        overwrite = True  # Standard: Überschreiben erlaubt
        
        # Progress Bar erstellen
        iface = QKan.instance.iface
        progress_bar = None
        status_message = None
        
        if iface:
            from qgis.PyQt.QtWidgets import QProgressBar
            progress_bar = QProgressBar(iface.messageBar())
            progress_bar.setRange(0, 100)

            status_message = iface.messageBar().createMessage(
                "", "Upload zu PostGIS läuft. Bitte warten..."
            )
            status_message.layout().addWidget(progress_bar)
            iface.messageBar().pushWidget(status_message, Qgis.Info, 10)

        try:
            task = UploadPostgisTask(
                server_connection=selected_server,
                target_database=target_database,
                source_database_file=QKan.config.database.qkan,  # Aktuelle QKan-Datenbank verwenden
                schema_name=schema_name,
                overwrite=overwrite,
                progress_bar=progress_bar
            )
            
            success = task.run()
            
            if success:
                self.log.info("UploadPostgis erfolgreich abgeschlossen!")
            else:
                self.log.error("UploadPostgis ist mit Fehlern beendet!")
                
        except Exception as e:
            self.log.error(f"UploadPostgis Fehler: {str(e)}")
            success = False
            
        finally:
            # Status message entfernen
            if iface and status_message:
                iface.messageBar().clearWidgets()
            
        del task

        return success

