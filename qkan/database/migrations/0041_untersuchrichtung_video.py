import os

from qgis.core import QgsProject, QgsEditorWidgetSetup

from qkan.database.dbfunc import DBConnection
from qkan.utils import get_logger, QkanDbError
from qgis.utils import pluginDirectory
from qkan import QKan, enums
from qkan.tools.qkan_utils import loadLayer, get_database_QKan
VERSION = "3.4.8"  # must be higher than previous one and correspond with qkan_database.py: __dbVersion__

logger = get_logger("QKan.database.migrations.0041")

def run(dbcon: DBConnection) -> bool:
    # Ergänzung einiger Felder in Videos

    project = QgsProject.instance()

    qkan_db=QKan.config.database.qkan           # wurde im Formular zum Datenbankupdate festgelegt

    pname = QKan.config.project.file            # wurde im Formular zum Datenbankupdate festgelegt
    logger.debug(f'{pname=}')

    dbcon.alter_table(
        tabnam=         'videos',
        attributes_new= [],
        attributes_del= None,
    )

    sql_file = os.path.join(pluginDirectory("qkan"), 'database/migrations', '0041_sqlite.sql')
    try:
        dbcon.executefile(sql_file)
    except BaseException as err:
        logger.error_code(f"Fehler {err} in {__name__}.0041, {sql_file =}")
        return False

    # Tabelle wurde bereits mit sql_file erstellt

    if 'untersuchrichtung' not in dbcon.attrlist('videos'):
        try:
            dbcon.sql(
                'ALTER TABLE videos ADD COLUMN untersuchrichtung TEXT;',
                'migration_0041, untersuchrichtung ergänzen'
            )
        except:
            logger.error_code('Fehlgeschlagen: migration_0041, untersuchrichtung ergänzen')

    project.write(pname)
    project.clear()
    project.setDirty(False)

    return True
