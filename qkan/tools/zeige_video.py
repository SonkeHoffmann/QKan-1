from qgis.PyQt.QtWidgets import QDialog
from qkan.utils import get_logger
from qgis.utils import iface

import os

from qgis.core import Qgis
from qkan import QKan

from qkan.database.dbfunc import DBConnection
from qkan.tools.videoplayer import Videoplayer
from qkan.tools.qkan_utils import get_database_QKan

logger = get_logger("QKan.tools.zeige_video")

class ShowVideo(QDialog):
    """Zeigt Haltungsschäden an"""
    def __init__(self, name: str, untersuchtag, video_offset, time_code):
        super(ShowVideo, self).__init__()

        self.name = name
        self.untersuchtag = untersuchtag
        if video_offset in ['', None, 'NULL']:
            self.video_offset = 0
        else:
            self.video_offset = float(video_offset)

        if time_code in ['', None, 'NULL']:
            self.time_code = 0
        else:
            self.time_code = float(time_code)

        self.show()

    def show(self):
        """Aktualisiert die Schadensliste"""
        self.showschaedencolumns = 100
        #self.showlist()

        ordner = QKan.config.videopath
        get_database_QKan()
        with DBConnection(dbname=QKan.config.database.qkan) as db_qkan:

            try:
                name = self.name
                datum = self.untersuchtag
                sql = f"""select datei from videos where name= '{name}' and untersuchtag = '{datum}'"""

                db_qkan.sql(sql)
                data = db_qkan.fetchone()
                if data is None:
                    iface.messageBar().pushMessage(
                        f'Kein Video für Haltung {name} und Datum {datum} gefunden',
                        level=Qgis.Warning, duration=5)
                else:
                    datei = data[0]
                    datei = datei.lstrip("\\/")

                video = os.path.normpath(os.path.join(ordner, datei))
                video = video.lower()
                time_h = 0
                timecode = self.time_code
                if timecode == 0:
                    window = Videoplayer(video=video, time=0)
                else:
                    time_h = int(timecode / 1000000) if timecode > 1000000 else 0
                time_m = (int(timecode / 10000) if timecode > 10000 else 0) - (time_h * 100)
                time_s = (int(timecode / 100) if timecode > 100 else 0) - (time_h * 10000) - (time_m * 100)

                video_offset = self.video_offset
                time = float(time_h / 3600 + time_m / 60 + time_s + video_offset)
                window = Videoplayer(video=video, time=time)

                window.show()
                window.open_file()
                window.exec_()

            except ImportError:
                raise Exception(
                    "The QKan main plugin has to be installed for this to work."
                )
