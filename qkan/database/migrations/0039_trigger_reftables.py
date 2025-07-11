from qkan.database.dbfunc import DBConnection
from qkan.utils import get_logger
from qkan.database.qkan_utils import loadlayer
from qgis.utils import pluginDirectory
from qkan import QKan, enums
import os

VERSION = "3.4.6"  # must be higher than previous one and correspond with qkan_database.py: __dbVersion__

logger = get_logger("QKan.database.migrations")


def run(dbcon: DBConnection) -> bool:
    # Korrektur der Trigger für einige Referenztabellen

    sql_file = os.path.join(pluginDirectory("qkan"), 'database/migrations', '0039_reftables.sql')
    try:
        dbcon.executefile(sql_file,
                          replacefun = lambda sqltext: sqltext.format(epsg=QKan.config.epsg)
                          )
    except BaseException as err:
        logger.debug(f"Fehler in {__name__}.trigger reftables, {sql_file =}")
        return False

    sql = "ALTER TABLE haltungen ADD COLUMN rwanschluss INTEGER DEFAULT 0"
    if not dbcon.sql(sql, 'migration_0039 add rwanschluss'):
        logger.error_code("migration_0039 add col failed")

    sql = "UPDATE haltungen SET rwanschluss = NOT transport"
    if not dbcon.sql(sql, 'migration_0039 set rwanschluss'):
        logger.error_code("migration_0039 set rwanschluss failed")

    if not dbcon.alter_table(
        "haltungen",
        [
            "haltnam TEXT",
            "schoben TEXT                                    /* join schaechte.schnam */",
            "schunten TEXT                                   /* join schaechte.schnam */",
            "hoehe REAL                                      /* Profilhoehe (mm) */",
            "breite REAL                                     /* Profilbreite (mm) */",
            "laenge REAL                                     /* abweichende Haltungslänge (m) */",
            "aussendurchmesser REAL",
            "sohleoben REAL                                  /* abweichende Sohlhöhe oben (m) */",
            "sohleunten REAL                                 /* abweichende Sohlhöhe unten (m) */",
            "baujahr INT",
            "eigentum TEXT                                   /* join eigentum.name */",
            "teilgebiet TEXT                                 /* join teilgebiet.tgnam */",
            "strasse TEXT                                    /* für ISYBAU benötigt */",
            "profilnam TEXT DEFAULT 'Kreisquerschnitt'       /* join profile.profilnam */",
            "entwart TEXT DEFAULT 'Regenwasser'              /* join entwaesserungsarten.bezeichnung */",
            "material TEXT                                   /* join material.bezeichnung */",
            "profilauskleidung TEXT",
            "innenmaterial TEXT",
            "ks REAL DEFAULT 1.5                             /* abs. Rauheit (Prandtl-Colebrook) */",
            "haltungstyp TEXT DEFAULT 'Haltung'              /* join haltungstypen.bezeichnung */",
            "simstatus TEXT DEFAULT 'vorhanden'              /* join simulationsstatus.bezeichnung */",
            "rwanschluss INTEGER DEFAULT 0                   /* soll bei TEZG-Erstellung berücksichtigt werden */",
            "druckdicht INTEGER DEFAULT 0                    /* Druckleitung */",
            "xschob REAL",
            "yschob REAL",
            "xschun REAL",
            "yschun REAL",
            "kommentar TEXT",
            "createdat TEXT DEFAULT CURRENT_TIMESTAMP",
            "transport INTEGER",
        ]
    ):
        logger.error_code(
            f"Fehler bei Migration zu Version {VERSION}: "
            "Hinzufügen von Attribut rwanschluss in Tabelle haltungen fehlgeschlagen"
        )

    logger.info('Attribut "rwanschluss" in Tabelle "haltungen" ergänzt')

    if not dbcon.alter_table(
        "untersuchdat_schacht",
        [
            "untersuchsch TEXT",
            "id INTEGER                                      /* absolute Nummer der Inspektion */",
            "untersuchtag TEXT",
            "bandnr INTEGER",
            "videozaehler TEXT",
            "timecode TEXT",
            "langtext TEXT",
            "kuerzel TEXT",
            "charakt1 TEXT",
            "charakt2 TEXT",
            "quantnr1 REAL",
            "quantnr2 REAL",
            "streckenschaden TEXT",
            "streckenschaden_lfdnr INTEGER",
            "pos_von INTEGER",
            "pos_bis INTEGER",
            "vertikale_lage INTEGER",
            "inspektionslaenge INTEGER",
            "bereich TEXT",
            "foto_dateiname TEXT",
            "film_dateiname TEXT",
            "ordner_bild TEXT",
            "ordner_video TEXT",
            "filmtyp INTEGER",
            "video_start INTEGER",
            "video_ende INTEGER",
            "ZD INTEGER",
            "ZB INTEGER",
            "ZS INTEGER",
            "kommentar TEXT",
            "createdat TEXT DEFAULT CURRENT_TIMESTAMP",
            "ordner TEXT",
        ]
    ):
        logger.error(
            f"Fehler bei Migration zu Version {VERSION}: "
            "Hinzufügen von Attribut ordner_bild in Tabelle haltungen fehlgeschlagen"
        )

    if not dbcon.sql("UPDATE untersuchdat_schacht SET ordner_bild = ordner"):
        logger.error(
            f"Fehler bei Migration zu Version {VERSION}: "
            "Übertragen von ordner zu ordner_bild in Tabelle untersuchdate_schacht fehlgeschlagen"
        )

    dbcon.commit()

    if not dbcon.alter_table(
        "untersuchdat_schacht",
        [
            "untersuchsch TEXT",
            "id INTEGER                                      /* absolute Nummer der Inspektion */",
            "untersuchtag TEXT",
            "bandnr INTEGER",
            "videozaehler TEXT",
            "timecode TEXT",
            "langtext TEXT",
            "kuerzel TEXT",
            "charakt1 TEXT",
            "charakt2 TEXT",
            "quantnr1 REAL",
            "quantnr2 REAL",
            "streckenschaden TEXT",
            "streckenschaden_lfdnr INTEGER",
            "pos_von INTEGER",
            "pos_bis INTEGER",
            "vertikale_lage INTEGER",
            "inspektionslaenge INTEGER",
            "bereich TEXT",
            "foto_dateiname TEXT",
            "film_dateiname TEXT",
            "ordner_bild TEXT",
            "ordner_video TEXT",
            "filmtyp INTEGER",
            "video_start INTEGER",
            "video_ende INTEGER",
            "ZD INTEGER",
            "ZB INTEGER",
            "ZS INTEGER",
            "kommentar TEXT",
            "createdat TEXT DEFAULT CURRENT_TIMESTAMP",
        ],                                         # nichts hinzufügen...
        ["ordner"]                                 # 'ordner' entfernen
    ):
        logger.error(
            f"Fehler bei Migration zu Version {VERSION}: "
            "Entfernen von Attribut ordner in Tabelle haltungen fehlgeschlagen"
        )

    dbcon.commit()

    # gpos: Position des Layers innerhalb der Gruppe
    layerconfs = [
        {'layerbez': enums.LAYERBEZ.HALTUNGEN.value, 'table': 'haltungen', 'geom_column': 'geom',
         'qmlfile': 'Haltungen.qml', 'uifile': 'qkan_haltungen.ui', 'group': 'Haltungen', 'gpos': 0, },
        {'layerbez': enums.LAYERBEZ.ANSCHLUSSLEITUNGEN.value, 'table': 'anschlussleitungen', 'geom_column': 'geom',
         'qmlfile': 'HA-Leitungen.qml', 'uifile': 'qkan_anschlussleitungen.ui', 'group': 'Haltungen', 'gpos': 1, },
        {'layerbez': enums.LAYERBEZ.HALTUNGSFLAECHEN.value, 'table': 'tezg', 'geom_column': 'geom',
         'qmlfile': 'Einzelflächen.qml', 'uifile': 'qkan_flaechen.ui', 'group': 'Flächen', 'gpos': 0, },
        {'layerbez': enums.LAYERBEZ.ANBINDUNG_FLAECHEN.value , 'table': 'linkfl', 'geom_column': 'glink',
         'qmlfile': 'Anbindungen Flächen.qml', 'uifile': 'qkan_anbindungflaechen.ui', 'group': 'Flächen', 'gpos': 1, },
        {'layerbez': enums.LAYERBEZ.EINZELFLAECHEN.value , 'table': 'flaechen', 'geom_column': 'geom',
         'qmlfile': 'Flächen.qml', 'uifile': 'qkan_flaechen.ui', 'group': 'Flächen', 'gpos': 2, },
        {'layerbez': enums.LAYERBEZ.ANBINDUNG_DIREKTEINLEITUNGEN.value, 'table': 'linksw', 'geom_column': 'glink',
         'qmlfile': 'Anbindungen Direkteinleitungen.qml', 'uifile': 'qkan_anbindungeinleit.ui', 'group': 'Einleitungen', 'gpos': 1, },
    ]

    for layerconf in layerconfs:
        if not loadlayer(
                layerconf['layerbez'],
                layerconf['table'],
                layerconf['geom_column'],
                layerconf['qmlfile'],
                layerconf['uifile'],
                layerconf['group'],
                layerconf['gpos'],):
            logger.error(
                f"Fehler bei Migration zu Version {VERSION}: "
                "Einfügen der atkualisierten Layer fehlgeschlagen"
            )
            return False

    # Neue Tabelle Fotos

    sql = """CREATE TABLE IF NOT EXISTS fotos (
    pk INTEGER PRIMARY KEY,
    name TEXT,
    untersuchtag TEXT,
    objekt TEXT, 
    datei TEXT,
    createdat TEXT DEFAULT CURRENT_TIMESTAMP)"""

    if not dbcon.sql(sql, f"migration 0039, Version {VERSION}: "
                          f"Neue Tabelle Fotos"):
        logger.error('Fehler in migration 0039')
        raise Exception(f"{__name__}")

    # Neue Tabelle Videos

    sql = """CREATE TABLE IF NOT EXISTS videos (
    pk INTEGER PRIMARY KEY,
    name TEXT,
    untersuchtag TEXT,
    objekt TEXT,
    datei TEXT,
    createdat TEXT DEFAULT CURRENT_TIMESTAMP)"""

    if not dbcon.sql(sql, f"migration 0039, Version {VERSION}: "
                          f"Neue Tabelle Fotos"):
        logger.error('Fehler in migration 0039')
        raise Exception(f"{__name__}")

    #TODO: Bestehende Daten aus den untersuchungen in die neuen Tabellen schreiben?

    return True
