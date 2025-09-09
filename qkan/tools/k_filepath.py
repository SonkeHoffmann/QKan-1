import os

from qkan.utils import get_logger

from qgis.core import (
    Qgis,
)
from qgis.utils import iface, spatialite_connect
from qkan import QKan
from pathlib import Path

logger = get_logger("QKan.tools.k_filepath")


def setfilepath(
    db,
    videopath,
    fotopath,
    fotopath_2,
    videopath_2,
    fotopath_3,
    videopath_3,
    ausw_haltung,
    ausw_schacht,
    ausw_leitung,
) -> None:
    """Schreibt die Dateipfade in die Datenbank.
    """

    pfad_video = Path(QKan.config.videopath)
    pfad_foto = Path(QKan.config.fotopath)

    if ausw_haltung == True:
        bild=''
        video = ''
        if fotopath != "":
            #Bild suchen
            # ordner und dateiname aus datenbank abfragen

            sql = """select pk, foto_dateiname
                        from untersuchdat_haltung"""
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

        if videopath != "":

            #Video suchen
            sql = """select pk, name, datei
                                from videos where objekt = 'Haltung'"""
            try:
                #curs.sql(sql)
                db.sql(sql)
            except BaseException as err:
                return False

            for attr in db.fetchall():
                #video_nam = attr[1]

                video_nam = os.path.basename(attr[2])

                for root, dirs, files in os.walk(videopath):
                    for file in files:
                        if file.lower() == video_nam.lower():
                            video = Path(str(root)+'/'+str(video_nam))

                            rest = video.relative_to(pfad_video)

                            # ordner_video in db ersetzen
                            sql = f"""Update videos set datei = '{rest}'
                                                    WHERE videos.pk =  {attr[0]};"""
                            #data = (rest, attr[0])

                            try:
                                db.sql(sql)
                            except BaseException as err:
                                return False
            db.commit()

    if ausw_leitung == True:
        bild=''
        video = ''
        if fotopath_3 != "":
            #Bild suchen
            # ordner und dateiname aus datenbank abfragen

            sql = """select pk, foto_dateiname
                        from untersuchdat_anschlussleitung"""
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
                            sql = f"""Update untersuchdat_haltung set foto_dateiname = '{rest}'
                                                WHERE untersuchdat_haltung.pk = {attr[0]};"""
                            #data = (str(rest), attr[0])

                            try:
                                db.sql(sql)
                            except BaseException as err:
                                return False

            db.commit()

        if videopath_3 != "":

            #Video suchen
            sql = """select pk, name, datei
                                from videos where objekt = 'Anschlussleitung'"""
            try:
                #curs.sql(sql)
                db.sql(sql)
            except BaseException as err:
                return False

            for attr in db.fetchall():
                #video_nam = attr[1]

                video_nam = os.path.basename(attr[2])

                for root, dirs, files in os.walk(videopath):
                    for file in files:
                        if file.lower() == video_nam.lower():
                            video = Path(str(root)+'/'+str(video_nam))

                            rest = video.relative_to(pfad_video)

                            # ordner_video in db ersetzen
                            sql = f"""Update videos set datei = '{rest}'
                                                    WHERE videos.pk = {attr[0]};"""
                            #data = (rest, attr[0])

                            try:
                                db.sql(sql)
                            except BaseException as err:
                                return False
            db.commit()


    if ausw_schacht == True:
        bild = ''
        if fotopath_2 != "":

            #ordner und dateiname aus datenbank abfragen
            sql = """select pk, foto_dateiname 
                        from untersuchdat_schacht"""
            try:
                #curs.sql(sql)
                db.sql(sql)
            except BaseException as err:
                return False


            for attr in db.fetchall():
                #bild_nam = attr[1]

                bild_nam = os.path.basename(attr[1])

            iface.messageBar().pushMessage("Error",
                                           "Name: " + str(bild_nam),
                                           level=Qgis.MessageLevel.Critical)

                for root, dirs, files in os.walk(fotopath_2):
                    for file in files:
                        if file.lower() == bild_nam.lower():
                            bild = Path(root+'/'+file)

                            rest = bild.relative_to(pfad_foto)

                            # pfad in db erstzen
                            sql = f"""Update untersuchdat_schacht set foto_dateiname = '{rest}'
                                                WHERE untersuchdat_schacht.pk = {attr[0]};"""
                            #data = (rest, attr[0])

                            try:
                                db.sql(sql)
                            except BaseException as err:
                                return False


            db.commit()
        if videopath_2 != "":

            #Video suchen
            sql = """select pk, name, datei
                                from videos where objekt = 'Schacht'"""
            try:
                #curs.sql(sql)
                db.sql(sql)
            except BaseException as err:
                return False

            for attr in db.fetchall():
                #video_nam = attr[1]

                video_nam = os.path.basename(attr[2])

                for root, dirs, files in os.walk(videopath):
                    for file in files:
                        if file.lower() == video_nam.lower():
                            video = Path(str(root)+'/'+str(video_nam))

                            rest = video.relative_to(pfad_video)

                            # ordner_video in db ersetzen
                            sql = f"""Update videos set datei = '{rest}'
                                                    WHERE videos.pk = {attr[0]};"""
                            #data = (rest, attr[0])

                            try:
                                db.sql(sql)
                            except BaseException as err:
                                return False
            db.commit()
