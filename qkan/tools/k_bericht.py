import os

from qkan.utils import get_logger

from qgis.utils import iface, spatialite_connect
from qkan import QKan
from qkan import enums
from pathlib import Path
import sys
from qkan.tools.k_schadenstexte import Schadenstexte
from qgis.core import (
    Qgis,
    QgsApplication,
    QgsProject,
    QgsLayoutExporter,
    QgsDataSourceUri,
    QgsVectorLayer,
)


logger = get_logger("QKan.tools.k_bericht")


def bericht(
    db, filename
) -> None:
    """Erzeugt Haltungsberichte.
    """
    #TODO: Vorlage Bericht in QGIS öffnen und je nach dem ob alle Daten oder nur gewählte Daten erzeugt werden sollen
    # die Auswahl vom Atlas ändern

    #vorher layout ändern und positionierung ändenr
    #sowie hinterher auch alles wieder zurückändern

    #Layout verändern
    uri = QgsDataSourceUri()
    uri.setDatabase(db.dbname)
    schema = ''
    table = 'untersuchdat_haltung_bewertung'
    geom_column = 'geom'
    uri.setDataSource(schema, table, geom_column)
    untersuchdat_haltung_bewertung = enums.LAYERBEZ.ZK_EINZELSCHAEDEN_HALTUNGEN.value
    vlayer = QgsVectorLayer(uri.uri(), untersuchdat_haltung_bewertung, 'spatialite')
    x = QgsProject.instance()
    try:
        x.removeMapLayer(x.mapLayersByName(untersuchdat_haltung_bewertung)[0].id())
    except:
        pass

    x = os.path.dirname(os.path.abspath(__file__))
    vlayer.loadNamedStyle(x + '/untersuchdat_haltung_bewertung_dwa_bericht.qml')
    # QgsProject.instance().addMapLayer(vlayer)
    group = 'Ergebnisse'
    layersRoot = QgsProject.instance().layerTreeRoot()
    QgsProject.instance().addMapLayer(vlayer, False)
    atcGroup = layersRoot.findGroup(group)
    if atcGroup is None:
        atcGroup = layersRoot.addGroup(group)
    atcGroup.addLayer(vlayer)

    #Beschriftung verändern und neu berechnen

    QKan.config.zustand.abstand_zustandstexte = 0.6
    QKan.config.zustand.abstand_zustandsbloecke = 1.0
    QKan.config.zustand.abstand_knoten_anf = 0.0
    QKan.config.zustand.abstand_knoten_1 = 1.0
    QKan.config.zustand.abstand_knoten_2 = 1.5
    QKan.config.zustand.abstand_knoten_end = 5.0

    Schadenstexte.setschadenstexte_haltungen(db)
    Schadenstexte.setschadenstexte_schaechte(db)
    Schadenstexte.setschadenstexte_anschlussleitungen(db)


    #Bericht erstellen und abspeichern

    x = QgsProject.instance()

    layout = x.layoutManager().layoutByName('Bericht')
    #TODO: QKan Fehler
    if layout is None:
        raise Exception("Layout nicht gefunden")

    atlas = layout.atlas()
    atlas.setEnabled(True)

    #Filter
    #atlas.setFilterFeatures(True)
    #atlas.setFilterExpression("")

    atlas.beginRender()

    while atlas.next():
        feature = atlas.currentFeature()
        print(feature["id"])

    atlas.endRender()

    exporter = QgsLayoutExporter(layout)
    settings = QgsLayoutExporter.PdfExportSettings()

    exporter.exportToPdf(
        filename,
        settings
    )


    #Layout zurücksetzten
    uri = QgsDataSourceUri()
    uri.setDatabase(db.dbname)
    schema = ''
    table = 'untersuchdat_haltung_bewertung'
    geom_column = 'geom'
    uri.setDataSource(schema, table, geom_column)
    untersuchdat_haltung_bewertung = enums.LAYERBEZ.ZK_EINZELSCHAEDEN_HALTUNGEN.value
    vlayer = QgsVectorLayer(uri.uri(), untersuchdat_haltung_bewertung, 'spatialite')
    x = QgsProject.instance()
    try:
        x.removeMapLayer(x.mapLayersByName(untersuchdat_haltung_bewertung)[0].id())
    except:
        pass

    x = os.path.dirname(os.path.abspath(__file__))
    vlayer.loadNamedStyle(x + '/untersuchdat_haltung_bewertung_dwa.qml')
    # QgsProject.instance().addMapLayer(vlayer)
    group = 'Ergebnisse'
    layersRoot = QgsProject.instance().layerTreeRoot()
    QgsProject.instance().addMapLayer(vlayer, False)
    atcGroup = layersRoot.findGroup(group)
    if atcGroup is None:
        atcGroup = layersRoot.addGroup(group)
    atcGroup.addLayer(vlayer)


    #Beschriftung zurücksetzten und neu berechnen

    QKan.config.zustand.abstand_zustandstexte = 0.35
    QKan.config.zustand.abstand_zustandsbloecke = 0.45
    QKan.config.zustand.abstand_knoten_anf = 0.0
    QKan.config.zustand.abstand_knoten_1 = 1.0
    QKan.config.zustand.abstand_knoten_2 = 1.5
    QKan.config.zustand.abstand_knoten_end = 4.0

    Schadenstexte.setschadenstexte_haltungen(db)
    Schadenstexte.setschadenstexte_schaechte(db)
    Schadenstexte.setschadenstexte_anschlussleitungen(db)
