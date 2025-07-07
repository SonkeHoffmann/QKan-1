
from pathlib import Path
import os
from typing import Dict, List, cast
from qgis.utils import pluginDirectory
from qgis.core import (
	Qgis,
	QgsProject,
	QgsVectorLayer,
	QgsDataSourceUri,
)
from qkan import QKan
from qkan.database.dbfunc import DBConnection
from qkan.utils import get_logger
from qkan import enums

logger = get_logger("QKan.swmm_erg")

class ImportTask:
    def __init__(
        self,
        inpfile: str,
        db_qkan: DBConnection,
        #offset: List[float],
        epsg: int = 25832,
        dbtyp: str = "SpatiaLite",
    ):
        self.epsg = epsg
        self.dbtyp = dbtyp
        self.inpobject = Path(inpfile)
        self.data: Dict[str, List[str]] = {}
        self.db_qkan = db_qkan
        #self.xoffset, self.yoffset = offset
        self.xoffset, self.yoffset = [0.0,0.0]

    def __del__(self) -> None:
        self.db_qkan.sql("SELECT RecoverSpatialIndex()")

    def read(self) -> None:

        with self.inpobject.open("r", encoding='utf-8', errors='replace') as inp:
            #position = inp.tell()
            block = ""
            zeile = [line.strip() for line in inp]

            #TODO: evtl. direkt nur de benötigten ergebnisse einlesen?


            for i in range(len(zeile) - 1):
                #line = zeile[i].lstrip()
                # Skip comments and empty lines
                if zeile[i].startswith(";") or len(zeile[i]) < 1:
                    continue

                if zeile[i].startswith("*") and zeile[i+2].startswith("*"):
                    y = zeile[i+1]
                    block = y.lower()

                if not zeile[i].startswith("*") and not zeile[i+1].startswith("*"):
                    data = self.data.get(block, [])
                    data.append(zeile[i])
                    self.data[block] = data

    def run(self) -> bool:
        #self._init_mappers()
        self.read()
        self._results()

        return True

    def _results(self):
        data = self.data.get("node flooding summary", [])
        data = data[7:]

        sqllist = [
            """CREATE TABLE IF NOT EXISTS ResultsSch(
                pk INTEGER PRIMARY KEY AUTOINCREMENT,
                schnam TEXT,
                uebstauhaeuf REAL,
                uebstauanz REAL, 
                maxuebstauvol REAL,
                kommentar TEXT,
                createdat TEXT DEFAULT CURRENT_DATE)""",
            """SELECT AddGeometryColumn('ResultsSch','geom',{},'POINT',2)""".format(
                self.epsg
            ),
            """DELETE FROM ResultsSch""",
        ]

        for sql in sqllist:
            if not self.db_qkan.sql(sql, "QKan_Import_Results (1)"):
                return False


        for line in data:
            line_tokens = line.split()
            name = line_tokens[0]  # schnam
            anzahl = line_tokens[3]
            max_hgl = float(line_tokens[5])*1000 # maximaler Überstau

            data = (name, anzahl, max_hgl)

            # Die folgende Abfrage gilt sowohl bei Einzel- als auch bei Seriensimulationen:
            sql = f"""INSERT INTO ResultsSch
                                (schnam, uebstauanz, maxuebstauvol)
                                VALUES (?, ?, ?)
                                """


            try:
                self.db_qkan.sql(sql, parameters=data)
            except:
                pass


        self.db_qkan.commit()

        #geometrien hinzufügen

        sql = f"""Update ResultsSch SET geom = 
                (select geom from schaechte where ResultsSch.schnam = schaechte.schnam)
                    
                                        """

        try:
            self.db_qkan.sql(sql)
        except:
            pass



        # Einfügen der Ergebnistabelle in die Layerliste, wenn nicht schon geladen
        project = QgsProject.instance()
        logger.debug(
            f'project.mapLayersByName("Überstau Schächte")= {project.mapLayersByName("Überstau Schächte")}')
        if not project.mapLayersByName(enums.LAYERBEZ.UEBERSTAUSCHAECHTE.value):

            uri = QgsDataSourceUri()
            uri.setDatabase(self.db_qkan.dbname)
            uri.setDataSource("", "ResultsSch", "geom")
            vlayer = QgsVectorLayer(uri.uri(), "Überstau Schächte", "spatialite")

            # root = project.layerTreeRoot()
            # group = root.addGroup("Ergebnisse")
            # project.addMapLayer(vlayer, False)
            # group.addLayer(vlayer)

            group = 'Ergebnisse'
            layersRoot = QgsProject.instance().layerTreeRoot()
            QgsProject.instance().addMapLayer(vlayer, False)
            actGroup = layersRoot.findGroup(group)
            if actGroup is None:
                actGroup = layersRoot.addGroup(group)
            actGroup.addLayer(vlayer)
            vlayer.triggerRepaint()

            # Stilvorlage nach Benutzerwahl laden
            templatepath = os.path.join(pluginDirectory("qkan"), "templates")
            if QKan.config.he8.qml_choice == enums.QmlChoice.UEBH:
                template = os.path.join(templatepath, "qml", "ueberstauhaeufigkeit.qml")
                try:
                    vlayer.loadNamedStyle(template)
                    vlayer.triggerRepaint()
                except:
                    errormsg = "Fehler in QKan_Results_from_HE\n" + \
                               'Stildatei "Überstauhäufigkeit.qml" wurde nicht gefunden!\nAbbruch!'
                    logger.warning(errormsg)
