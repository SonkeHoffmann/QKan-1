import os

from qgis.core import QgsProject, QgsEditorWidgetSetup

from qkan.database.dbfunc import DBConnection
from qkan.utils import get_logger
from qgis.utils import pluginDirectory
from qkan import enums
from qkan.tools.qkan_utils import loadlayer
VERSION = "3.4.8"  # must be higher than previous one and correspond with qkan_database.py: __dbVersion__

logger = get_logger("QKan.database.migrations.0040")

def run(dbcon: DBConnection) -> bool:
    # Ergänzung einiger Felder in anschlussleitungen

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

    project = QgsProject.instance()
    vlayers = project.mapLayersByName('Geometrien')         # können mehrere sein, auch wenn's nicht gewollt ist ...
    for vlayer in vlayers:
        qmlfile = os.path.join(pluginDirectory("qkan"), 'database/migrations', "0040_Geometrien.qml")
        try:
            vlayer.loadNamedStyle(qmlfile)
        except:
            logger.error_code(f'Die Styledatei {qmlfile} konnte nicht gelesen werden!')
            return False

    if not loadlayer(
            enums.LAYERBEZ.MATERIAL.value,
            'material',
            None,
            'Material.qml',
            'qkan_material.ui',
            'Referenztabellen',
            6,):
        logger.error(
            f"Fehler beim Einfügen des Layers Material"
        )
        return False

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

    reflayers = project.mapLayersByName(enums.LAYERBEZ.ABFLUSSTYPEN.value)
    if len(reflayers) != 1:
        logger.error_data('Entweder fehlt der Layer "Knotentypen oder es gibt mehr als einen Layer mit '
                          'diesem Namen')
    else:
        reflayer = reflayers[0]
        layers = project.mapLayersByName(enums.LAYERBEZ.ANBINDUNG_FLAECHEN.value)
        for layer in layers:
            # Alle aufgelisteten Attribute
            idx = layer.fields().indexFromName('abflusstyp')
            ews = layer.editorWidgetSetup(idx)
            ewsconf = ews.config()
            ewsconf['Layer'] = reflayer.id()
            ewsconf['LayerName'] = reflayer.name()
            ewsconf['Key'] = 'abflusstyp'
            ewsconf['Value'] = 'abflusstyp'
            ewsnew = QgsEditorWidgetSetup('ValueRelation', ewsconf)
            layer.setEditorWidgetSetup(idx, ewsnew)

            logger.debug(f'Layer {layer.name()} geändert')

    project.write()

    return True
