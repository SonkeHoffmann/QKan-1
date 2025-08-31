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
    """Ändert die Befahrungsdaten, sodass 2 Teilbefahrungen zu einer GEsamtbefahrung zusammmengefasst werden
    """
    #sucht doppelte haltungen, eventuell nur bei diesen die werte ändern oder auch bei einzelschäden die stationierung umrechnen?
    sql = """SELECT
           haltnam,
           COUNT(*)
        FROM
           haltungen_untersucht
        GROUP BY
           haltnam
        HAVING COUNT(*) > 1"""

    #TODO: nur prüfen bei gleichem datum oder auch mit daten mit wenigem abstand?

    #TODO: prüfen ob eventuell nur doppelter Anfang oder ob die gleichen einzelschäden vorliegen, wenn nur 2x BCD, dann ein wert löschen


    #sucht haltungen mit zwei Anfängen in Einzelschäden
    sql = """SELECT
               untersuchhal,
               COUNT(*)
            FROM
               untersuchdat_haltung
            WHERE kuerzel = 'BCD' and charakt1 = 'XP'
            GROUP BY
               untersuchhal
            HAVING COUNT(*) > 1"""
    try:
        db.sql(sql)
    except BaseException as err:
        return False


    for attr in db.fetchall():

        #pfad+name = attr[1]
        #nur name =

        #fotopath, bild_nam = attr[1]


        bild_nam = os.path.basename(attr[1])

        for root, dirs, files in os.walk(fotopath):
            for file in files:
                if file.lower() == bild_nam.lower():
                    bild = Path(str(root) + '/' + str(bild_nam))

                    rest = bild.relative_to(pfad_foto)

                    # pfad in db erstzen
                    sql = f"""Update untersuchdat_haltung set foto_dateiname = {sql}
                                        WHERE untersuchdat_haltung.pk = {attr[0]};"""
                    #data = (str(rest), attr[0])

                    try:
                        db.sql(sql)
                    except BaseException as err:
                        return False

    db.commit()

