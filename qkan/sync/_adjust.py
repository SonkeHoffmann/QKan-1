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
            # Medien müssen in allen nachfolgenden Fällen berücksichtigt werden:
            check_medien = any(
                [
                    QKan.config.sync.check_schaechte_insp,
                    QKan.config.sync.check_haltungen_insp,
                    QKan.config.sync.check_haleitungen_insp
                ]
            )

            userchoices = [
                ['schaechte', QKan.config.sync.check_schaechte],
                ['haltungen', QKan.config.sync.check_haltungen],
                ['anschlussschaechte', QKan.config.sync.check_haschaechte],
                ['anschlussleitungen', QKan.config.sync.check_haleitungen],
                ['flaechen', QKan.config.sync.check_flaechen],
                ['einleit', QKan.config.sync.check_einleitdirekt],          # gleicher Schalter check_einleitdirekt
                ['aussengebiete', QKan.config.sync.check_einleitdirekt],    # gleicher Schalter check_einleitdirekt
                ['tezg', QKan.config.sync.check_tezg],
                ['linkfl', QKan.config.sync.check_linkfl],
                ['linksw', QKan.config.sync.check_linksw],                  # gleicher Schalter check_linksw
                ['linkageb', QKan.config.sync.check_linksw],                # gleicher Schalter check_linksw
                ['schaechte_untersucht', QKan.config.sync.check_schaechte_insp],
                ['untersuchdat_schacht', QKan.config.sync.check_schaechte_insp],
                ['haltungen_untersucht', QKan.config.sync.check_haltungen_insp],
                ['untersuchdat_haltung', QKan.config.sync.check_haltungen_insp],
                ['anschlussleitungen_untersucht', QKan.config.sync.check_haleitungen_insp],
                ['untersuchdat_anschlussleitung', QKan.config.sync.check_haleitungen_insp],
                ['notizen', QKan.config.sync.check_notizen],
                ['symbole', QKan.config.sync.check_symbole],
                ['pruefsql', QKan.config.sync.check_plausi],
                ['videos', check_medien],                                   # gleicher Schalter check_medien, s.o.
                ['fotos', check_medien],                                    # gleicher Schalter check_medien, s.o.
                ['refdata', QKan.config.sync.ckeck_refdata],
            ]

            try:
                with open(QKan.config.sync.protfile, 'w') as protfile:
                    dat = dtim.now().strftime('%A, %d/%m/%y %H:%M:%S')
                    protfile.write(f'Protokoll der Synchronisation am {dat}')
                    for table, userchoice in userchoices:
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

            for table, userchoice in userchoices:
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
