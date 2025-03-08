from qkan import QKan
from qkan.database.dbfunc import DBConnection
from qkan.plugin import QKanPlugin
from qkan.utils import get_logger

logger = get_logger("mu.import")


class PlausiTask:
    def __init__(self, db_qkan: DBConnection, limitdata: bool = True):
        self.db_qkan = db_qkan
        if limitdata:
            self.limit = 5
        else:
            self.limit = 5000

    def run(self) -> bool:
        selected_themes = QKan.config.plausi.themen

        # update damit die Charakterisirungsfehler funktionieren
        sql = f"""Update Untersuchdat_haltung
                            Set charakt1 = ''
                            where charakt1 = 'not found'
                            """
        if not self.db_qkan.sql(sql, "datacheck.PlausiTask.run (1a)"):
            logger.error('Plausibilitätsabfragen konnten nicht abgefragt werden.')
            return False

        sql = f"""Update Untersuchdat_haltung
                                    Set charakt2 = ''
                                    where charakt2 = 'not found'
                                    """
        if not self.db_qkan.sql(sql, "datacheck.PlausiTask.run (1b)"):
            logger.error('Plausibilitätsabfragen konnten nicht abgefragt werden.')
            return False

        sql = f"""Update Untersuchdat_schacht
                                    Set charakt1 = ''
                                    where charakt1 = 'not found'
                                    """
        if not self.db_qkan.sql(sql, "datacheck.PlausiTask.run (1c)"):
            logger.error('Plausibilitätsabfragen konnten nicht abgefragt werden.')
            return False

        sql = f"""Update Untersuchdat_schacht
                                            Set charakt2 = ''
                                            where charakt2 = 'not found'
                                            """
        if not self.db_qkan.sql(sql, "datacheck.PlausiTask.run (1d)"):
            logger.error('Plausibilitätsabfragen konnten nicht abgefragt werden.')
            return False

        sql = f"""Update Untersuchdat_schacht
                                                    Set bereich = ''
                                                    where bereich = 'not found'
                                                    """
        if not self.db_qkan.sql(sql, "datacheck.PlausiTask.run (1e)"):
            logger.error('Plausibilitätsabfragen konnten nicht abgefragt werden.')
            return False

        if not QKan.config.plausi.keepdata:
            sql = """DELETE FROM pruefliste"""
            if not self.db_qkan.sql(sql, "datacheck.PlausiTask.run (1)"):
                logger.error('Plausibilitätsabfragen konnten nicht abgefragt werden.')
                return False

        filter = "('" + "', '".join(selected_themes) + "')"
        sql = f"""SELECT 
                    gruppe, warntext, warntyp, warnlevel, sql, layername, attrname
                FROM pruefsql
                WHERE gruppe in {filter}"""

        if not self.db_qkan.sql(sql, "datacheck.PlausiTask.run (1)"):
            logger.error('Plausibilitätsabfragen konnten nicht abgefragt werden.')
            return False

        for (gruppe, warnung, warntyp, warnlevel, sqltext, layername, attrname) in self.db_qkan.fetchall():
            params = {
                'warnung': warnung,
                'warntyp': warntyp,
                'warnlevel': warnlevel,
                'layername': layername,
                'limit': self.limit,
            }

            if not self.db_qkan.sqlyml(
                'datacheck_plausi',
                'datacheck.PlausiTask.run (2)',
                replacefun=lambda sqltext: sqltext.format(attrname=attrname, sqltext=sqltext)
            ):
                logger.warning(f"Plausibilitätsabfrage '{warnung}' zum Thema '{gruppe}' ist fehlgeschlagen.")

        self.db_qkan.commit()

        return True
