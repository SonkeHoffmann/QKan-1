from qgis.PyQt.QtWidgets import QDialog, QTableWidgetItem
from qkan.utils import get_logger
from qgis.utils import iface
from qgis.core import *

from qgis.core import *
from qgis.gui import QgsMessageBar
import os
from qgis.PyQt.QtCore import QStandardPaths
import json
import site
from pathlib import Path
from qgis.core import QgsApplication
import sys

from qkan.database.dbfunc import DBConnection

from qkan.config import Config

#form_class, _ = loadUiType(os.path.join(os.path.dirname(__file__), 'res/qkan_schadensliste.ui'))

logger = get_logger("QKan.tools.zeige_schaeden")

class ShowVideo(QDialog):
    """Zeigt Haltungsschäden an"""
    def __init__(self, name: str, untersuchtag, video_offset, time_code: str):
        super(ShowVideo, self).__init__()

        self.name = name
        self.untersuchtag = untersuchtag
        if video_offset in ['', None, 'NULL']:
            self.video_offset = 0
        else:
            self.video_offset = float(video_offset)

        self.time_code = time_code

        self.show()

    def show(self):
        """Aktualisiert die Schadensliste"""
        self.showschaedencolumns = 100
        self.showlist()

        cfile = Path(site.getuserbase()) / "qkan" / "qkan.json"

        with open(cfile, "r", encoding="utf-8") as f:
            data = json.load(f)

        ordner = data["videopath"]


        with DBConnection(dbname=Config.database.qkan) as db_qkan:

            try:
                from qkan.tools.videoplayer import Videoplayer

                # video=ordner+'/'+'[%film_dateiname%]'
                name = self.name
                datum = self.untersuchtag
                sql = f"""select datei from videos where name= '{name}' and untersuchtag = '{datum}'"""

                db_qkan.sql(sql)
                file = db_qkan.fetchone()[0]

                from qkan.tools.videoplayer import Videoplayer
                if self.video_offset == 0:
                    iface.messageBar().pushMessage("Error", "Video offset = 0.00 s, bitte in der Attributtabelle prüfen!",
                                                   level=Qgis.Critical)
                y = QgsProject.instance().readPath("./")

                video = ordner+ '/' +file
                # video='[%ordner_video%]'+'/'+'[%film_dateiname%]'
                timecode = self.time_code
                time_h = int(timecode / 1000000) if timecode > 1000000 else 0
                time_m = (int(timecode / 10000) if timecode > 10000 else 0) - (time_h * 100)
                time_s = (int(timecode / 100) if timecode > 100 else 0) - (time_h * 10000) - (time_m * 100)

                time = float(time_h / 3600 + time_m / 60 + time_s + self.video_offset)
                window = Videoplayer(video=video, time=time)
                window.show()
                window.open_file()
                window.exec_()

            except ImportError:
                raise Exception(
                    "The QKan main plugin has to be installed for this to work."
                )
