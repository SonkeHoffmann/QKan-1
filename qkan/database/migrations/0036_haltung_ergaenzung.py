from qkan.database.dbfunc import DBConnection
import os
from qgis.utils import pluginDirectory
from qkan.utils import get_logger

VERSION = "3.3.7"  # must be higher than previous one and correspond with qkan_database.py: __dbVersion__

logger = get_logger("QKan.database.migrations")


def run(dbcon: DBConnection) -> bool:
    """Zusätzliche Spalten in der Haltungstabelle
    :type dbcon:    DBConnection
    """
    if not dbcon.alter_table(
        "haltungen",
        [
            "haltnam TEXT",
            "schoben TEXT                                    -- join schaechte.schnam",
            "schunten TEXT                                   -- join schaechte.schnam",
            "hoehe REAL                                      -- Profilhoehe (m)",
            "breite REAL                                     -- Profilbreite (m)",
            "laenge REAL                                     -- abweichende Haltungslänge (m)",
            "aussendurchmesser REAL",
            "sohleoben REAL                                  -- abweichende Sohlhöhe oben (m)",
            "sohleunten REAL                                 -- abweichende Sohlhöhe unten (m)",
            "teilgebiet TEXT                                 -- join teilgebiet.tgnam",
            "strasse TEXT                                    -- für ISYBAU benötigt",
            "profilnam TEXT DEFAULT 'Kreisquerschnitt'       -- join profile.profilnam",
            "entwart TEXT DEFAULT 'Regenwasser'              -- join entwaesserungsarten.bezeichnung",
            "material TEXT",
            "profilauskleidung TEXT",
            "innenmaterial TEXT",
            "ks REAL DEFAULT 1.5                             -- abs. Rauheit (Prandtl-Colebrook)",
            "haltungstyp TEXT DEFAULT 'Haltung'              -- join haltungstypen.bezeichnung",
            "simstatus TEXT DEFAULT 'vorhanden'              -- join simulationsstatus.bezeichnung",
            "transport INTEGER DEFAULT 0                     -- Transporthaltung?",
            "druckdicht INTEGER DEFAULT 0                    -- Druckleitung?",
            "xschob REAL",
            "yschob REAL",
            "xschun REAL",
            "yschun REAL",
            "kommentar TEXT",
            "createdat TEXT DEFAULT CURRENT_TIMESTAMP"
        ]
    ):
        logger.error(
            f"Fehler bei Migration zu Version {VERSION}: "
            "Hinzufügen von aussendurchmesser, profilauskleidung, innenmaterial "
            "zu Tabelle 'haltungen' fehlgeschlagen"
        )

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

    if not dbcon.alter_table(
        "entwaesserungsarten", [
            "bezeichnung TEXT                    -- eindeutige QKan-Bezeichnung",
            "kuerzel TEXT                        -- nur für Beschriftung",
            "bemerkung TEXT",
            "he_nr INTEGER                       -- HYSTEM-EXTRAN",
            "kp_nr INTEGER                       -- DYNA / Kanal++",
            "isybau TEXT                         -- BFR Abwasser",
            "m150 TEXT                           -- DWA M150",
            "m145 TEXT                           -- DWA M145",
            "transport INTEGER                   -- Transporthaltung? - deprecated",
            "druckdicht INTEGER                  -- Druckleitung? - deprecated",
            ]
    ):
        logger.error(
            f"Fehler bei Migration zu Version {VERSION}: "
            "Hinzufügen von m145/m150 "
            "zu Tabelle 'entwart' fehlgeschlagen"
        )

    return True
