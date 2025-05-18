from qkan import QKan
from qkan.database.dbfunc import DBConnection
from qkan.utils import get_logger

logger = get_logger("QKan")

class PlausiTask:
    def __init__(self, db_qkan: DBConnection):
        self.db_qkan = db_qkan
        self.db_qkan.setmodule('datacheck')

    def run(self) -> bool:
        selected_themes = QKan.config.plausi.themen
        if QKan.config.plausi.limitdata:
            limit = 5
        else:
            limit = 5000

        # update damit die Charakterisierungsfehler funktionieren
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
            if not self.db_qkan.sqlyml('datacheck_clear', "datacheck.PlausiTask.run (1)"):
                logger.error('Plausibilitätsabfragen konnten nicht abgefragt werden.')

        filter = "'" + "', '".join(selected_themes) + "'"
        if not self.db_qkan.sqlyml(
            'datacheck_load_plausi',
            "datacheck.PlausiTask.run (2)",
            replacefun=lambda sqltext: sqltext.format(filter=filter)
        ):
            logger.error('Plausibilitätsabfragen konnten nicht abgefragt werden.')
            return False

        data = self.db_qkan.fetchall()

        logger.debug(f'{data=}')

        iloop = 0
        for (pk, gruppe, warntext, warntyp, warnlevel, sqltxt, layername, attrname) in data:      # pk, gruppe, warntext dienen nur zur Kontrolle
            iloop += 1
            params = {
                'warntyp':   warntyp,
                'warnlevel': warnlevel,
                'layername': layername,
                'attrname':  attrname,
                'limit':     limit,
            }

            logger.info(f'Plausibilitätsprüfung: {warntext} ({pk} - {gruppe})')

            if not self.db_qkan.sqlyml(
                'datacheck_plausi',
                f'datacheck.PlausiTask.run Nr. (3) - {pk=} {iloop=}',
                parameters=params,
                replacefun=lambda sqltext: sqltext.format(sqltxt=sqltxt)
            ):
                logger.warning(f"Plausibilitätsabfrage '{warntext}' zum Thema '{gruppe}' ist fehlgeschlagen.")

            self.db_qkan.commit()

        return True
