from qkan.database.dbfunc import DBConnection
from qkan.utils import get_logger
from qgis.utils import pluginDirectory
from qgis.core import QgsProject, QgsDataSourceUri, QgsVectorLayer
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
        layerbez = layerconf['layerbez']
        table = layerconf['table']
        geom_column = layerconf['geom_column']
        qmlfile = layerconf['qmlfile']
        uifile = layerconf['uifile']
        group = layerconf['group']
        gpos = layerconf['gpos']

        uri = QgsDataSourceUri()
        uri.setDatabase(QKan.config.database.qkan)
        schema = ''
        uri.setDataSource(schema, table, geom_column)
        layer = QgsVectorLayer(uri.uri(), layerbez, 'spatialite')
        x = QgsProject.instance()
        try:
            x.removeMapLayer(x.mapLayersByName(layerbez)[0].id())
        except:
            pass

        templatepath = os.path.join(pluginDirectory("qkan"), "templates")
        qmlpath = os.path.join(templatepath, "qml", qmlfile)
        formsDir = os.path.join(pluginDirectory("qkan"), "forms")

        try:
            layer.loadNamedStyle(qmlpath)
            layer.triggerRepaint()
        except:
            logger.error_code(f'Stildatei "{qmlfile}" wurde nicht gefunden!\nAbbruch!')

        # Adapt path to forms directory
        editFormConfig = layer.editFormConfig()
        editFormConfig.setUiForm(os.path.join(formsDir, uifile))
        layer.setEditFormConfig(editFormConfig)
        QgsProject.instance().addMapLayer(layer, False)

        layersRoot = QgsProject.instance().layerTreeRoot()
        actGroup = layersRoot.findGroup(group)
        if actGroup is None:
            actGroup = layersRoot.addGroup(group)
        actGroup.insertLayer(gpos, layer)

    # Alias für hinzugefügtes Feld "rwanschluss"
    # project = QgsProject.instance()
    # layers = project.mapLayersByName(enums.LAYERBEZ.HALTUNGEN.value)
    # for layer in layers:
    #     index = layer.fields().indexFromName('rwanschluss')
    #     layer.setFieldAlias(index, 'RW-Anschlüsse')
    #
    #     tableconfig = layer.attributeTableConfig()
    #     columns = tableconfig.columns()
    #     names = [col.name for col in columns]
    #     # rwanschluss zu Pos. 15 verschieben
    #     index = names.index('rwanschluss')
    #     columns.insert(15, columns.pop(index))
    #     # transport ans Ende verschieben
    #     index = names.index('transport')
    #     columns.append(columns.pop(index))
    #     tableconfig.setColumns(columns)
    #     layer.setAttributeTabelConfig(tableconfig)

    return True
