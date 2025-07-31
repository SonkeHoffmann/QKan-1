from qkan.database.dbfunc import DBConnection
from qkan.tools.qkan_utils import fehlermeldung
from qkan.utils import get_logger

VERSION = "3.0.1"

logger = get_logger("QKan.database.migrations")


def run(dbcon: DBConnection) -> bool:
    # Spalte "teilgebiet" in Tabelle "pumpen" ergänzen
    attrlis = dbcon.attrlist("pumpen")
    if attrlis == []:
        fehlermeldung(
            "dbfunc.DBConnection.version (3.0.1):",
            "attrlis für pumpen ist leer",
        )
        return False
    elif "teilgebiet" not in attrlis:
        logger.debug("pumpen.teilgebiet ist nicht in: {}".format(str(attrlis)))

    dbcon.alter_table(
        "pumpen",
        [
            "pnam TEXT",
            "schoben TEXT",
            "schunten TEXT",
            "pumpentyp TEXT",
            "volanf REAL",
            "volges REAL",
            "sohle REAL",
            "steuersch TEXT",
            "einschalthoehe REAL",
            "ausschalthoehe REAL",
            "teilgebiet TEXT",
            "simstatus TEXT DEFAULT 'vorhanden'",
            "kommentar TEXT",
            "createdat TEXT DEFAULT (datetime('now'))",
        ],
        ["volanf", "volges"],
    )

    # Spalte "teilgebiet" in Tabelle "wehre" ergänzen
    attrlis = dbcon.attrlist("wehre")
    if attrlis == []:
        fehlermeldung(
            "dbfunc.DBConnection.version (3.0.1):",
            "attrlis für wehre ist leer",
        )
        return False
    elif "teilgebiet" not in attrlis:
        logger.debug("wehre.teilgebiet ist nicht in: {}".format(str(attrlis)))

    dbcon.alter_table(
        "wehre",
        [
            "wnam TEXT",
            "schoben TEXT",
            "schunten TEXT",
            "wehrtyp TEXT",
            "schwellenhoehe REAL",
            "kammerhoehe REAL",
            "laenge REAL",
            "uebeiwert REAL",
            "aussentyp TEXT",
            "aussenwsp REAL",
            "teilgebiet TEXT",
            "simstatus TEXT DEFAULT 'vorhanden'",
            "kommentar TEXT",
            "createdat TEXT DEFAULT (datetime('now'))",
        ],
    )

    return True
