import os
from typing import Callable, List, Optional

from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import (
    QCheckBox,
    QDialog,
    QFileDialog,
    QLineEdit,
    QPushButton,
    QWidget,
)

from qkan import QKan
from qkan.utils import get_logger, QkanError, QkanDbError, QkanAbortError

logger = get_logger("QKan.sync.application_dialog")


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


COMPARE_CLASS, _ = uic.loadUiType(
    os.path.join(os.path.dirname(__file__), "res", "compare_dialog_base.ui")
)


class CompareDialog(_Dialog, COMPARE_CLASS):  # type: ignore
    tf_database: QLineEdit
    tf_extdb: QLineEdit
    tf_protokolldatei: QLineEdit

    pb_select_extdb: QPushButton
    pb_project: QPushButton

    cb_schaechte: QCheckBox
    cb_haltungen: QCheckBox
    cb_haschaechte: QCheckBox
    cb_haleitungen: QCheckBox
    cb_flaechen: QCheckBox
    cb_tezg: QCheckBox
    cb_linkfl: QCheckBox
    cb_schaechte_insp: QCheckBox
    cb_haltungen_insp: QCheckBox
    cb_haleitungen_insp: QCheckBox
    cb_linksw: QCheckBox
    cb_einleitdirekt: QCheckBox
    cb_refdata: QCheckBox
    cb_notizen: QCheckBox
    cb_symbole: QCheckBox
    cb_plausi: QCheckBox
    cb_showComparetables: QCheckBox

    def __init__(
        self,
        default_dir: str,
        tr: Callable,
        parent: Optional[QWidget] = None,
    ):
        # noinspection PyCallByClass,PyArgumentList
        super().__init__(default_dir, tr, parent)

        # Attach events
        self.pb_select_extdb.clicked.connect(self.select_qkan_ext)

        self.button_box.helpRequested.connect(self.click_help)

    def select_qkan_ext(self) -> None:
        # noinspection PyArgumentList,PyCallByClass
        filename, _ = QFileDialog.getOpenFileName(
            self,
            self.tr("Externe QKan-Datenbank zur Datenübernahme"),
            self.default_dir,
            "*.sqlite",
        )
        if filename:
            self.tf_extdb.setText(filename)
            self.default_dir = os.path.dirname(filename)

    def select_database(self) -> None:
        # noinspection PyArgumentList,PyCallByClass
        filename, _ = QFileDialog.getSaveFileName(
            self,
            self.tr("Zu erstellende SQLite-Datei"),
            self.default_dir,
            "*.sqlite",
        )
        if filename:
            self.tf_database.setText(filename)
            self.default_dir = os.path.dirname(filename)

    def click_help(self) -> None:
        """Reaktion auf Klick auf Help-Schaltfläche"""

        help_file = "https://qkan.eu/QKan_Synchronisation.html#Synchronisation_von_QKan_Projekten"
        os.startfile(help_file)

    def _load_compare_config(self):
        # Read fields from Config

        self.tf_database.setText(QKan.config.database.qkan)
        self.tf_extdb.setText(QKan.config.sync.ext)

        self.cb_schaechte.setChecked(QKan.config.sync.check_schaechte)
        self.cb_haltungen.setChecked(QKan.config.sync.check_haltungen)
        self.cb_haschaechte.setChecked(QKan.config.sync.check_haschaechte)
        self.cb_haleitungen.setChecked(QKan.config.sync.check_haleitungen)
        self.cb_flaechen.setChecked(QKan.config.sync.check_flaechen)
        self.cb_einleitdirekt.setChecked(QKan.config.sync.check_einleitdirekt)
        self.cb_tezg.setChecked(QKan.config.sync.check_tezg)
        self.cb_linkfl.setChecked(QKan.config.sync.check_linkfl)
        self.cb_linksw.setChecked(QKan.config.sync.check_linksw)
        self.cb_schaechte_insp.setChecked(QKan.config.sync.check_schaechte_insp)
        self.cb_haltungen_insp.setChecked(QKan.config.sync.check_haltungen_insp)
        self.cb_haleitungen_insp.setChecked(QKan.config.sync.check_haleitungen_insp)
        self.cb_notizen.setChecked(QKan.config.sync.check_notizen)
        self.cb_symbole.setChecked(QKan.config.sync.check_symbole)
        self.cb_plausi.setChecked(QKan.config.sync.check_plausi)
        self.cb_refdata.setChecked(QKan.config.sync.ckeck_refdata)
        self.cb_showComparetables.setChecked(QKan.config.sync.check_showAttrTables)

    def _save_compare_config(self):
        # Read from form and save to config
        QKan.config.database.qkan = self.tf_database.text()
        QKan.config.sync.ext = self.tf_extdb.text()

        QKan.config.sync.check_schaechte = self.cb_schaechte.isChecked()
        QKan.config.sync.check_haltungen = self.cb_haltungen.isChecked()
        QKan.config.sync.check_haschaechte = self.cb_haschaechte.isChecked()
        QKan.config.sync.check_haleitungen = self.cb_haleitungen.isChecked()
        QKan.config.sync.check_flaechen = self.cb_flaechen.isChecked()
        QKan.config.sync.check_einleitdirekt = self.cb_einleitdirekt.isChecked()
        QKan.config.sync.check_tezg = self.cb_tezg.isChecked()
        QKan.config.sync.check_linkfl = self.cb_linkfl.isChecked()
        QKan.config.sync.check_linksw = self.cb_linksw.isChecked()
        QKan.config.sync.check_schaechte_insp = self.cb_schaechte_insp.isChecked()
        QKan.config.sync.check_haltungen_insp = self.cb_haltungen_insp.isChecked()
        QKan.config.sync.check_haleitungen_insp = self.cb_haleitungen_insp.isChecked()
        QKan.config.sync.check_notizen = self.cb_notizen.isChecked()
        QKan.config.sync.check_symbole = self.cb_symbole.isChecked()
        QKan.config.sync.check_plausi = self.cb_plausi.isChecked()
        QKan.config.sync.ckeck_refdata = self.cb_refdata.isChecked()
        QKan.config.sync.check_showAttrTables = self.cb_showComparetables.isChecked()
        # self.cb_selectedTgbs.isChecked()

        QKan.config.save()


