from qgis.core import Qgis, QgsProject
from qgis.PyQt.QtWidgets import QProgressBar

from qkan.database.dbfunc import DBConnection
from qkan import QKan, enums

from qkan.utils import get_logger
from qkan.tools.qkan_utils import loadLayer

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
                QKan.config.sync.check_haschaechte,
                QKan.config.sync.check_haleitungen,
                QKan.config.sync.check_flaechen,
                QKan.config.sync.check_tezg,
                QKan.config.sync.check_linkfl,
                QKan.config.sync.check_schaechte_insp,
                QKan.config.sync.check_haltungen_insp,
                QKan.config.sync.check_haleitungen_insp,
                QKan.config.sync.check_showAttrTables,
            ]
            tables = [
                'schaechte',
                'haltungen',
                'anschlussschaechte',
                'anschlussleitungen',
                'flaechen',
                'tezg',
                'linkfl',
                'schaechte_untersucht',
                'haltungen_untersucht',
                'anschlussleitungen_untersucht',
                'refdata',
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
                    enums.LAYERBEZ.SYNC_HA_SCHAECHTE_COMPARE.value,
                    enums.LAYERBEZ.SYNC_HA_SCHAECHTE_EXT.value,
                    enums.LAYERBEZ.HA_SCHAECHTE.value,
                ],
                [
                    enums.LAYERBEZ.SYNC_HA_LEITUNGEN_COMPARE.value,
                    enums.LAYERBEZ.SYNC_HA_LEITUNGEN_EXT.value,
                    enums.LAYERBEZ.HA_LEITUNGEN.value,
                ],
                [
                    enums.LAYERBEZ.SYNC_FLAECHEN_COMPARE.value,
                    enums.LAYERBEZ.SYNC_FLAECHEN_EXT.value,
                    enums.LAYERBEZ.EINZELFLAECHEN.value,
                ],
                [
                    enums.LAYERBEZ.SYNC_TEZG_COMPARE.value,
                    enums.LAYERBEZ.SYNC_TEZG_EXT.value,
                    enums.LAYERBEZ.TEILGEBIETE.value,
                ],
                [
                    enums.LAYERBEZ.SYNC_ANBINDUNG_FLAECHEN_COMPARE.value,
                    enums.LAYERBEZ.SYNC_ANBINDUNG_FLAECHEN_EXT.value,
                    enums.LAYERBEZ.ANBINDUNG_FLAECHEN.value,
                ],
                [
                    enums.LAYERBEZ.SYNC_ZUSTAND_SCHAECHTE_COMPARE.value,
                    enums.LAYERBEZ.SYNC_ZUSTAND_SCHAECHTE_EXT.value,
                    enums.LAYERBEZ.ZUSTAND_SCHAECHTE_GESAMT.value,
                ],
                [
                    enums.LAYERBEZ.SYNC_SCHAEDEN_SCHAECHTE_COMPARE.value,
                    enums.LAYERBEZ.SYNC_SCHAEDEN_SCHAECHTE_EXT.value,
                    enums.LAYERBEZ.EINZELSCHAEDEN_SCHAECHTE.value,
                ],
                [
                    enums.LAYERBEZ.SYNC_ZUSTAND_HALTUNGEN_COMPARE.value,
                    enums.LAYERBEZ.SYNC_ZUSTAND_HALTUNGEN_EXT.value,
                    enums.LAYERBEZ.ZUSTAND_HALTUNGEN_GESAMT.value,
                ],
                [
                    enums.LAYERBEZ.SYNC_SCHAEDEN_HALTUNGEN_COMPARE.value,
                    enums.LAYERBEZ.SYNC_SCHAEDEN_HALTUNGEN_EXT.value,
                    enums.LAYERBEZ.EINZELSCHAEDEN_HALTUNGEN.value,
                ],
                [
                    enums.LAYERBEZ.SYNC_ZUSTAND_HA_LEITUNGEN_COMPARE.value,
                    enums.LAYERBEZ.SYNC_ZUSTAND_HA_LEITUNGEN_EXT.value,
                    enums.LAYERBEZ.ZUSTAND_HA_LEITUNGEN_GESAMT.value,
                ],
                [
                    enums.LAYERBEZ.SYNC_SCHAEDEN_HA_LEITUNGEN_COMPARE.value,
                    enums.LAYERBEZ.SYNC_SCHAEDEN_HA_LEITUNGEN_EXT.value,
                    enums.LAYERBEZ.EINZELSCHAEDEN_HA_LEITUNGEN.value,
                ]
            ]
            groups = [
                    enums.LAYERBEZ.SYNC_GROUP_SCHAECHTE.value,
                    enums.LAYERBEZ.SYNC_GROUP_HALTUNGEN.value,
                    enums.LAYERBEZ.SYNC_GROUP_HA_SCHAECHTE.value,
                    enums.LAYERBEZ.SYNC_GROUP_HA_LEITUNGEN.value,
                    enums.LAYERBEZ.SYNC_GROUP_FLAECHEN.value,
                    enums.LAYERBEZ.SYNC_GROUP_TEZG.value,
                    enums.LAYERBEZ.SYNC_GROUP_ANBINDUNG_FLAECHEN.value,
                    enums.LAYERBEZ.SYNC_GROUP_ZUSTAND_SCHAECHTE.value,
                    enums.LAYERBEZ.SYNC_GROUP_SCHAEDEN_SCHAECHTE.value,
                    enums.LAYERBEZ.SYNC_GROUP_ZUSTAND_HALTUNGEN.value,
                    enums.LAYERBEZ.SYNC_GROUP_SCHAEDEN_HALTUNGEN.value,
                    enums.LAYERBEZ.SYNC_GROUP_ZUSTAND_HA_LEITUNGEN.value,
                    enums.LAYERBEZ.SYNC_GROUP_SCHAEDEN_HA_LEITUNGEN.value,
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
                    if table == 'refdata':
                        del sqlnames[1]

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
                loadLayer(
                    layerbez=   layer_sync,
                    table=      f'sync_{table}',
                    geom_column='geom',
                    qmlfile=    f'{layer_sync}.qml',
                    filter=     '',
                    uifile=     f'sync_{table}.ui',
                    group=      grouppath,
                )

                # Externe Tabelle
                loadLayer(
                    layerbez=   layer_ext,
                    table=      table,
                    geom_column='geom',
                    qmlfile=    f'{layer_loc}.qml',
                    filter=     '',
                    uifile=     f'qkan_{table}.ui',
                    group=      grouppath,
                    gpos=       0,
                    qkan_db=    QKan.config.sync.ext,
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

