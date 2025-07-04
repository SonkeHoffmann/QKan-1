import os
from typing import Callable, List, Optional

from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import (
    QCheckBox,
    QDialog,
    QFileDialog,
    QLineEdit,
    QListWidget,
    QListWidgetItem,
    QPushButton,
    QRadioButton,
    QWidget,
    QDialogButtonBox,
)
from qgis.core import QgsCoordinateReferenceSystem
from qgis.gui import QgsProjectionSelectionWidget

from qkan import QKan, list_selected_items
from qkan.database.dbfunc import DBConnection
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
        #help_file = "https://qkan.eu/QKan_SWMM.html#import-aus-swmm-datei"
        #os.startfile(help_file)
        pass

