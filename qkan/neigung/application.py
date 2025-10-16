from qgis.gui import QgisInterface
from qkan import QKan
from qkan.database.dbfunc import DBConnection
from qkan.plugin import QKanPlugin

from qkan.utils import get_logger
from qkan.tools.qkan_utils import get_database_QKan, get_default_dir
logger = get_logger("QKan")

# noinspection PyUnresolvedReferences
from . import resources  # noqa: F401

from ._neigung import NeigungTask
from .application_dialog import NeigungDialog

class Neigung(QKanPlugin):
    def __init__(self, iface: QgisInterface):
        super().__init__(iface)
        default_dir = get_default_dir()

        self.neigung_dlg = NeigungDialog(default_dir=default_dir, tr=self.tr)

    # noinspection PyPep8Naming
    def initGui(self) -> None:
        icon_neigung = ":/plugins/qkan/neigung/res/icon_neigung.png"
        QKan.instance.add_action(
            icon_neigung,
            text=self.tr("Neigungsklassen ermitteln"),
            callback=self.run,
            parent=self.iface.mainWindow(),
        )

    def unload(self) -> None:
        self.neigung_dlg.close()


    def run(self) -> None:
        # Prüfen, ob ein Projekt geladen ist

        self.neigung_dlg.show()
        if self.neigung_dlg.exec_():
            # Read from form and save to config

            get_database_QKan()
            database_qkan, epsg = QKan.config.database.qkan, QKan.config.epsg
            if not database_qkan:
                logger.error(
                    "selection.application: database_QKan konnte nicht aus den Layern ermittelt werden. Abbruch!"
                )
                return

            with DBConnection(
                    dbname=database_qkan, epsg=epsg
            ) as db_qkan:
                if not db_qkan.connected:
                    return False

                check_cb = {}
                check_cb['cb1'] = self.neigung_dlg.dgm_automatisch.isChecked()
                check_cb['cb2'] = self.neigung_dlg.dgm_manuell.isChecked()

                imp = NeigungTask(self.neigung_dlg.url_dgm_daten.text(), self.neigung_dlg.speicher_neigung.text(), self.neigung_dlg.speicher_dgm.text(),
                    db_qkan, check_cb, epsg
                    )
                imp.run()
