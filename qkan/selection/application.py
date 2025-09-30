from qgis.gui import QgisInterface
from qkan import QKan
from qkan.database.dbfunc import DBConnection
from qkan.plugin import QKanPlugin

from qkan.utils import get_logger
from qkan.tools.qkan_utils import get_database_QKan
logger = get_logger("QKan")

from ._selection import Select
from .application_dialog import SelectionDialog

# noinspection PyUnresolvedReferences
from . import resources  # noqa: F401

class Selection(QKanPlugin):
    def __init__(self, iface: QgisInterface):
        super().__init__(iface)

        self.select_dlg = SelectionDialog(default_dir=self.default_dir, tr=self.tr)


    # noinspection PyPep8Naming
    def initGui(self) -> None:
        icon_import = ":/plugins/qkan/selection/res/icon_selection.png"
        QKan.instance.add_action(
            icon_import,
            text=self.tr("Selektion"),
            callback=self.run,
            parent=self.iface.mainWindow(),
        )

    def unload(self) -> None:
        self.select_dlg.close()


    def run(self) -> None:
        # Prüfen, ob ein Projekt geladen ist

        self.select_dlg.show()
        if self.select_dlg.exec_():
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
                check_cb['cb1'] = self.select_dlg.radioButton.isChecked()
                check_cb['cb2'] = self.select_dlg.radioButton_2.isChecked()
                check_cb['cb3'] = self.select_dlg.radioButton_4.isChecked()
                check_cb['cb4'] = self.select_dlg.radioButton_5.isChecked()
                check_cb['cb5'] = self.select_dlg.radioButton_6.isChecked()
                check_cb['cb6'] = self.select_dlg.radioButton_7.isChecked()
                check_cb['cb7'] = self.select_dlg.radioButton_8.isChecked()
                check_cb['cb8'] = self.select_dlg.radioButton_3.isChecked()
                check_cb['cb9'] = self.select_dlg.radioButton_9.isChecked()
                check_cb['cb10'] = self.select_dlg.radioButton_10.isChecked()

                imp = Select(
                    db_qkan,
                    check_cb)
                imp.run()
