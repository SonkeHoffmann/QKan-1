from qgis.core import Qgis, QgsProject
from qkan import QKan, enums
from qkan.utils import get_logger
from datetime import datetime as dtim

logger = get_logger("QKan.tools.zeige_schaeden")

class ShowSelected():
    """Gemeinsame Funktion(en) für die nachfolgenden Klassen"""

    # Der Zeitstempel wird als Workaraound benötigt, um bei den Aktionen die Auswahl "Alle Objekte"
    # zu identifizieren.
    lastcalltime = dtim.now()

    def show_selected(
            self,
            layername: str = None,
            untersuchbezeich: str = None,
            untersuchattribut: str = None
    ):
        """Ändert den Layerfilter der Untersuchungsdaten

        :param layername:           Bezeichnung des untersuchten Objektes
        :type layername:            str

        :param untersuchbezeich:    Bezeichnung des untersuchten Objektes
        :type untersuchbezeich:     str

        :param untersuchattribut:   Attributname des untersuchten Objektes
        :type untersuchattribut:    str
        """

        actcalltime = dtim.now()
        td = actcalltime - ShowSelected.lastcalltime
        # Wenn bei aktivierten Aktionen im Kontextmenü der Objektauswahl "Alle Objekte" angeklickt
        # wird, wird die Aktion direkt hintereinander für alle Objekte ausgelöst. Für diesen Fall
        # wird die Selektion auf untersuchtag deaktiviert. Auf ein Unterdrücken der nachfolgenden
        # Aktionen wird hier verzichtet, um den Code nicht noch komplizierter zu machen.
        if td.total_seconds() < 0.05:
            self.untersuchtag = None
        ShowSelected.lastcalltime = actcalltime

        self.iface = QKan.instance.iface

        splitstr = f" AND {untersuchattribut} = "
        project = QgsProject.instance()
        if project.mapLayersByName(layername):
            layer = project.mapLayersByName(layername)[0]
        else:
            return False
        ren = layer.renderer()
        if ren.type() != 'RuleRenderer':
            logger.warning(f"Fehler: Der Layer '{layername}' enthält keine regelbasierenden Symbole"
                           "\nAktualisieren Sie das Projekt oder bearbeiten den Layer entsprechend.")
            return False
        try:
            root_rule = ren.rootRule()
        except BaseException as e:
            logger.error(f"Fehler: Der Layer '{layername}' enthält keine regelbasierenden Symbole")
            raise Exception(f"{self.__class__.__name__}")

        for child in root_rule.children():
            rule = root_rule.takeChild(child)
            label = rule.label()
            if 'Zustandsklasse' in label:
                pos = label.find('Zustandsklasse') + 15
                i = label[pos]
                baserule = f"if(min( coalesce( ZD,6), coalesce( ZB,6),coalesce( ZS,6))>5,'-',min( coalesce( ZD,6), coalesce( ZB,6),coalesce( ZS,6))) = {i}"
            else:
                baserule = "((if(min( coalesce( ZD,6), coalesce( ZB,6),coalesce( ZS,6))>5,'-',min( coalesce( ZD,6), coalesce( ZB,6),coalesce( ZS,6))) < 0 OR if(min( coalesce( ZD,6), coalesce( ZB,6),coalesce( ZS,6))>5,'-',min( coalesce( ZD,6), coalesce( ZB,6),coalesce( ZS,6))) > 5 OR if(min( coalesce( ZD,6), coalesce( ZB,6),coalesce( ZS,6))>5,'-',min( coalesce( ZD,6), coalesce( ZB,6),coalesce( ZS,6)))='-'))"

            filterlis = [baserule]
            if untersuchbezeich is not None:
                filterlis.append(f"{untersuchattribut} = '{untersuchbezeich}'")

            if self.untersuchtag is not None:
                filterlis.append(f"untersuchtag = '{self.untersuchtag}'")
            elif self.id is not None:                   # nur alternativ zu Untersuchungsdatum!
                filterlis.append(f"id = {self.id}")

            filter = ' AND '.join(filterlis)
            rule.setFilterExpression(filter)
            root_rule.appendChild(rule)
        layer.triggerRepaint()
        self.iface.layerTreeView().refreshLayerSymbology(layer.id())


class ShowHaltungsschaeden(ShowSelected):
    """Zeigt Zustandsdaten an Haltungen selektiv an"""
    def __init__(self, haltnam: str = None, schoben: str = None, schunten: str = None, untersuchtag: str = None, id: int = None):

        self.haltnam = haltnam
        self.schoben = schoben
        self.schunten = schunten
        self.untersuchtag = untersuchtag
        self.id = id
        self.showschaedencolumns = QKan.config.zustand.showschaedencolumns      # evtl. ergänzen: Eingabe unter Optionen

        layername = enums.LAYERBEZ.EINZELSCHAEDEN_HALTUNGEN.value
        untersuchbezeich = self.haltnam
        untersuchattribut = 'untersuchhal'
        self.show_selected(layername, untersuchbezeich, untersuchattribut)

        # self.showlist()

        # self.pb_showAll.clicked.connect(self.show_all)


class ShowSchachtschaeden(ShowSelected):
    """Zeigt Zustandsdaten an Schächten selektiv an"""
    def __init__(self, schnam: str = None, untersuchtag: str = None, id: int = None):

        self.schnam = schnam
        self.untersuchtag = untersuchtag
        self.id = id

        self.iface = QKan.instance.iface

        layername = enums.LAYERBEZ.EINZELSCHAEDEN_SCHAECHTE.value
        untersuchbezeich = self.schnam
        untersuchattribut = 'untersuchsch'
        self.show_selected(layername, untersuchbezeich, untersuchattribut)


class ShowHausanschlussschaeden(ShowSelected):
    """Zeigt Zustandsdaten an Hausanschlussleitungen selektiv an"""
    def __init__(self, untersuchleit: str = None, untersuchtag: str = None, id: int = None):

        self.untersuchleit = untersuchleit
        self.untersuchtag = untersuchtag
        self.id = id

        self.iface = QKan.instance.iface

        layername = enums.LAYERBEZ.EINZELSCHAEDEN_HA_LEITUNGEN.value
        untersuchbezeich = self.untersuchleit
        untersuchattribut = 'untersuchleit'
        self.show_selected(layername, untersuchbezeich, untersuchattribut)
