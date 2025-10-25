import os
from typing import Callable, List, Optional

from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import (
    QDialog,
    QFileDialog,
    QLineEdit,
    QPushButton,
    QWidget,
    QDialogButtonBox,
)
from qgis.gui import QgsProjectionSelectionWidget

from qkan import QKan
from qkan.utils import get_logger

logger = get_logger("QKan.swmm_erg.application_dialog")

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
        self.default_dir = str(default_dir)
        logger.debug(
            f"swmm.application_dialog._Dialog.__init__:"
            f"\nself.default_dir: {self.default_dir}"
        )
        self.tr = tr


IMPORT_CLASS, _ = uic.loadUiType(
    os.path.join(os.path.dirname(__file__), "res", "ergSWMM.ui")
)


class ImportDialog(_Dialog, IMPORT_CLASS):  # type: ignore
    button_box: QDialogButtonBox
    tf_import: QLineEdit
    pb_import: QPushButton



    epsg: QgsProjectionSelectionWidget

    def __init__(
        self,
        default_dir: str,
        tr: Callable,
        parent: Optional[QWidget] = None,
    ):
        super().__init__(default_dir, tr, parent)

        # Attach events
        self.pb_import.clicked.connect(self.select_import)
        self.button_box.helpRequested.connect(self.click_help)

        # Init fields
        self.tf_import.setText(QKan.config.xml.import_file)

        # noinspection PyCallByClass,PyArgumentList


    def select_import(self) -> None:
        # noinspection PyArgumentList,PyCallByClass
        filename, _ = QFileDialog.getOpenFileName(
            self,
            self.tr("Zu importierende SWMM-Ergebnisdatei"),
            self.default_dir,
            "*.rpt",
        )
        if filename:
            self.tf_import.setText(filename)
            self.default_dir = os.path.dirname(filename)

    def click_help(self) -> None:
        """Reaktion auf Klick auf Help-Schaltfläche"""
        help_file = "https://qkan.eu/QKan_SWMM.html#ergebnis-import-aus-swmm"
        os.startfile(help_file)

