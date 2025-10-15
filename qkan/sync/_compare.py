from qgis.core import Qgis, QgsProject
from qgis.PyQt.QtWidgets import QProgressBar

from qkan.database.dbfunc import DBConnection
from qkan import QKan, enums

from qkan.utils import get_logger
from qkan.tools.qkan_utils import loadlayer

logger = get_logger("QKan.sync._compare")


class CompareTask:
    def __init__(
            self,
            tgbs_selected,
    ):
        self.tgbs_selected = tgbs_selected

    def run(self) -> bool:

        iface = QKan.instance.iface

        # Create progress bar
        progress_bar = QProgressBar(iface.messageBar())
        progress_bar.setRange(0, 100)

        status_message = iface.messageBar().createMessage(
            "", "Abgleich ausführen..."
        )
        status_message.layout().addWidget(progress_bar)
        iface.messageBar().pushWidget(status_message, Qgis.MessageLevel.Info, 5)

        progress_bar.setValue(20)

        with DBConnection(dbname=QKan.config.database.qkan) as db_qkan:

            # SQL-Statements für dieses Modul laden
            db_qkan.loadmodule('sync')

            db_qkan.sqlyml(
                sqlnam='sync_attach_ext',
                stmt_category='compare_dbs',
                parameters=(QKan.config.sync.ext,),
            )

            # Prepare optional filter on teilgebiete
            db_qkan.sqlyml(
                'sync_create_sel_teilgebiete',
                'comp_1',
            )

            db_qkan.sqlyml(
                'sync_sel_teilgebiete_reset',
                'comp_2',
            )

            # Add selected teilgebiete into temp table
            if self.tgbs_selected:
                for tgb in QKan.config.selections.teilgebiete:
                    db_qkan.sqlyml(
                        'sync_sel_teilgebiete_add',
                        'comp_3',
                        (tgb,),
                    )

            # Vergleich aller gewählten Tabellen
            userchoices = [
                QKan.config.sync.check_schaechte,
                QKan.config.sync.check_haltungen,
                QKan.config.sync.check_haleitungen,
            ]
            tables = [
                'schaechte',
                'haltungen',
                'anschlussleitungen'
            ]
            layernames = [
                [
                    enums.LAYERBEZ.SYNC_SCHAECHTE_COMPARE.value,
                    enums.LAYERBEZ.SYNC_SCHAECHTE_EXT.value,
                    enums.LAYERBEZ.SCHAECHTE.value,
                ],
                [
                    enums.LAYERBEZ.SYNC_HALTUNGEN_COMPARE.value,
                    enums.LAYERBEZ.SYNC_HALTUNGEN_EXT.value,
                    enums.LAYERBEZ.HALTUNGEN.value,
                ],
                [
                    enums.LAYERBEZ.SYNC_ANSCHLUSSLEITUNGEN_COMPARE.value,
                    enums.LAYERBEZ.SYNC_ANSCHLUSSLEITUNGEN_EXT.value,
                    enums.LAYERBEZ.ANSCHLUSSLEITUNGEN.value,
                ],
            ]
            groups = [
                    enums.LAYERBEZ.SYNC_GROUP_SCHAECHTE.value,
                    enums.LAYERBEZ.SYNC_GROUP_HALTUNGEN.value,
                    enums.LAYERBEZ.SYNC_GROUP_ANSCHLUSSLEITUNGEN.value,
            ]

            for table, userchoice in zip(tables, userchoices):
                if userchoice:
                    sqlnames = [
                        f'sync_create_{table}',
                        f'sync_create_{table}_geom',
                        f'sync_reset_{table}',
                        f'sync_{table}_ext',
                        f'sync_{table}_local',
                        f'sync_{table}_dif',
                    ]
                    for sqlnam in sqlnames:
                        db_qkan.sqlyml(
                            sqlnam,
                            'comp_4',
                            {'seltgb': self.tgbs_selected, 'epsg': QKan.config.epsg}
                        )

            db_qkan.commit()

        for table, layers, group, userchoice in zip(tables, layernames, groups, userchoices):
            if userchoice:
                grouppath = [
                    enums.LAYERBEZ.QKAN_GROUP.value,
                    enums.LAYERBEZ.SYNC_GROUP_SYNCHRONISATION.value,
                    group,
                ]
                layer_sync, layer_ext, layer_loc = layers

                # Synchronisationstabelle
                loadlayer(
                    layer_sync,
                    f'sync_{table}',
                    'geom',
                    f'{layer_sync}.qml',
                    f'sync_{table}.ui',
                    grouppath,
                )

                # Externe Tabelle
                loadlayer(
                    layer_ext,
                    table,
                    'geom',
                    f'{layer_loc}.qml',
                    f'qkan_{table}.ui',
                    grouppath,
                    qkan_db=QKan.config.sync.ext,
                )

        # Attributtabellen anzeigen
        if QKan.config.sync.check_showAttrTables:
            project = QgsProject.instance()
            for layers, userchoice in zip(layernames, userchoices):
                layercomp = layers[0]
                layer = project.mapLayersByName(layercomp)[0]
                iface.showAttributeTable(layer)

        progress_bar.setValue(100)
        status_message.setText("Vergleich der ausgewählten Tabellen abgeschlossen.")
        status_message.setLevel(Qgis.MessageLevel.Success)

        return True

