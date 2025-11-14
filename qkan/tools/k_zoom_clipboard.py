import os

from qkan.utils import get_logger

from qgis.core import (
    Qgis,
    QgsProject,
    QgsVectorLayer,
    QgsDataSourceUri,
    QgsFeatureRequest,
)
from qgis.utils import iface, spatialite_connect
from qkan import QKan


logger = get_logger("QKan.tools.k_filepath")


def zoom_clip(
    clip,
) -> None:
    """Zoom zum Wert in Clipboard.
    """

    #mehrere Fälle, für Haltungen und Schächte? oder nur Haltungen?

    layer = QgsProject.instance().mapLayersByName('Haltungen')[0]
    if layer is not None and clip is not None:
        value = str(clip)
        field = "Bezeichnung"

        if value != '':
            expr = f'"{field}" = \'{value}\''
            layer.selectByExpression(expr)
            iface.mapCanvas().zoomToSelected(layer)
