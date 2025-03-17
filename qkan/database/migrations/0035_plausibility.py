from qkan.database.dbfunc import DBConnection
import os
from qgis.utils import pluginDirectory
from qkan.utils import get_logger

VERSION = "3.3.6"  # must be higher than previous one and correspond with qkan_database.py: __dbVersion__

logger = get_logger("QKan.database.migrations")


def run(dbcon: DBConnection) -> bool:
    """Zusätzliche Tabelle Notizen
    :type dbcon:    DBConnection
    """

    templateDir = os.path.join(pluginDirectory("qkan"), "templates")
    filenam = os.path.join(templateDir, 'Plausibilitaetspruefungen.sql')
    if dbcon.executefile(filenam):
        logger.debug(f"Plausibilitätsabfragen aus Datei {filenam} eingelesen")
    else:
        logger.error_code("Fehler beim Lesen der Plausibilitätsabfragen:"
                          f"Die Datei {filenam} konnten nicht gelesen werden!\n"
                          "Fehler in migration 0035_plausibility")
    dbcon.commit()
    logger.debug("Plausibilitätsprüfungen mit Datei 'Plausibilitaetspruefungen.sql' ergänzt.")

    return True
