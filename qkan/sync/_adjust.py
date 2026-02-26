from typing import Optional
from qgis.core import Qgis
from qgis.PyQt.QtWidgets import QProgressBar
from datetime import datetime as dtim

from qkan import QKan
from qkan.database.dbfunc import DBConnection

from qkan.utils import get_logger

logger = get_logger("QKan.sync._adjust")

progress_bar: Optional[QProgressBar] = None


class AdjustTask:
    def __init__(
        self,
    ):
        pass

    def run(self) -> bool:

        iface = QKan.instance.iface

        # Create progress bar
        progress_bar = QProgressBar(iface.messageBar())
        progress_bar.setRange(0, 100)

        status_message = iface.messageBar().createMessage(
            "", "Synchronisation durchführen..."
        )
        status_message.layout().addWidget(progress_bar)
        iface.messageBar().pushWidget(status_message, Qgis.MessageLevel.Info, 5)

        progress_bar.setValue(20)

        with DBConnection(dbname=QKan.config.database.qkan) as db_qkan:

            # SQL-Statements für dieses Modul laden
            db_qkan.loadmodule('sync')

            db_qkan.sqlyml(
                sqlnam='sync_attach_ext',
                stmt_category='attach_ext',
                parameters=(QKan.config.sync.ext,),
            )

            # Synchronisation aller gewählten Tabellen
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

            try:
                with open(QKan.config.sync.protfile, 'w') as protfile:
                    dat = dtim.now().strftime('%A, %d/%m/%y %H:%M:%S')
                    protfile.write(f'Protokoll der Synchronisation am {dat}')
                    for table, userchoice in zip(tables, userchoices):
                        if userchoice:
                            # Protokoll schreiben
                            sqlnam = f'sync_{table}_prot'
                            db_qkan.sqlyml(
                                sqlnam,
                                'adjust'
                            )
                            protfile.write(f'\nSynchronisation Tabelle {table}:')
                            for ds in db_qkan.fetchall():
                                line = ', '.join([f'{el}' for el in ds])
                                protfile.write(line + '\n')
            except:
                logger.warning(f'Protokolldatei {QKan.config.sync.protfile=} konnte nicht geschrieben werden')
                return False

            for table, userchoice in zip(tables, userchoices):
                if userchoice:

                    sqlnames = [
                        f'sync_{table}_add',
                        f'sync_{table}_del',
                        f'sync_{table}_mod',
                        f'sync_reset_{table}',
                    ]
                    for sqlnam in sqlnames:
                        db_qkan.sqlyml(
                            sqlnam,
                            'adjust'
                        )

            db_qkan.commit()

        progress_bar.setValue(100)
        status_message.setText("Synchronisation der ausgewählten Daten abgeschlossen.")
        status_message.setLevel(Qgis.MessageLevel.Success)

        return True
