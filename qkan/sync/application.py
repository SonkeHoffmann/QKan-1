from typing import Callable, List, Optional

from qgis.core import Qgis, QgsCoordinateReferenceSystem, QgsProject
from qgis.gui import QgisInterface
from qgis.utils import pluginDirectory

from qkan import QKan, get_default_dir
from qkan.plugin import QKanPlugin

from ._compare import CompareTask
from ._adjust import AdjustTask
from .application_dialog import CompareDialog, AdjustDialog

# noinspection PyUnresolvedReferences
from . import resources

from qkan.utils import get_logger

logger = get_logger("QKan.sync.application")


class Synchronisation(QKanPlugin):
    def __init__(self, iface: QgisInterface):
        super().__init__(iface)

        default_dir = get_default_dir()
        self.compare_dlg = CompareDialog(default_dir, tr=self.tr)
        self.adjust_dlg = AdjustDialog(default_dir, tr=self.tr)
        self.tgbs_selected = False             # Filterung auf Teilgebiete

    # noinspection PyPep8Naming
    def initGui(self) -> None:
        """Create the menu entries and toolbar icons inside the QGIS GUI."""

        icon_compare = ":/plugins/qkan/sync/res/icon_compare.png"
        QKan.instance.add_action(
            icon_compare,
            text=self.tr("Vergleich mit einem anderen QKan-Projekt"),
            callback=self.openform_compare,
            parent=self.iface.mainWindow(),
        )

        icon_adjust = ":/plugins/qkan/sync/res/icon_adjust.png"
        QKan.instance.add_action(
            icon_adjust,
            text=self.tr("Synchronisation mit einem anderen QKan-Projekt"),
            callback=self.openform_adjust,
            parent=self.iface.mainWindow(),
        )

    def unload(self) -> None:
        self.compare_dlg.close()
        self.adjust_dlg.close()

    def openform_compare(self) -> None:
        """Anzeigen des Vergleichs-Formulars. Bei OK Start des Projektvergleichs"""

        self.compare_dlg._load_compare_config()
        try:
            self.compare_dlg._prepareDialog()
        except:
            logger.debug('self.__class__.__name__: openform_compare fehlgeschlagen')
            return

        self.compare_dlg.show()

        if self.compare_dlg.exec_():
            self.compare_dlg._save_compare_config()

            if self.compare_dlg.tf_extdb.text() == "":

                logger.error_user("QKan-Fehlermeldung - Fehler beim Import", "Es wurde kein Verzeichnis ausgewählt!")
                return

            self.tgbs_selected = self.compare_dlg.cb_teilgebiete.isChecked()

            self._run_compare()

    def _run_compare(self) -> bool:
        """Start des Templates"""

        task = CompareTask(self.tgbs_selected)
        task.run()
        del task

        self.log.debug("Closed DB")

        return True

    def openform_adjust(self) -> None:
        """Anzeigen des Synchronisations-Formulars. Bei OK Start der Synchronisation"""

        self.adjust_dlg._load_adjust_config()

        self.adjust_dlg.show()

        if self.adjust_dlg.exec_():
            self.adjust_dlg._save_adjust_config()

            if QKan.config.sync.ext == "":

                logger.error_user("QKan-Fehlermeldung - Fehler beim Import", "Es wurde kein Verzeichnis ausgewählt!")
                return

            self._run_adjust()

    def _run_adjust(self) -> bool:
        """Start des Templates"""

        task = AdjustTask()
        task.run()
        del task

        self.log.debug("Closed DB")

        return True
