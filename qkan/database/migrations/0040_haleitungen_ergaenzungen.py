import os

from qgis.core import QgsProject

from qkan.database.dbfunc import DBConnection
from qkan.utils import get_logger
from qgis.utils import pluginDirectory
from qkan import QKan, enums
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

    project = QgsProject.instance()
    vlayers = project.mapLayersByName('Geometrien')         # können mehrere sein, auch wenn's nicht gewollt ist ...
    for vlayer in vlayers:
        qmlfile = os.path.join(QKan.template_dir, 'qml', "Geometrien.qml")
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

    dbcon.commit()

    return True
