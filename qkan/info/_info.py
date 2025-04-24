from qgis.utils import spatialite_connect

from qkan.database.dbfunc import DBConnection
from qkan.utils import get_logger
import matplotlib.pyplot as plt
from matplotlib.gridspec import GridSpec
import matplotlib.patches as mpatches
import numpy as np
from math import cos, sin, radians

from qgis.core import (
    Qgis,
    QgsProject,
    QgsVectorLayer,
    QgsDataSourceUri,
)
from qgis.utils import iface, spatialite_connect


logger = get_logger("QKan.xml.info")


class Info:
    def __init__(self, fig_1, canv_1, fig_2, canv_2, fig_3, canv_3, fig_4, canv_4, fig_5, canv_5, fig_6, canv_6, fig_7, canv_7, fig_8, canv_8, fig_9, canv_9, fig_10, canv_10, combo, combo3, dat1, dat2, dat3, dat8, dat9, db_qkan: DBConnection):
        self.db_qkan = db_qkan
        self.anz_haltungen = 0
        self.anz_schaechte = 0
        self.laenge_haltungen = 0
        self.anz_teilgeb = 0
        self.canv_1 = canv_1
        self.fig_1 = fig_1
        self.canv_2 = canv_2
        self.fig_2 = fig_2
        self.canv_3 = canv_3
        self.fig_3 = fig_3
        self.canv_4 = canv_4
        self.fig_4 = fig_4
        self.canv_5 = canv_5
        self.fig_5 = fig_5
        self.canv_6 = canv_6
        self.fig_6 = fig_6
        self.canv_7 = canv_7
        self.fig_7 = fig_7
        self.canv_8 = canv_8
        self.fig_8 = fig_8
        self.canv_9 = canv_9
        self.fig_9 = fig_9
        self.canv_10 = canv_10
        self.fig_10 = fig_10
        self.combo = combo
        self.combo3 = combo3
        self.dat1 = dat1
        self.dat2 = dat2
        self.dat3 = dat3
        self.dat8 = dat8
        self.dat9 = dat9

        if len(combo3)>0:
            self.abfrage_and = f"AND teilgebiet = {str(self.combo3)}"

            self.abfrage_where = f"WHERE teilgebiet = {str(self.combo3)}"

        else:
            self.abfrage_and = ""
            self.abfrage_where = ""

        # iface.messageBar().pushMessage("Error",
        #                                str(self.combo),
        #                                level=Qgis.Critical)

        #variable für schatten
        self.shadow = True
        #variable für abstand (wedgeprops)
        self.abstand = {"edgecolor" : "white",
                      'linewidth': 2,
                      'antialiased': True}

    def func(self, pct, allvals):
        if pct is not None and allvals is not None:
            try:
                absolute = int(np.round(pct / 100. * np.sum(allvals)))
            except BaseException as e:
                logger.error(
                    f'Fehler: {e}\n'
                    f'{pct=}\n'
                    f'{allvals=}\n'
                )
                raise Exception(f"{self.__class__.__name__}: Fehler in Funktion pct")
            return f"{pct:.1f}%\n({absolute:d})"
        else:
            return ""

    def _tableplot(self, figure, sql: str, title: str, pos):
        "Erzeugt eine Tabelle mit Bezeichnungen, Längen und Anzahl und fügt sie als subplot einem tab zu"

        if not self.db_qkan.sql(sql, "Dashboard - {title}"):
            raise Exception(f"{self.__class__.__name__}: SQL-Fehler")

        data = self.db_qkan.fetchall()
        l_bezeich = [el[0] for el in data]
        t_values = [[el[1], el[2]] for el in data]

        laenge_ges = sum([el[1] for el in data])
        anzahl_ges = sum([el[2] for el in data])

        t_values.append([laenge_ges, anzahl_ges])
        l_bezeich.append("Gesamt")

        colLabels = ["km", "Anzahl"]

        # plt.figure(figure.number)
        new_plot = figure.add_subplot(pos)


        try:
            new_plot.table(
                cellText=t_values,
                colLabels=colLabels,
                rowLabels=l_bezeich,
                loc='center'
            )
        except BaseException as e:
            logger.error(
                f'Fehler: {e}\n'
                f'{t_values=}\n'
                f'{l_bezeich=}\n'
             )
            raise  Exception(f"{self.__class__.__name__}: Fehler beim Erstellen der Tabelle")
        new_plot.axis('off')

        new_plot.set_title(title, fontsize=9, fontweight='bold', pad=25)

    def _tableplot_2(self, figure, sql: str, title: str, pos):
        "Erzeugt eine Tabelle mit Bezeichnungen, Längen und Anzahl und fügt sie als subplot einem tab zu"

        if not self.db_qkan.sql(sql, "Dashboard - {title}"):
            raise Exception(f"{self.__class__.__name__}: SQL-Fehler")

        data = self.db_qkan.fetchall()
        l_bezeich = [el[0] for el in data]
        t_values = [[el[1]] for el in data]

        anzahl_ges = sum([el[1] for el in data])

        t_values.append([anzahl_ges])
        l_bezeich.append("Gesamt")

        colLabels = ["Anzahl"]

        # plt.figure(figure.number)
        new_plot = figure.add_subplot(pos)

        #figure.subplots_adjust(left=0.15, right=0.95, wspace=1.5, hspace=5)

        try:
            new_plot.table(
                cellText=t_values,
                colLabels=colLabels,
                rowLabels=l_bezeich,
                loc='center'
            )
        except BaseException as e:
            logger.error(
                f'Fehler: {e}\n'
                f'{t_values=}\n'
                f'{l_bezeich=}\n'
             )
            raise  Exception(f"{self.__class__.__name__}: Fehler beim Erstellen der Tabelle")
        new_plot.axis('off')

        new_plot.set_title(title, fontsize=9, fontweight='bold', pad=25)

    def _barofpie(self, figure, title, values, pos):

        new_plot = figure.add_subplot(pos)
        y_pos = np.arange(len(values))
        box = new_plot.get_position()
        #new_plot.set_position([box.x0 + 0.05, box.y0, box.width * 0.5, box.height * 0.75])
        new_plot.barh(y_pos, values, align='center')
        new_plot.set_yticks(y_pos)
        new_plot.set_yticklabels(values)
        new_plot.invert_yaxis()
        new_plot.set_xlabel('Durchmesser')
        new_plot.set_title(title)
        #TODO: Verbindungslinien zwischen plot und bar zeichnen


    def _pieplot(self, sql, figure, title, pos, pos2):
        """Erzeugt ein Pie-Chart mit Bezeichnungen und Anzahl bzw. Länge und fügt sie als subplot einem tab zu"""

        if not self.db_qkan.sql(sql, "Dashboard - {title}"):
            raise Exception(f"{self.__class__.__name__}: SQL-Fehler")

        data = self.db_qkan.fetchall()
        labels, values = [[el[i] for el in data] for i in range(2)]

        new_plot = figure.add_subplot(pos)
        #figure.subplots_adjust(left=0.05, right=0.95, wspace=1.5, hspace=2)

        wedges, texts, autotexts = new_plot.pie(values, labels=labels,  shadow=self.shadow, wedgeprops=self.abstand, autopct=lambda pct: self.func(pct, values), radius=1.1)
        #figure.tight_layout()
        new_plot.set_title(title)

        #bar of pie für "Sonstiges"
        l_bezeich = []

        for i in data:
            i = str(i[0])
            l_bezeich.append(i)

        if values not in [None, 'None']:
            total = sum(values)
            threshold = 0.1 * total
            dic={}
            for key in labels:
                for value in values:
                    dic[key] = value
                    values.remove(value)
                    break

            daten = {k: v for k, v in dic.items() if v >= threshold}
            sonstiges = {k: v for k, v in dic.items() if v < threshold}

            if sonstiges:
                daten['Sonstiges'] = sum(sonstiges.values())
                # Daten für das Kreisdiagramm
                names = list(daten.keys())
                values = list(daten.values())

            if 'Sonstiges' in daten:
                sonstiges_names = list(sonstiges.keys())
                sonstiges_values = list(sonstiges.values())

                y_pos = np.arange(len(sonstiges_values))

                title = 'Sonstiges'
                #self._barofpie(figure, title, values, pos2)

        return wedges, texts, autotexts

    def _barplot(self, sql, figure, title:str, xlabel:str, ylabel: str, pos):
        """Erzeugt ein Balkendiagramm mit Bezeichnungen und fügt sie als subplot einem tab zu"""

        if not self.db_qkan.sql(sql, "Dashboard - {title}"):
            raise Exception(f"{self.__class__.__name__}: SQL-Fehler")

        data = self.db_qkan.fetchall()
        labels, values = [[el[i] for el in data] for i in range(2)]


        new_plot = figure.add_subplot(pos)
        #figure.subplots_adjust(left=0.05, right=0.95, wspace=1.5, hspace=2)

        if title == 'Gesamtlänge je Zustandsklasse':

            bar_colors = {
                '0': 'red',
                '1': 'orange',
                '2': 'yellow',
                '3': 'green',
                '4': 'skyblue',
                '5': 'steelblue',
                'sonstige': 'grey'
            }
            farben = [bar_colors[attr] for attr in labels]
            summe = sum(values)

            y_pos = np.arange(len(values))
            box = new_plot.get_position()
            new_plot.set_position([box.x0 + 0.1, box.y0, box.width * 0.85, box.height* 0.9])
            bar_container = new_plot.barh(y_pos, values, color=farben, align='center')
            new_plot.autoscale()
            new_plot.set_yticks(y_pos)
            new_plot.set_yticklabels(labels)
            new_plot.invert_yaxis()
            new_plot.set_xlabel(xlabel)
            new_plot.set_ylabel(ylabel)
            new_plot.set_title(title)
            new_plot.bar_label(bar_container, fmt=lambda x: f'{x :.1f} km ({x/summe*100 :.1f} %)')
            new_plot.spines['top'].set_visible(False)
            new_plot.spines['right'].set_visible(False)
            #new_plot.legend(['ZK 0: sofort', 'ZK 1: kurzfristig', 'ZK 2: mittelfristig', 'ZK 3: langfristig', 'ZK 4: nachrangig', 'ZK 5: schadensfrei', 'ZK -: keine verewertbare Inspektion'], loc='upper right')
            patch_0 = mpatches.Patch(color= 'red', label='ZK 0: sofort')
            patch_1 = mpatches.Patch(color='orange', label='ZK 1: kurzfristig')
            patch_2 = mpatches.Patch(color='yellow', label='ZK 2: mittelfristig')
            patch_3 = mpatches.Patch(color='green', label='ZK 3: langfristig')
            patch_4 = mpatches.Patch(color='skyblue', label='ZK 4: nachrangig')
            patch_5 = mpatches.Patch(color='steelblue', label='ZK 5: schadensfrei')
            patch_6 = mpatches.Patch(color='grey', label='ZK -: keine verewertbare Inspektion')
            new_plot.legend(handles=[patch_0,patch_1,patch_2,patch_3,patch_4,patch_5,patch_6], fontsize=8)

        elif title == 'Anzahl je Zustandsklasse':

            bar_colors = {
                '0': 'red',
                '1': 'orange',
                '2': 'yellow',
                '3': 'green',
                '4': 'skyblue',
                '5': 'steelblue',
                'sonstige': 'grey'
            }
            farben = [bar_colors[attr] for attr in labels]
            summe = sum(values)

            y_pos = np.arange(len(values))
            box = new_plot.get_position()
            new_plot.set_position([box.x0 + 0.1, box.y0, box.width * 0.85, box.height* 0.9])
            bar_container = new_plot.barh(y_pos, values, color=farben, align='center')
            new_plot.autoscale()
            new_plot.set_yticks(y_pos)
            new_plot.set_yticklabels(labels)
            new_plot.invert_yaxis()
            new_plot.set_xlabel(xlabel)
            new_plot.set_ylabel(ylabel)
            new_plot.set_title(title)
            #new_plot.bar_label(bar_container, fmt=lambda x: f'{x :.1f} km ({x/summe*100 :.1f} %)')
            new_plot.spines['top'].set_visible(False)
            new_plot.spines['right'].set_visible(False)
            #new_plot.legend(['ZK 0: sofort', 'ZK 1: kurzfristig', 'ZK 2: mittelfristig', 'ZK 3: langfristig', 'ZK 4: nachrangig', 'ZK 5: schadensfrei', 'ZK -: keine verewertbare Inspektion'], loc='upper right')
            patch_0 = mpatches.Patch(color= 'red', label='ZK 0: sofort')
            patch_1 = mpatches.Patch(color='orange', label='ZK 1: kurzfristig')
            patch_2 = mpatches.Patch(color='yellow', label='ZK 2: mittelfristig')
            patch_3 = mpatches.Patch(color='green', label='ZK 3: langfristig')
            patch_4 = mpatches.Patch(color='skyblue', label='ZK 4: nachrangig')
            patch_5 = mpatches.Patch(color='steelblue', label='ZK 5: schadensfrei')
            patch_6 = mpatches.Patch(color='grey', label='ZK -: keine verewertbare Inspektion')
            new_plot.legend(handles=[patch_0,patch_1,patch_2,patch_3,patch_4,patch_5,patch_6], fontsize=8)

        elif title == 'Gesamtlänge je Substanzklasse':

            bar_colors = {
                '0': 'red',
                '1': 'orange',
                '2': 'yellow',
                '3': 'green',
                '4': 'skyblue',
                '5': 'steelblue',
                'sonstige': 'grey'
            }
            farben = [bar_colors[attr] for attr in labels]
            summe = sum(values)

            y_pos = np.arange(len(values))
            box = new_plot.get_position()
            new_plot.set_position([box.x0 + 0.1, box.y0, box.width * 0.85, box.height* 0.9])
            bar_container = new_plot.barh(y_pos, values, color=farben, align='center')
            new_plot.autoscale()
            new_plot.set_yticks(y_pos)
            new_plot.set_yticklabels(labels)
            new_plot.invert_yaxis()
            new_plot.set_xlabel(xlabel)
            new_plot.set_ylabel(ylabel)
            new_plot.set_title(title)
            new_plot.bar_label(bar_container, fmt=lambda x: f'{x :.1f} km ({x/summe*50 :.1f} %)')
            new_plot.spines['top'].set_visible(False)
            new_plot.spines['right'].set_visible(False)
            #new_plot.legend(['SK 0: aufgebraucht', 'SK 1: niedrig', 'SK 2: mittel', 'SK 3: hoch', 'SK 4: sehr hoch', 'SK 5: volle Substanz', 'SK -: keine verewertbare Inspektion'], loc='upper right')
            patch_0 = mpatches.Patch(color='red', label='SK 0: aufgebraucht')
            patch_1 = mpatches.Patch(color='orange', label='SK 1: niedrig')
            patch_2 = mpatches.Patch(color='yellow', label='SK 2: mittel')
            patch_3 = mpatches.Patch(color='green', label='SK 3: hoch')
            patch_4 = mpatches.Patch(color='skyblue', label='SK 4: sehr hoch')
            patch_5 = mpatches.Patch(color='steelblue', label='SK 5: volle Substanz')
            patch_6 = mpatches.Patch(color='grey', label='SK -: keine verwertbare Inspektion')
            new_plot.legend(handles=[patch_0, patch_1, patch_2, patch_3, patch_4, patch_5, patch_6], fontsize=8)

        elif title == 'Baujahre':
            y_pos = np.arange(len(values))
            box = new_plot.get_position()
            new_plot.set_position([box.x0 + 0.1, box.y0, box.width * 0.85, box.height * 0.9])
            # iface.messageBar().pushMessage("Error",
            #                                str(labels),
            #                                level=Qgis.Critical)
            if len(labels)>1:
                label = [str(baujahr) if baujahr % 50 == 0 else '' for baujahr in labels]
                new_plot.set_xticklabels(label)
            new_plot.bar(y_pos, values, align='center')
            new_plot.set_xticks(y_pos)
            #new_plot.invert_yaxis()
            new_plot.set_xlabel(ylabel)
            new_plot.set_ylabel(xlabel)
            new_plot.set_title(title)
            new_plot.autoscale()

        elif title == 'Baujahre der Schächte':
            y_pos = np.arange(len(values))
            box = new_plot.get_position()
            new_plot.set_position([box.x0 + 0.1, box.y0, box.width * 0.85, box.height * 0.9])
            # iface.messageBar().pushMessage("Error",
            #                                str(labels),
            #                                level=Qgis.Critical)
            if len(labels)>1:
                label = [str(baujahr) if baujahr % 50 == 0 else '' for baujahr in labels]
                new_plot.set_xticklabels(label)
            new_plot.bar(y_pos, values, align='center')
            new_plot.set_xticks(y_pos)
            #new_plot.invert_yaxis()
            new_plot.set_xlabel(ylabel)
            new_plot.set_ylabel(xlabel)
            new_plot.set_title(title)
            new_plot.autoscale()

        elif title == 'Anzahl der Schäden nach Schadenskürzel' or title == 'Gesamtschadenslänge je Schaden':
            y_pos = np.arange(len(values))
            box = new_plot.get_position()
            new_plot.set_position([box.x0 + 0.1, box.y0, box.width * 0.85, box.height * 0.9])
            new_plot.bar(y_pos, values, align='center')
            new_plot.set_xticks(y_pos)
            new_plot.set_xticklabels(labels, rotation=90)
            # new_plot.invert_yaxis()
            new_plot.set_xlabel(ylabel)
            new_plot.set_ylabel(xlabel)
            new_plot.set_title(title)
            new_plot.autoscale()

            # # plot the bars
            # plt.barh(X, A, color='r')
            # plt.barh(X, -B, color='b')
            # plt.title("Back-to-Back Bar Chart")
            # plt.show()

        elif title == 'Gesamtlänge je Durchmesser' or title == 'Gesamtlänge je Profil' or title == 'Verteilung der Haltungslängen':
            y_pos = np.arange(len(values))
            box = new_plot.get_position()
            new_plot.set_position([box.x0 + 0.1, box.y0, box.width * 0.85, box.height * 0.9])
            new_plot.bar(y_pos, values, align='center')
            new_plot.set_xticks(y_pos)
            new_plot.set_xticklabels(labels, rotation=90)
            #new_plot.invert_yaxis()
            new_plot.set_xlabel(ylabel)
            new_plot.set_ylabel(xlabel, rotation=90)
            new_plot.set_title(title)
            new_plot.autoscale()

        else:
            y_pos = np.arange(len(values))
            box = new_plot.get_position()
            new_plot.set_position([box.x0 + 0.1, box.y0, box.width * 0.85, box.height * 0.9])
            new_plot.barh(y_pos, values, align='center')
            new_plot.set_yticks(y_pos)
            new_plot.set_yticklabels(labels)
            new_plot.invert_yaxis()
            new_plot.set_xlabel(xlabel)
            new_plot.set_ylabel(ylabel)
            new_plot.set_title(title)
            new_plot.autoscale()

    #TODO: Wenn auf Balken oder Pie geklickt wird soll die Auswahl in QGIS angezeigt werden

    # def make_picker(fig, wedges):
    #
    #     def onclick(event):
    #         wedge = event.artist
    #         label = wedge.get_label()
    #         print(label)
    #
    #     # Make wedges selectable
    #     for wedge in wedges:
    #         wedge.set_picker(True)
    #
    #     fig.canvas.mpl_connect('pick_event', onclick)

    # def handle_click(event, pie_wedges, run_script_callback):
    #     # TODO: Anpassen, sodass beim Anklicken der Grafik die jeweiligen Daten in QGIS ausgewählt werden!
    #     for wedge in pie_wedges:
    #         if wedge.contains_point([event.x, event.y]):
    #             run_script_callback()
    #             break

    def _infos(self) -> None:

        # Karteikarte 1 initialisieren
        figure = self.fig_4
        figure.clear()

        gs = GridSpec(4, 1, figure=figure, wspace=0.15)

        # Infos Haltungen nach Entwässerungsarten ------------------------------------------------------

        sql = f"""
            WITH liste AS (
                SELECT
                    entwart,
                    round(sum(iif(coalesce(laenge,0)=0,GLength(geom),laenge))/1000.,2) AS gesamtlaenge, 
                    count() AS anzahl
                FROM haltungen
                WHERE entwart IS NOT NULL {self.abfrage_and}
                GROUP BY entwart
            )
            SELECT *
            FROM liste
            WHERE entwart NOT LIKE '%still%' 
            ORDER BY gesamtlaenge DESC
        """
        #pos=111
        self._tableplot(
            figure=figure,
            sql=sql,
            title="Haltungen (Entwässerungsart)",
            pos=gs[0]
        )

        # #Infos Schächte nach Entwässerungsarten ------------------------------------------------------
        sql = f"""
                    WITH liste AS (
                        SELECT
                            entwart,
                            count() AS anzahl
                        FROM schaechte
                        WHERE entwart IS NOT NULL {self.abfrage_and}
                        GROUP BY entwart
                    )
                    SELECT *
                    FROM liste
                    WHERE entwart NOT LIKE '%still%' 
                """
        # pos=111
        self._tableplot_2(
            figure=figure,
            sql=sql,
            title="Schaechte (Entwässerungsart)",
            pos=gs[1]
        )


        # #Infos Anschlussleitungen nach Entwässerungsarten -------------------------------------------

        sql = f"""
                    WITH liste AS (
                        SELECT
                            entwart,
                            round(sum(iif(coalesce(laenge,0)=0,GLength(geom),laenge))/1000.,2) AS gesamtlaenge, 
                            count() AS anzahl
                        FROM anschlussleitungen
                        WHERE entwart IS NOT NULL {self.abfrage_and}
                        GROUP BY entwart
                    )
                    SELECT *
                    FROM liste
                    WHERE entwart NOT LIKE '%still%' 
                    ORDER BY gesamtlaenge DESC
                """
        # pos=111
        self._tableplot(
            figure=figure,
            sql=sql,
            title="Anschlussleitungen (Entwässerungsart)",
            pos=gs[2]
        )


        #Infos Teilgebiete -------------------------------------------------------------------
        sql = f"""
                        SELECT
                            coalesce(trim(teilgebiet), '') as tgb,
                            round(sum(iif(coalesce(laenge,0)=0,GLength(geom),laenge))/1000.,2) AS gesamtlaenge, 
                            count() AS anzahl
                        FROM haltungen
                        WHERE entwart IS NOT NULL {self.abfrage_and}
                        GROUP BY tgb
                """

        # pos=111
        self._tableplot(
            figure=figure,
            sql=sql,
            title="Haltungen Teilgebiete",
            pos=gs[3]
        )

        self.fig_4.subplots_adjust(left=0.3, right=0.95, wspace=0.3, hspace=1)

    def anzeigen(self):
        """Grafiken in den Karteikarten erstellen"""

        # Karteikarte 2 initialisieren
        figure = self.fig_1
        figure.clear()

        gs = GridSpec(1, 2, figure=figure, wspace=0.15)

        #Darstellungen Haltungen nach Baujahr
        sql = f"""
                    WITH liste AS (
                        SELECT
                            iif(coalesce(laenge,0)=0,GLength(geom),laenge) AS laenge,
                            baujahr
                            FROM haltungen
                            {self.abfrage_where}
                    )
                    SELECT
                        baujahr,
                        round(sum(laenge)/1000.0 ,2) AS gesamtlaenge
                    FROM liste
                    GROUP BY baujahr
                    ORDER BY baujahr
                """

        self._barplot(
            sql=sql,
            figure=figure,
            title='Baujahre',
            ylabel='Baujahre',
            xlabel='Gesamtlänge (km)',
            pos=gs[1]
        )

        #TODO:Darstellung nach Tiefenlage?


        # Darstellungen Haltungen nach Material

        sql = f"""
            WITH liste AS (
                SELECT
                    material,
                    round(sum(iif(coalesce(laenge,0)=0,GLength(geom),laenge))/1000.,2) AS gesamtlaenge
                FROM haltungen
                WHERE material IS NOT NULL  {self.abfrage_and}
                GROUP BY material
            )
            SELECT *
            FROM liste
            WHERE gesamtlaenge > 0.01
            ORDER BY gesamtlaenge DESC
        """

        self._barplot(
            sql=sql,
            figure=figure,
            title='Gesamtlänge je Material',
            ylabel='Material',
            xlabel='Gesamtlänge (km)',
            pos=gs[0]
        )

        self.canv_1.draw()
        self.fig_1.subplots_adjust(left=0.25, right=0.95, top=0.95, bottom=0.1, wspace=0.3, hspace=0.4)

        # Karteikarte 2 initialisieren
        figure = self.fig_6
        figure.clear()

        gs = GridSpec(1, 3, figure=figure, wspace=0.25)
        # Darstellungen Haltungen nach Profiltyp

        # Darstellungen Haltungen nach Durchmesser

        sql = f"""
            WITH liste AS (
                SELECT
                    iif(breite <= 501, ceil(breite/100.)*100, iif(breite <= 1001, ceil(breite/250.)*250, iif(breite <= 3001, ceil(hoehe/250.)*250, ceil(breite/1000.)*1000))) AS Hoehe,
                    iif(coalesce(laenge,0)=0,GLength(geom),laenge) AS laenge
                FROM haltungen {self.abfrage_where}
            )
            SELECT
                printf('bis %d', Hoehe) AS t_hoehe,
                round(sum(laenge)/1000.,2) AS gesamtlaenge
            FROM liste
            GROUP BY Hoehe
            ORDER BY Hoehe
        """

        self._barplot(
            sql=sql,
            figure=figure,
            title='Gesamtlänge je Durchmesser',
            ylabel='Durchmesser bis mm',
            xlabel='Gesamtlänge (km)',
            pos=gs[0]
        )

        # Darstellungen Haltungen nach Profiltyp

        sql = f"""
            WITH liste AS (
                SELECT
                    profilnam,
                    round(sum(iif(coalesce(laenge,0)=0,GLength(geom),laenge))/1000.,2) AS gesamtlaenge
                FROM haltungen
                WHERE profilnam IS NOT NULL {self.abfrage_and}
                GROUP BY profilnam
            )
            SELECT *
            FROM liste
            WHERE gesamtlaenge > 0.01
            ORDER BY gesamtlaenge DESC
        """

        self._barplot(
            sql=sql,
            figure=figure,
            title='Gesamtlänge je Profil',
            ylabel='Profil',
            xlabel='Gesamtlänge (km)',
            pos=gs[1]
        )

        # Darstellungen Haltungen nach Länge
        sql = f"""
                        WITH liste AS (
                        SELECT
                            laenge,
                            ROUND(SUM(IIF(COALESCE(laenge, 0) = 0, GLength(geom), laenge)), 2) AS gesamtlaenge
                        FROM haltungen
                        WHERE laenge IS NOT NULL {self.abfrage_and}
                        GROUP BY laenge
                    ),
                    intervalle AS (
                        SELECT
                            laenge,
                            gesamtlaenge,
                            CASE
                                WHEN laenge < 10 THEN '0-10'
                                WHEN laenge BETWEEN 10 AND 20 THEN '10-20'
                                WHEN laenge BETWEEN 20 AND 30 THEN '20-30'
                                WHEN laenge BETWEEN 30 AND 40 THEN '30-40'
                                WHEN laenge BETWEEN 40 AND 50 THEN '40-50'
                                WHEN laenge BETWEEN 50 AND 60 THEN '50-60'
                                WHEN laenge BETWEEN 60 AND 70 THEN '60-70'
                                ELSE '70+'
                            END AS intervall
                        FROM liste
                    )
                    SELECT 
                        intervall,
                        ROUND(SUM(gesamtlaenge), 2)/1000 AS gesamtlaenge_km
                    FROM intervalle
                    GROUP BY intervall
                    ORDER BY 
                        CASE 
                            WHEN intervall = '0-10' THEN 1
                            WHEN intervall = '10-20' THEN 2
                            WHEN intervall = '20-30' THEN 3
                            WHEN intervall = '30-40' THEN 4
                            WHEN intervall = '40-50' THEN 5
                            WHEN intervall = '50-60' THEN 6
                            WHEN intervall = '60-70' THEN 7
                            ELSE 8
                        END;
                """

        self._barplot(
            sql=sql,
            figure=figure,
            title='Verteilung der Haltungslängen',
            ylabel='Haltungslänge (m)',
            xlabel='Gesamtlänge (km)',
            pos=gs[2]
        )

        self.canv_6.draw()
        self.fig_6.subplots_adjust(left=0.1, right=0.95, top=0.95, bottom=0.3, wspace=0.3, hspace=0.4)

        # Karteikarte 4 initialisieren HA-Leitungen 1
        figure = self.fig_7
        figure.clear()

        gs = GridSpec(1, 2, figure=figure, wspace=0.15)

        # Darstellungen Haltungen nach Baujahr
        sql = f"""
                            WITH liste AS (
                                SELECT
                                    iif(coalesce(laenge,0)=0,GLength(geom),laenge) AS laenge,
                                    baujahr
                                    FROM anschlussleitungen
                                    {self.abfrage_where}
                            )
                            SELECT
                                baujahr,
                                round(sum(laenge)/1000.0 ,2) AS gesamtlaenge
                            FROM liste
                            GROUP BY baujahr
                            ORDER BY baujahr
                        """

        self._barplot(
            sql=sql,
            figure=figure,
            title='Baujahre',
            ylabel='Baujahre',
            xlabel='Gesamtlänge (km)',
            pos=gs[1]
        )

        # TODO:Darstellung nach Tiefenlage?

        # Darstellungen Haltungen nach Material

        sql = f"""
                    WITH liste AS (
                        SELECT
                            material,
                            round(sum(iif(coalesce(laenge,0)=0,GLength(geom),laenge))/1000.,2) AS gesamtlaenge
                        FROM anschlussleitungen
                        WHERE material IS NOT NULL  {self.abfrage_and}
                        GROUP BY material
                    )
                    SELECT *
                    FROM liste
                    WHERE gesamtlaenge > 0.01
                    ORDER BY gesamtlaenge DESC
                """

        self._barplot(
            sql=sql,
            figure=figure,
            title='Gesamtlänge je Material',
            ylabel='Material',
            xlabel='Gesamtlänge (km)',
            pos=gs[0]
        )

        self.canv_7.draw()
        self.fig_7.subplots_adjust(left=0.25, right=0.95, top=0.95, bottom=0.1, wspace=0.3, hspace=0.4)

        # Karteikarte 5 initialisieren HA-LEitungen 2
        figure = self.fig_8
        figure.clear()

        gs = GridSpec(1, 3, figure=figure, wspace=0.25)
        # Darstellungen Haltungen nach Profiltyp

        # Darstellungen Haltungen nach Durchmesser

        sql = f"""
                    WITH liste AS (
                        SELECT
                            iif(breite <= 501, ceil(breite/100.)*100, iif(breite <= 1001, ceil(breite/250.)*250, iif(breite <= 3001, ceil(hoehe/250.)*250, ceil(breite/1000.)*1000))) AS Hoehe,
                            iif(coalesce(laenge,0)=0,GLength(geom),laenge) AS laenge
                        FROM anschlussleitungen {self.abfrage_where}
                    )
                    SELECT
                        printf('bis %d', Hoehe) AS t_hoehe,
                        round(sum(laenge)/1000.,2) AS gesamtlaenge
                    FROM liste
                    GROUP BY Hoehe
                    ORDER BY Hoehe
                """

        self._barplot(
            sql=sql,
            figure=figure,
            title='Gesamtlänge je Durchmesser',
            ylabel='Durchmesser bis mm',
            xlabel='Gesamtlänge (km)',
            pos=gs[0]
        )

        # Darstellungen Haltungen nach Profiltyp

        sql = f"""
                    WITH liste AS (
                        SELECT
                            profilnam,
                            round(sum(iif(coalesce(laenge,0)=0,GLength(geom),laenge))/1000.,2) AS gesamtlaenge
                        FROM anschlussleitungen
                        WHERE profilnam IS NOT NULL {self.abfrage_and}
                        GROUP BY profilnam
                    )
                    SELECT *
                    FROM liste
                    WHERE gesamtlaenge > 0.01
                    ORDER BY gesamtlaenge DESC
                """

        self._barplot(
            sql=sql,
            figure=figure,
            title='Gesamtlänge je Profil',
            ylabel='Profil',
            xlabel='Gesamtlänge (km)',
            pos=gs[1]
        )

        # Darstellungen Haltungen nach Länge
        sql = f"""
                                WITH liste AS (
                                SELECT
                                    laenge,
                                    ROUND(SUM(IIF(COALESCE(laenge, 0) = 0, GLength(geom), laenge)), 2) AS gesamtlaenge
                                FROM anschlussleitungen
                                WHERE laenge IS NOT NULL {self.abfrage_and}
                                GROUP BY laenge
                            ),
                            intervalle AS (
                                SELECT
                                    laenge,
                                    gesamtlaenge,
                                    CASE
                                        WHEN laenge < 10 THEN '0-10'
                                        WHEN laenge BETWEEN 10 AND 20 THEN '10-20'
                                        WHEN laenge BETWEEN 20 AND 30 THEN '20-30'
                                        WHEN laenge BETWEEN 30 AND 40 THEN '30-40'
                                        WHEN laenge BETWEEN 40 AND 50 THEN '40-50'
                                        WHEN laenge BETWEEN 50 AND 60 THEN '50-60'
                                        WHEN laenge BETWEEN 60 AND 70 THEN '60-70'
                                        ELSE '70+'
                                    END AS intervall
                                FROM liste
                            )
                            SELECT 
                                intervall,
                                ROUND(SUM(gesamtlaenge), 2)/1000 AS gesamtlaenge_km
                            FROM intervalle
                            GROUP BY intervall
                            ORDER BY 
                                CASE 
                                    WHEN intervall = '0-10' THEN 1
                                    WHEN intervall = '10-20' THEN 2
                                    WHEN intervall = '20-30' THEN 3
                                    WHEN intervall = '30-40' THEN 4
                                    WHEN intervall = '40-50' THEN 5
                                    WHEN intervall = '50-60' THEN 6
                                    WHEN intervall = '60-70' THEN 7
                                    ELSE 8
                                END;
                        """

        self._barplot(
            sql=sql,
            figure=figure,
            title='Verteilung der Haltungslängen',
            ylabel='Haltungslänge (m)',
            xlabel='Gesamtlänge (km)',
            pos=gs[2]
        )

        self.canv_8.draw()
        self.fig_8.subplots_adjust(left=0.1, right=0.95, top=0.95, bottom=0.3, wspace=0.3, hspace=0.4)

        #Haltungen nach Zustandsklasse
        # Karteikarte 3 initialisieren
        figure_3 = self.fig_3
        figure_3.clear()

        # testen ob tabelle vorhanden:
        if self.combo == 'Originale Bewertung':
            gs = GridSpec(2, 2, figure=figure_3, wspace=0.15, width_ratios=[2, 1])

            sql = f"""
                WITH liste AS (
                                    SELECT
                                        CASE
                                         WHEN MIN(max_ZD, max_ZS, max_ZB) IS NULL THEN 'sonstige'
                                            WHEN MIN(max_ZD, max_ZS, max_ZB) NOT IN (0, 1, 2, 3, 4, 5) THEN 'sonstige'
                                            ELSE CAST(MIN(max_ZD, max_ZS, max_ZB) AS TEXT)
                                        END AS Zustandszahl,
                                        COALESCE(ROUND(SUM(
                                            CASE 
                                                WHEN COALESCE(haltungen_untersucht.laenge, 0) = 0 THEN GLength(haltungen_untersucht.geom)
                                                ELSE haltungen_untersucht.laenge
                                            END
                                        ) / 1000.0, 2),0) AS gesamtlaenge,
                                        COUNT(*) AS anzahl
                                    FROM haltungen_untersucht  
                                    LEFT JOIN haltungen h ON haltungen_untersucht.haltnam = h.haltnam
                                    {self.abfrage_where}
                                    GROUP BY CASE
                                    WHEN MIN(max_ZD, max_ZS, max_ZB) IS NULL THEN 'sonstige'
                                        WHEN MIN(max_ZD, max_ZS, max_ZB) NOT IN (0, 1, 2, 3, 4, 5) THEN 'sonstige'
                                        ELSE MIN(max_ZD, max_ZS, max_ZB)
                                    END
                                )
                                SELECT *
                                FROM liste
                                WHERE gesamtlaenge > 0.01 OR Zustandszahl = 'sonstige'
                                ORDER BY Zustandszahl
            """

            self._barplot(
                sql=sql,
                figure=figure_3,
                title='Gesamtlänge je Zustandsklasse',
                ylabel='Zustandsklasse',
                xlabel='Gesamtlänge (km)',
                pos=gs[0]
            )

            # Schäden
            # Karteikarte 3 initialisieren

            sql = """
                         select kuerzel,count(*) from untersuchdat_haltung group by kuerzel
                    """

            self._barplot(
                sql=sql,
                figure=figure_3,
                title='Anzahl der Schäden nach Schadenskürzel',
                ylabel='Art',
                xlabel='Anzahl',
                pos=gs[2]
            )


            # plt.figure(figure_3.number)
            new_plot_2 = figure_3.add_subplot(gs[1])
            l_bezeich = []
            sql = f"""select DISTINCT MIN(max_ZD,max_ZS,max_ZB) from haltungen_untersucht LEFT JOIN haltungen h ON h.haltnam = haltungen_untersucht.haltnam {self.abfrage_where}"""

            if not self.db_qkan.sql(sql):
                return

            for i in self.db_qkan.fetchall():
                i1 = str(i[0])
                l_bezeich.append(i1)

            data = {k: None for k in l_bezeich}

            for i in data.keys():
                if i not in ['None', 63, '63']:
                    sql = f"""select count(*) from haltungen_untersucht LEFT JOIN haltungen h ON h.haltnam = haltungen_untersucht.haltnam WHERE MIN(max_ZD,max_ZS,max_ZB) = {i} {self.abfrage_and}"""

                    if not self.db_qkan.sql(sql):
                        return

                    anz = self.db_qkan.fetchall()[0][0]

                    data[i] = anz

            if 'None' in data.keys():
                del data['None']
            if '63' in data.keys():
                del data['63']
            names = list(data.keys())
            values = list(data.values())
            bar_colors = {
                '0': 'red',
                '1': 'orange',
                '2': 'yellow',
                '3': 'green',
                '4': 'skyblue',
                '5': 'steelblue',
                'sonstige': 'grey'
            }
            farben = [bar_colors[attr] for attr in names]

            # Plot
            wedges, texts, autotexts = new_plot_2.pie(values, labels=None, shadow=self.shadow, wedgeprops=self.abstand,
                                                      colors=farben, pctdistance=1.2,
                                                      autopct=lambda pct: self.func(pct, values))
            for autotext in autotexts:
                autotext.set_color('black')
                autotext.set_size(10)

                # Innere Labels (Segmentnamen) nach außen
            for wedge, label in zip(wedges, names):
                angle = (wedge.theta2 + wedge.theta1) / 2  # Winkel der Segmente berechnen
                x = 0.6 * wedge.r * cos(radians(angle))  # x-Position außen (mit math.cos)
                y = 0.6 * wedge.r * sin(radians(angle))  # y-Position außen (mit math.sin)
                new_plot_2.text(x, y, label, ha='center', va='center', fontsize=12, color='black')

            new_plot_2.set_title('Zustandsklassenverteilung Haltungen')
            self.canv_3.draw()
            self.fig_3.subplots_adjust(left=0.1, right=0.95, top=0.95, bottom=0.15, wspace=0.3, hspace=0.4)

        elif self.combo == 'Automatisierte Bewertung':
            sql = """ SELECT name FROM sqlite_master WHERE type='table' AND name='haltungen_untersucht_bewertung'
                                """
            if not self.db_qkan.sql(sql):
                return
            liste = self.db_qkan.fetchall()

            if liste != []:
                gs = GridSpec(2, 2, figure=figure_3, wspace=0.15, width_ratios=[2, 1])

                sql = f"""
                                WITH liste AS (
                                    SELECT
                                        CASE
                                        WHEN objektklasse_gesamt IS NULL THEN 'sonstige'
                                            WHEN objektklasse_gesamt NOT IN (0, 1, 2, 3, 4, 5) THEN 'sonstige'
                                            ELSE CAST(objektklasse_gesamt AS TEXT)
                                        END AS Zustandszahl,
                                        COALESCE(ROUND(SUM(
                                            CASE 
                                                WHEN COALESCE(haltungen_untersucht_bewertung.laenge, 0) = 0 THEN GLength(haltungen_untersucht.geom)
                                                ELSE haltungen_untersucht_bewertung.laenge
                                            END
                                        ) / 1000.0, 2),0) AS gesamtlaenge,
                                        COUNT(*) AS anzahl
                                    FROM haltungen_untersucht_bewertung  
                                    LEFT JOIN haltungen h ON haltungen_untersucht_bewertung.haltnam = h.haltnam
                                    {self.abfrage_where}
                                    GROUP BY CASE
                                        WHEN objektklasse_gesamt IS NULL THEN 'sonstige'
                                        WHEN objektklasse_gesamt NOT IN (0, 1, 2, 3, 4, 5) THEN 'sonstige'
                                        ELSE objektklasse_gesamt
                                    END
                                )
                                SELECT *
                                FROM liste
                                WHERE gesamtlaenge > 0.01 OR Zustandszahl = 'sonstige'
                                ORDER BY Zustandszahl
                            """

                self._barplot(
                    sql=sql,
                    figure=figure_3,
                    title='Gesamtlänge je Zustandsklasse',
                    ylabel='Zustandsklasse',
                    xlabel='Gesamtlänge (km)',
                    pos=gs[0]
                )


                sql = f"""
                                         select kuerzel,count(*) from untersuchdat_haltung_bewertung LEFT JOIN haltungen h ON h.haltnam = untersuchdat_haltung_bewertung.untersuchhal {self.abfrage_where} group by kuerzel
                                    """

                self._barplot(
                    sql=sql,
                    figure=figure_3,
                    title='Anzahl der Schäden nach Schadenskürzel',
                    ylabel='Art',
                    xlabel='Anzahl',
                    pos=gs[2]
                )

                # plt.figure(figure_3.number)
                new_plot_2 = figure_3.add_subplot(gs[1])
                l_bezeich = []
                sql = f"""select DISTINCT objektklasse_gesamt from haltungen_untersucht_bewertung LEFT JOIN haltungen h ON h.haltnam = untersuchdat_haltung_bewertung.untersuchhal {self.abfrage_where}"""

                if not self.db_qkan.sql(sql):
                    return

                for i in self.db_qkan.fetchall():
                    i1 = str(i[0])
                    l_bezeich.append(i1)

                data = {k: None for k in l_bezeich}

                for i in data.keys():
                    if i not in ['None', 63]:
                        sql = f"""select count(*) from haltungen_untersucht_bewertung LEFT JOIN haltungen h ON h.haltnam = untersuchdat_haltung_bewertung.untersuchhal WHERE objektklasse_gesamt = {i}  {self.abfrage_and} """

                        if not self.db_qkan.sql(sql):
                            return

                        anz = self.db_qkan.fetchall()[0][0]

                        data[i] = anz

                if 'None' in data.keys():
                    del data['None']
                names = list(data.keys())
                values = list(data.values())
                bar_colors = {
                    '0': 'red',
                    '1': 'orange',
                    '2': 'yellow',
                    '3': 'green',
                    '4': 'skyblue',
                    '5': 'steelblue',
                    'sonstige': 'grey'
                }
                farben = [bar_colors[attr] for attr in names]
                # Plot
                wedges, texts, autotexts = new_plot_2.pie(values, labels=None, shadow=self.shadow,
                                                          wedgeprops=self.abstand, colors=farben, pctdistance=1.2,
                                                          autopct=lambda pct: self.func(pct, values))
                for autotext in autotexts:
                    autotext.set_color('black')
                    autotext.set_size(10)

                    # Innere Labels (Segmentnamen) nach außen
                for wedge, label in zip(wedges, names):
                    angle = (wedge.theta2 + wedge.theta1) / 2  # Winkel der Segmente berechnen
                    x = 0.6 * wedge.r * cos(radians(angle))  # x-Position außen (mit math.cos)
                    y = 0.6 * wedge.r * sin(radians(angle))  # y-Position außen (mit math.sin)
                    new_plot_2.text(x, y, label, ha='center', va='center', fontsize=12, color='black')

                new_plot_2.set_title('Zustandsklassenverteilung Haltungen')
                self.canv_3.draw()
                self.fig_3.subplots_adjust(left=0.1, right=0.95, top=0.95, bottom=0.15, wspace=0.3, hspace=0.4)

            else:
                figure_3.clf()



        elif self.combo == 'Bewertung nach SubKanS':
            sql = f""" SELECT name FROM sqlite_master WHERE type='table' AND name='haltungen_substanz_bewertung'
                                            """
            if not self.db_qkan.sql(sql):
                return
            liste = self.db_qkan.fetchall()

            if liste != []:
                gs = GridSpec(2, 2, figure=figure_3, wspace=0.15, width_ratios=[2, 1])

                sql = f"""
                                            WITH liste AS (
                                    SELECT
                                        CASE
                                        WHEN objektklasse_gesamt IS NULL THEN 'sonstige'
                                            WHEN objektklasse_gesamt NOT IN (0, 1, 2, 3, 4, 5) THEN 'sonstige'
                                            ELSE CAST(objektklasse_gesamt AS TEXT)
                                        END AS Zustandszahl,
                                        COALESCE(ROUND(SUM(
                                            CASE 
                                                WHEN COALESCE(haltungen_untersucht.laenge, 0) = 0 THEN GLength(haltungen_untersucht.geom)
                                                ELSE haltungen_untersucht.laenge
                                            END
                                        ) / 1000.0, 2),0) AS gesamtlaenge,
                                        COUNT(*) AS anzahl
                                    FROM haltungen_substanz_bewertung  
                                    LEFT JOIN haltungen h ON haltungen_substanz_bewertung.haltnam = h.haltnam
                                    {self.abfrage_where}
                                    GROUP BY CASE
                                    WHEN objektklasse_gesamt IS NULL THEN 'sonstige'
                                        WHEN objektklasse_gesamt NOT IN (0, 1, 2, 3, 4, 5) THEN 'sonstige'
                                        ELSE objektklasse_gesamt
                                    END
                                )
                                SELECT *
                                FROM liste
                                WHERE gesamtlaenge > 0.01 OR Zustandszahl = 'sonstige'
                                ORDER BY Zustandszahl
                                        """

                self._barplot(
                    sql=sql,
                    figure=figure_3,
                    title='Gesamtlänge je Zustandsklasse',
                    ylabel='Zustandsklasse',
                    xlabel='Gesamtlänge (km)',
                    pos=gs[0]
                )

                sql = f"""
                            select kuerzel,count(*) from substanz_haltung_bewertung LEFT JOIN haltungen h ON h.haltnam = haltungen_substanz_bewertung.haltnam {self.abfrage_where} group by kuerzel
                                                """

                self._barplot(
                    sql=sql,
                    figure=figure_3,
                    title='Anzahl der Schäden nach Schadenskürzel',
                    ylabel='Art',
                    xlabel='Anzahl',
                    pos=gs[2]
                )

                # plt.figure(figure_3.number)
                new_plot_2 = figure_3.add_subplot(gs[1])
                l_bezeich = []
                sql = f"""select DISTINCT objektklasse_gesamt from haltungen_substanz_bewertung LEFT JOIN haltungen h ON h.haltnam = haltungen_substanz_bewertung.haltnam {self.abfrage_where} """

                if not self.db_qkan.sql(sql):
                    return

                for i in self.db_qkan.fetchall():
                    i1 = str(i[0])
                    l_bezeich.append(i1)

                data = {k: None for k in l_bezeich}

                for i in data.keys():
                    if i not in ['None', 63]:
                        sql = f"""select count(*) from haltungen_substanz_bewertung LEFT JOIN haltungen h ON h.haltnam = haltungen_substanz_bewertung.haltnam WHERE objektklasse_gesamt = {i}  {self.abfrage_and}"""

                        if not self.db_qkan.sql(sql):
                            return

                        anz = self.db_qkan.fetchall()[0][0]

                        data[i] = anz

                if 'None' in data.keys():
                    del data['None']
                names = list(data.keys())
                values = list(data.values())
                bar_colors = {
                    '0': 'red',
                    '1': 'orange',
                    '2': 'yellow',
                    '3': 'green',
                    '4': 'skyblue',
                    '5': 'steelblue',
                    'sonstige': 'grey'
                }
                farben = [bar_colors[attr] for attr in names]
                # Plot
                wedges, texts, autotexts = new_plot_2.pie(values, labels=None, shadow=self.shadow, wedgeprops=self.abstand, colors=farben, pctdistance=1.2,
                                                          autopct=lambda pct: self.func(pct, values))
                for autotext in autotexts:
                    autotext.set_color('black')
                    autotext.set_size(10)

                #Innere Labels (Segmentnamen) nach außen
                for wedge, label in zip(wedges, names):
                    angle = (wedge.theta2 + wedge.theta1) / 2  # Winkel der Segmente berechnen
                    x = 0.6 * wedge.r * cos(radians(angle))  # x-Position außen (mit math.cos)
                    y = 0.6 * wedge.r * sin(radians(angle))  # y-Position außen (mit math.sin)
                    new_plot_2.text(x, y, label, ha='center', va='center', fontsize=12, color='black')

                new_plot_2.set_title('Zustandsklassenverteilung Haltungen')
                self.canv_3.draw()
                self.fig_3.subplots_adjust(left=0.1, right=0.95, top=0.95, bottom=0.15, wspace=0.3, hspace=0.4)
            else:
                figure_3.clf()
        figure_3.tight_layout()

        #Schächte nach Zustandsklasse
        # Karteikarte 9 initialisieren
        figure_10 = self.fig_10
        figure_10.clear()

        # testen ob tabelle vorhanden:
        if self.combo == 'Originale Bewertung':
            gs = GridSpec(2, 2, figure=figure_10, wspace=0.15, width_ratios=[2, 1])

            sql = f"""
                        WITH liste AS (
                                            SELECT
                                                CASE
                                                 WHEN MIN(max_ZD, max_ZS, max_ZB) IS NULL THEN 'sonstige'
                                                    WHEN MIN(max_ZD, max_ZS, max_ZB) NOT IN (0, 1, 2, 3, 4, 5) THEN 'sonstige'
                                                    ELSE CAST(MIN(max_ZD, max_ZS, max_ZB) AS TEXT)
                                                END AS Zustandszahl,
                                                COUNT(*) AS anzahl
                                            FROM schaechte_untersucht  
                                            LEFT JOIN schaechte h ON schaechte_untersucht.schnam = h.schnam
                                            {self.abfrage_where}
                                            GROUP BY CASE
                                            WHEN MIN(max_ZD, max_ZS, max_ZB) IS NULL THEN 'sonstige'
                                                WHEN MIN(max_ZD, max_ZS, max_ZB) NOT IN (0, 1, 2, 3, 4, 5) THEN 'sonstige'
                                                ELSE MIN(max_ZD, max_ZS, max_ZB)
                                            END
                                        )
                                        SELECT *
                                        FROM liste
                                        WHERE Zustandszahl = 'sonstige'
                                        ORDER BY Zustandszahl
                    """

            self._barplot(
                sql=sql,
                figure=figure_10,
                title='Anzahl je Zustandsklasse',
                ylabel='Zustandsklasse',
                xlabel='Anzahl',
                pos=gs[0]
            )

            # Schäden
            # Karteikarte 3 initialisieren

            sql = """
                                 select kuerzel,count(*) from untersuchdat_schacht group by kuerzel
                            """

            self._barplot(
                sql=sql,
                figure=figure_10,
                title='Anzahl der Schäden nach Schadenskürzel',
                ylabel='Art',
                xlabel='Anzahl',
                pos=gs[2]
            )

            # plt.figure(figure_3.number)
            new_plot_2 = figure_10.add_subplot(gs[1])
            l_bezeich = []
            sql = f"""select DISTINCT MIN(max_ZD,max_ZS,max_ZB) from schaechte_untersucht LEFT JOIN schaechte h ON h.schnam = schaechte_untersucht.schnam {self.abfrage_where}"""

            if not self.db_qkan.sql(sql):
                return

            for i in self.db_qkan.fetchall():
                i1 = str(i[0])
                l_bezeich.append(i1)

            data = {k: None for k in l_bezeich}

            for i in data.keys():
                if i not in ['None', 63, '63']:
                    sql = f"""select count(*) from schaechte_untersucht LEFT JOIN schaechte h ON h.schnam = schaechte_untersucht.schnam WHERE MIN(max_ZD,max_ZS,max_ZB) = {i} {self.abfrage_and}"""

                    if not self.db_qkan.sql(sql):
                        return

                    anz = self.db_qkan.fetchall()[0][0]

                    data[i] = anz

            if 'None' in data.keys():
                del data['None']
            if '63' in data.keys():
                del data['63']
            names = list(data.keys())
            values = list(data.values())
            bar_colors = {
                '0': 'red',
                '1': 'orange',
                '2': 'yellow',
                '3': 'green',
                '4': 'skyblue',
                '5': 'steelblue',
                'sonstige': 'grey'
            }
            farben = [bar_colors[attr] for attr in names]

            # Plot
            wedges, texts, autotexts = new_plot_2.pie(values, labels=None, shadow=self.shadow, wedgeprops=self.abstand,
                                                      colors=farben, pctdistance=1.2,
                                                      autopct=lambda pct: self.func(pct, values))
            for autotext in autotexts:
                autotext.set_color('black')
                autotext.set_size(10)

                # Innere Labels (Segmentnamen) nach außen
            for wedge, label in zip(wedges, names):
                angle = (wedge.theta2 + wedge.theta1) / 2  # Winkel der Segmente berechnen
                x = 0.6 * wedge.r * cos(radians(angle))  # x-Position außen (mit math.cos)
                y = 0.6 * wedge.r * sin(radians(angle))  # y-Position außen (mit math.sin)
                new_plot_2.text(x, y, label, ha='center', va='center', fontsize=12, color='black')

            new_plot_2.set_title('Zustandsklassenverteilung Schächte')
            self.canv_10.draw()
            self.fig_10.subplots_adjust(left=0.1, right=0.95, top=0.95, bottom=0.15, wspace=0.3, hspace=0.4)

        elif self.combo == 'Automatisierte Bewertung':
            sql = """ SELECT name FROM sqlite_master WHERE type='table' AND name='schaechte_untersucht_bewertung'
                                        """
            if not self.db_qkan.sql(sql):
                return
            liste = self.db_qkan.fetchall()

            if liste != []:
                gs = GridSpec(2, 2, figure=figure_10, wspace=0.15, width_ratios=[2, 1])

                sql = f"""
                                        WITH liste AS (
                                            SELECT
                                                CASE
                                                WHEN objektklasse_gesamt IS NULL THEN 'sonstige'
                                                    WHEN objektklasse_gesamt NOT IN (0, 1, 2, 3, 4, 5) THEN 'sonstige'
                                                    ELSE CAST(objektklasse_gesamt AS TEXT)
                                                END AS Zustandszahl,
                                                COUNT(*) AS anzahl
                                            FROM schaechte_untersucht_bewertung  
                                            LEFT JOIN schaechte h ON schaechte_untersucht_bewertung.schnam = h.schnam
                                            {self.abfrage_where}
                                            GROUP BY CASE
                                                WHEN objektklasse_gesamt IS NULL THEN 'sonstige'
                                                WHEN objektklasse_gesamt NOT IN (0, 1, 2, 3, 4, 5) THEN 'sonstige'
                                                ELSE objektklasse_gesamt
                                            END
                                        )
                                        SELECT *
                                        FROM liste
                                        WHERE Zustandszahl = 'sonstige'
                                        ORDER BY Zustandszahl
                                    """

                self._barplot(
                    sql=sql,
                    figure=figure_10,
                    title='Anzahl je Zustandsklasse',
                    ylabel='Zustandsklasse',
                    xlabel='Anzahl',
                    pos=gs[0]
                )

                sql = f"""
                                                 select kuerzel,count(*) from untersuchdat_schacht_bewertung LEFT JOIN schaechte h ON h.schnam = untersuchdat_schacht_bewertung.untersuchsch {self.abfrage_where} group by kuerzel
                                            """

                self._barplot(
                    sql=sql,
                    figure=figure_10,
                    title='Anzahl der Schäden nach Schadenskürzel',
                    ylabel='Art',
                    xlabel='Anzahl',
                    pos=gs[2]
                )

                # plt.figure(figure_3.number)
                new_plot_2 = figure_10.add_subplot(gs[1])
                l_bezeich = []
                sql = f"""select DISTINCT objektklasse_gesamt from schaechte_untersucht_bewertung LEFT JOIN schaechte h ON h.schnam = untersuchdat_schacht_bewertung.untersuchsch {self.abfrage_where}"""

                if not self.db_qkan.sql(sql):
                    return

                for i in self.db_qkan.fetchall():
                    i1 = str(i[0])
                    l_bezeich.append(i1)

                data = {k: None for k in l_bezeich}

                for i in data.keys():
                    if i not in ['None', 63]:
                        sql = f"""select count(*) from schaechte_untersucht_bewertung LEFT JOIN schaechte h ON h.schnam = untersuchdat_schacht_bewertung.untersuchsch WHERE objektklasse_gesamt = {i}  {self.abfrage_and} """

                        if not self.db_qkan.sql(sql):
                            return

                        anz = self.db_qkan.fetchall()[0][0]

                        data[i] = anz

                if 'None' in data.keys():
                    del data['None']
                names = list(data.keys())
                values = list(data.values())
                bar_colors = {
                    '0': 'red',
                    '1': 'orange',
                    '2': 'yellow',
                    '3': 'green',
                    '4': 'skyblue',
                    '5': 'steelblue',
                    'sonstige': 'grey'
                }
                farben = [bar_colors[attr] for attr in names]
                # Plot
                wedges, texts, autotexts = new_plot_2.pie(values, labels=None, shadow=self.shadow,
                                                          wedgeprops=self.abstand, colors=farben, pctdistance=1.2,
                                                          autopct=lambda pct: self.func(pct, values))
                for autotext in autotexts:
                    autotext.set_color('black')
                    autotext.set_size(10)

                    # Innere Labels (Segmentnamen) nach außen
                for wedge, label in zip(wedges, names):
                    angle = (wedge.theta2 + wedge.theta1) / 2  # Winkel der Segmente berechnen
                    x = 0.6 * wedge.r * cos(radians(angle))  # x-Position außen (mit math.cos)
                    y = 0.6 * wedge.r * sin(radians(angle))  # y-Position außen (mit math.sin)
                    new_plot_2.text(x, y, label, ha='center', va='center', fontsize=12, color='black')

                new_plot_2.set_title('Zustandsklassenverteilung Schächte')
                self.canv_10.draw()
                self.fig_10.subplots_adjust(left=0.1, right=0.95, top=0.95, bottom=0.15, wspace=0.3, hspace=0.4)

            else:
                figure_10.clf()

        # Anschlussleitugnen nach Zustandsklasse
        # Karteikarte 8 initialisieren
        figure_9 = self.fig_9
        figure_9.clear()

        # testen ob tabelle vorhanden:
        if self.combo == 'Originale Bewertung':
            gs = GridSpec(2, 2, figure=figure_9, wspace=0.15, width_ratios=[2, 1])

            sql = f"""
                        WITH liste AS (
                                            SELECT
                                                CASE
                                                 WHEN MIN(max_ZD, max_ZS, max_ZB) IS NULL THEN 'sonstige'
                                                    WHEN MIN(max_ZD, max_ZS, max_ZB) NOT IN (0, 1, 2, 3, 4, 5) THEN 'sonstige'
                                                    ELSE CAST(MIN(max_ZD, max_ZS, max_ZB) AS TEXT)
                                                END AS Zustandszahl,
                                                COALESCE(ROUND(SUM(
                                                    CASE 
                                                        WHEN COALESCE(anschlussleitungen_untersucht.laenge, 0) = 0 THEN GLength(anschlussleitungen_untersucht.geom)
                                                        ELSE anschlussleitungen_untersucht.laenge
                                                    END
                                                ) / 1000.0, 2),0) AS gesamtlaenge,
                                                COUNT(*) AS anzahl
                                            FROM anschlussleitungen_untersucht  
                                            LEFT JOIN anschlussleitungen h ON anschlussleitungen_untersucht.leitnam = h.leitnam
                                            {self.abfrage_where}
                                            GROUP BY CASE
                                            WHEN MIN(max_ZD, max_ZS, max_ZB) IS NULL THEN 'sonstige'
                                                WHEN MIN(max_ZD, max_ZS, max_ZB) NOT IN (0, 1, 2, 3, 4, 5) THEN 'sonstige'
                                                ELSE MIN(max_ZD, max_ZS, max_ZB)
                                            END
                                        )
                                        SELECT *
                                        FROM liste
                                        WHERE gesamtlaenge > 0.01 OR Zustandszahl = 'sonstige'
                                        ORDER BY Zustandszahl
                    """

            self._barplot(
                sql=sql,
                figure=figure_9,
                title='Gesamtlänge je Zustandsklasse',
                ylabel='Zustandsklasse',
                xlabel='Gesamtlänge (km)',
                pos=gs[0]
            )

            # Schäden
            # Karteikarte 3 initialisieren

            sql = """
                                 select kuerzel,count(*) from untersuchdat_anschlussleitung group by kuerzel
                            """

            self._barplot(
                sql=sql,
                figure=figure_9,
                title='Anzahl der Schäden nach Schadenskürzel',
                ylabel='Art',
                xlabel='Anzahl',
                pos=gs[2]
            )

            # plt.figure(figure_3.number)
            new_plot_2 = figure_9.add_subplot(gs[1])
            l_bezeich = []
            sql = f"""select DISTINCT MIN(max_ZD,max_ZS,max_ZB) from anschlussleitungen_untersucht LEFT JOIN anschlussleitungen h ON h.leitnam = anschlussleitungen_untersucht.leitnam {self.abfrage_where}"""

            if not self.db_qkan.sql(sql):
                return

            for i in self.db_qkan.fetchall():
                i1 = str(i[0])
                l_bezeich.append(i1)

            data = {k: None for k in l_bezeich}

            for i in data.keys():
                if i not in ['None', 63, '63']:
                    sql = f"""select count(*) from anschlussleitung_untersucht LEFT JOIN anschlussleitungen h ON h.leitnam = anschlussleitungen_untersucht.leitnam WHERE MIN(max_ZD,max_ZS,max_ZB) = {i} {self.abfrage_and}"""

                    if not self.db_qkan.sql(sql):
                        return

                    anz = self.db_qkan.fetchall()[0][0]

                    data[i] = anz

            if 'None' in data.keys():
                del data['None']
            if '63' in data.keys():
                del data['63']
            names = list(data.keys())
            values = list(data.values())
            bar_colors = {
                '0': 'red',
                '1': 'orange',
                '2': 'yellow',
                '3': 'green',
                '4': 'skyblue',
                '5': 'steelblue',
                'sonstige': 'grey'
            }
            farben = [bar_colors[attr] for attr in names]

            # Plot
            wedges, texts, autotexts = new_plot_2.pie(values, labels=None, shadow=self.shadow,
                                                      wedgeprops=self.abstand,
                                                      colors=farben, pctdistance=1.2,
                                                      autopct=lambda pct: self.func(pct, values))
            for autotext in autotexts:
                autotext.set_color('black')
                autotext.set_size(10)

                # Innere Labels (Segmentnamen) nach außen
            for wedge, label in zip(wedges, names):
                angle = (wedge.theta2 + wedge.theta1) / 2  # Winkel der Segmente berechnen
                x = 0.6 * wedge.r * cos(radians(angle))  # x-Position außen (mit math.cos)
                y = 0.6 * wedge.r * sin(radians(angle))  # y-Position außen (mit math.sin)
                new_plot_2.text(x, y, label, ha='center', va='center', fontsize=12, color='black')

            new_plot_2.set_title('Zustandsklassenverteilung HA-Leitungen')
            self.canv_10.draw()
            self.fig_10.subplots_adjust(left=0.1, right=0.95, top=0.95, bottom=0.15, wspace=0.3, hspace=0.4)

        elif self.combo == 'Automatisierte Bewertung':
            sql = """ SELECT name FROM sqlite_master WHERE type='table' AND name='anschlussleitungen_untersucht_bewertung'
                                        """
            if not self.db_qkan.sql(sql):
                return
            liste = self.db_qkan.fetchall()

            if liste != []:
                gs = GridSpec(2, 2, figure=figure_9, wspace=0.15, width_ratios=[2, 1])

                sql = f"""
                                        WITH liste AS (
                                            SELECT
                                                CASE
                                                WHEN objektklasse_gesamt IS NULL THEN 'sonstige'
                                                    WHEN objektklasse_gesamt NOT IN (0, 1, 2, 3, 4, 5) THEN 'sonstige'
                                                    ELSE CAST(objektklasse_gesamt AS TEXT)
                                                END AS Zustandszahl,
                                                COALESCE(ROUND(SUM(
                                                    CASE 
                                                        WHEN COALESCE(anschlussleitungen_untersucht_bewertung.laenge, 0) = 0 THEN GLength(schaechte_untersucht.geom)
                                                        ELSE anschlussleitungen_untersucht_bewertung.laenge
                                                    END
                                                ) / 1000.0, 2),0) AS gesamtlaenge,
                                                COUNT(*) AS anzahl
                                            FROM anschlussleitungen_untersucht_bewertung  
                                            LEFT JOIN ansclhussleitungen h ON anschlussleitungen_untersucht_bewertung.leitnam = h.leitnam
                                            {self.abfrage_where}
                                            GROUP BY CASE
                                                WHEN objektklasse_gesamt IS NULL THEN 'sonstige'
                                                WHEN objektklasse_gesamt NOT IN (0, 1, 2, 3, 4, 5) THEN 'sonstige'
                                                ELSE objektklasse_gesamt
                                            END
                                        )
                                        SELECT *
                                        FROM liste
                                        WHERE gesamtlaenge > 0.01 OR Zustandszahl = 'sonstige'
                                        ORDER BY Zustandszahl
                                    """

                self._barplot(
                    sql=sql,
                    figure=figure_9,
                    title='Gesamtlänge je Zustandsklasse',
                    ylabel='Zustandsklasse',
                    xlabel='Gesamtlänge (km)',
                    pos=gs[0]
                )

                sql = f"""
                                                 select kuerzel,count(*) from untersuchdat_anschlussleitungen_bewertung LEFT JOIN anschlussleitungen h ON h.leitnam = untersuchdat_anschlussleitungen_bewertung.untersuchleit {self.abfrage_where} group by kuerzel
                                            """

                self._barplot(
                    sql=sql,
                    figure=figure_9,
                    title='Anzahl der Schäden nach Schadenskürzel',
                    ylabel='Art',
                    xlabel='Anzahl',
                    pos=gs[2]
                )

                # plt.figure(figure_3.number)
                new_plot_2 = figure_9.add_subplot(gs[1])
                l_bezeich = []
                sql = f"""select DISTINCT objektklasse_gesamt from anslchussleitungen_untersucht_bewertung LEFT JOIN anschlussleitungen h ON h.leitnam = untersuchdat_anschlussleitungen_bewertung.untersuchleit {self.abfrage_where}"""

                if not self.db_qkan.sql(sql):
                    return

                for i in self.db_qkan.fetchall():
                    i1 = str(i[0])
                    l_bezeich.append(i1)

                data = {k: None for k in l_bezeich}

                for i in data.keys():
                    if i not in ['None', 63]:
                        sql = f"""select count(*) from anslchussleitungen_untersucht_bewertung LEFT JOIN anschlussleitungen h ON h.leitnam = untersuchdat_anschlussleitungen_bewertung.untersuchleit WHERE objektklasse_gesamt = {i}  {self.abfrage_and} """

                        if not self.db_qkan.sql(sql):
                            return

                        anz = self.db_qkan.fetchall()[0][0]

                        data[i] = anz

                if 'None' in data.keys():
                    del data['None']
                names = list(data.keys())
                values = list(data.values())
                bar_colors = {
                    '0': 'red',
                    '1': 'orange',
                    '2': 'yellow',
                    '3': 'green',
                    '4': 'skyblue',
                    '5': 'steelblue',
                    'sonstige': 'grey'
                }
                farben = [bar_colors[attr] for attr in names]
                # Plot
                wedges, texts, autotexts = new_plot_2.pie(values, labels=None, shadow=self.shadow,
                                                          wedgeprops=self.abstand, colors=farben,
                                                          pctdistance=1.2,
                                                          autopct=lambda pct: self.func(pct, values))
                for autotext in autotexts:
                    autotext.set_color('black')
                    autotext.set_size(10)

                    # Innere Labels (Segmentnamen) nach außen
                for wedge, label in zip(wedges, names):
                    angle = (wedge.theta2 + wedge.theta1) / 2  # Winkel der Segmente berechnen
                    x = 0.6 * wedge.r * cos(radians(angle))  # x-Position außen (mit math.cos)
                    y = 0.6 * wedge.r * sin(radians(angle))  # y-Position außen (mit math.sin)
                    new_plot_2.text(x, y, label, ha='center', va='center', fontsize=12, color='black')

                new_plot_2.set_title('Zustandsklassenverteilung HA-Leitungen')
                self.canv_9.draw()
                self.fig_9.subplots_adjust(left=0.1, right=0.95, top=0.95, bottom=0.15, wspace=0.3, hspace=0.4)

            else:
                figure_9.clf()



        # Darstellung Schächte nach Entwässerungsart
        figure_2 = self.fig_2
        figure_2.clear()
        # plt.figure(figure_2.number)
        #new_plot_2 = figure_2.add_subplot(121)

        # l_bezeich = []
        # sql = """select count() from schaechte"""
        #
        # if not self.db_qkan.sql(sql):
        #     return
        #
        # sql = """select DISTINCT entwart from schaechte """
        #
        # if not self.db_qkan.sql(sql):
        #     return
        #
        # for i in self.db_qkan.fetchall():
        #     i = str(i[0])
        #     l_bezeich.append(i)
        #
        # data = {k: None for k in l_bezeich}
        #
        # for i in data.keys():
        #     sql = f"""select count() from schaechte WHERE entwart = '{i}'"""
        #
        #     if not self.db_qkan.sql(sql):
        #         return
        #
        #     anz = self.db_qkan.fetchall()[0][0]
        #
        #     data[i] = anz
        #
        # if 'None' in data.keys():
        #     del data['None']
        # names = list(data.keys())
        # values = list(data.values())
        # # Plot
        # new_plot_2.pie(values, labels=names, shadow=self.shadow, wedgeprops=self.abstand, autopct=lambda pct: self.func(pct, values))
        # new_plot_2.set_title('Entwässerungsart')
        # self.canv_2.draw()
        # self.fig_2.subplots_adjust(left=0.1, right=0.95, top=0.95, bottom=0.3, wspace=0.3, hspace=0.4)

        # Darstellungen Schächte nach Baujahren

        sql = f"""
        
            WITH liste AS (
                        SELECT
                        CASE
                        WHEN baujahr IS NULL THEN 'sonstige'
                          ELSE baujahr
                            END AS baujahr
                            FROM schaechte
                            {self.abfrage_where}      
                    )
                    SELECT
                        baujahr,
                        count() as Anzahl
                    FROM liste
                    GROUP BY baujahr
                    ORDER BY baujahr;
        """
        self._barplot(
            sql=sql,
            figure=figure_2,
            title='Baujahre der Schächte',
            ylabel='Baujahre',
            xlabel='Anzahl',
            pos=122
        )

        # Darstellung Schächte nach Material
        sql = f"""

                    WITH liste AS (
                        SELECT
                        CASE
                        WHEN material IS NULL THEN 'sonstige'
                          ELSE CAST(material AS text)
                        END AS material
                        FROM schaechte
                             {self.abfrage_where} 
                           
                    )
                    SELECT
                        material,
                        count() as Anzahl
                    FROM liste
                    GROUP BY material
                    ORDER BY material;
                """
        self._barplot(
            sql=sql,
            figure=figure_2,
            title='Material der Schächte',
            ylabel='Material',
            xlabel='Anzahl',
            pos=121
        )

        # l_bezeich = []
        # sql = """select DISTINCT material from schaechte """
        #
        # if not self.db_qkan.sql(sql):
        #     return
        #
        # for i in self.db_qkan.fetchall():
        #     i = str(i[0])
        #     l_bezeich.append(i)
        #
        # data = {k: None for k in l_bezeich}
        #
        # for i in data.keys():
        #     sql = f"""select count() from schaechte WHERE material = '{i}'"""
        #
        #     if not self.db_qkan.sql(sql):
        #         return
        #
        #     anz = self.db_qkan.fetchall()[0][0]
        #
        #     data[i] = anz
        # if 'None' in data.keys():
        #     del data['None']
        # names = list(data.keys())
        # values = list(data.values())
        # # Plot
        # new_plot = figure_2.add_subplot(122)
        # wedges, texts, autotexts = new_plot.pie(values, labels=names, shadow=self.shadow, wedgeprops=self.abstand, autopct=lambda pct: self.func(pct, values))
        # new_plot.set_title('Material')
        # self.canv_2.draw()
        # self.fig_2.subplots_adjust(left=0.1, right=0.95, top=0.95, bottom=0.3, wspace=0.3, hspace=0.4)

        # Haltungen nach Substanzklasse
        # Karteikarte 5 initialisieren
        figure_5 = self.fig_5
        figure_5.clear()

        gs = GridSpec(2, 2, figure=figure_5, wspace=0.15, width_ratios=[2, 1])

        #testen ob tabelle vorhanden:
        sql = """ SELECT name FROM sqlite_master WHERE type='table' AND name='substanz_haltung_bewertung'
                """
        if not self.db_qkan.sql(sql):
            return
        liste = self.db_qkan.fetchall()

        if liste != []:

            sql = f"""
                        WITH liste AS (
                          SELECT
                          CASE
                           WHEN Substanzklasse IS NULL THEN 'sonstige'
                          WHEN Substanzklasse NOT IN (0, 1, 2, 3, 4, 5) THEN 'sonstige'
                          ELSE CAST(Substanzklasse AS TEXT)
                          END AS Substanzzahl,
                          ROUND(SUM(
                          CASE 
                          WHEN COALESCE(haltungen_substanz_bewertung.laenge, 0) = 0 THEN GLength(haltungen_substanz_bewertung.geom)
                          ELSE haltungen_substanz_bewertung.laenge
                          END
                          ) / 1000.0, 2) AS gesamtlaenge,
                          COUNT(*) AS anzahl
                          FROM haltungen_substanz_bewertung
                          LEFT JOIN haltungen h ON haltungen_substanz_bewertung.haltnam = h.haltnam
                                    {self.abfrage_where}
                            GROUP BY CASE
                             WHEN Substanzklasse IS NULL THEN 'sonstige'
                          WHEN Substanzklasse NOT IN (0, 1, 2, 3, 4, 5) THEN 'sonstige'
                          ELSE Substanzklasse
                          END
                          )
                          SELECT *
                          FROM liste
                          WHERE gesamtlaenge > 0.01 OR Substanzzahl = 'sonstige'
                          ORDER BY Substanzzahl
                    """

            self._barplot(
                sql=sql,
                figure=figure_5,
                title='Gesamtlänge je Substanzklasse',
                ylabel='Substanzklasse',
                xlabel='Gesamtlänge (km)',
                pos=gs[0]
            )

            new_plot_2 = figure_5.add_subplot(gs[1])
            l_bezeich = []
            sql = f"""select DISTINCT Substanzklasse from haltungen_substanz_bewertung LEFT JOIN haltungen h ON h.haltnam = haltungen_substanz_bewertung.haltnam {self.abfrage_where}"""

            if not self.db_qkan.sql(sql):
                return

            for i in self.db_qkan.fetchall():
                i1 = str(i[0])
                l_bezeich.append(i1)

            data = {k: None for k in l_bezeich}

            for i in data.keys():
                if i != 'None':
                    sql = f"""select count(*) from haltungen_substanz_bewertung LEFT JOIN haltungen h ON h.haltnam = haltungen_substanz_bewertung.haltnam WHERE Substanzklasse = {i}  {self.abfrage_where}"""

                    if not self.db_qkan.sql(sql):
                        return

                    anz = self.db_qkan.fetchall()[0][0]

                    data[i] = anz

            if 'None' in data.keys():
                del data['None']
            names = list(data.keys())
            values = list(data.values())
            bar_colors = {
                '0': 'red',
                '1': 'orange',
                '2': 'yellow',
                '3': 'green',
                '4': 'skyblue',
                '5': 'steelblue',
                'sonstige': 'grey'
            }
            farben = [bar_colors[attr] for attr in names]
            # Plot
            wedges, texts, autotexts = new_plot_2.pie(values, labels=None, shadow=self.shadow, wedgeprops=self.abstand,
                                                      colors=farben, pctdistance=1.2,
                                                      autopct=lambda pct: self.func(pct, values))
            for autotext in autotexts:
                autotext.set_color('black')
                autotext.set_size(10)

                # Innere Labels (Segmentnamen) nach außen
            for wedge, label in zip(wedges, names):
                angle = (wedge.theta2 + wedge.theta1) / 2  # Winkel der Segmente berechnen
                x = 0.6 * wedge.r * cos(radians(angle))  # x-Position außen (mit math.cos)
                y = 0.6 * wedge.r * sin(radians(angle))  # y-Position außen (mit math.sin)
                new_plot_2.text(x, y, label, ha='center', va='center', fontsize=12, color='black')

            new_plot_2.set_title('Substanzklassenverteilung Haltungen')
            self.canv_5.draw()
            self.fig_5.subplots_adjust(left=0.1, right=0.95, top=0.95, bottom=0.15, wspace=0.3, hspace=0.4)

            sql = f"""
                     select kuerzel, IIF(sum(Schadenslaenge),sum(Schadenslaenge), 0) from substanz_haltung_bewertung LEFT JOIN haltungen h ON h.haltnam = substanz_haltung_bewertung.untersuchhal {self.abfrage_where} group by kuerzel
                                """

            self._barplot(
                sql=sql,
                figure=figure_5,
                title='Gesamtschadenslänge je Schaden',
                ylabel='Art',
                xlabel='Länge',
                pos=gs[2]
            )
        figure_5.tight_layout()

    def _suewvo(self):
        dat1 = self.dat1
        dat2 = self.dat2
        dat3 = self.dat3

        bericht = dat1 + '%'

        untersuch1 = dat2+'-01-01'
        untersuch2 = dat3+'-12-31'

        self.bew_art = 'DWA'
        self.laenge_haltungen_rw = 0
        self.laenge_haltungen_sw = 0
        self.laenge_haltungen_mw = 0
        self.haltungen_0_rw = 0
        self.haltungen_1_rw = 0
        self.haltungen_2_rw = 0
        self.haltungen_3_rw = 0
        self.haltungen_4_rw = 0
        self.haltungen_5_rw = 0
        self.laenge_haltungen_untersuch_rw = 0
        self.laenge_haltungen_untersuch_bj_rw = 0
        self.laenge_haltungen_saniert_rw = 0
        self.haltungen_0_sw = 0
        self.haltungen_1_sw = 0
        self.haltungen_2_sw = 0
        self.haltungen_3_sw = 0
        self.haltungen_4_sw = 0
        self.haltungen_5_sw = 0
        self.laenge_haltungen_untersuch_sw = 0
        self.laenge_haltungen_untersuch_bj_sw = 0
        self.laenge_haltungen_saniert_sw = 0
        self.haltungen_0_mw = 0
        self.haltungen_1_mw = 0
        self.haltungen_2_mw = 0
        self.haltungen_3_mw = 0
        self.haltungen_4_mw = 0
        self.haltungen_5_mw = 0
        self.laenge_haltungen_untersuch_mw = 0
        self.laenge_haltungen_untersuch_bj_mw = 0
        self.laenge_haltungen_saniert_mw = 0
        self.anz_schaechte_rw = 0
        self.anz_schaechte_sw = 0
        self.anz_schaechte_mw = 0
        self.anz_schaechte_0_rw = 0
        self.anz_schaechte_1_rw = 0
        self.anz_schaechte_2_rw = 0
        self.anz_schaechte_3_rw = 0
        self.anz_schaechte_4_rw = 0
        self.anz_schaechte_5_rw = 0
        self.anz_schaechte_untersuch_rw = 0
        self.anz_schaechte_untersuch_bj_rw = 0
        self.anz_schaechte_saniert_rw = 0
        self.anz_schaechte_0_sw = 0
        self.anz_schaechte_1_sw = 0
        self.anz_schaechte_2_sw = 0
        self.anz_schaechte_3_sw = 0
        self.anz_schaechte_4_sw = 0
        self.anz_schaechte_5_sw = 0
        self.anz_schaechte_untersuch_sw = 0
        self.anz_schaechte_untersuch_bj_sw = 0
        self.anz_schaechte_saniert_sw = 0
        self.anz_schaechte_0_mw = 0
        self.anz_schaechte_1_mw = 0
        self.anz_schaechte_2_mw = 0
        self.anz_schaechte_3_mw = 0
        self.anz_schaechte_4_mw = 0
        self.anz_schaechte_5_mw = 0
        self.anz_schaechte_untersuch_mw = 0
        self.anz_schaechte_untersuch_bj_mw = 0
        self.anz_schaechte_saniert_mw = 0

        #testen ob zustandsbewertungen vorhanden sind
        sql = """
                   SELECT
                    pk
                    FROM
                    haltungen_untersucht
                   """
        if not self.db_qkan.sql(sql):
            return

        if len(self.db_qkan.fetchall()) != 0:
            #abfragen Haltungen

            # anzahl lange haltungen RW
            sql = """
                       SELECT
                        SUM(laenge)
                        FROM
                        haltungen
                        WHERE entwart = 'Regenwasser'
                       """

            if not self.db_qkan.sql(sql):
                return
            attr = self.db_qkan.fetchall()
            if attr[0][0] != None and attr != []:
                self.laenge_haltungen_rw = round(attr[0][0]/1000, 2)

            # anzahl lange haltungen SW
            sql = """
                                   SELECT
                                    SUM(laenge)
                                    FROM
                                    haltungen
                                    WHERE entwart = 'Schmutzwasser'
                                   """

            if not self.db_qkan.sql(sql):
                return
            attr = self.db_qkan.fetchall()
            if attr[0][0] != None and attr != []:
                self.laenge_haltungen_sw = round(attr[0][0]/1000, 2)

            # anzahl lange haltungen MW
            sql = """
                       SELECT
                        SUM(laenge)
                        FROM
                        haltungen
                        WHERE entwart = 'Mischwasser'
                       """

            if not self.db_qkan.sql(sql):
                return
            attr = self.db_qkan.fetchall()
            if attr[0][0] != None and attr != []:
                self.laenge_haltungen_mw = round(attr[0][0]/1000, 2)

            sql = """
                        SELECT * FROM
                        sqlite_master
                        WHERE
                        name = 'haltungen_untersucht_bewertung' and type = 'table'
                        """
            if not self.db_qkan.sql(sql):
                return

            if len(self.db_qkan.fetchall()) != 0:

                sql = """
                            SELECT MAX(haltungen_untersucht_bewertung.datenart)

                            FROM haltungen_untersucht_bewertung
                                   """
                if not self.db_qkan.sql(sql):
                    return

                attr = self.db_qkan.fetchall()
                if attr[0][0] != None and attr != []:
                    self.bew_art = attr[0][0]

                # laenge haltungen 0
                sql = """
                            SELECT h1.haltnam,
                            haltungen.entwart,
                            haltungen.laenge
                                FROM haltungen_untersucht_bewertung h1, haltungen
                                JOIN (
                                    SELECT haltnam, MAX(DATE(untersuchtag)) AS max_untersuchtag
                                    FROM haltungen_untersucht_bewertung 
                                    GROUP BY haltnam) h2
                                ON h1.haltnam = h2.haltnam AND DATE(h1.untersuchtag) = h2.max_untersuchtag
                                WHERE h1.haltnam =haltungen.haltnam
                                AND h1.objektklasse_gesamt = 0
                                      """
                data = ()

                try:
                    self.db_qkan.sql(sql, "Info Entwässerungsart bewertete Haltungen Objektklasse 0", data)
                except:
                    pass

                attr = self.db_qkan.fetchall()
                if attr != None and attr != []:
                    rw = 0
                    sw = 0
                    mw = 0
                    for i in attr:
                        if i[1] == 'Regenwasser':
                            rw += i[2]
                        if i[1] == 'Schmutzwasser':
                            sw += i[2]
                        if i[1] == 'Mischwasser':
                            mw += i[2]

                        self.haltungen_0_rw = round(rw/1000,2)
                        self.haltungen_0_sw = round(sw/1000,2)
                        self.haltungen_0_mw = round(mw/1000,2)

                # laenge haltungen 1
                sql = """
                        SELECT h1.haltnam,
                            haltungen.entwart,
                            haltungen.laenge
                                FROM haltungen_untersucht_bewertung h1, haltungen
                                JOIN (
                                    SELECT haltnam, MAX(DATE(untersuchtag)) AS max_untersuchtag
                                    FROM haltungen_untersucht_bewertung 
                                    GROUP BY haltnam) h2
                                ON h1.haltnam = h2.haltnam AND DATE(h1.untersuchtag) = h2.max_untersuchtag
                                WHERE h1.haltnam =haltungen.haltnam
                                AND h1.objektklasse_gesamt = 1
                """

                data = ()

                try:
                    self.db_qkan.sql(sql, "Info Entwässerungsart bewertete Haltungen Objektklasse 1", data)
                except:
                    pass
                attr = self.db_qkan.fetchall()
                if attr != None and attr != []:
                    rw = 0
                    sw = 0
                    mw = 0
                    for i in attr:
                        if i[1] == 'Regenwasser':
                            rw += i[2]
                        if i[1] == 'Schmutzwasser':
                            sw += i[2]
                        if i[1] == 'Mischwasser':
                            mw += i[2]

                        self.haltungen_1_rw = round(rw/1000,2)
                        self.haltungen_1_sw = round(sw/1000,2)
                        self.haltungen_1_mw = round(mw/1000,2)

                # laenge haltungen 2
                sql = """
                    SELECT h1.haltnam,
                            haltungen.entwart,
                            haltungen.laenge
                                FROM haltungen_untersucht_bewertung h1, haltungen
                                JOIN (
                                    SELECT haltnam, MAX(DATE(untersuchtag)) AS max_untersuchtag
                                    FROM haltungen_untersucht_bewertung 
                                    GROUP BY haltnam) h2
                                ON h1.haltnam = h2.haltnam AND DATE(h1.untersuchtag) = h2.max_untersuchtag
                                WHERE h1.haltnam =haltungen.haltnam
                                AND h1.objektklasse_gesamt = 2
                """

                data = ()

                try:
                    self.db_qkan.sql(sql, "Info Entwässerungsart bewertete Haltungen Objektklasse 2", data)
                except:
                    pass
                attr = self.db_qkan.fetchall()
                if attr != None and attr != []:
                    rw = 0
                    sw = 0
                    mw = 0
                    for i in attr:
                        if i[1] == 'Regenwasser':
                            rw += i[2]
                        if i[1] == 'Schmutzwasser':
                            sw += i[2]
                        if i[1] == 'Mischwasser':
                            mw += i[2]

                        self.haltungen_2_rw = round(rw/1000,2)
                        self.haltungen_2_sw = round(sw/1000,2)
                        self.haltungen_2_mw = round(mw/1000,2)

                # laenge haltungen 3
                sql = """
                    SELECT h1.haltnam,
                            haltungen.entwart,
                            haltungen.laenge
                                FROM haltungen_untersucht_bewertung h1, haltungen
                                JOIN (
                                    SELECT haltnam, MAX(DATE(untersuchtag)) AS max_untersuchtag
                                    FROM haltungen_untersucht_bewertung 
                                    GROUP BY haltnam) h2
                                ON h1.haltnam = h2.haltnam AND DATE(h1.untersuchtag) = h2.max_untersuchtag
                                WHERE h1.haltnam =haltungen.haltnam
                                AND h1.objektklasse_gesamt = 3
                """

                data = ()

                try:
                    self.db_qkan.sql(sql, "Info Entwässerungsart bewertete Haltungen Objektklasse 3", data)
                except:
                    pass
                attr = self.db_qkan.fetchall()
                if attr != None and attr != []:
                    rw = 0
                    sw = 0
                    mw = 0
                    for i in attr:
                        if i[1] == 'Regenwasser':
                            rw += i[2]
                        if i[1] == 'Schmutzwasser':
                            sw += i[2]
                        if i[1] == 'Mischwasser':
                            mw += i[2]

                        self.haltungen_3_rw = round(rw/1000,2)
                        self.haltungen_3_sw = round(sw/1000,2)
                        self.haltungen_3_mw = round(mw/1000,2)

                # laenge haltungen 4
                sql = """
                    SELECT h1.haltnam,
                            haltungen.entwart,
                            haltungen.laenge
                                FROM haltungen_untersucht_bewertung h1, haltungen
                                JOIN (
                                    SELECT haltnam, MAX(DATE(untersuchtag)) AS max_untersuchtag
                                    FROM haltungen_untersucht_bewertung 
                                    GROUP BY haltnam) h2
                                ON h1.haltnam = h2.haltnam AND DATE(h1.untersuchtag) = h2.max_untersuchtag
                                WHERE h1.haltnam =haltungen.haltnam
                                AND h1.objektklasse_gesamt = 4
                """

                data = ()

                try:
                    self.db_qkan.sql(sql, "Info Entwässerungsart bewertete Haltungen Objektklasse 44", data)
                except:
                    pass
                attr = self.db_qkan.fetchall()
                if attr != None and attr != []:
                    rw = 0
                    sw = 0
                    mw = 0
                    for i in attr:
                        if i[1] == 'Regenwasser':
                            rw += i[2]
                        if i[1] == 'Schmutzwasser':
                            sw += i[2]
                        if i[1] == 'Mischwasser':
                            mw += i[2]

                        self.haltungen_4_rw = round(rw/1000,2)
                        self.haltungen_4_sw = round(sw/1000,2)
                        self.haltungen_4_mw = round(mw/1000,2)

                # laenge haltungen 5
                sql = """
                    SELECT h1.haltnam,
                            haltungen.entwart,
                            haltungen.laenge
                                FROM haltungen_untersucht_bewertung h1, haltungen
                                JOIN (
                                    SELECT haltnam, MAX(DATE(untersuchtag)) AS max_untersuchtag
                                    FROM haltungen_untersucht_bewertung 
                                    GROUP BY haltnam) h2
                                ON h1.haltnam = h2.haltnam AND DATE(h1.untersuchtag) = h2.max_untersuchtag
                                WHERE h1.haltnam =haltungen.haltnam
                                AND h1.objektklasse_gesamt = 5
                """

                data = ()

                try:
                    self.db_qkan.sql(sql, "Info Entwässerungsart bewertete Haltungen Objektklasse 5", data)
                except:
                    pass
                attr = self.db_qkan.fetchall()
                if attr != None and attr != []:
                    rw = 0
                    sw = 0
                    mw = 0
                    for i in attr:
                        if i[1] == 'Regenwasser':
                            rw += i[2]
                        if i[1] == 'Schmutzwasser':
                            sw += i[2]
                        if i[1] == 'Mischwasser':
                            mw += i[2]

                        self.haltungen_5_rw = round(rw/1000,2)
                        self.haltungen_5_sw = round(sw/1000,2)
                        self.haltungen_5_mw = round(mw/1000,2)

                # laenge im untersuchungszyklus
                sql = """
                            SELECT h1.haltnam,
                                    haltungen.entwart,
                                    haltungen.laenge
                                    FROM haltungen_untersucht_bewertung h1, haltungen
                                    WHERE h1.haltnam =haltungen.haltnam
                                    AND  h1.untersuchtag BETWEEN ? AND ?
                        """

                data = (untersuch1, untersuch2)

                try:
                    self.db_qkan.sql(sql, "Info Entwässerungsart bewertete Haltungen Objektklasse 5", data)
                except:
                    pass
                attr = self.db_qkan.fetchall()
                if attr != None and attr != []:
                    rw = 0
                    sw = 0
                    mw = 0
                    for i in attr:
                        if i[1] == 'Regenwasser':
                            rw += i[2]
                        if i[1] == 'Schmutzwasser':
                            sw += i[2]
                        if i[1] == 'Mischwasser':
                            mw += i[2]

                        self.laenge_haltungen_untersuch_rw = round(rw / 1000, 2)
                        self.laenge_haltungen_untersuch_sw = round(sw / 1000, 2)
                        self.laenge_haltungen_untersuch_mw = round(mw / 1000, 2)

                # laenge im berichtsjahr
                sql = """
                            SELECT h1.haltnam,
                                haltungen.entwart,
                                haltungen.laenge
                                    FROM haltungen_untersucht_bewertung h1, haltungen
                                    WHERE h1.haltnam =haltungen.haltnam
                                    AND h1.untersuchtag like ?
                                """

                data = (bericht,)

                try:
                    self.db_qkan.sql(sql, "Info Entwässerungsart bewertete Haltungen Objektklasse 5", data)
                except:
                    pass
                attr = self.db_qkan.fetchall()
                if attr != None and attr != []:
                    rw = 0
                    sw = 0
                    mw = 0
                    for i in attr:
                        if i[1] == 'Regenwasser':
                            rw += i[2]
                        if i[1] == 'Schmutzwasser':
                            sw += i[2]
                        if i[1] == 'Mischwasser':
                            mw += i[2]

                        self.laenge_haltungen_untersuch_bj_rw = round(rw / 1000, 2)
                        self.laenge_haltungen_untersuch_bj_sw = round(sw / 1000, 2)
                        self.laenge_haltungen_untersuch_bj_mw = round(mw / 1000, 2)


       #Abfragen Schaechte
        sql = """
                   SELECT
                    pk
                    FROM
                    schaechte_untersucht
                   """
        if not self.db_qkan.sql(sql):
            return

        if len(self.db_qkan.fetchall()) != 0:
            # abfragen schaechte

            # anzahl schaechte rw
            sql = """
                       SELECT
                       count(*)
                        FROM
                        schaechte
                        WHERE entwart ='Regenwasser' OR entwart = 'KR'
                       """

            if not self.db_qkan.sql(sql):
                return
            attr = self.db_qkan.fetchall()
            if attr[0][0] != None and attr != []:
                self.anz_schaechte_rw = attr[0][0]

            # anzahl schaechte sw
            sql = """
                           SELECT
                           count(*)
                            FROM
                            schaechte
                            WHERE entwart ='Schmutzwasser' OR entwart = 'KS'
                           """

            if not self.db_qkan.sql(sql):
                return
            attr = self.db_qkan.fetchall()
            if attr[0][0] != None and attr != []:
                self.anz_schaechte_sw = attr[0][0]

            # anzahl schaechte mw
            sql = """
               SELECT count(*)
               FROM schaechte
               WHERE entwart ='Mischwasser' OR entwart = 'KM'
            """

            if not self.db_qkan.sql(sql):
                return
            attr = self.db_qkan.fetchall()
            if attr[0][0] != None and attr != []:
                self.anz_schaechte_mw = attr[0][0]

            sql = """
                SELECT *
                FROM sqlite_master
                WHERE
                    name = 'schaechte_untersucht_bewertung' and type = 'table'
            """
            if not self.db_qkan.sql(sql):
                return

            if len(self.db_qkan.fetchall()) != 0:
                sql = """
                    SELECT MAX(schaechte_untersucht_bewertung.datenart)
                    FROM schaechte_untersucht_bewertung
                """

                if not self.db_qkan.sql(sql):
                    return

                attr = self.db_qkan.fetchall()
                if attr[0][0] != None and attr != []:
                    self.bew_art = attr[0][0]

                # anzahl schaechte 0
                sql = """
                    SELECT s1.schnam,
                    schaechte.entwart
                    FROM schaechte_untersucht_bewertung s1,schaechte
                    JOIN (
                        SELECT schnam, MAX(DATE(untersuchtag)) AS max_untersuchtag
                        FROM schaechte_untersucht_bewertung 
                        GROUP BY schnam) s2
                    ON s1.schnam = s2.schnam AND DATE(s1.untersuchtag) = s2.max_untersuchtag
                    WHERE s1.schnam =schaechte.schnam
                        AND s1.objektklasse_gesamt = 0

                """

                data = ()

                try:
                    self.db_qkan.sql(sql, "Info Entwässerungsart bewertete Schächte Objektklasse 0", data)
                except:
                    pass
                attr = self.db_qkan.fetchall()
                if attr != []:
                    rw = 0
                    sw = 0
                    mw = 0
                    for i in attr:
                        if i[1] == 'Regenwasser':
                            rw += 1
                        if i[1] == 'Schmutzwasser':
                            sw += 1
                        if i[1] == 'Mischwasser':
                            mw += 1

                        self.anz_schaechte_0_rw = rw
                        self.anz_schaechte_0_sw = sw
                        self.anz_schaechte_0_mw = mw

                    # anzahl schaechte 1
                    sql = """
                        SELECT s1.schnam,
                    schaechte.entwart
                    FROM schaechte_untersucht_bewertung s1,schaechte
                    JOIN (
                        SELECT schnam, MAX(DATE(untersuchtag)) AS max_untersuchtag
                        FROM schaechte_untersucht_bewertung 
                        GROUP BY schnam) s2
                    ON s1.schnam = s2.schnam AND DATE(s1.untersuchtag) = s2.max_untersuchtag
                    WHERE s1.schnam =schaechte.schnam
                        AND s1.objektklasse_gesamt = 1
                    """

                    data = ()

                    try:
                        self.db_qkan.sql(sql, "Info Entwässerungsart bewertete Schächte Objektklasse 1", data)
                    except:
                        pass
                    attr = self.db_qkan.fetchall()
                    if attr != []:
                        if attr[0] != None:
                            rw = 0
                            sw = 0
                            mw = 0
                            for i in attr:
                                if i[1] == 'Regenwasser':
                                    rw += 1
                                if i[1] == 'Schmutzwasser':
                                    sw += 1
                                if i[1] == 'Mischwasser':
                                    mw += 1

                                self.anz_schaechte_1_rw = rw
                                self.anz_schaechte_1_sw = sw
                                self.anz_schaechte_1_mw = mw

                    # anzahl schaechte 2
                    sql = """
                        SELECT s1.schnam,
                    schaechte.entwart
                    FROM schaechte_untersucht_bewertung s1,schaechte
                    JOIN (
                        SELECT schnam, MAX(DATE(untersuchtag)) AS max_untersuchtag
                        FROM schaechte_untersucht_bewertung 
                        GROUP BY schnam) s2
                    ON s1.schnam = s2.schnam AND DATE(s1.untersuchtag) = s2.max_untersuchtag
                    WHERE s1.schnam =schaechte.schnam
                        AND s1.objektklasse_gesamt = 2
                    """

                    data = ()

                    try:
                        self.db_qkan.sql(sql, "Info Entwässerungsart bewertete Schächte Objektklasse 2", data)
                    except:
                        pass
                    attr = self.db_qkan.fetchall()
                    if attr != []:
                        if attr[0] != None:
                            rw = 0
                            sw = 0
                            mw = 0
                            for i in attr:
                                if i[1] == 'Regenwasser':
                                    rw += 1
                                if i[1] == 'Schmutzwasser':
                                    sw += 1
                                if i[1] == 'Mischwasser':
                                    mw += 1

                                self.anz_schaechte_2_rw = rw
                                self.anz_schaechte_2_sw = sw
                                self.anz_schaechte_2_mw = mw

                    # anzahl schaechte 3
                    sql = """
                        SELECT s1.schnam,
                    schaechte.entwart
                    FROM schaechte_untersucht_bewertung s1,schaechte
                    JOIN (
                        SELECT schnam, MAX(DATE(untersuchtag)) AS max_untersuchtag
                        FROM schaechte_untersucht_bewertung 
                        GROUP BY schnam) s2
                    ON s1.schnam = s2.schnam AND DATE(s1.untersuchtag) = s2.max_untersuchtag
                    WHERE s1.schnam =schaechte.schnam
                        AND s1.objektklasse_gesamt = 3
                    """

                    data = ()

                    try:
                        self.db_qkan.sql(sql, "Info Entwässerungsart bewertete Schächte Objektklasse 3", data)
                    except:
                        pass
                    attr = self.db_qkan.fetchall()
                    if attr != []:
                        if attr[0] != None:
                            rw = 0
                            sw = 0
                            mw = 0
                            for i in attr:
                                if i[1] == 'Regenwasser':
                                    rw += 1
                                if i[1] == 'Schmutzwasser':
                                    sw += 1
                                if i[1] == 'Mischwasser':
                                    mw += 1

                                self.anz_schaechte_3_rw = rw
                                self.anz_schaechte_3_sw = sw
                                self.anz_schaechte_3_mw = mw

                    # anzahl schaechte 4
                    sql = """
                        SELECT s1.schnam,
                    schaechte.entwart
                    FROM schaechte_untersucht_bewertung s1,schaechte
                    JOIN (
                        SELECT schnam, MAX(DATE(untersuchtag)) AS max_untersuchtag
                        FROM schaechte_untersucht_bewertung 
                        GROUP BY schnam) s2
                    ON s1.schnam = s2.schnam AND DATE(s1.untersuchtag) = s2.max_untersuchtag
                    WHERE s1.schnam =schaechte.schnam
                        AND s1.objektklasse_gesamt = 4
                    """

                    data = ()

                    try:
                        self.db_qkan.sql(sql, "Info Entwässerungsart bewertete Schächte Objektklasse 4", data)
                    except:
                        pass
                    attr = self.db_qkan.fetchall()
                    if attr != []:
                        if attr[0] != None:
                            rw = 0
                            sw = 0
                            mw = 0
                            for i in attr:
                                if i[1] == 'Regenwasser':
                                    rw += 1
                                if i[1] == 'Schmutzwasser':
                                    sw += 1
                                if i[1] == 'Mischwasser':
                                    mw += 1

                                self.anz_schaechte_4_rw = rw
                                self.anz_schaechte_4_sw = sw
                                self.anz_schaechte_4_mw = mw

                    # anzahl schaechte 5
                    sql = """
                        SELECT s1.schnam,
                    schaechte.entwart
                    FROM schaechte_untersucht_bewertung s1,schaechte
                    JOIN (
                        SELECT schnam, MAX(DATE(untersuchtag)) AS max_untersuchtag
                        FROM schaechte_untersucht_bewertung 
                        GROUP BY schnam) s2
                    ON s1.schnam = s2.schnam AND DATE(s1.untersuchtag) = s2.max_untersuchtag
                    WHERE s1.schnam =schaechte.schnam
                        AND s1.objektklasse_gesamt = 5
                    """

                    data = ()

                    try:
                        self.db_qkan.sql(sql, "Info Entwässerungsart bewertete Schächte Objektklasse 5", data)
                    except:
                        pass
                    attr = self.db_qkan.fetchall()
                    if attr != []:
                        if attr[0] != None:
                            rw = 0
                            sw = 0
                            mw = 0
                            for i in attr:
                                if i[1] == 'Regenwasser':
                                    rw += 1
                                if i[1] == 'Schmutzwasser':
                                    sw += 1
                                if i[1] == 'Mischwasser':
                                    mw += 1

                                self.anz_schaechte_5_rw = rw
                                self.anz_schaechte_5_sw = sw
                                self.anz_schaechte_5_mw = mw

                    # anzahl im untersuchungszyklus
                    sql = """
                                    SELECT s1.schnam,
                                    schaechte.entwart
                                    FROM schaechte_untersucht_bewertung s1,schaechte
                                            WHERE s1.schnam =schaechte.schnam
                                            AND  s1.untersuchtag BETWEEN ? AND ?
                                """

                    data = (untersuch1, untersuch2)

                    try:
                        self.db_qkan.sql(sql, "Info Entwässerungsart bewertete Haltungen Objektklasse 5",
                                         data)
                    except:
                        pass
                    attr = self.db_qkan.fetchall()
                    if attr != None and attr != []:
                        rw = 0
                        sw = 0
                        mw = 0
                        for i in attr:
                            if i[1] == 'Regenwasser':
                                rw += i[2]
                            if i[1] == 'Schmutzwasser':
                                sw += i[2]
                            if i[1] == 'Mischwasser':
                                mw += i[2]

                            self.anz_schaechte_untersuch_rw = round(rw / 1000, 2)
                            self.anz_schaechte_untersuch_sw = round(sw / 1000, 2)
                            self.anz_schaechte_untersuch_mw = round(mw / 1000, 2)

                    # laenge im berichtsjahr
                    sql = """
                                    SELECT s1.schnam,
                                    schaechte.entwart
                                    FROM schaechte_untersucht_bewertung s1,schaechte
                                            WHERE s1.schnam =schaechte.schnam
                                            AND  s1.untersuchtag like ?
                                        """

                    data = (bericht,)

                    try:
                        self.db_qkan.sql(sql, "Info Entwässerungsart bewertete Haltungen Objektklasse 5",
                                         data)
                    except:
                        pass
                    attr = self.db_qkan.fetchall()
                    if attr != None and attr != []:
                        rw = 0
                        sw = 0
                        mw = 0
                        for i in attr:
                            if i[1] == 'Regenwasser':
                                rw += i[2]
                            if i[1] == 'Schmutzwasser':
                                sw += i[2]
                            if i[1] == 'Mischwasser':
                                mw += i[2]

                            self.anz_schaechte_untersuch_bj_rw = round(rw / 1000, 2)
                            self.anz_schaechte_untersuch_bj_sw = round(sw / 1000, 2)
                            self.anz_schaechte_untersuch_bj_mw = round(mw / 1000, 2)


    def run(self) -> None:
            """
            Export der Kanaldaten aus einer QKan-SpatiaLite-Datenbank und Schreiben in eine XML-Datei
            """

            self._infos()
            self.anzeigen()
            self._suewvo()

            # Close connection
            del self.db_qkan




