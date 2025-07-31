import os
from typing import Callable, Optional, TYPE_CHECKING
from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import (
    QFileDialog,
    QLineEdit,
    QPushButton,
    QWidget,
    QDialog,
    QRadioButton,
)

if TYPE_CHECKING:
    from qkan.tools.application import QKanTools

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


NEIGUNG_CLASS, _ = uic.loadUiType(
    os.path.join(os.path.dirname(__file__), "res", "neigung.ui")
)

class NeigungDialog(_Dialog, NEIGUNG_CLASS):  # type: ignore
    #button_box: QDialogButtonBox
    lineEdit: QLineEdit
    lineEdit_2: QLineEdit
    lineEdit_3: QLineEdit
    lineEdit_4: QLineEdit
    pushButton: QPushButton
    pushButton_2: QPushButton
    pushButton_3: QPushButton
    radioButton: QRadioButton
    radioButton_2: QRadioButton


    def __init__(self,
        default_dir: str,
        tr: Callable,
        parent: Optional[QWidget] = None,
    ):
        super().__init__(default_dir, tr, parent)

        self.pushButton.clicked.connect(self.select_dgm_ordner)

        self.pushButton_2.clicked.connect(self.select_dgm_speicher)


    def select_dgm_ordner(self):
        dirname = QFileDialog.getExistingDirectory(
            self,
            self.tr("Speicherort DGM wählen"),
            self.default_dir,
        )
        if dirname:
            self.lineEdit.setText(dirname)
            self.default_dir = os.path.dirname(dirname)


    def select_dgm_speicher(self):
        filename, _ = QFileDialog.getOpenFileName(
            self,
            self.tr("Vorhandene DGM Datei wählen"),
            self.default_dir,
            "*.tif",
        )

        if filename:
            self.lineEdit_2.setText(filename)

