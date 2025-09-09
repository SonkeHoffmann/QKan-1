from qkan.database.dbfunc import DBConnection
from qkan.utils import get_logger
from qkan.tools.qkan_utils import loadlayer
from qgis.utils import pluginDirectory
from qkan import QKan, enums
import os

VERSION = "3.4.8"  # must be higher than previous one and correspond with qkan_database.py: __dbVersion__

logger = get_logger("QKan.database.migrations.0040")


def run(dbcon: DBConnection) -> bool:
    # Ergänzung einiger Felder in anschlussleitungen

    sql_file = os.path.join(pluginDirectory("qkan"), 'database/migrations', '0040_sqlite.sql')
    try:
        dbcon.executefile(sql_file
                          )
    except BaseException as err:
        logger.debug(f"Fehler in {__name__}.0040, {sql_file =}")
        return False

    dbcon.commit()

    return True
