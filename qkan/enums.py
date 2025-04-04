import enum


class BefChoice(enum.Enum):
    FLAECHEN = "flaechen"
    TEZG = "tezg"


class ProfChoice(enum.Enum):
    PROFILNAME = "profilname"
    PROFILKEY = "profilkey"


class AuswahlTyp(enum.Enum):
    WITHIN = "within"
    OVERLAPS = "overlaps"


class BezugAbstand(enum.Enum):
    KANTE = "kante"
    MITTELPUNKT = "mittelpunkt"


class QmlChoice(enum.Enum):
    UEBH = "uebh"
    UEBVOL = "uebvol"
    USERQML = "userqml"
    NONE = "none"


class SelectedLayers(enum.Enum):
    ALL = "alle_anpassen"
    SELECTED = "auswahl_anpassen"
    NONE = "None"  # für Tests


class RunOffModelType(enum.Enum):
    SPEICHERKASKADE = "Speicherkaskade"
    FLIESSZEITEN = "Fliesszeiten"
    SCHWERPUNKTLAUFZEIT = "Schwerpunktlaufzeit"


class RunOffParamsType(enum.Enum):
    ITWH = "itwh"
    DYNA = "dyna"
    MANIAK = "maniak"


class QKanDBChoice(enum.Enum):
    SPATIALITE = "spatialite"
    POSTGIS = "postgis"                 # Achtung: lay.providerType() liefert 'postgres'


class UntersuchBezugpunkt(enum.Enum):
    ROHRANFANG = 'Rohranfang'
    GERINNEMITTELPUNKT = 'Gerinnemittelpunkt'


class LAYERBEZ(enum.Enum):
    Notiz = "Notizen"
    Schaechte = "Schächte"
    Auslaesse = "Auslässe"
    Speicher = "Speicher"
    Knotentyp = "Knotentyp"
    Geometrien = "Geometrien"
    Haltungen = "Haltungen"
    Anschlussleitungen = "HA-Leitungen"
    Drosseln = "Drosseln"
    Schieber = "Schieber"
    Grund_Seitenauslass = "Grund-/Seitenauslässe"
    H_Regler = "H-Regler"
    Q_Regler = "Q-Regler"
    Pumpen = "Pumpen"
    Wehre = "Wehre"
    Haltungsflaechen = "Haltungsflächen"
    Anbindung_Flaechen = "Anbindungen Flächen"
    Einzelflaechen = "Einzelflächen"
    Teilgebiete = "Teilgebiete"
    Direkteinleitungen = "Direkteinleitungen"
    Anbindung_Direkteinleitungen = "Anbindungen Direkteinleitungen"
    Aussengebiete = "Außengebiete"
    Anbindung_Aussengebiete = "Anbindung Außengebiete"
    Zustand_Haltungen_gesamt = "Zustand_Haltungen_gesamt"
    Einzelschaeden_Haltungen = "Einzelschäden_Haltungen"
    Zustand_Schaechte_gesamt = "Zustand_Schächte_gesamt"
    Einzelschaeden_Schaechte = "Einzelschäden_Schächte"
    Zustand_HA_Leitungen_gesamt = "Zustand_HA-Leitungen_gesamt"
    Einzelschaeden_HA_Leitungen = "Einzelschäden_HA-Leitungen"

    #Ergebnislayer
    ZK_Einzelschaeden_HA_Leitungen = "Ergebnis_ZK_Einzelschäden_HA_Leitungen"
    ZK_Zustand_HA_Leitungen_gesamt = "Ergebnis_ZK_HA_Leitungen"
    ZK_Einzelschaeden_Schaechte = "Ergebnis_ZK_Einzelschäden_Schächte"
    ZK_Zustand_Schaechte_gesamt = "Ergebnis_ZK_Schächte"
    ZK_Einzelschaeden_Haltungen = "Ergebnis_ZK_Einzelschäden_Haltungen"
    ZK_Zustand_Haltungen_gesamt = "Ergebnis_ZK_Haltungen"
    SK_Einzelschaeden_Haltungen = "Bewertung_Substanz_Einzelschäden_Haltungen"
    SK_Zustand_Haltungen_gesamt = "Bewertung_Substanz_Haltungen"





