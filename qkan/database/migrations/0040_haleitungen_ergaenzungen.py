import os

from qgis.core import QgsProject, QgsEditorWidgetSetup

from qkan.database.dbfunc import DBConnection
from qkan.utils import get_logger
from qgis.utils import pluginDirectory
from qkan import QKan, enums
from qkan.tools.qkan_utils import loadLayer, get_database_QKan
VERSION = "3.4.8"  # must be higher than previous one and correspond with qkan_database.py: __dbVersion__

logger = get_logger("QKan.database.migrations.0040")

def run(dbcon: DBConnection) -> bool:
    # Ergänzung einiger Felder in anschlussleitungen

    project = QgsProject.instance()

    qkan_db=QKan.config.database.qkan           # wurde im Formular zum Datenbankupdate festgelegt

    pname = QKan.config.project.file            # wurde im Formular zum Datenbankupdate festgelegt
    logger.debug(f'{pname=}')

    dbcon.alter_table(
        tabnam=         'schaechte',
        attributes_new= [],
        attributes_del= None,
        geo_attrchange='geom',
        geo_newtype=    'MULTILINESTRING',
        geo_modfun=     'CastToMultiLineString(LinesFromRings(geom)) AS geom',
    )

    sql_file = os.path.join(pluginDirectory("qkan"), 'database/migrations', '0040_sqlite.sql')
    try:
        dbcon.executefile(sql_file)
    except BaseException as err:
        logger.error_code(f"Fehler {err} in {__name__}.0040, {sql_file =}")
        return False

    if 'urstation' not in dbcon.attrlist('anschlussleitungen'):
        try:
            dbcon.sql(
                'ALTER TABLE anschlussleitungen ADD COLUMN urstation REAL;',
                'migration_0040, urstation ergänzen'
            )
        except:
            logger.error_code('Fehlgeschlagen: migration_0040, urstation ergänzen')

    if 'ursprung' not in dbcon.attrlist('anschlussleitungen'):
        try:
            dbcon.sql(
                'ALTER TABLE anschlussleitungen ADD COLUMN ursprung TEXT;',
                'migration_0040, ursprung ergänzen'
            )
        except:
            logger.error_code('Fehlgeschlagen: migration_0040, ursprung ergänzen')

    dbcon.commit()

    project.read()

    # Neuer Layer HA-Schächte
    grouppath = [
        enums.LAYERBEZ.QKAN_GROUP.value,
        enums.LAYERBEZ.SCHAECHTE_GROUP.value,
    ]
    loadLayer(
        layerbez=enums.LAYERBEZ.ANSCHLUSSSCHAECHTE.value,
        table="schaechte",
        geom_column='geop',
        qmlfile="HA-Schächte.qml",
        uifile="qkan_anschlussschaechte.ui",
        group=grouppath,
        gpos=4,
    )

    layers = project.mapLayersByName(enums.LAYERBEZ.ANSCHLUSSSCHAECHTE.value)         # können mehrere sein, auch wenn's nicht gewollt ist ...
    for layer in layers:
        qmlfile = os.path.join(pluginDirectory("qkan"), 'templates/qml', "HA-Schächte.qml")
        try:
            layer.loadNamedStyle(qmlfile)
        except:
            logger.error_code(f'Die Styledatei {qmlfile} konnte nicht gelesen werden!')
            return False

    # Layer Geometrien ändern
    layers = project.mapLayersByName(enums.LAYERBEZ.GEOMETRIEN.value)         # können mehrere sein, auch wenn's nicht gewollt ist ...
    for layer in layers:
        qmlfile = os.path.join(pluginDirectory("qkan"), 'database/migrations', "0040_Geometrien.qml")
        try:
            layer.loadNamedStyle(qmlfile)
        except:
            logger.error_code(f'Die Styledatei {qmlfile} konnte nicht gelesen werden!')
            return False

    logger.debug(f'{qkan_db=}')
    if not loadLayer(
        layerbez=enums.LAYERBEZ.MATERIAL.value,
        table='material',
        geom_column=None,
        qmlfile='Material.qml',
        uifile='qkan_material.ui',
        group='Referenztabellen',
        gpos=6,
        qkan_db=qkan_db,
    ):
        logger.error(
            f"Fehler beim Einfügen des Layers Material"
        )
        return False
    else:
        logger.debug(f'Layer Material geladen')

    # Attribut haltungen.rwanschluss in Attributtabelle umbenennen
    layers = project.mapLayersByName(enums.LAYERBEZ.HALTUNGEN.value)
    for layer in layers:
        fields = layer.fields()
        for i, field in enumerate(fields):
            if field.name() == 'rwanschluss':
                layer.setFieldAlias(i, 'hat RW-Anschlüsse')

    # Layer Abflusstypen umbennen in Abflussmodelle (enums.LAYERBEZ.ABFLUSSTYPEN)
    abmodlayers = project.mapLayersByName('Abflusstypen')           # alte Bezeichnung!
    for abmodlayer in abmodlayers:
        abmodlayer.setName(enums.LAYERBEZ.ABFLUSSTYPEN.value)

    # Wertebezeichnungen für das Feld "abflusstyp" in Layer "Anbindungen Flächen" korrigieren
    reflayers = project.mapLayersByName(enums.LAYERBEZ.ABFLUSSTYPEN.value)
    if (anz := len(reflayers)) != 1:
        logger.error_data(f'Es gibt {anz} Layer "{enums.LAYERBEZ.ABFLUSSTYPEN.value}". '
                          f'Es darf aber nur einen geben!')
    else:
        reflayer = reflayers[0]
        layers = project.mapLayersByName(enums.LAYERBEZ.ANBINDUNG_FLAECHEN.value)
        for layer in layers:
            # Alle aufgelisteten Attribute
            idx = layer.fields().indexFromName('abflusstyp')
            ews = layer.editorWidgetSetup(idx)
            ewsconf = ews.config()
            # del ewsconf['LayerSource']
            ewsconf['Layer'] = reflayer.id()
            ewsconf['LayerName'] = reflayer.name()
            ewsconf['Key'] = 'abflusstyp'
            ewsconf['Value'] = 'abflusstyp'
            ewsnew = QgsEditorWidgetSetup('ValueRelation', ewsconf)
            layer.setEditorWidgetSetup(idx, ewsnew)

            logger.debug(f'Layer {layer.name()} geändert')

            # Kontrolle
            ews = layer.editorWidgetSetup(idx)
            ewsconf = ews.config()
            logger.debug(f'{ewsconf=}')

    # Wertebeziehungen, die bisher auf Schächte verweisen, auf Knotentypen ändern
    reflayers = project.mapLayersByName(enums.LAYERBEZ.KNOTENTYP.value)
    if len(reflayers) != 1:
        logger.error_data('Entweder fehlt der Layer "Knotentypen oder es gibt mehr als einen Layer mit '
                          'diesem Namen')
    else:
        reflayer = reflayers[0]                 # Layer, auf den die Werteliste referenziert
        layerlist = [
            (enums.LAYERBEZ.ANBINDUNG_FLAECHEN, 'schnam'),
            (enums.LAYERBEZ.ANBINDUNG_DIREKTEINLEITUNGEN, 'schnam'),
            (enums.LAYERBEZ.EINZELFLAECHEN, 'schnam'),
            (enums.LAYERBEZ.ANSCHLUSSLEITUNGEN, 'schoben', 'schunten'),
            (enums.LAYERBEZ.AUSSENGEBIETE, 'schnam'),
            (enums.LAYERBEZ.DROSSELN, 'schoben', 'schunten'),
            (enums.LAYERBEZ.DIREKTEINLEITUNGEN, 'schnam'),
            (enums.LAYERBEZ.GRUND_SEITENAUSLASS, 'schoben', 'schunten'),
            (enums.LAYERBEZ.HALTUNGEN, 'schoben', 'schunten'),
            (enums.LAYERBEZ.H_REGLER, 'schoben', 'schunten'),
            (enums.LAYERBEZ.ANBINDUNG_AUSSENGEBIETE, 'schnam'),
            (enums.LAYERBEZ.PUMPEN, 'schoben', 'schunten'),
            (enums.LAYERBEZ.Q_REGLER, 'schoben', 'schunten'),
            (enums.LAYERBEZ.SCHIEBER, 'schoben', 'schunten'),
            (enums.LAYERBEZ.WEHRE, 'schoben', 'schunten'),
        ]
        # Alle Layernamen aus layerlist
        for (layername, *attrs) in layerlist:
            layers = project.mapLayersByName(layername.value)
            # Jedes Auftreten dieses Layernamens
            for layer in layers:
                # Alle aufgelisteten Attribute
                for attr in attrs:
                    idx = layer.fields().indexFromName(attr)
                    ews = layer.editorWidgetSetup(idx)
                    ewsconf = ews.config()
                    ewsconf['Layer'] = reflayer.id()
                    ewsconf['LayerName'] = reflayer.name()
                    ewsnew = QgsEditorWidgetSetup('ValueRelation', ewsconf)
                    layer.setEditorWidgetSetup(idx, ewsnew)

                    logger.debug(f'Layer {layer.name()} geändert')

    project.write(pname)

    return True
