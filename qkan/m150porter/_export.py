from pathlib import Path

# noinspection PyUnresolvedReferences
from typing import Dict, List, Optional, Union
from xml.dom import minidom
from xml.etree.ElementTree import Element, SubElement, tostring

from qgis.PyQt.QtWidgets import QProgressBar
from qgis.core import Qgis, QgsGeometry

from qkan import QKan
from qkan.database.dbfunc import DBConnection
from qkan.tools.qkan_utils import fortschritt
from qkan.utils import get_logger, QkanDbError, QkanAbortError

logger = get_logger("QKan.xml.export")


def _create_children(parent: Element, names: List[str]) -> None:
    for child in names:
        SubElement(parent, child)


def _create_children_text(
    parent: Element, children: Dict[str, Union[str, int, None]]
) -> None:
    for name, text in children.items():
        if text is None:
            SubElement(parent, name)
        else:
            SubElementText(parent, name, str(text))


# noinspection PyPep8Naming
def SubElementText(parent: Element, name: str, text: Union[str, int]) -> Element:
    s = SubElement(parent, name)
    if text is not None:
        s.text = str(text)
    return s

# TODO: Testen und Verknuepfung zu Refernztabellen prüfen


# noinspection SqlNoDataSourceInspection, SqlResolve
class ExportTask:
    def __init__(self, db_qkan: DBConnection, export_file: str):
        self.db_qkan = db_qkan
        self.export_file = export_file
        self.liste_teilgebiete = QKan.config.selections.teilgebiete

        # XML base

        self.hydraulik_objekte: Optional[Element] = None

        self.root: Element = None

    def _export_wehre(self) -> None:
        if not QKan.config.check_export.wehre:
            # or not self.hydraulik_objekte
            return

        if QKan.config.selections.selectedObjects:
            sqlnam = 'm150_ex_wehre_sel'
        else:
            sqlnam = 'm150_ex_wehre_all'

        if not self.db_qkan.sqlyml(
            sqlnam=sqlnam,
            stmt_category=sqlnam,
        ):
            logger.error_code(f"{self.__class__.__name__}: Fehler in 'm150 Export Wehre'")
            raise QkanDbError

        for (
            haltnam,
            schoben,
            schunten,
            sohleoben,
            hoehe,
            simstatus,
            kommentar,
            entwart,
            xschob,
            yschob,
        ) in self.db_qkan.fetchall():
            if sohleoben is None:
                sohleoben = 0

            abw = SubElement(self.root, "KG")
            _create_children_text(
                abw,
                {
                    "KG001": haltnam,
                    "KG211": hoehe,
                    "KG302": entwart,
                    "KG305": "B",
                    "KG306": "ZRUE",
                    "KG309": schoben,
                    "KG401": simstatus,
                    "KG999": kommentar,
                },
            )

            geo = SubElement(abw, "GO")
            _create_children_text(
                geo,
                {
                    "GO001": haltnam,

                },
            )

            _create_children_text(
                SubElement(geo, "GP"),
                {
                    "GP001": haltnam,
                    "GP005": xschob,
                    "GP006": yschob,
                    "GP007": sohleoben,
                },
            )

    def _export_pumpen(self) -> None:
        if not QKan.config.check_export.pumpen:
            # or not self.hydraulik_objekte
            return

        if QKan.config.selections.selectedObjects:
            sqlnam = 'm150_ex_pumpen_sel'
        else:
            sqlnam = 'm150_ex_pumpen_all'

        if not self.db_qkan.sqlyml(
            sqlnam=sqlnam,
            stmt_category=sqlnam,
        ):
            logger.error_code(f"{self.__class__.__name__}: Fehler in 'm150 Export Pumpen'")
            raise QkanDbError

        for (
            haltnam,
            schoben,
            schunten,
            sohleoben,
            simstatus,
            kommentar,
            entwart,
            xschob,
            yschob,
        ) in self.db_qkan.fetchall():

            abw = SubElement(self.root, "KG")
            _create_children_text(
                abw,
                {
                    "KG001": haltnam,
                    "KG302": entwart,
                    "KG305": "B",
                    "KG306": "ZPW",
                    "KG309": schoben,
                    "KG401": simstatus,
                    "KG999": kommentar,
                },
            )

            geo = SubElement(abw, "GO")
            _create_children_text(
                geo,
                {
                    "GO001": haltnam,

                },
            )

            _create_children_text(
                SubElement(geo, "GP"),
                {
                    "GP001": haltnam,
                    "GP005": xschob,
                    "GP006": yschob,
                    "GP007": sohleoben,
                },
            )

    def _export_auslaesse(self) -> None:
        if not QKan.config.check_export.auslaesse:
            return

        if QKan.config.selections.selectedObjects:
            sqlnam = "m150_ex_schaechte_sel"
        else:
            sqlnam = "m150_ex_schaechte_all"

        if not self.db_qkan.sqlyml(
            sqlnam=sqlnam,
            stmt_category=sqlnam,
            parameters={'schachttyp': 'Auslass'}
        ):
            logger.error_code(f"{self.__class__.__name__}: Fehler in 'm150 Export Auslaesse'")
            raise QkanDbError

        for (
            schnam,
            deckelhoehe,
            sohlhoehe,
            tiefe,
            durchm,
            entwart,
            baujahr,
            simstatus,
            xsch,
            ysch,
            kommentar
        ) in self.db_qkan.fetchall():
            abw = SubElement(self.root, "KG")
            _create_children_text(
                abw,
                {
                    "KG001": schnam,
                    "KG211": tiefe,
                    "KG302": entwart,
                    "KG303": baujahr,
                    "KG305": "A",
                    "KG309": durchm,
                    "KG401": simstatus,
                    "KG999": kommentar,
                },
            )

            geo = SubElement(abw, "GO")
            _create_children_text(
                geo,
                {
                    "GO001": schnam,

                },
            )

            _create_children_text(
                SubElement(geo, "GP"),
                {
                    "GP001": schnam,
                    "GP005": xsch,
                    "GP006": ysch,
                    "GP007": deckelhoehe,
                },
            )

    def _export_schaechte(self) -> None:
        if not QKan.config.check_export.schaechte:
            return

        if QKan.config.selections.selectedObjects:
            sqlnam = "m150_ex_schaechte_sel"
        else:
            sqlnam = "m150_ex_schaechte_all"

        if not self.db_qkan.sqlyml(
            sqlnam=sqlnam,
            stmt_category=sqlnam,
            parameters={'schachttyp': 'Schacht'}
        ):
            logger.error_code(f"{self.__class__.__name__}: Fehler in 'm150 Export Schaechte'")
            raise QkanDbError

        for (
            schnam,
            deckelhoehe,
            sohlhoehe,
            tiefe,
            durchm,
            entwart,
            baujahr,
            simstatus,
            xsch,
            ysch,
            kommentar
        ) in self.db_qkan.fetchall():
            abw = SubElement(self.root, "KG")
            _create_children_text(
                abw,
                {
                    "KG001": schnam,
                    "KG211": tiefe,
                    "KG302": entwart,
                    "KG303": baujahr,
                    "KG305": "S",
                    "KG309": durchm,
                    "KG401": simstatus,
                    "KG999": kommentar,
                },
            )

            geo = SubElement(abw, "GO")
            _create_children_text(
                geo,
                {
                    "GO001": schnam,

                },
            )

            _create_children_text(
                SubElement(geo, "GP"),
                {
                    "GP001": schnam,
                    "GP005": xsch,
                    "GP006": ysch,
                    "GP007": deckelhoehe,
                },
            )

    def _export_speicher(self) -> None:
        if not QKan.config.check_export.speicher:
            return

        if QKan.config.selections.selectedObjects:
            sqlnam = "m150_ex_schaechte_sel"
        else:
            sqlnam = "m150_ex_schaechte_all"

        if not self.db_qkan.sqlyml(
            sqlnam=sqlnam,
            stmt_category=sqlnam,
            parameters={'schachttyp': 'Speicher'}
        ):
            logger.error_code(f"{self.__class__.__name__}: Fehler in 'm150 Export Speicher'")
            raise QkanDbError

        for (
            schnam,
            deckelhoehe,
            sohlhoehe,
            tiefe,
            durchm,
            entwart,
            baujahr,
            simstatus,
            xsch,
            ysch,
            kommentar
        ) in self.db_qkan.fetchall():
            abw = SubElement(self.root, "KG")
            _create_children_text(
                abw,
                {
                    "KG001": schnam,
                    "KG211": tiefe,
                    "KG302": entwart,
                    "KG303": baujahr,
                    "KG305": "B",
                    "KG306": "ZRRB",
                    "KG309": durchm,
                    "KG401": simstatus,
                    "KG999": kommentar,
                },
            )

            geo = SubElement(abw, "GO")
            _create_children_text(
                geo,
                {
                    "GO001": schnam,

                },
            )

            _create_children_text(
                SubElement(geo, "GP"),
                {
                    "GP001": schnam,
                    "GP005": xsch,
                    "GP006": ysch,
                    "GP007": deckelhoehe,
                },
            )

    def _export_haltungen(self) -> None:
        if not QKan.config.check_export.haltungen:
            # or not self.hydraulik_objekte
            return

        if QKan.config.selections.selectedObjects:
            sqlnam = 'm150_ex_haltungen_sel'
        else:
            sqlnam = 'm150_ex_haltungen_all'

        if not self.db_qkan.sqlyml(
            sqlnam=sqlnam,
            stmt_category=sqlnam,
        ):
            logger.error_code(f"{self.__class__.__name__}: Fehler in 'm150 Export Haltungen'")
            raise QkanDbError

        for (
            haltnam,
            schoben,
            schunten,
            hoehe,
            breite,
            laenge,
            sohleoben,
            sohleunten,
            profil,
            strasse,
            material,
            entwart,
            baujahr,
            profilauskleidung,
            innenmaterial,
            simstatus,
            kommentar,
            gline,
        ) in self.db_qkan.fetchall():

            abw = SubElement(self.root, "HG")
            _create_children_text(
                abw,
                {
                    "HG001": haltnam,
                    "HG003": schoben,
                    "HG004": schunten,
                    "HG102": strasse,
                    "HG301": 'K',
                    "HG302": entwart,
                    "HG303": baujahr,
                    "HG304": material,
                    "HG305": profil,
                    "HG306": breite,
                    "HG307": hoehe,
                    "HG308": profilauskleidung,
                    "HG309": innenmaterial,
                    "HG310": laenge,
                    "HG313": 'A',
                    "HG401": simstatus,
                    "HG999": kommentar,
                },
            )

            gobj = QgsGeometry()
            gobj.fromWkb(gline)
            ptlis = gobj.asPolyline()
            npt = len(ptlis)
            if npt == 2:
                gtype = 'L'
            elif npt > 2:
                gtype = 'Poly'
            else:
                logger.debug(f"Die Haltungsgeometrie {gobj=} hat weniger als 2 Punkte")
                continue

            kante = SubElement(abw, "GO")
            _create_children_text(
                kante,
                {
                    "GO001": haltnam,
                    "GO002": 'H',
                    "GO003": gtype,
                },
            )

            for ip, ptobj in enumerate(ptlis):
                geom = SubElement(kante, "GP")

                if ip == 1:
                    _create_children_text(
                        geom,
                        {
                            "GP001": schoben,
                            "GP005": ptobj.x(),
                            "GP006": ptobj.x(),
                            "GP007": sohleoben,
                        },
                    )

                elif ip == npt:
                    _create_children_text(
                        geom,
                        {
                            "GP001": schunten,
                            "GP005": ptobj.x(),
                            "GP006": ptobj.x(),
                            "GP007": sohleunten,
                        },
                    )
                else:
                    _create_children_text(
                        geom,
                        {
                            "GP001": f'{haltnam}-{ip - 1}',
                            "GP005": ptobj.x(),
                            "GP006": ptobj.x(),
                        },
                    )

    def _export_anschlussleitungen(self) -> None:
        if not QKan.config.check_export.anschlussleitungen:
            # or not self.hydraulik_objekte
            return

        if QKan.config.selections.selectedObjects:
            sqlnam = "m150_ex_anschlussleitungen_sel"
        else:
            sqlnam = "m150_ex_anschlussleitungen_all"

        if not self.db_qkan.sqlyml(
            sqlnam=sqlnam,
            stmt_category=sqlnam,
        ):
            logger.error_code(f"{self.__class__.__name__}: Fehler in 'm150 Export Anschlussleitungen'")
            raise QkanDbError

        for (
            leitnam,
            schoben,
            schunten,
            haltnam,
            urstation,
            hoehe,
            breite,
            laenge,
            sohleoben,
            sohleunten,
            profil,
            material,
            entwart,
            simstatus,
            baujahr,
            aussendurchmesser,
            profilauskleidung,
            innenmaterial,
            kommentar,
            gline
        ) in self.db_qkan.fetchall():
            abw = SubElement(self.root, "HG")
            _create_children_text(
                abw,
                {
                    "HG001": leitnam,
                    "HG003": schoben,
                    "HG004": schunten,
                    "HG005": haltnam,
                    "HG006": 'H',
                    "HG007": urstation,
                    "HG008": 'I',                   # QKan-Standard: in Fließrichtung
                    "HG301": 'K',
                    "HG302": entwart,
                    "HG303": baujahr,
                    "HG304": material,
                    "HG306": breite,
                    "HG307": hoehe,
                    "HG308": profilauskleidung,
                    "HG309": innenmaterial,
                    "HG310": laenge,
                    "HG313": 'B',
                    "HG401": simstatus,
                    "HG999": kommentar,
                },
            )

            kante = SubElement(abw, "GO")
            _create_children_text(
                kante,
                {
                    "GO001": leitnam,
                    "GO002": 'H',
                },
            )

            geom = SubElement(kante, "GP")
            _create_children_text(
                geom,
                {
                    "GP001": schoben,
                    "GP005": xschob,                  # todo: Schacht- und Deckelhöhe mit entsprechendem TAG markieren
                    "GP006": yschob,
                    "GP007": sohleoben,
                },
            )

            kante = SubElement(abw, "GO")
            geom = SubElement(kante, "GP")
            _create_children_text(
                geom,
                {
                    "GP001": schunten,
                    "GP005": xschun,
                    "GP006": yschun,
                    "GP007": sohleunten,
                },
            )

    def run(self) -> None:
        """
        Export der Kanaldaten aus einer QKan-SpatiaLite-Datenbank und Schreiben in eine XML-Datei
        """
        iface = QKan.instance.iface

        self.db_qkan.loadmodule("m150porter")

        # Create progress bar
        progress_bar = QProgressBar(iface.messageBar())
        progress_bar.setRange(0, 100)

        status_message = iface.messageBar().createMessage(
            "", "Export in Arbeit. Bitte warten..."
        )
        status_message.layout().addWidget(progress_bar)
        iface.messageBar().pushWidget(status_message, Qgis.MessageLevel.Info, 10)

        fortschritt("Export startet...", 0.05)

        # region Create XML structure
        self.root = Element("DATA", {"xmlns:xsi": "http://www.w3.org/2001/XMLSchema-instance", }
        )

        # Export
        self._export_schaechte()            ; fortschritt("Schächte eingefügt", 0.30)
        self._export_wehre()                ; fortschritt("Wehre eingefügt", 0.35)
        self._export_pumpen()               ; fortschritt("Pumpen eingefügt", 0.40)
        self._export_auslaesse()            ; fortschritt("Auslässe eingefügt", 0.45)
        self._export_speicher()             ; fortschritt("Speicher eingefügt", 0.50)
        self._export_haltungen()            ; fortschritt("Haltungen eingefügt", 0.75)
        self._export_anschlussleitungen()   ; fortschritt("Anschlussleitungen eingefügt", 0.95)
        # self._export_haltungen_inspektion() ; fortschritt("Haltungen Inspektion eingefügt", 0.60)
        # self._export_schaechte_inspektion() ; fortschritt("Schächte eingefügt", 0.4)

        Path(self.export_file).write_bytes(
            minidom.parseString(tostring(self.root)).toprettyxml(
                indent="  ",
                standalone = False,
                encoding = 'iso-8859-1'
            )
        )

        # Close connection
        del self.db_qkan

        fortschritt("Export abgeschlossen.", 1)
        progress_bar.setValue(100)
        status_message.setText("Datenexport abgeschlossen.")
        status_message.setLevel(Qgis.MessageLevel.Success)
