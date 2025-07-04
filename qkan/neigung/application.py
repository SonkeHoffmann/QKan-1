from qgis.gui import QgisInterface
from qgis.core import QgsProject
from PyQt5.QtWidgets import *
from qkan import QKan
from qkan.database.dbfunc import DBConnection
from qkan.plugin import QKanPlugin
from qgis.core import (
	Qgis,
	QgsProject,
	QgsVectorLayer,
	QgsDataSourceUri,
)


from qkan.utils import get_logger
from qkan.database.qkan_utils import get_database_QKan
logger = get_logger("QKan")

from PyQt5.QtWidgets import QTableWidgetItem

from ._neigung import Neigung
from .application_dialog import NeigungDialog

# noinspection PyUnresolvedReferences
from . import resources  # noqa: F401
import os

class Neigungs(QKanPlugin):
    def __init__(self, iface: QgisInterface):
        super().__init__(iface)

        self.neigung_dlg = NeigungDialog(default_dir=self.default_dir, tr=self.tr)


    # noinspection PyPep8Naming
    def initGui(self) -> None:
        icon_import = ":/plugins/qkan/selection/res/neigung.png"
        QKan.instance.add_action(
            icon_import,
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
                check_cb['cb1'] = self.neigung_dlg.radioButton.isChecked()
                check_cb['cb2'] = self.neigung_dlg.radioButton_2.isChecked()

                imp = Neigung(self.neigung_dlg.lineEdit_3.text(), self.neigung_dlg.lineEdit.text(), self.neigung_dlg.lineEdit_2.text(),
                    db_qkan, check_cb, self.neigung_dlg.lineEdit_4.text()
                    )
                imp.run()
