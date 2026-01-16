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
    QRadioButton,
)


from qkan import QKan

from . import QKanDBDialog

if TYPE_CHECKING:
    from qkan.tools.application import QKanTools

FORM_CLASS_bericht, _ = uic.loadUiType(
    os.path.join(os.path.dirname(__file__), "..", "res", "application_bericht.ui")
)


class QgsBerichtDialog(QKanDBDialog, FORM_CLASS_bericht):  # type: ignore
    buttonBox: QDialogButtonBox
    select_all: QRadioButton
    select_auswahl: QRadioButton
    save_path: QLineEdit
    select_path: QPushButton


    def __init__(self, plugin: "QKanTools", parent: Optional[QWidget] = None):
        super().__init__(plugin, parent, readonly=True)

        self.select_path.clicked.connect(self.select_pfad)

        self.buttonBox.helpRequested.connect(self.click_help)



    def click_help(self) -> None:
        help_file = "https://qkan.eu//QKan_Formulare_Allgemein.html"
        os.startfile(help_file)

    def select_pfad(self) -> None:
        filename= QFileDialog.getExistingDirectory(self, "Haltungsberichte Speicherort")
        self.save_path.setText(filename)

        if os.path.dirname(filename) != '':
            os.chdir(os.path.dirname(filename))
