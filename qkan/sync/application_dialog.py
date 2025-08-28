import os
from typing import Callable, List, Optional

from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import (
    QCheckBox,
    QDialog,
    QFileDialog,
    QLineEdit,
    QListWidgetItem,
    QPushButton,
    QWidget,
)

from qkan import QKan
from qkan.database.dbfunc import DBConnection
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

    cb_haltungen: QCheckBox
    cb_schaechte: QCheckBox
    cb_haleitungen: QCheckBox
    cb_flaechen: QCheckBox
    cb_tezg: QCheckBox
    cb_linkfl: QCheckBox
    cb_schaechte_inspek: QCheckBox
    cb_haltungen_inspek: QCheckBox
    cb_haleitungen_inspek: QCheckBox
    cb_teilgebiete: QCheckBox
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
        self.cb_teilgebiete.stateChanged.connect(self.click_selection)
        self.lw_teilgebiete.itemClicked.connect(self.click_lw_teilgebiete)

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
        self.cb_haleitungen.setChecked(QKan.config.sync.check_haleitungen)
        self.cb_flaechen.setChecked(QKan.config.sync.check_flaechen)
        self.cb_tezg.setChecked(QKan.config.sync.check_tezg)
        self.cb_linkfl.setChecked(QKan.config.sync.check_linkfl)
        self.cb_schaechte_insp.setChecked(QKan.config.sync.check_schaechte_insp)
        self.cb_haltungen_insp.setChecked(QKan.config.sync.check_haltungen_insp)
        self.cb_haleitungen_insp.setChecked(QKan.config.sync.check_haleitungen_insp)
        self.cb_showComparetables.setChecked(QKan.config.sync.check_showAttrTables)
        self.cb_teilgebiete.setChecked((QKan.config.selections.teilgebiete != []))

    def _save_compare_config(self):
        # Read from form and save to config
        QKan.config.database.qkan = self.tf_database.text()
        QKan.config.sync.ext = self.tf_extdb.text()

        QKan.config.sync.check_schaechte = self.cb_schaechte.isChecked()
        QKan.config.sync.check_haltungen = self.cb_haltungen.isChecked()
        QKan.config.sync.check_haleitungen = self.cb_haleitungen.isChecked()
        QKan.config.sync.check_flaechen = self.cb_flaechen.isChecked()
        QKan.config.sync.check_tezg = self.cb_tezg.isChecked()
        QKan.config.sync.check_linkfl = self.cb_linkfl.isChecked()
        QKan.config.sync.check_schaechte_insp = self.cb_schaechte_insp.isChecked()
        QKan.config.sync.check_haltungen_insp = self.cb_haltungen_insp.isChecked()
        QKan.config.sync.check_haleitungen_insp = self.cb_haleitungen_insp.isChecked()
        QKan.config.sync.check_showAttrTables = self.cb_showComparetables.isChecked()
        # self.cb_selectedTgbs.isChecked()

        teilgebiete = [
            _.text() for _ in self.lw_teilgebiete.selectedItems()
        ]
        QKan.config.selections.teilgebiete = teilgebiete

        QKan.config.save()

    def click_selection(self) -> None:
        """Reagiert auf Checkbox zur Aktivierung der Auswahl"""

        # Checkbox hat den Status nach dem Klick
        if not self.cb_teilgebiete.isChecked():
            # Auswahl deaktivieren und Liste zurücksetzen
            anz = self.lw_teilgebiete.count()
            for i in range(anz):
                item = self.lw_teilgebiete.item(i)
                item.setSelected(False)
                # self.lw_teilgebiete.setItemSelected(item, False)

    def click_lw_teilgebiete(self) -> None:
        """Reaktion auf Klick in Tabelle"""

        self.cb_teilgebiete.setChecked(True)

    def _prepareDialog(self) -> bool:
        """Füllt Auswahllisten im Export-Dialog"""

        # Alle Teilgebiete in Flächen, Schächten und Haltungen, die noch nicht in Tabelle "teilgebiete" enthalten
        # sind, ergänzen
        with DBConnection() as db_qkan:
            db_qkan.loadmodule('sync')

            try:
                db_qkan.sqlyml('sync_collect_teilgebiete', '_prepareDialog')
            except:
                logger.debug(f'Fehler in {self.__class__.__name__}')
                raise QkanError

            db_qkan.commit()

            # Anlegen der Tabelle zur Auswahl der Teilgebiete

            # Zunächst wird die Liste der beim letzten Mal gewählten Teilgebiete aus config gelesen
            teilgebiete = QKan.config.selections.teilgebiete

            # Abfragen der Tabelle teilgebiete nach Teilgebieten
            try:
                db_qkan.sqlyml('sync_list_teilgebiete', '_prepareDialog')
            except:
                return False
            daten = db_qkan.fetchall()
            self.lw_teilgebiete.clear()

            for ielem, elem in enumerate(daten):
                self.lw_teilgebiete.addItem(QListWidgetItem(elem[0]))
                try:
                    if elem[0] in teilgebiete:
                        self.lw_teilgebiete.setCurrentRow(ielem)
                except BaseException as err:
                    logger.error_code(f"Fehler in Listenelement teilgebiete: {err}")
                    raise QkanError

            return True

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
