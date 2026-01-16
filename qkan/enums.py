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
    SPATIALITE          = "spatialite"
    POSTGIS             = "postgis"                 # Achtung: lay.providerType() liefert 'postgres'


class UntersuchBezugpunkt(enum.Enum):
    ROHRANFANG          = 'Rohranfang'
    GERINNEMITTELPUNKT  = 'Gerinnemittelpunkt'


class LAYERBEZ(enum.Enum):
    #Allgemeine Layer
    NOTIZ               = "Notizen"
    SCHAECHTE           = "Schächte"
    AUSLAESSE           = "Auslässe"
    SPEICHER            = "Speicher"
    KNOTENTYP           = "Knotentyp"
    GEOMETRIEN          = "Geometrien"
    HALTUNGEN           = "Haltungen"
    HA_LEITUNGEN        = "HA-Leitungen"
    HA_SCHAECHTE        = "HA-Schächte"
    DROSSELN            = "Drosseln"
    SCHIEBER            = "Schieber"
    GRUND_SEITENAUSLASS = "Grund-/Seitenauslässe"
    H_REGLER            = "H-Regler"
    Q_REGLER            = "Q-Regler"
    PUMPEN              = "Pumpen"
    WEHRE               = "Wehre"
    HALTUNGSFLAECHEN    = "Haltungsflächen"
    ANBINDUNG_FLAECHEN  = "Anbindungen Flächen"
    EINZELFLAECHEN      = "Einzelflächen"
    TEILGEBIETE         = "Teilgebiete"
    DIREKTEINLEITUNGEN  = "Direkteinleitungen"
    ANBINDUNG_DIREKTEINLEITUNGEN    = "Anbindungen Direkteinleitungen"
    AUSSENGEBIETE                   = "Außengebiete"
    ANBINDUNG_AUSSENGEBIETE         = "Anbindung Außengebiete"
    ZUSTAND_HALTUNGEN_GESAMT        = "Zustand_Haltungen_gesamt"
    EINZELSCHAEDEN_HALTUNGEN        = "Einzelschäden_Haltungen"
    ZUSTAND_SCHAECHTE_GESAMT        = "Zustand_Schächte_gesamt"
    EINZELSCHAEDEN_SCHAECHTE        = "Einzelschäden_Schächte"
    ZUSTAND_HA_LEITUNGEN_GESAMT     = "Zustand_HA-Leitungen_gesamt"
    EINZELSCHAEDEN_HA_LEITUNGEN     = "Einzelschäden_HA-Leitungen"
    FEHLERLISTE                     = "Fehlerliste"
    PRUEFABFRAGEN                   = "Prüfabfragen"
    UEBERSTAUSCHAECHTE              = "Überstau Schächte"

    QKAN_GROUP              = "QKan"
    ALLGEMEIN_GROUP         = "Allgemein"
    SCHAECHTE_GROUP         = "Schächte"
    HALTUNGEN_GROUP         = "Haltungen"
    SONDERELEMENTE_GROUP    = "Sonderelemente"
    FLAECHEN_GROUP          = "Flächen"
    EINLEITUNGEN_GROUP      = "Einleitungen"
    AUSSENGEBIETE_GROUP     = "Außengebiete"
    INSPEKTIONSDATEN_GROUP  = "Inspektionsdaten"
    SYMBOLE_GROUP           = "Symbole"
    REFERENZTABELLEN_GROUP  = "Referenztabellen"
    M150_GROUP              = "M150"
    PLAUSI_GROUP            = "Plausibilitätsprüfungen"
    WMS_GROUP               = "WMS-Dienste"

    #Referenztabellen
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
    MATERIAL                = "Material"
    M150_KNOTENARTEN        = "M150 Knotenarten"
    M150_KUERZEL_ERG        = "M150 Kürzel zu ergänzen"

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
    SYNC_SCHAECHTE_COMPARE              = "Synchronisation Schächte"
    SYNC_SCHAECHTE_EXT                  = "Schächte extern"
    SYNC_HALTUNGEN_COMPARE              = "Synchronisation Haltungen"
    SYNC_HALTUNGEN_EXT                  = "Haltungen extern"
    SYNC_HA_SCHAECHTE_COMPARE           = "Synchronisation HA-Schächte"
    SYNC_HA_SCHAECHTE_EXT               = "HA-Schächte extern"
    SYNC_HA_LEITUNGEN_COMPARE           = "Synchronisation HA-Leitungen"
    SYNC_HA_LEITUNGEN_EXT               = "HA-Leitungen extern"
    SYNC_FLAECHEN_COMPARE               = "Synchronisation Einzelflächen"
    SYNC_FLAECHEN_EXT                   = "Einzelflächen extern"
    SYNC_TEZG_COMPARE                   = "Synchronisation Haltungsflächen"
    SYNC_TEZG_EXT                       = "Haltungsflächen extern"
    SYNC_ANBINDUNG_FLAECHEN_COMPARE     = "Synchronisation Anbindungen Flächen"
    SYNC_ANBINDUNG_FLAECHEN_EXT         = "Anbindungen Flächen extern"
    SYNC_ZUSTAND_SCHAECHTE_COMPARE      = "Synchronisation Zustand Schächte"
    SYNC_ZUSTAND_SCHAECHTE_EXT          = "Zustand Schächte extern"
    SYNC_SCHAEDEN_SCHAECHTE_COMPARE     = "Synchronisation Einzelschäden Schächte"
    SYNC_SCHAEDEN_SCHAECHTE_EXT         = "Einzelschäden Schächte extern"
    SYNC_ZUSTAND_HALTUNGEN_COMPARE      = "Synchronisation Zustand Haltungen"
    SYNC_ZUSTAND_HALTUNGEN_EXT          = "Zustand Haltungen extern"
    SYNC_SCHAEDEN_HALTUNGEN_COMPARE     = "Synchronisation Einzelschäden Haltungen"
    SYNC_SCHAEDEN_HALTUNGEN_EXT         = "Einzelschäden Haltungen extern"
    SYNC_ZUSTAND_HA_LEITUNGEN_COMPARE   = "Synchronisation Zustand HA-Leitungen"
    SYNC_ZUSTAND_HA_LEITUNGEN_EXT       = "Zustand HA-Leitungen extern"
    SYNC_SCHAEDEN_HA_LEITUNGEN_COMPARE  = "Synchronisation Einzelschäden HA-Leitungen"
    SYNC_SCHAEDEN_HA_LEITUNGEN_EXT      = "Einzelschäden HA-Leitungen extern"

    SYNC_GROUP_SYNCHRONISATION          = "Synchronisation"
    SYNC_GROUP_SCHAECHTE                = "Vergleich Schächte"
    SYNC_GROUP_HALTUNGEN                = "Vergleich Haltungen"
    SYNC_GROUP_HA_SCHAECHTE             = "Vergleich HA-Schächte"
    SYNC_GROUP_HA_LEITUNGEN             = "Vergleich HA-Leitungen"
    SYNC_GROUP_FLAECHEN                 = "Vergleich Flächen"
    SYNC_GROUP_TEZG                     = "Vergleich Haltungsflächen"
    SYNC_GROUP_ANBINDUNG_FLAECHEN       = "Vergleich Anbindungen Flächen"
    SYNC_GROUP_ZUSTAND_SCHAECHTE        = "Vergleich Zustand Schächte"
    SYNC_GROUP_SCHAEDEN_SCHAECHTE       = "Vergleich Einzelschäden Schächte"
    SYNC_GROUP_ZUSTAND_HALTUNGEN        = "Vergleich Zustand Haltungen"
    SYNC_GROUP_SCHAEDEN_HALTUNGEN       = "Vergleich Einzelschäden Haltungen"
    SYNC_GROUP_ZUSTAND_HA_LEITUNGEN     = "Vergleich Zustand HA-Leitungen"
    SYNC_GROUP_SCHAEDEN_HA_LEITUNGEN    = "Vergleich Einzelschäden HA-Leitungen"


class MikeVersion(enum.Enum):
    """Programmversion der Ergebnisdateien zu Mike+"""
    v1 = '2023'
    v2 = '2025'
