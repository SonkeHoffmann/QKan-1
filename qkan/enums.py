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
    #Allgemeine Layer
    NOTIZ = "Notizen"
    SCHAECHTE = "Schächte"
    AUSLAESSE = "Auslässe"
    SPEICHER = "Speicher"
    KNOTENTYP = "Knotentyp"
    GEOMETRIEN = "Geometrien"
    HALTUNGEN = "Haltungen"
    ANSCHLUSSLEITUNGEN = "HA-Leitungen"
    DROSSELN = "Drosseln"
    SCHIEBER = "Schieber"
    GRUND_SEITENAUSLASS = "Grund-/Seitenauslässe"
    H_REGLER = "H-Regler"
    Q_REGLER = "Q-Regler"
    PUMPEN = "Pumpen"
    WEHRE = "Wehre"
    HALTUNGSFLAECHEN = "Haltungsflächen"
    ANBINDUNG_FLAECHEN = "Anbindungen Flächen"
    EINZELFLAECHEN = "Einzelflächen"
    TEILGEBIETE = "Teilgebiete"
    DIREKTEINLEITUNGEN = "Direkteinleitungen"
    ANBINDUNG_DIREKTEINLEITUNGEN = "Anbindungen Direkteinleitungen"
    AUSSENGEBIETE = "Außengebiete"
    ANBINDUNG_AUSSENGEBIETE = "Anbindung Außengebiete"
    ZUSTAND_HALTUNGEN_GESAMT = "Zustand_Haltungen_gesamt"
    EINZELSCHAEDEN_HALTUNGEN = "Einzelschäden_Haltungen"
    ZUSTAND_SCHAECHTE_GESAMT = "Zustand_Schächte_gesamt"
    EINZELSCHAEDEN_SCHAECHTE = "Einzelschäden_Schächte"
    ZUSTAND_HA_LEITUNGEN_GESAMT = "Zustand_HA-Leitungen_gesamt"
    EINZELSCHAEDEN_HA_LEITUNGEN = "Einzelschäden_HA-Leitungen"
    FEHLERLISTE             = "Fehlerliste"
    PRUEFABFRAGEN           = "Prüfabfragen"
    UEBERSTAUSCHAECHTE      = "Überstau Schächte"

    QKAN_GROUP              = "QKan"

    #Referenztabellen
    REFERENZTABELLEN        = "Referenztabellen"
    ENTWAESSERUNGSARTEN     = "Entwässerungsarten"
    PROFILE                 = "Profile"
    PUMPENTYPEN             = "Pumpentypen"
    EIGENTUM                = "Eigentum"
    AUSLASSTYPEN            = "Auslasstypen"
    PLANUNGSSTATUS          = "Planungsstatus"
    BODENARTEN              = "Bodenarten"
    ABFLUSSPARAMETER        = "Abflussparameter"
    ABFLUSSTYPEN            = "Abflussmodelle"
    KNOTENTYPEN             = "Knotentypen"
    SCHACHTTYPEN            = "Schachttypen"
    SYMBOLKATALOG           = "Symbolkatalog"
    FLAECHENTYPEN           = "Flächentypen"
    M150_KNOTENARTEN        = "M150 Knotenarten"
    MATERIAL                = "Material"

    #Ergebnislayer
    ZK_EINZELSCHAEDEN_HA_LEITUNGEN  = "Ergebnis_ZK_Einzelschäden_HA_Leitungen"
    ZK_ZUSTAND_HA_LEITUNGEN_GESAMT  = "Ergebnis_ZK_HA_Leitungen"
    ZK_EINZELSCHAEDEN_SCHAECHTE     = "Ergebnis_ZK_Einzelschäden_Schächte"
    ZK_ZUSTAND_SCHAECHTE_GESAMT     = "Ergebnis_ZK_Schächte"
    ZK_EINZELSCHAEDEN_HALTUNGEN     = "Ergebnis_ZK_Einzelschäden_Haltungen"
    ZK_ZUSTAND_HALTUNGEN_GESAMT     = "Ergebnis_ZK_Haltungen"
    SK_EINZELSCHAEDEN_HALTUNGEN     = "Bewertung_Substanz_Einzelschäden_Haltungen"
    SK_ZUSTAND_HALTUNGEN_GESAMT     = "Bewertung_Substanz_Haltungen"

    # Anwendungsbezogene Layer
    STRAKAT_SYMBOLE = "STRAKAT-Symbole"

    # Synchronisation
    SYNC_SCHAECHTE_COMPARE          = "Synchronisation Schächte"
    SYNC_SCHAECHTE_EXT              = "Schächte extern"
    SYNC_HALTUNGEN_COMPARE          = "Synchronisation Haltungen"
    SYNC_HALTUNGEN_EXT              = "Haltungen extern"
    SYNC_ANSCHLUSSLEITUNGEN_COMPARE = "Synchronisation HA-Leitungen"
    SYNC_ANSCHLUSSLEITUNGEN_EXT     = "HA-Leitungen extern"

    SYNC_GROUP_SYNCHRONISATION      = "Synchronisation"
    SYNC_GROUP_SCHAECHTE            = "Vergleich Schächte"
    SYNC_GROUP_HALTUNGEN            = "Vergleich Haltungen"
    SYNC_GROUP_ANSCHLUSSLEITUNGEN   = "Vergleich HA-Leitungen"


class MikeVersion(enum.Enum):
    """Programmversion der Ergebnisdateien zu Mike+"""
    v1 = '2023'
    v2 = '2025'
