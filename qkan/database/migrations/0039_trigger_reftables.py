from qkan.database.dbfunc import DBConnection
from qkan.utils import get_logger
from qgis.utils import pluginDirectory
import os

VERSION = "3.4.3"  # must be higher than previous one and correspond with qkan_database.py: __dbVersion__

logger = get_logger("QKan.database.migrations")


def run(dbcon: DBConnection) -> bool:
    # Korrektur der Trigger für einige Referenztabellen

    sql_file = os.path.join(pluginDirectory("qkan"), 'database/migrations', '0039_reftables.sql')
    try:
        dbcon.executefile(sql_file)
    except BaseException as err:
        logger.debug(f"Fehler in {__name__}.trigger reftables, {sql_file =}")
        return False

    dbcon.commit()

    return True
