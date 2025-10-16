import os
from typing import TYPE_CHECKING, Optional
from typing import Callable, Optional
import webbrowser
from qgis.gui import QgisInterface
from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import (
    QCheckBox,
    QDialogButtonBox,
    QFileDialog,
    QGroupBox,
    QLineEdit,
    QPushButton,
    QWidget,
    QTextBrowser,
    QDialog,
    QButtonGroup,
    QRadioButton,
)



if TYPE_CHECKING:
    from qkan.tools.application import QKanTools

SELECT_CLASS, _ = uic.loadUiType(
    os.path.join(os.path.dirname(__file__), ".", "res", "selection.ui")
)

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
        self.tr = tr


class SelectionDialog(_Dialog, SELECT_CLASS):  # type: ignore
    #button_box: QDialogButtonBox
    cb_selectFlaechen: QCheckBox
    cb_selectHaltungen: QCheckBox
    cb_selectSchaechte: QCheckBox
    pushButton: QPushButton
    pushButton_2: QPushButton
    pushButton_3: QPushButton
    pushButton_4: QPushButton
    pushButton_5: QPushButton



    def __init__(self,
        default_dir: str,
        tr: Callable,
        parent: Optional[QWidget] = None,
    ):
        super().__init__(default_dir, tr, parent)

        self.geklickter_button = None

        # Signale verbinden
        self.pushButton_2.clicked.connect(lambda: self.button_clicked("Teilgebiet"))
        self.pushButton_3.clicked.connect(lambda: self.button_clicked("unterhalb"))
        self.pushButton_4.clicked.connect(lambda: self.button_clicked("kuerzester"))
        self.pushButton.clicked.connect(lambda: self.button_clicked("oberhalb"))
        self.pushButton_5.clicked.connect(lambda: self.button_clicked("Fliessweg"))

    def button_clicked(self, name):
        self.geklickter_button = name
        self.accept()
