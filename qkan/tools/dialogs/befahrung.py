import os
from typing import TYPE_CHECKING, Optional
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
)


from qkan import QKan

from . import QKanDBDialog

if TYPE_CHECKING:
    from qkan.tools.application import QKanTools

FORM_CLASS_befahrung, _ = uic.loadUiType(
    os.path.join(os.path.dirname(__file__), "..", "res", "application_befahrung.ui")
)


class QgsBefahrungDialog(QKanDBDialog, FORM_CLASS_befahrung):  # type: ignore
    button_box: QDialogButtonBox



    def __init__(self, plugin: "QKanTools", parent: Optional[QWidget] = None):
        super().__init__(plugin, parent, readonly=True)

        self.button_box.helpRequested.connect(self.click_help)

    def click_help(self) -> None:
        pass
        # help_file = "https://www.fh-aachen.de/fileadmin/people/fb02_hoettges/" \
        #             "QKan/Doku/Qkan_Formulare.html#datenbank-aktualisieren"
        # os.startfile(help_file)

