from datetime import date
from pathlib import Path

# noinspection PyUnresolvedReferences
from typing import Any, Dict, List, Optional, Union
from xml.dom import minidom
from xml.etree.ElementTree import Element, SubElement, tostring
import xml.etree.ElementTree as ET
from lxml import etree

from qgis.PyQt.QtWidgets import QProgressBar
from qgis.core import Qgis, QgsProject
from qgis.utils import iface

from qkan import QKan
from qkan.database.dbfunc import DBConnection
from qkan.tools.qkan_utils import fortschritt
from qkan.utils import get_logger

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

#TODO: Testen und Verknuepfung zu Refernztabellen prüfen

# noinspection SqlNoDataSourceInspection, SqlResolve
class ExportTask:
    def __init__(self, db_qkan: DBConnection, export_file: str, vorlage: str, auswahl_zustand:str, selection):
        self.db_qkan = db_qkan
        self.db_qkan.loadmodule('isyporter')
        self.export_file = export_file
        self.vorlage = vorlage
        self.auswahl_zustand = auswahl_zustand
        self.selection = selection

        # XML base
        self.stamm: Optional[Element] = None
        self.zustand: Optional[Element] = None
        self.hydraulik_objekte: Optional[Element] = None

        if self.vorlage != "":
            tree = etree.parse(self.vorlage)
            x = tree.xpath('namespace-uri(.)')
            self.NS = {"d": x}

    @staticmethod
    def _safe_clause(clause: str, expected_prefixes: tuple[str, ...]) -> str:
        """Sanitize dynamic SQL suffixes assembled from internal filter logic."""

        clause_clean = (clause or "").strip()
        if not clause_clean:
            return ""

        clause_upper = clause_clean.upper()
        if not any(clause_upper.startswith(prefix) for prefix in expected_prefixes):
            logger.warning(
                f"Unsichere SQL-Klausel verworfen: {clause_clean}. "
                f"Erwartete Präfixe: {expected_prefixes}"
            )
            return ""

        if ";" in clause_clean or "--" in clause_clean or "/*" in clause_clean:
            logger.warning(f"Potentiell unsichere SQL-Klausel verworfen: {clause_clean}")
            return ""

        return f" {clause_clean}"

    def _query(self, query_name: str, **kwargs: Any) -> str:
        return self.db_qkan.load_query(query_name, **kwargs)


    def _export_wehre(self) -> None:

        if self.vorlage == "":

            if (
                not getattr(QKan.config.check_export, "export_wehre", True)
                #or not self.hydraulik_objekte
                or not self.stamm
            ):
                return
            sql = self._query(
                "export_wehre",
                abfrage_h_where=self._safe_clause(self.abfrage_h_where, ("WHERE",)),
            )

            if not self.db_qkan.sql(sql, "db_qkan: export_wehre"):
                return

            fortschritt("Export Wehre...", 0.5)

            for attr in self.db_qkan.fetchall():
                (
                    haltnam,
                    schoben,
                    schunten,
                    sohleoben,
                    sohleunten,
                    hoehe,
                    breite,
                    laenge,
                    simstatus_nr,
                    kommentar,
                ) = attr

                obj = SubElement(self.hydraulik_objekte, "Hydraulikobjekt")
                _create_children_text(
                    obj, {"HydObjektTyp": None, "Objektbezeichnung": haltnam}
                )

                _create_children_text(
                    SubElement(obj, "Wehr"),
                    {
                        "SchachtZulauf": schoben,                               # schoben
                        "SchachtAblauf": schunten,                               # schunten
                        "Schwellenhoehe": sohleunten,                              # sohleoben
                        "Kammerhoehe": hoehe,                                 # hoehe
                        "LaengeWehrschwelle": laenge,                          # laenge
                    },
                )

                abw = SubElement(self.stamm, "AbwassertechnischeAnlage")
                SubElementText(abw, "Objektbezeichnung", haltnam)               # haltnam
                SubElementText(abw, "Objektart", "1")
                SubElementText(abw, "Status", simstatus_nr)                          # simstatus
                _create_children_text(
                    SubElement(
                        SubElement(SubElement(abw, "Knoten"), "Bauwerk"), "Wehr_Ueberlauf"
                    ),
                    {"LaengeWehrschwelle": laenge},                            # laenge
                )

            fortschritt("Wehre eingefügt", 0.10)

    def _export_pumpen(self) -> None:

        if self.vorlage == "":

            if (
                not getattr(QKan.config.check_export, "export_pumpen", True)
                #or not self.hydraulik_objekte
                or not self.stamm
            ):
                return

            sql = self._query(
                "export_pumpen",
                abfrage_h_where=self._safe_clause(self.abfrage_h_where, ("WHERE",)),
            )

            if not self.db_qkan.sql(sql, "db_qkan: export_pumpen"):
                return

            fortschritt("Export Pumpen...", 0.15)

            for attr in self.db_qkan.fetchall():
                (
                    haltnam,
                    sohleoben,
                    schoben,
                    schunten,
                    simstatus_nr,
                    kommentar,
                ) = attr

                obj = SubElement(self.hydraulik_objekte, "Hydraulikobjekt")
                SubElementText(obj, "Objektbezeichnung", haltnam)
                _create_children_text(
                    SubElement(obj, "Pumpe"),
                    {
                        "HydObjektTyp": None,
                        "Sohlhoehe": sohleoben,
                        "SchachtAblauf": schunten,
                        "SchachtZulauf": schoben,
                    },
                )

                abw = SubElement(self.stamm, "AbwassertechnischeAnlage")
                _create_children_text(
                    abw,
                    {
                        "Objektbezeichnung": haltnam,
                        "Objektart": str(1),
                        "Status": simstatus_nr,
                    },
                )
                SubElement(SubElement(abw, "Knoten"), "Bauwerk")

            fortschritt("Pumpen eingefügt", 0.20)

    def _export_auslaesse(self) -> None:

        if self.vorlage == "":

            if (
                not getattr(QKan.config.check_export, "export_auslaesse", True)
                or not self.stamm
            ):
                return

            sql = self._query(
                "export_auslaesse",
                abfrage_s_and=self._safe_clause(self.abfrage_s_and, ("AND",)),
            )

            if not self.db_qkan.sql(sql, u"db_qkan: export_auslaesse"):
                return

            fortschritt("Export Auslässe...", 0.25)
            for attr in self.db_qkan.fetchall():

                (
                    schnam,
                    deckelhoehe,
                    sohlhoehe,
                    durchm,
                    xsch,
                    ysch,
                    kommentar,
                    simstatus_nr,
                    entwart_nr,
                    strasse_nam,
                    kntoentyp,
                    baujahr,
                    material,
                ) = attr

                abw = SubElement(self.stamm, "AbwassertechnischeAnlage")
                _create_children_text(
                    abw,
                    {
                        "Objektbezeichnung": schnam,
                        "Objektart": str(2),
                        "Status": simstatus_nr,
                        "baujahr": baujahr,
                        "Entwaesserungsart": entwart_nr,
                        "Kommentar": kommentar,
                    },
                )
                knoten = SubElement(abw, "Knoten")
                SubElementText(knoten, "KnotenTyp", 0)
                schacht = SubElement(knoten, "Schacht")
                strasse = SubElement(abw, "Lage")
                SubElementText(strasse, "Strassenname", strasse_nam)
                SubElementText(schacht, "Schachttiefe", deckelhoehe-sohlhoehe)
                _create_children(
                    SubElement(knoten, "Bauwerk"), ["Bauwerktyp", "Auslaufbauwerk"]
                )
                # geom_knoten = SubElement(
                #    SubElement(SubElement(abw, "Geometrie"), "Geometriedaten"), "Knoten"
                # )

                geo = SubElement(abw, "Geometrie")
                x = QgsProject.instance().crs().authid()
                x.replace('EPSG:', '')
                _create_children_text(
                    geo,
                    {
                        "CRSLage": x,
                    }, )

                geom_knoten = SubElement(SubElement(geo, "Geometriedaten"), "Knoten")
                _create_children_text(
                    SubElement(geom_knoten, "Punkt"),
                    {
                        "PunktattributAbwasser": "DMP",
                        "Punkthoehe": sohlhoehe,
                        "Rechtswert": xsch,
                        "Hochwert": ysch,
                    },
                )
                _create_children_text(
                    SubElement(geom_knoten, "Punkt"),
                    {"PunktattributAbwasser": "GOK", "Punkthoehe": deckelhoehe},
                )

                _create_children_text(
                    SubElement(geom_knoten, "Punkt"),
                    {
                        "PunktattributAbwasser": "SMP",
                        "Punkthoehe": sohlhoehe,
                        "Rechtswert": xsch,
                        "Hochwert": ysch,
                    },
                )
            fortschritt("Auslässe eingefügt", 0.3)

        if self.vorlage != "":
            # Daten äbandern oder zu bestehender datei hinzufügen
            tree = ET.parse(self.vorlage)
            root = tree.getroot()

            sql = self._query(
                "export_auslaesse_vorlage",
                abfrage_s_and=self._safe_clause(self.abfrage_s_and, ("AND",)),
            )

            if not self.db_qkan.sql(sql, u"db_qkan: export_auslaesse"):
                return

            fortschritt("Export Auslässe...", 0.25)
            for attr in self.db_qkan.fetchall():

                (
                    schnam,
                    deckelhoehe,
                    sohlhoehe,
                    durchm,
                    xsch,
                    ysch,
                    kommentar,
                    simstatus_nr,
                    entwart_nr,
                    strasse_nam,
                    kntoentyp,
                    baujahr,
                    material,
                ) = attr

                blocks = root.find(
                    f"d:Datenkollektive/d:Stammdatenkollektiv/d:AbwassertechnischeAnlage/[d:Objektbezeichnung={schnam}/"
                    "d:Knoten/d:Bauwerk/d:Auslaufbauwerk/../../..", self.NS,)

                if blocks is None:
                    #Daten ergänzen
                    new_item = ET.Element('AbwassertechnischeAnlage')

                    stammdaten = root.find('Stammdatenkollektiv')
                    stammdaten.append(new_item)

                    _create_children_text(
                        new_item,
                        {
                            "Objektbezeichnung": schnam,
                            "Objektart": str(2),
                            "Status": simstatus_nr,
                            "Baujahr": baujahr,
                            "Entwaesserungsart": entwart_nr,
                            "Kommentar": kommentar,
                        },
                    )
                    knoten = SubElement(new_item, "Knoten")
                    SubElementText(knoten, "KnotenTyp", 0)
                    schacht = SubElement(knoten, "Schacht")
                    strasse = SubElement(new_item, "Lage")
                    SubElementText(strasse, "Strassenname", strasse_nam)
                    SubElementText(schacht, "Schachttiefe", deckelhoehe - sohlhoehe)
                    _create_children(
                        SubElement(knoten, "Bauwerk"), ["Bauwerktyp", "Auslaufbauwerk"]
                    )
                    # geom_knoten = SubElement(
                    #    SubElement(SubElement(abw, "Geometrie"), "Geometriedaten"), "Knoten"
                    # )
                    geo = SubElement(new_item, "Geometrie")
                    x = QgsProject.instance().crs().authid()
                    x.replace('EPSG:', '')
                    _create_children_text(
                        geo,
                        {
                            "CRSLage": x,
                        }, )

                    geom_knoten = SubElement(SubElement(geo, "Geometriedaten"), "Knoten")
                    _create_children_text(
                        SubElement(geom_knoten, "Punkt"),
                        {
                            "PunktattributAbwasser": "DMP",
                            "Punkthoehe": deckelhoehe,
                            "Rechtswert": xsch,
                            "Hochwert": ysch,
                        },
                    )
                    _create_children_text(
                        SubElement(geom_knoten, "Punkt"),
                        {"PunktattributAbwasser": "GOK", "Punkthoehe": deckelhoehe},
                    )

                    _create_children_text(
                        SubElement(geom_knoten, "Punkt"),
                        {
                            "PunktattributAbwasser": "SMP",
                            "Punkthoehe": sohlhoehe,
                            "Rechtswert": xsch,
                            "Hochwert": ysch,
                        },
                    )
                fortschritt("Auslässe eingefügt", 0.3)
                if blocks is not None:
                    pass
                    # blocks.find('Status').text = attr[7]
                    # blocks.find('Baujahr').text = attr[12]
            tree.write(self.export_file)


    def _export_schaechte(self) -> None:

        if self.vorlage == "":

            if (
                not getattr(QKan.config.check_export, "export_schaechte", True)
                or not self.stamm
            ):
                return

            sql = self._query(
                "export_schaechte",
                abfrage_s_and=self._safe_clause(self.abfrage_s_and, ("AND",)),
            )
            if not self.db_qkan.sql(sql, "db_qkan: export_schaechte"):
                return

            fortschritt("Export Schächte...", 0.35)
            for attr in self.db_qkan.fetchall():

                (
                    schnam,
                    deckelhoehe,
                    sohlhoehe,
                    durchm,
                    druckdicht,
                    entwart_nr,
                    strasse_nam,
                    kntoentyp,
                    kommentar,
                    simstatus_nr,
                    xsch,
                    ysch,
                    baujahr,
                ) = attr

                abw = SubElement(self.stamm, "AbwassertechnischeAnlage")
                _create_children_text(
                    abw,
                    {
                        "Objektbezeichnung": schnam,
                        "Objektart": str(2),
                        "Status": simstatus_nr,
                        "Baujahr": baujahr,
                        "Entwaesserungsart": entwart_nr,
                        "Kommentar": kommentar,
                    },
                )

                knoten = SubElement(abw, "Knoten")
                SubElementText(knoten, "KnotenTyp", 0)
                schacht = SubElement(knoten, "Schacht")
                if deckelhoehe is not None and deckelhoehe>0:
                    SubElementText(schacht, "Schachttiefe", deckelhoehe - sohlhoehe)
                _create_children(
                    SubElement(knoten, "Schacht"), ["Schachttiefe", "AnzahlAnschluesse"]
                )
                # geom_knoten = SubElement(
                #    SubElement(SubElement(abw, "Geometrie"), "Geometriedaten"), "Knoten"
                #
                geo = SubElement(abw, "Geometrie")
                x = QgsProject.instance().crs().authid()
                x.replace('EPSG:', '')
                _create_children_text(
                    geo,
                    {
                        "CRSLage": x,
                    }, )

                geom_knoten = SubElement(SubElement(geo, "Geometriedaten"), "Knoten")
                _create_children_text(
                    SubElement(geom_knoten, "Punkt"),
                    {
                        "PunktattributAbwasser": "DMP",
                        "Punkthoehe": deckelhoehe,
                        "Rechtswert": xsch,
                        "Hochwert": ysch,
                    },
                )

                #_create_children_text(
                #    SubElement(geom_knoten, "Punkt"),
                #    {"PunktattributAbwasser": "HP", "Punkthoehe": attr[2]},
                #)

                _create_children_text(
                    SubElement(geom_knoten, "Punkt"),
                    {
                        "PunktattributAbwasser": "SMP",
                        "Punkthoehe": sohlhoehe,
                        "Rechtswert": xsch,
                        "Hochwert": ysch,
                    },
                )

            fortschritt("Schächte eingefügt", 0.4)

        if self.vorlage != "":
            # Daten äbandern oder zu bestehender datei hinzufügen
            tree = ET.parse(self.vorlage)
            root = tree.getroot()

            sql = self._query(
                "export_schaechte_vorlage",
                abfrage_s_and=self._safe_clause(self.abfrage_s_and, ("AND",)),
            )

            if not self.db_qkan.sql(sql, u"db_qkan: export_schaechte"):
                return

            fortschritt("Export Schacht...", 0.25)
            for attr in self.db_qkan.fetchall():

                (
                    schnam,
                    deckelhoehe,
                    sohlhoehe,
                    durchm,
                    xsch,
                    ysch,
                    kommentar,
                    simstatus_nr,
                    entwart_nr,
                    strasse_nam,
                    kntoentyp,
                    baujahr,
                    material,
                ) = attr

                blocks = root.find(
                    f".//d:Datenkollektive/d:Stammdatenkollektiv/d:AbwassertechnischeAnlage/[d:Objektbezeichnung={schnam}]/[d:Objektart='2']", self.NS, )

                if blocks is None:
                    # Daten ergänzen
                    new_item = ET.Element('AbwassertechnischeAnlage')

                    stammdaten = root.find('Stammdatenkollektiv')
                    stammdaten.append(new_item)

                    _create_children_text(
                        new_item,
                        {
                            "Objektbezeichnung": schnam,
                            "Objektart": str(2),
                            "Status": simstatus_nr,
                            "Baujahr": baujahr,
                            "Entwaesserungsart": entwart_nr,
                            "Kommentar": kommentar,
                        },
                    )
                    knoten = SubElement(new_item, "Knoten")
                    SubElementText(knoten, "KnotenTyp", 0)
                    schacht = SubElement(knoten, "Schacht")
                    strasse = SubElement(new_item, "Lage")
                    SubElementText(strasse, "Strassenname", strasse_nam)
                    SubElementText(schacht, "Schachttiefe", round(deckelhoehe - sohlhoehe,2))
                    _create_children(
                        SubElement(knoten, "Schacht"), ["Schachttiefe", "AnzahlAnschluesse"]
                    )
                    # geom_knoten = SubElement(
                    #    SubElement(SubElement(abw, "Geometrie"), "Geometriedaten"), "Knoten"
                    # )
                    geo = SubElement(new_item, "Geometrie")
                    x=QgsProject.instance().crs().authid()
                    x.replace('EPSG:', '')
                    _create_children_text(
                        geo,
                        {
                            "CRSLage": x,
                        }, )

                    geom_knoten = SubElement(SubElement(geo, "Geometriedaten"), "Knoten")
                    _create_children_text(
                        SubElement(geom_knoten, "Punkt"),
                        {
                            "PunktattributAbwasser": "DMP",
                            "Punkthoehe": deckelhoehe,
                            "Rechtswert": xsch,
                            "Hochwert": ysch,
                        },
                    )
                    _create_children_text(
                        SubElement(geom_knoten, "Punkt"),
                        {"PunktattributAbwasser": "GOK", "Punkthoehe": deckelhoehe},
                    )

                    _create_children_text(
                        SubElement(geom_knoten, "Punkt"),
                        {
                            "PunktattributAbwasser": "SMP",
                            "Punkthoehe": sohlhoehe,
                            "Rechtswert": xsch,
                            "Hochwert": ysch,
                        },
                    )
                fortschritt("Schaechte eingefügt", 0.3)
                if blocks is not None:
                    pass
                    # blocks.find('Status').text = attr[7]
                    # blocks.find('Baujahr').text = attr[12]
            tree.write(self.export_file)

    def _export_speicher(self) -> None:

        if self.vorlage == "":

            if (
                not getattr(QKan.config.check_export, "export_speicher", True)
                or not self.stamm
            ):
                return

            sql = self._query(
                "export_speicher",
                abfrage_s_and=self._safe_clause(self.abfrage_s_and, ("AND",)),
            )

            if not self.db_qkan.sql(sql, "db_qkan: export_speicher"):
                return

            fortschritt("Export Speicherschächte...", 0.45)
            for attr in self.db_qkan.fetchall():

                (
                    schnam,
                    deckelhoehe,
                    sohlhoehe,
                    durchm,
                    entwart_nr,
                    strasse_nam,
                    xsch,
                    ysch,
                    kommentar,
                    simstatus_nr,
                    kntoentyp,
                    baujahr,
                ) = attr

                abw = SubElement(self.stamm, "AbwassertechnischeAnlage")
                _create_children_text(
                    abw,
                    {
                        "Objektbezeichnung": schnam,
                        "Objektart": str(2),
                        "Status": simstatus_nr,
                        "Baujahr": baujahr,
                        "Entwaesserungsart": entwart_nr,
                        "Kommentar": kommentar,
                    },
                )

                knoten = SubElement(abw, "Knoten")
                SubElementText(knoten, "KnotenTyp",0)
                bauwerk = SubElement(knoten, "Bauwerk")
                SubElement(bauwerk, "Bauwerkstyp")
                _create_children(
                    SubElement(bauwerk, "Becken"), ["AnzahlZulaeufe", "AnzahlAblaeufe"]
                )

                #geom_knoten = SubElement(
                #    SubElement(SubElement(abw, "Geometrie"), "Geometriedaten"), "Knoten"
                #)
                geo = SubElement(abw, "Geometrie")
                x = QgsProject.instance().crs().authid()
                x.replace('EPSG:', '')
                _create_children_text(
                    geo,
                    {
                        "CRSLage": x,
                    },)

                geom_knoten= SubElement(SubElement(geo, "Geometriedaten"), "Knoten")
                _create_children_text(
                    SubElement(geom_knoten, "Punkt"),
                    {
                        "PunktattributAbwasser": "DMP",
                        "Punkthoehe": deckelhoehe,
                        "Rechtswert": xsch,
                        "Hochwert": ysch,
                    },
                )
                _create_children_text(
                    SubElement(geom_knoten, "Punkt"),
                    {
                        "PunktattributAbwasser": "SMP",
                        "Punkthoehe": sohlhoehe,
                        "Rechtswert": xsch,
                        "Hochwert": ysch,
                    },
                )
            fortschritt("Speicher eingefügt", 0.5)


        if self.vorlage != "":
            # Daten äbandern oder zu bestehender datei hinzufügen
            tree = ET.parse(self.vorlage)
            root = tree.getroot()

            sql = self._query(
                "export_speicher_vorlage",
                abfrage_s_and=self._safe_clause(self.abfrage_s_and, ("AND",)),
            )

            if not self.db_qkan.sql(sql, u"db_qkan: export_schaechte"):
                return

            fortschritt("Export Speicher...", 0.25)
            for attr in self.db_qkan.fetchall():

                (
                    schnam,
                    deckelhoehe,
                    sohlhoehe,
                    durchm,
                    entwart_nr,
                    strasse_nam,
                    xsch,
                    ysch,
                    kommentar,
                    simstatus_nr,
                    kntoentyp,
                    baujahr,
                ) = attr

                blocks = root.find(
                    f".//d:Datenkollektive/d:Stammdatenkollektiv/d:AbwassertechnischeAnlage/[d:Objektbezeichnung={schnam}/[d:Objektart='2']", self.NS, )

                if blocks is None:
                    # Daten ergänzen
                    new_item = ET.Element('AbwassertechnischeAnlage')

                    stammdaten = root.find('Stammdatenkollektiv')
                    stammdaten.append(new_item)

                    _create_children_text(
                        new_item,
                        {
                            "Objektbezeichnung": schnam,
                            "Objektart": str(2),
                            "Status": simstatus_nr,
                            "Baujahr": baujahr,
                            "Entwaesserungsart": entwart_nr,
                            "Kommentar": kommentar,
                        },
                    )
                    knoten = SubElement(new_item, "Knoten")
                    SubElementText(knoten, "KnotenTyp", 0)
                    bauwerk = SubElement(knoten, "Bauwerk")
                    SubElement(bauwerk, "Bauwerkstyp")
                    _create_children(
                        SubElement(bauwerk, "Becken"), ["AnzahlZulaeufe", "AnzahlAblaeufe"]
                    )
                    # geom_knoten = SubElement(
                    #    SubElement(SubElement(abw, "Geometrie"), "Geometriedaten"), "Knoten"
                    # )
                    geo = SubElement(new_item, "Geometrie")
                    x = QgsProject.instance().crs().authid()
                    x.replace('EPSG:', '')
                    _create_children_text(
                        geo,
                        {
                            "CRSLage": x,
                        }, )

                    geom_knoten = SubElement(SubElement(geo, "Geometriedaten"), "Knoten")
                    _create_children_text(
                        SubElement(geom_knoten, "Punkt"),
                        {
                            "PunktattributAbwasser": "DMP",
                            "Punkthoehe": deckelhoehe,
                            "Rechtswert": xsch,
                            "Hochwert": ysch,
                        },
                    )
                    _create_children_text(
                        SubElement(geom_knoten, "Punkt"),
                        {"PunktattributAbwasser": "GOK", "Punkthoehe": deckelhoehe},
                    )

                    _create_children_text(
                        SubElement(geom_knoten, "Punkt"),
                        {
                            "PunktattributAbwasser": "SMP",
                            "Punkthoehe": sohlhoehe,
                            "Rechtswert": xsch,
                            "Hochwert": ysch,
                        },
                    )
                fortschritt("Speicher eingefügt", 0.3)
                if blocks is not None:
                    pass
                    # blocks.find('Status').text = attr[7]
                    # blocks.find('Baujahr').text = attr[12]

            tree.write(self.export_file)

    def _export_haltungen(self) -> None:

        if self.vorlage == "":

            if (
                not getattr(QKan.config.check_export, "export_haltungen", True)
                #or not self.hydraulik_objekte
                or not self.stamm
            ):
                return

            sql = self._query(
                "export_haltungen",
                abfrage_h_where=self._safe_clause(self.abfrage_h_where, ("WHERE",)),
            )

            if not self.db_qkan.sql(sql, "db_qkan: export_haltungen"):
                return

            fortschritt("Export Haltungen...", 0.55)

            for attr in self.db_qkan.fetchall():
                (
                    haltnam,
                    schoben,
                    schunten,
                    hoehe,
                    breite,
                    laenge,
                    sohleoben,
                    sohleunten,
                    profilnam_nr,
                    strasse_nam,
                    material,
                    entwart_nr,
                    ks,
                    simstatus_nr,
                    kommentar,
                    xschob,
                    yschob,
                    xschun,
                    yschun,
                    baujahr,
                    aussendurchmesser,
                    profilauskleidung,
                    innenmaterial,
                ) = attr

                obj = SubElement(self.hydraulik_objekte, "HydraulikObjekt")
                _create_children(obj, ["HydObjektTyp", "Objektbezeichnung"])
                _create_children_text(
                    SubElement(obj, "Haltung"),
                    {"Objektbezeichnung": haltnam, "Berechnungslaenge": laenge,"Rauigkeitsansatz": 1, "RauigkeitsbeiwertKb": ks},
                )

                abw = SubElement(self.stamm, "AbwassertechnischeAnlage")
                _create_children_text(
                    abw,
                    {
                        "Objektbezeichnung": haltnam,
                        "Objektart": str(1),
                        "Status": simstatus_nr,
                        "Baujahr": baujahr,
                        "Entwaesserungsart": entwart_nr,
                    },
                )

                kante = SubElement(abw, "Kante")
                _create_children_text(
                    kante,
                    {
                        "KantenTyp": 0,
                        "KnotenZulauf": schoben,
                        "KnotenZulaufTyp": 0,
                        "KnotenAblauf": schunten,
                        "KnotenAblaufTyp": 0,
                        "SohlhoeheZulauf": sohleoben,
                        "SohlhoeheAblauf": sohleunten,
                        "Laenge": laenge,
                        "Material": material,
                    },
                )

                _create_children_text(
                    SubElement(kante, "Profil"),
                    {
                        "ProfilID": None,
                        "SonderprofilVorhanden": None,
                        "Profilart": profilnam_nr,
                        "Profilbreite": breite,
                        "Profilhoehe": hoehe,
                        "Aussendurchmesser": aussendurchmesser,
                        "Auskleidung": profilauskleidung,
                        "MaterialAuskleidung": innenmaterial,
                    },
                )

                SubElementText(SubElement(kante, "Haltung"), "DMPLaenge", laenge)

                strasse = SubElement(abw, "Lage")
                _create_children_text(
                    strasse,
                    {
                        "Strassenname": strasse_nam,
                    },
                )

                geom = SubElement(abw, "Geometrie")
                x = QgsProject.instance().crs().authid()
                x.replace('EPSG:', '')
                _create_children_text(
                    geom,
                    {
                        "CRSLage": x,
                    }, )

                _create_children(geom, ["GeoObjektart", "GeoObjekttyp"])

                kante = SubElement(
                    SubElement(SubElement(geom, "Geometriedaten"), "Kanten"), "Kante"
                )


                _create_children_text(
                    SubElement(kante, "Start"),
                    {
                        "PunktattributAbwasser": "DMP",
                        "Rechtswert": xschob,
                        "Hochwert": yschob,
                        "Punkthoehe": sohleoben,
                    },
                )
                _create_children_text(
                    SubElement(kante, "Ende"),
                    {
                        "PunktattributAbwasser": "DMP",
                        "Rechtswert": xschun,
                        "Hochwert": yschun,
                        "Punkthoehe":sohleunten,
                    },
                )

            fortschritt("Haltungen eingefügt", 0.60)

    def _export_anschlussleitungen(self) -> None:

        if self.vorlage == "":

            if (
                not getattr(QKan.config.check_export, "export_anschlussleitungen", True)
                #or not self.hydraulik_objekte
                or not self.stamm
            ):
                return

            if self.abfrage_h_where:
                sql = self._query(
                    "export_anschlussleitungen_filtered",
                    abfrage_h_where=self._safe_clause(self.abfrage_h_where, ("WHERE",)),
                )

                if not self.db_qkan.sql(sql, "db_qkan: export_anschlussleitungen"):
                    return


            else:
                sql = self._query("export_anschlussleitungen")

                if not self.db_qkan.sql(sql, "db_qkan: export_anschlussleitungen"):
                    return

            fortschritt("Export Anschlussleitungen...", 0.65)

            for attr in self.db_qkan.fetchall():
                (
                    leitnam,
                    schoben,
                    schunten,
                    hoehe,
                    breite,
                    laenge,
                    sohleoben,
                    sohleunten,
                    profilnam_nr,
                    material,
                    entwart_nr,
                    ks,
                    simstatus_nr,
                    kommentar,
                    xschob,
                    yschob,
                    xschun,
                    yschun,
                ) = attr

                obj = SubElement(self.hydraulik_objekte, "HydraulikObjekt")
                _create_children(obj, ["HydObjektTyp", "Objektbezeichnung"])
                _create_children_text(
                    SubElement(obj, "Leitung"),
                    {"Objektbezeichnung": leitnam, "Berechnungslaenge": laenge, "Rauigkeitsansatz": 1,  "RauigkeitsbeiwertKb": ks},
                )

                abw = SubElement(self.stamm, "AbwassertechnischeAnlage")
                _create_children_text(
                    abw,
                    {
                        "Objektbezeichnung": leitnam,
                        "Objektart": str(1),
                        "Entwaesserungsart": entwart_nr,
                        "Status": simstatus_nr,
                    },
                )

                kante = SubElement(abw, "Kante")
                _create_children_text(
                    kante,
                    {
                        "KantenTyp": 1,
                        "KnotenZulauf": schoben,
                        "KnotenZulaufTyp": 0,
                        "KnotenAblauf": schunten,
                        "KnotenAblaufTyp": 0,
                        "Material": material,
                        "SohlhoeheZulauf": sohleoben,
                        "SohlhoeheAblauf": sohleunten,
                        "Laenge": laenge,
                    },
                )

                _create_children_text(
                    SubElement(kante, "Profil"),
                    {
                        "ProfilID": None,
                        "SonderprofilVorhanden": None,
                        "Profilart": profilnam_nr,
                        "Profilbreite": breite,
                        "Profilhoehe": hoehe,
                    },
                )

                SubElementText(SubElement(kante, "Leitung"), "DMPLaenge", laenge)

                geom = SubElement(abw, "Geometrie")
                x = QgsProject.instance().crs().authid()
                x.replace('EPSG:', '')
                _create_children_text(
                    geom,
                    {
                        "CRSLage": x,
                    }, )
                _create_children(geom, ["GeoObjektart", "GeoObjekttyp"])

                kante = SubElement(
                    SubElement(SubElement(geom, "Geometriedaten"), "Kanten"), "Kante"
                )
                _create_children_text(
                    SubElement(kante, "Start"),
                    {
                        "PunktattributAbwasser": "DMP",
                        "Rechtswert": xschob,
                        "Hochwert":yschob,
                    },
                )
                _create_children_text(
                    SubElement(kante, "Ende"),
                    {
                        "PunktattributAbwasser": "DMP",
                        "Rechtswert": xschun,
                        "Hochwert": yschun,
                    },
                )

            fortschritt("Leitung eingefügt", 0.7)

    def _export_zustandsdaten_haltungen(self):
        if self.vorlage == "":

            if (
                    not getattr(QKan.config.check_export, "export_zustandsdaten", True)
                    # or not self.hydraulik_objekte
                    or not self.zustand
            ):
                return

            #Haltungen

            last_pk = None


            if self.auswahl_zustand == "Stammdaten":

                sql = self._query(
                    "export_zustand_haltungen_stamm",
                    abfrage_h_and=self._safe_clause(self.abfrage_h_and, ("AND",)),
                )

                if not self.db_qkan.sql(sql, "db_qkan: export_zustandsdaten"):
                    return

            elif self.auswahl_zustand == "Bewertet (Zustandsklassifizierung)":

                sql = self._query(
                    "export_zustand_haltungen_bewertet",
                    abfrage_h_and=self._safe_clause(self.abfrage_h_and, ("AND",)),
                )

                if not self.db_qkan.sql(sql, "db_qkan: export_zustandsdaten"):
                    return

            elif self.auswahl_zustand == "Bewertet (Substanzklassifizierung)":

                sql = self._query(
                    "export_zustand_haltungen_substanz",
                    abfrage_h_and=self._safe_clause(self.abfrage_h_and, ("AND",)),
                )

                if not self.db_qkan.sql(sql, "db_qkan: export_zustandsdaten"):
                    return

            #fortschritt("Export Zustandsdaten...", 0.55)

            for attr in self.db_qkan.fetchall():

                (
                    pk,
                    haltnam,
                    bezugspunkt,
                    schoben,
                    schunten,
                    hoehe,
                    breite,
                    laenge,
                    baujahr,
                    untersuchtag,
                    untersucher,
                    untersuchrichtung,
                    wetter_nr,
                    bewertungsart,
                    bewertungstag,
                    strasse_nam,
                    datenart,
                    auftragsbezeichnung,
                    max_ZD,
                    max_ZB,
                    max_ZS,
                    xschob,
                    yschob,
                    xschun,
                    yschun,
                    kommentar,
                    station,
                    timekode,
                    kuerzel,
                    charakt1,
                    charakt2,
                    quantnr1,
                    quantnr2,
                    streckenschaden,
                    streckenschadenlfdnr,
                    posvon,
                    posbis,
                    foto,
                    zd,
                    zb,
                    zs,
                    profilnam_nr,
                    material,
                    entwart_nr,
                ) = attr

                if pk != last_pk:
                    insp = SubElement(self.zustand, "InspizierteAbwassertechnischeAnlage")
                    _create_children_text(
                        insp,
                        {
                            "Objektbezeichnung": haltnam,
                            "Anlagentyp": str(1),
                        },
                    )

                    strasse = SubElement(insp, "Lage")
                    _create_children_text(
                        strasse,
                        {
                            "Strassenname": strasse_nam,
                        },
                    )

                    opt = SubElement(insp, "OptischeInspektion")
                    _create_children_text(
                        opt,
                        {
                            "Inspektionsdatum": untersuchtag,
                            "NameUntersucher": untersucher,
                            "Wetter": wetter_nr,
                        },
                    )

                    rohr = SubElement(opt, "Rohrleitung")
                    _create_children_text(
                        rohr,
                        {
                            "Inspektionsrichtung": untersuchrichtung,
                            "Bezugspunktlage": bezugspunkt,
                            "Inspektionslaenge": laenge,
                        },
                    )

                    rgrund = SubElement(rohr, "RGrunddaten")
                    _create_children_text(
                        rgrund,
                        {
                            "KnotenZulauf": 0,
                            "KnotenZulauftyp": schoben,
                            "KnotenAblauf": 0,
                            "KnotenAblauftyp": schunten,
                            "Profilhoehe": hoehe,
                            "Profilbreite": breite,
                            "Profilart": profilnam_nr,
                            "Material": material,
                            "Kanalart": entwart_nr,
                        },
                    )
                    inspdat = SubElement(opt, "Inspektionsdaten")

                    last_pk = pk


                rzu = SubElement(inspdat, "RZustand")
                _create_children_text(
                    rzu,
                    {
                        "Station": station,
                        "Timecode": timekode,
                        "InspektionsKode": kuerzel,
                        "Charakterisierung1": charakt1,
                        "Charakterisierung2": charakt2,
                        "Quantifizierung1Numerisch": quantnr1,
                        "Quantifizierung2Numerisch": quantnr2,
                        "Streckenschaden": streckenschaden,
                        "StreckenschadenLfdNr": streckenschadenlfdnr,
                        "PositionVon": posvon,
                        "PositionBis": posbis,
                        "Fotodatei": foto,
                    },
                )
                kl = SubElement(rzu, "Klassifizierung")
                _create_children_text(
                    kl,
                    {
                        "Dichtheit": zd,
                        "Standsicherheit": zs,
                        "Betriebssicherheit": zb,
                    },
                )

    def _export_zustandsdaten_anschlussleitungen(self):
        if self.vorlage == "":

            if (
                    not getattr(QKan.config.check_export, "export_zustandsdaten", True)
                    # or not self.hydraulik_objekte
                    or not self.zustand
            ):
                return

            # Haltungen

            last_pk = None
            if self.auswahl_zustand == "Stammdaten":

                if self.abfrage_h_where:
                    sql = self._query(
                        "export_zustand_anschluss_stamm_filtered",
                        abfrage_h_where=self._safe_clause(self.abfrage_h_where, ("WHERE",)),
                    )

                    if not self.db_qkan.sql(sql, "db_qkan: export_anschlussleitungen"):
                        return

                else:
                    sql = self._query("export_zustand_anschluss_stamm")

                    if not self.db_qkan.sql(sql, "db_qkan: export_zustandsdaten"):
                        return

            elif self.auswahl_zustand == "Bewertet (Zustandsklassifizierung)":

                if self.abfrage_h_where:
                    sql = self._query(
                        "export_zustand_anschluss_bewertet_filtered",
                        abfrage_h_where=self._safe_clause(self.abfrage_h_where, ("WHERE",)),
                    )

                    if not self.db_qkan.sql(sql, "db_qkan: export_anschlussleitungen"):
                        return

                else:
                    sql = self._query("export_zustand_anschluss_bewertet")

                    if not self.db_qkan.sql(sql, "db_qkan: export_zustandsdaten"):
                        return

            # fortschritt("Export Zustandsdaten...", 0.55)

            for attr in self.db_qkan.fetchall():

                (
                    pk,
                    haltnam,
                    bezugspunkt,
                    schoben,
                    schunten,
                    hoehe,
                    breite,
                    laenge,
                    baujahr,
                    untersuchtag,
                    untersucher,
                    untersuchrichtung,
                    wetter_nr,
                    bewertungsart,
                    bewertungstag,
                    strasse_nam,
                    datenart,
                    auftragsbezeichnung,
                    max_ZD,
                    max_ZB,
                    max_ZS,
                    xschob,
                    yschob,
                    xschun,
                    yschun,
                    kommentar,
                    station,
                    timekode,
                    kuerzel,
                    charakt1,
                    charakt2,
                    quantnr1,
                    quantnr2,
                    streckenschaden,
                    streckenschadenlfdnr,
                    posvon,
                    posbis,
                    foto,
                    zd,
                    zs,
                    zb,
                    profilnam_nr,
                    material,
                    entwart_nr,
                ) = attr

                if pk != last_pk:
                    insp = SubElement(self.zustand, "InspizierteAbwassertechnischeAnlage")
                    _create_children_text(
                        insp,
                        {
                            "Objektbezeichnung": haltnam,
                            "Anlagentyp": str(2),
                        },
                    )

                    strasse = SubElement(insp, "Lage")
                    _create_children_text(
                        strasse,
                        {
                            "Strassenname": strasse_nam,
                        },
                    )

                    opt = SubElement(insp, "OptischeInspektion")
                    _create_children_text(
                        opt,
                        {
                            "Inspektionsdatum": untersuchtag,
                            "NameUntersucher": untersucher,
                            "Wetter": wetter_nr,
                        },
                    )

                    rohr = SubElement(opt, "Rohrleitung")
                    _create_children_text(
                        rohr,
                        {
                            "Inspektionsrichtung": untersuchrichtung,
                            "Bezugspunktlage": bezugspunkt,
                            "Inspektionslaenge": laenge,
                        },
                    )

                    rgrund = SubElement(rohr, "RGrunddaten")
                    _create_children_text(
                        rgrund,
                        {
                            "KnotenZulauf": 0,
                            "KnotenZulauftyp": schoben,
                            "KnotenAblauf": 0,
                            "KnotenAblauftyp": schunten,
                            "Profilhoehe": hoehe,
                            "Profilbreite": breite,
                            "Profilart": profilnam_nr,
                            "Material": material,
                            "Kanalart": entwart_nr,
                        },
                    )
                    inspdat = SubElement(opt, "Inspektionsdaten")

                    last_pk = pk

                rzu = SubElement(inspdat, "RZustand")
                _create_children_text(
                    rzu,
                    {
                        "Station": station,
                        "Timecode": timekode,
                        "InspektionsKode": kuerzel,
                        "Charakterisierung1": charakt1,
                        "Charakterisierung2": charakt2,
                        "Quantifizierung1Numerisch": quantnr1,
                        "Quantifizierung2Numerisch": quantnr2,
                        "Streckenschaden": streckenschaden,
                        "StreckenschadenLfdNr": streckenschadenlfdnr,
                        "PositionVon": posvon,
                        "PositionBis": posbis,
                        "Fotodatei": foto,
                    },
                )
                kl = SubElement(rzu, "Klassifizierung")

                _create_children_text(
                    kl,
                    {
                        "Dichtheit": zd,
                        "Standsicherheit": zs,
                        "Betriebssicherheit": zb,
                    },
                )

    def _export_zustandsdaten_schaechte(self):
        if self.vorlage == "":

            if (
                    not getattr(QKan.config.check_export, "export_zustandsdaten", True)
                    # or not self.hydraulik_objekte
                    or not self.zustand
            ):
                return

            # Haltungen

            last_pk = None

            if self.auswahl_zustand == "Stammdaten":

                sql = self._query(
                    "export_zustand_schaechte_stamm",
                    abfrage_s_and=self._safe_clause(self.abfrage_s_and, ("AND",)),
                )

                if not self.db_qkan.sql(sql, "db_qkan: export_zustandsdaten"):
                    return

            elif self.auswahl_zustand == "Bewertet (Zustandsklassifizierung)":

                sql = self._query(
                    "export_zustand_schaechte_bewertet",
                    abfrage_s_and=self._safe_clause(self.abfrage_s_and, ("AND",)),
                )

                if not self.db_qkan.sql(sql, "db_qkan: export_zustandsdaten"):
                    return

            # fortschritt("Export Zustandsdaten...", 0.55)

            for attr in self.db_qkan.fetchall():

                (
                    pk,
                    schnam,
                    bezugspunkt,
                    baujahr,
                    untersuchtag,
                    untersucher,
                    wetter_nr,
                    bewertungsart,
                    bewertungstag,
                    strasse_nam,
                    datenart,
                    auftragsbezeichnung,
                    max_ZD,
                    max_ZB,
                    max_ZS,
                    xschob,
                    yschob,
                    xschun,
                    yschun,
                    kommentar,
                    vertikale_lage,
                    timekode,
                    kuerzel,
                    charakt1,
                    charakt2,
                    quantnr1,
                    quantnr2,
                    streckenschaden,
                    streckenschadenlfdnr,
                    posvon,
                    posbis,
                    foto,
                    zd,
                    zs,
                    zb,
                    material,
                    entwart_nr,
                ) = attr

                if pk != last_pk:
                    insp = SubElement(self.zustand, "InspizierteAbwassertechnischeAnlage")
                    _create_children_text(
                        insp,
                        {
                            "Objektbezeichnung": schnam,
                            "Anlagentyp": str(3),
                        },
                    )

                    strasse = SubElement(insp, "Lage")
                    _create_children_text(
                        strasse,
                        {
                            "Strassenname": strasse_nam,
                        },
                    )

                    opt = SubElement(insp, "OptischeInspektion")
                    _create_children_text(
                        opt,
                        {
                            "Inspektionsdatum": untersuchtag,
                            "NameUntersucher": untersucher,
                            "Wetter": wetter_nr,
                        },
                    )

                    knoten = SubElement(opt, "Knoten")
                    _create_children_text(
                        knoten,
                        {
                            "BezugspunktVertikal": bezugspunkt,
                        },
                    )

                    rgrund = SubElement(knoten, "KGrunddaten")
                    # _create_children_text(
                    #     rgrund,
                    #     {
                    #         "Material": material,
                    #         "Kanalart": entwart_nr,
                    #     },
                    # )
                    inspdat = SubElement(opt, "Inspektionsdaten")

                    last_pk = pk

                rzu = SubElement(inspdat, "RZustand")
                _create_children_text(
                    rzu,
                    {
                        "VertikaleLage": vertikale_lage,
                        "Timecode": timekode,
                        "InspektionsKode": kuerzel,
                        "Charakterisierung1": charakt1,
                        "Charakterisierung2": charakt2,
                        "Quantifizierung1Numerisch": quantnr1,
                        "Quantifizierung2Numerisch": quantnr2,
                        "Streckenschaden": streckenschaden,
                        "StreckenschadenLfdNr": streckenschadenlfdnr,
                        "PositionVon": posvon,
                        "PositionBis": posbis,
                        "Fotodatei": foto,
                    },
                )
                kl = SubElement(rzu, "Klassifizierung")

                _create_children_text(
                    kl,
                    {
                        "Dichtheit": zd,
                        "Standsicherheit": zs,
                        "Betriebssicherheit": zb,
                    },
                )

    def _export_zustandsdaten_filme(self):
        if self.vorlage == "":

            if (
                    not getattr(QKan.config.check_export, "export_zustandsdaten", True)
                    # or not self.hydraulik_objekte
                    or not self.zustand
            ):
                return

            #TODO: jenachdem um was für ein objekt es sich handelt müssen unterschiedliche joins durchgeführt werden für inspektionsrichtung usw.
            sql = self._query("export_zustand_filme")

            if not self.db_qkan.sql(sql, "db_qkan: export_zustandsdaten"):
                return

            # fortschritt("Export Zustandsdaten...", 0.55)
            filme = SubElement(self.zustand, "Filme")

            for attr in self.db_qkan.fetchall():

                (
                    name,
                    untersuchtag,
                    objekt,
                    datei,
                ) = attr

                film = SubElement(self.zustand, "Film")


                _create_children_text(
                    film,
                    {
                        "Filmname": datei,
                        "Auftragskennung": "",
                    },
                )

                objekte = SubElement(film, "FilmObjekte")
                objekt = SubElement(objekte, "FilmObjekt")
                _create_children_text(
                    objekt,
                    {
                        "Objektbezeichnung": name,
                        "Typ": "",
                        "Inspektionsrichtung":"",
                    },
                )


    def run(self) -> None:
        """
        Export der Kanaldaten aus einer QKan-SpatiaLite-Datenbank und Schreiben in eine XML-Datei
        """
        iface = QKan.instance.iface

        # Create progress bar
        progress_bar = QProgressBar(iface.messageBar())
        progress_bar.setRange(0, 100)

        status_message = iface.messageBar().createMessage(
            "", "Export in Arbeit. Bitte warten..."
        )
        status_message.layout().addWidget(progress_bar)
        iface.messageBar().pushWidget(status_message, Qgis.MessageLevel.Info, 10)

        if self.vorlage == "":

            # region Create XML structure
            root = Element(
                "Identifikation", {"xmlns": "http://www.ofd-hannover.la/Identifikation", "xmlns:xsi":"http://www.w3.org/2001/XMLSchema-instance",}
            )
            SubElementText(root, "Version", "2013-02")

            admin_daten = SubElement(root, "Admindaten")
            _create_children(
                SubElement(admin_daten, "Liegenschaft"),
                ["Liegenschaftsnummer", "Liegenschaftsbezeichnung"],
            )

            daten_kollektive = SubElement(root, "Datenkollektive")
            _create_children_text(
                daten_kollektive,
                {
                    "Erstellungsdatum": str(date.today()),
                    "Kommentar": "Created with QKan's XML export module",
                },
            )
            kennungen = SubElement(SubElement(daten_kollektive, "Kennungen"), "Kollektiv")

            _create_children_text(
                kennungen,
                {
                    "Kennung": "STA01",
                    "Kollektivart": "1",
                },
            )

            #TODO: aufträge ergänzen zur Vollständigkeit bei stammdaten und zustandsdaten
            #wenn nur zahl in auftragsbezeichnung, dann auftragskennung sonst als auftragsbezeichnung

            self.stamm = SubElement(daten_kollektive, "Stammdatenkollektiv")
            _create_children_text(self.stamm, {"Kennung": "STA01", "Beschreibung": "Stammdaten",},)

            if QKan.config.check_export.zustandsdaten:
                _create_children_text(
                    kennungen,
                    {
                        "Kennung": "ZUS01",
                        "Kollektivart": "2",
                    },
                )
                self.zustand = SubElement(daten_kollektive, "Zustandsdatenkollektiv")
                _create_children_text(self.zustand, {"Kennung": "ZUS01", "Beschreibung": "Zustandsdaten", }, )

            hydro_kollektiv = SubElement(daten_kollektive, "Hydraulikdatenkollektiv")
            _create_children_text(
                hydro_kollektiv,
                {"Kennung": "STA01", "Beschreibung": "Hydraulikdaten",},
            )
            rechen = SubElement(hydro_kollektiv, "Rechennetz")
            SubElement(rechen, "Stammdatenkennung")
            self.hydraulik_objekte = SubElement(rechen, "HydraulikObjekt")
            # endregion

        if self.vorlage == "":

            Path(self.export_file).write_text(
                minidom.parseString(tostring(root)).toprettyxml(indent="  ")
            )

        # if self.selection:
        #     select_s = []
        #     select_h = []
        #
        #     sql = f"""
        #                         SELECT
        #                         pk
        #                         from sel_schaechte
        #                      """
        #
        #     if not self.db_qkan.sql(sql, "db_qkan: export_zustandsdaten"):
        #         return
        #
        #
        #     for attr in self.db_qkan.fetchall():
        #         select_s.append(attr[0])
        #
        #     sql = f"""
        #                                     SELECT
        #                                     pk
        #                                     from sel_haltungen
        #                                  """
        #
        #     if not self.db_qkan.sql(sql, "db_qkan: export_zustandsdaten"):
        #         return
        #
        #     for attr in self.db_qkan.fetchall():
        #         select_h.append(attr[0])
        #
        #     select_s_t = tuple(select_s)
        #
        #     select_h_t = tuple(select_h)
        #
        #
        #     self.abfrage_s_and = f"AND schaechte.pk in {select_s_t}"
        #
        #     self.abfrage_s_where = f"WHERE schaechte.pk in {select_s_t}"
        #
        #     self.abfrage_h_and = f"AND haltungen.pk in {select_h_t}"
        #
        #     self.abfrage_h_where = f"WHERE haltungen.pk in {select_h_t}"
        #
        # else:
        #     self.abfrage_s_and = ""
        #     self.abfrage_s_where = ""
        #     self.abfrage_h_and = ""
        #     self.abfrage_h_where = ""

        self.abfrage_s_and = ""
        self.abfrage_s_where = ""
        self.abfrage_h_and = ""
        self.abfrage_h_where = ""
        # Export
        if QKan.config.check_export.wehre:
            self._export_wehre()
        if QKan.config.check_export.pumpen:
            self._export_pumpen()
        if QKan.config.check_export.auslaesse:
            self._export_auslaesse()
        if QKan.config.check_export.schaechte:
            self._export_schaechte()
        if QKan.config.check_export.speicher:
            self._export_speicher()
        if QKan.config.check_export.haltungen:
            self._export_haltungen()
        if QKan.config.check_export.anschlussleitungen:
            self._export_anschlussleitungen()

        if QKan.config.check_export.zustandsdaten:
            self._export_zustandsdaten_haltungen()
            self._export_zustandsdaten_schaechte()
            self._export_zustandsdaten_anschlussleitungen()


        # Close connection
        del self.db_qkan

        fortschritt("Ende...", 1)
        progress_bar.setValue(100)
        status_message.setText("Datenexport abgeschlossen.")
        status_message.setLevel(Qgis.MessageLevel.Success)
