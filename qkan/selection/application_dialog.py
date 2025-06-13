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
    checkBox: QCheckBox
    checkBox_2: QCheckBox
    checkBox_3: QCheckBox
    checkBox_4: QCheckBox
    checkBox_5: QCheckBox
    checkBox_6: QCheckBox
    checkBox_7: QCheckBox
    checkBox_8: QCheckBox
    checkBox_9: QCheckBox
    checkBox_10: QCheckBox


    def __init__(self,
        default_dir: str,
        tr: Callable,
        parent: Optional[QWidget] = None,
    ):
        super().__init__(default_dir, tr, parent)

        self.button_group = QButtonGroup(self)
        self.button_group.setExclusive(True)
        self.button_group.addButton(self.checkBox_3)
        self.button_group.addButton(self.checkBox_4)
        self.button_group.addButton(self.checkBox_5)
        self.button_group.addButton(self.checkBox_6)
        self.button_group.addButton(self.checkBox_7)
        self.button_group.addButton(self.checkBox_9)
        self.button_group.addButton(self.checkBox_10)

        self.button_group2 = QButtonGroup(self)
        self.button_group2.setExclusive(True)
        self.button_group2.addButton(self.checkBox)
        self.button_group2.addButton(self.checkBox_2)
        self.button_group2.addButton(self.checkBox_8)