ADJUST_CLASS, _ = uic.loadUiType(
    os.path.join(os.path.dirname(__file__), "res", "adjust_dialog_base.ui")
)


class AdjustDialog(_Dialog, ADJUST_CLASS):  # type: ignore
    tf_database: QLineEdit
    tf_extdb: QLineEdit
    tf_protokolldatei: QLineEdit

    pb_select_extdb: QPushButton
    pb_project: QPushButton

    cb_haltungen: QCheckBox
    cb_schaechte: QCheckBox

    def __init__(
        self,
        default_dir: str,
        tr: Callable,
        parent: Optional[QWidget] = None,
    ):
        # noinspection PyCallByClass,PyArgumentList
        super().__init__(default_dir, tr, parent)

        # Attach events
        self.pb_protokolldatei.clicked.connect(self.select_protokolldatei)

        self.button_box.helpRequested.connect(self.click_help)

        self._load_adjust_config()

    def select_protokolldatei(self):
        """Angabe der Protokolldatei"""
        filename, _ = QFileDialog.getSaveFileName(
            self,
            self.tr("Zu erstellende Protokolldatei"),
            self.default_dir,
            "*.txt",
        )
        if filename:
            self.tf_protokolldatei.setText(filename)
            self.default_dir = os.path.dirname(filename)

    def _load_adjust_config(self):
        # Read fields from Config
        self.tf_database.setText(QKan.config.database.qkan)
        self.tf_extdb.setText(QKan.config.sync.ext)

        self.tf_protokolldatei.setText(QKan.config.sync.protfile)

    def _save_adjust_config(self):
        # Read from form and save to config
        QKan.config.database.qkan = self.tf_database.text()
        QKan.config.sync.ext = self.tf_extdb.text()
        QKan.config.sync.protfile = self.tf_protokolldatei.text()

        QKan.config.save()

    def click_help(self) -> None:
        """Reaktion auf Klick auf Help-Schaltfläche"""

        help_file = "https://qkan.eu/QKan_Synchronisation.html#Synchronisation_von_QKan_Projekten"
        os.startfile(help_file)
