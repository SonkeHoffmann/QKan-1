import os

from qgis.utils import spatialite_connect

from qkan.utils import get_logger

from qgis.core import (
    Qgis,
    QgsProject,
    QgsVectorLayer,
    QgsDataSourceUri,
)
from qgis.utils import iface, spatialite_connect
from qkan import QKan
from pathlib import Path

logger = get_logger("QKan.tools.k_filepath")


def setbefahrung(
    db,
) -> None:
    """Ändert die Befahrungsdaten, sodass 2 Teilbefahrungen zu einer Gesamtbefahrung zusammengefasst werden
    """

    #sucht doppelte anhand der inspektionsnummer und der abweichung des befahrungstages

    sql = """SELECT h1.pk, h1.haltnam, h1.id, h1.laenge
                FROM haltungen_untersucht h1
                WHERE (
                  SELECT COUNT(*)
                  FROM haltungen_untersucht h2
                  WHERE h2.haltnam = h1.haltnam AND h2.id <= h1.id AND ABS(julianday(h2.untersuchtag) - julianday(h1.untersuchtag)) < 1
                ) = 2;"""

    try:
        db.sql(sql)
    except BaseException as err:
        return False

    for attr in db.fetchall():

        # die Daten in der DB verändern (länge, id, station, kommentar)
        # die Stationierungen unter Berücksichtigung der Richtung neu berechnet

        sql = f"""UPDATE untersuchdat_haltung
                                    SET
                                        station = 
                                        CASE 
                                            WHEN untersuchhal = '{attr[1]}' AND untersuchdat_haltung.id > 1 AND h2.untersuchrichtung = 'in Fließrichtung' THEN h2.laenge+station 
        
                                             WHEN untersuchhal = '{attr[1]}' AND untersuchdat_haltung.id > 1 AND h2.untersuchrichtung = 'gegen Fließrichtung' THEN h2.laenge+untersuchdat_haltung.inspektionslaenge-station 
                                        ELSE station
                                            END
                                        FROM haltungen_untersucht h2
                                        WHERE h2.haltnam = '{attr[1]}' AND h2.id = 1
                                             """

        try:
            db.sql(sql)
        except BaseException as err:
            return False

        db.commit()

        #Länge muss aufaddiert werden

        sql = f"""UPDATE haltungen_untersucht 
                    SET laenge = 
                    ( SELECT SUM(h2.laenge) FROM haltungen_untersucht h2 WHERE h2.haltnam = haltungen_untersucht.haltnam GROUP BY h2.haltnam) 
                    WHERE haltungen_untersucht.haltnam = '{attr[1]}' AND haltungen_untersucht.id = 1
                    """
        try:
            db.sql(sql)
        except BaseException as err:
            return False

        sql = f"""DELETE FROM haltungen_untersucht 
                            WHERE haltnam = '{attr[1]}'  AND id = '2'
                            """
        try:
            db.sql(sql)
        except BaseException as err:
            return False



        sql = f"""UPDATE untersuchdat_haltung
						SET inspektionslaenge = ( SELECT h2.laenge
                            FROM haltungen_untersucht h2
                                WHERE h2.haltnam = untersuchdat_haltung.untersuchhal AND h2.id = 1)
								WHERE untersuchdat_haltung.untersuchhal =  '{attr[1]}' 
                                """

        try:
            db.sql(sql)
        except BaseException as err:
            return False

        sql = f"""UPDATE untersuchdat_haltung
                                    SET id = 1, 
                                    kommentar = CASE 
                                        WHEN kommentar is NULL THEN 'Doppelbefahrungen wurden zusammengefügt und die Daten verändert'
                                        WHEN kommentar is not NULL THEN kommentar + ', Doppelbefahrungen wurden zusammengefügt und die Daten verändert'
                                        ELSE kommentar
                                        END
                                        WHERE untersuchhal = '{attr[1]}' 
                     """

        try:
            db.sql(sql)
        except BaseException as err:
            return False


    db.commit()

