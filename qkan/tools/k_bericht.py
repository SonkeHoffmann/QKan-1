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
    db, filename, auswahl
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

    exporter = QgsLayoutExporter(layout)
    settings = QgsLayoutExporter.PdfExportSettings()

    layer = atlas.coverageLayer()

    if auswahl:

        haltungen_layer_name = "Haltungen"

        haltungen_layer = QgsProject.instance().mapLayersByName(haltungen_layer_name)[0]


        sql = f"""
        SELECT h.*
        FROM haltungen AS h
        JOIN sel_haltungen AS s
        ON h.pk = s.pk
        """

        vl_name = "vl_haltungen_filtered"
        vl = QgsVectorLayer(f"virtual:{sql}", vl_name, "virtual")

        if not vl.isValid():
            print("Fehler: Virtueller Layer konnte nicht erstellt werden!")
        else:
            QgsProject.instance().addMapLayer(vl)
            coverage_layer = atlas.coverageLayer()

            expression = f"""
                "haltnam" IN (
                    aggregate(
                        layer:='{vl_name}',
                        aggregate:='array_agg',
                        expression:="haltnam"
                    )
                )
            """
            coverage_layer.setSubsetString(expression)

        features = list(layer.getFeatures())

        atlas.beginRender()
        for i in range(len(features)):
            atlas.next()  # Atlas auf die nächste Seite setzen
            feature = features[atlas.currentFeatureNumber()]
            filename = filename + rf"\{feature['haltnam']}.pdf"
            exporter.exportToPdf(filename, settings)
        atlas.endRender()

        haltungen_layer.setSubsetString("")
        coverage_layer.setSubsetString("")

    else:
        haltungen = QgsProject.instance().mapLayersByName("Haltungen")[0]
        features = list(layer.getFeatures())
        coverage_layer = atlas.coverageLayer()
        coverage_layer.setSubsetString("")
        atlas.beginRender()
        for i in range(len(features)):
            atlas.next()  # Atlas auf die nächste Seite setzen
            feature = features[atlas.currentFeatureNumber()]
            exporter.exportToPdf(filename+ rf"\{feature['haltnam']}.pdf", settings)
        atlas.endRender()

        haltungen.setSubsetString("")


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
