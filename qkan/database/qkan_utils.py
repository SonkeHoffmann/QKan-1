from qkan.openqkanproject import initQKanProject
from ..utils import get_logger
from qgis.core import QgsMessageLog, Qgis
from qgis.utils import iface

logger = get_logger("QKan.database.qkan_utils")

def warnung(title: str, text: str, duration: int = -1) -> None:
    """Ersatzfunktion für Projekte vor QKan 3.4.8"""
    logger.warning_user(f'{title}: {text}')

def get_database_QKan(silent: bool = False) -> None:
    """Ersatzfunktion für Projekte vor QKan 3.4.8"""
    """Check actual version of database and project file"""
    try:
        initQKanProject()
    except ImportError:
        # import traceback
        # traceback.print_exc()
        msg = "Diese Projektdatei wurde mit dem Programm QKan (Prof. Höttges, FH Aachen) erstellt."
        QgsMessageLog.logMessage(
            message=msg, level=Qgis.Info,
        )
        iface.messageBar().pushMessage("Information", msg, level=Qgis.Info)

    return None, None
