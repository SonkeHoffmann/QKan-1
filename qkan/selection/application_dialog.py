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
    radioButton: QRadioButton
    radioButton_2: QRadioButton
    radioButton_3: QRadioButton
    radioButton_4: QRadioButton
    radioButton_5: QRadioButton
    radioButton_6: QRadioButton
    radioButton_7: QRadioButton
    radioButton_8: QRadioButton
    radioButton_9: QRadioButton
    radioButton_10: QRadioButton


    def __init__(self,
        default_dir: str,
        tr: Callable,
        parent: Optional[QWidget] = None,
    ):
        super().__init__(default_dir, tr, parent)

