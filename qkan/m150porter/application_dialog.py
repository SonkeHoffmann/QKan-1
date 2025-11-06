import os
from typing import Callable, Optional, List

from qgis.core import QgsCoordinateReferenceSystem, QgsProject
from qgis.gui import QgsProjectionSelectionWidget
from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import (
    QCheckBox,
    QListWidget,
    QListWidgetItem,
    QDialog,
    QFileDialog,
    QLineEdit,
    QPushButton,
    QWidget,
    QDialogButtonBox,
)

from qkan import QKan
from qkan.database.dbfunc import DBConnection
from qkan.utils import get_logger, QkanDbError, QkanUserError

logger = get_logger("QKan.m150.application_dialog")

EXPORT_CLASS, _ = uic.loadUiType(
    os.path.join(os.path.dirname(__file__), "res", "xml_export_dialog_base.ui")
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


class ExportDialog(_Dialog, EXPORT_CLASS):  # type: ignore
    button_box: QDialogButtonBox
    tf_database: QLineEdit
    tf_export: QLineEdit

    pb_database: QPushButton
    pb_export: QPushButton

    cb_export_schaechte: QCheckBox
    cb_export_auslaesse: QCheckBox
    cb_export_speicher: QCheckBox
    cb_export_haltungen: QCheckBox
    cb_export_pumpen: QCheckBox
    cb_export_wehre: QCheckBox
    cb_export_anschlussleitungen: QCheckBox

    def __init__(
        self,
        default_dir: str,
        tr: Callable,
        parent: Optional[QWidget] = None,
    ):
        super().__init__(default_dir, tr, parent)

        # Attach events
        self.pb_export.clicked.connect(self.select_export)
        self.button_box.helpRequested.connect(self.click_help)

        # Aktionen zu Selektionen
        self.cb_selectedObjects.stateChanged.connect(self.count)

        # Init fields
        self.tf_database.setText(QKan.config.database.qkan)
        self.tf_export.setText(QKan.config.xml.export_file)
        self.cb_export_schaechte.setChecked(
            getattr(QKan.config.check_export, "export_schaechte", True)
        )
        self.cb_export_auslaesse.setChecked(
            getattr(QKan.config.check_export, "export_auslaesse", True)
        )
        self.cb_export_speicher.setChecked(
            getattr(QKan.config.check_export, "export_speicher", True)
        )
        self.cb_export_haltungen.setChecked(
            getattr(QKan.config.check_export, "export_haltungen", True)
        )
        self.cb_export_anschlussleitungen.setChecked(
            getattr(QKan.config.check_export, "export_anschlussleitungen", True)
        )
        self.cb_export_pumpen.setChecked(
            getattr(QKan.config.check_export, "export_pumpen", True)
        )
        self.cb_export_wehre.setChecked(
            getattr(QKan.config.check_export, "export_wehre", True)
        )


    def select_export(self) -> None:
        # noinspection PyArgumentList,PyCallByClass
        filename, _ = QFileDialog.getSaveFileName(
            self,
            self.tr("Zu erstellende XML-Datei"),
            self.default_dir,
            "*.xml",
        )
        if filename:
            self.tf_export.setText(filename)
            self.default_dir = os.path.dirname(filename)

    def click_selection(self) -> None:
        """Reagiert auf Checkbox zur Aktivierung der Auswahl"""

        self.count()

    def count(self) -> None:
        """ Zählt nach Änderung der Auswahlen in den Listen im Formular die Anzahl
            der betroffenen Flächen und Haltungen
        """
        logger.debug('Event: SelectionChanged')
        with DBConnection() as db_qkan:
            db_qkan.loadmodule('m150porter')

            dbname = db_qkan.dbname

            # Datenbankpfad in Dialog übernehmen
            QKan.config.database.qkan = dbname

            self.tf_database.setText(QKan.config.database.qkan)

            # Checkbox hat den Status nach dem Klick
            selected = self.cb_selectedObjects.isChecked()
            # Ausgewählte Objekte in temporäre Tabellen übernehmen
            if selected:
                n_haltungen, n_schaechte, _ = db_qkan.getSelection(selected)        # flaechen not used here
                logger.debug(f'Selection 2: {n_haltungen}, {n_schaechte}')
                if not db_qkan.sqlyml('m150_count_haltungen_sel', 'count selected haltungen'):
                    raise QkanDbError(f"{self.__class__.__name__}: errno. 105")
                n_haltungen = db_qkan.fetchone()[0]
                if not db_qkan.sqlyml('m150_count_schaechte_sel', 'count selected schaechte'):
                    raise QkanDbError(f"{self.__class__.__name__}: errno. 106")
                n_schaechte = db_qkan.fetchone()[0]

            else:
                if not db_qkan.sqlyml('m150_count_haltungen_all', 'count selected haltungen'):
                    raise QkanDbError(f"{self.__class__.__name__}: errno. 105")
                n_haltungen = db_qkan.fetchone()[0]
                if not db_qkan.sqlyml('m150_count_schaechte_all', 'count selected schaechte'):
                    raise QkanDbError(f"{self.__class__.__name__}: errno. 106")
                n_schaechte = db_qkan.fetchone()[0]

            self.lf_anzahl_haltungen.setText(f'{n_haltungen}')
            self.lf_anzahl_schaechte.setText(f'{n_schaechte}')

    def prepareDialog(self, iface) -> bool:
        # Initialisierung der Anzeige der Anzahl zu exportierender Objekte

        # Für 3 Layer Selection-Change-Events definieren
        for layernam in ['Haltungen', 'Schächte', 'Flächen']:
            layerobjects = QgsProject().instance().mapLayersByName(layernam)
            for layer in layerobjects:
                layer.selectionChanged.connect(self.count)

        try:
            self.count()
        except QkanUserError:
            return

        return True

    def finishDialog(self) -> bool:
        # Aufheben der Anzeige der Anzahl zu exportierender Objekte

        # Aufheben der Selections-Change-Events
        for layernam in ['Haltungen', 'Schächte', 'Flächen']:
            layerobjects = QgsProject().instance().mapLayersByName(layernam)
            for layer in layerobjects:
                layer.selectionChanged.disconnect()

        return True

    def click_help(self) -> None:
        """Reaktion auf Klick auf Help-Schaltfläche"""
        help_file = "https://qkan.eu/QKan_XML.html#import-aus-dwa-xml"
        os.startfile(help_file)


IMPORT_CLASS, _ = uic.loadUiType(
    os.path.join(os.path.dirname(__file__), "res", "xml_import_dialog_base.ui")
)


class ImportDialog(_Dialog, IMPORT_CLASS):  # type: ignore
    tf_database: QLineEdit
    tf_import: QLineEdit
    tf_project: QLineEdit

    pb_database: QPushButton
    pb_import: QPushButton
    pb_project: QPushButton

    pb_ordnerbild: QPushButton
    tf_ordnerbild: QLineEdit

    pb_ordnervideo: QPushButton
    tf_ordnervideo: QLineEdit

    cb_import_tabinit: QCheckBox

    epsg: QgsProjectionSelectionWidget

    checkBox: QCheckBox
    checkBox_2: QCheckBox
    checkBox_3: QCheckBox

    def __init__(
        self,
        default_dir: str,
        tr: Callable,
        parent: Optional[QWidget] = None,
    ):
        super().__init__(default_dir, tr, parent)

        # Attach events
        self.pb_import.clicked.connect(self.select_import)
        self.pb_ordnerbild.clicked.connect(self.select_ordnerbild)
        self.pb_ordnervideo.clicked.connect(self.select_ordnervideo)
        self.pb_project.clicked.connect(self.select_project)
        self.pb_database.clicked.connect(self.select_database)

        self.button_box.helpRequested.connect(self.click_help)

        # Init fields
        self.tf_database.setText(QKan.config.database.qkan)
        self.tf_import.setText(QKan.config.xml.import_file)
        self.tf_ordnerbild.setText(QKan.config.xml.ordner_bild)
        self.tf_ordnervideo.setText(QKan.config.xml.ordner_video)
        # noinspection PyCallByClass,PyArgumentList
        self.epsg.setCrs(QgsCoordinateReferenceSystem.fromEpsgId(QKan.config.epsg))
        self.tf_project.setText(QKan.config.project.file)

        self.cb_impStamm.setChecked(getattr(QKan.config.xml, "import_stamm", True))
        self.cb_impAnschluesse.setChecked(getattr(QKan.config.xml, "import_haus", True))
        # Note: cb_switchAnschluesse doesn't exist in the UI file
        if hasattr(self, 'cb_switchAnschluesse'):
            self.cb_switchAnschluesse.setChecked(getattr(QKan.config.xml, "import_switchHA", True))
        self.cb_zustand.setChecked(getattr(QKan.config.xml, "import_zustand", True))

    def select_import(self) -> None:
        # noinspection PyArgumentList,PyCallByClass
        filename, _ = QFileDialog.getOpenFileName(
            self,
            self.tr("Zu importierende XML-Datei"),
            self.default_dir,
            "*.xml",
        )
        if filename:
            self.tf_import.setText(filename)
            self.default_dir = os.path.dirname(filename)

    def select_ordnerbild(self) -> None:
        # noinspection PyArgumentList,PyCallByClass
        ordner_bild = QFileDialog.getExistingDirectory(
            self,
            self.tr("Ordner zur Speicherung der Fotos"),
            self.default_dir,
        )
        if ordner_bild:
            self.tf_ordnerbild.setText(ordner_bild)
            self.default_dir = os.path.dirname(ordner_bild)

    def select_ordnervideo(self) -> None:
        # noinspection PyArgumentList,PyCallByClass
        ordner_video = QFileDialog.getExistingDirectory(
            self,
            self.tr("Ordner zur Speicherung der Videos"),
            self.default_dir,
        )
        if ordner_video:
            self.tf_ordnervideo.setText(ordner_video)
            self.default_dir = os.path.dirname(ordner_video)

    def select_project(self) -> None:
        # noinspection PyArgumentList,PyCallByClass
        filename, _ = QFileDialog.getSaveFileName(
            self,
            self.tr("Zu erstellende Projektdatei"),
            self.default_dir,
            "*.qgs",
        )
        if filename:
            self.tf_project.setText(filename)
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
        help_file = "https://qkan.eu/QKan_XML.html#import-aus-dwa-xml"
        os.startfile(help_file)
