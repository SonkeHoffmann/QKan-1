"""

  Aktualisierung der Verknüpfungen für Flächen und SW-Einleiter
  =============================================================

  Für den Benutzer ist bei den Verknüpfungen der Flächen bzw. SW-Einleitern 
  mit den Haltungen ausschließlich die graphische maßgebend. Vor Nutzung 
  der verschiedenen Funktionen müssen diese Verknüpfung in die logischen
  übertragen werden. 

  | Dateiname            : updatelinks.py
  | Date                 : February 2018
  | Copyright            : (C) 2018 by Joerg Hoettges
  | Email                : hoettges@fh-aachen.de

  This program is free software; you can redistribute it and/or modify  
  it under the terms of the GNU General Public License as published by  
  the Free Software Foundation; either version 2 of the License, or     
  (at your option) any later version.

"""

__author__ = "Joerg Hoettges"
__date__ = "February 2018"
__copyright__ = "(C) 2018, Joerg Hoettges"

from qkan.database.dbfunc import DBConnection
from qkan.tools.qkan_utils import check_flaechenbilanz, checknames, fortschritt
from qkan.utils import get_logger

logger = get_logger("QKan.linkflaechen.updatelinks")

# progress_bar = None


def updatelinkfl(
    db_qkan: DBConnection,
    radiusHal: float = 0.1,
    flaechen_bereinigen: bool = False,
    deletelinkGeomNone: bool = True,
) -> bool:
    """Aktualisierung des logischen Cache für die Tabelle "linkfl"

    :db_qkan:                  Datenbankobjekt, das die Verknüpfung zur QKan-SpatiaLite-Datenbank verwaltet.
    :type db_qkan:             DBConnection

    :radiusHal:             Fangradius für das Verknüpfungsende auf der Haltung
    :type radiusHal:        Float

    :flaechen_bereinigen: Vor der Bearbeitung werden die Tabellen "flaechen" und "tezg" mit MakeValid korrigiert
    :type flaechen_bereinigen: Boolean

    Für den Benutzer maßgebend ist ausschließlich die graphische
    Verknüpfung von linkfl. Der Export basiert aber aus Performancegründen
    ausschließlich auf der logischen Verknüpfung ("logischer Cache").
    Deshalb erfolgt hier die Anpassung bzw. Korrektur der logischen Verknüpfungen.
    Aus Performancegründen wird in den nachfolgenden Abfragen zunächst immer
    eine Auswahl der Datensätze aus "linkfl" vorgenommen, bei denen die logische
    Verknüpfung mit der graphischen übereinstimmt (Unterabfrage "linksvalid")
    und die Korrektur nur für die darin nicht enthaltenen Datensätze durchgeführt.
    """

    db_qkan.loadmodule("linkflaechen")

    # Statusmeldung in der Anzeige
    # global progress_bar
    # progress_bar = QProgressBar(iface.messageBar())
    # progress_bar.setRange(0, 100)
    # status_message = iface.messageBar().createMessage("",
    # "Bereinigung Flächenverknüpfungen in Arbeit. Bitte warten.")
    # status_message.layout().addWidget(progress_bar)
    # iface.messageBar().pushWidget(status_message, Qgis.MessageLevel.Info, 10)

    # progress_bar.setValue(1)

    # MakeValid auf Tabellen "flaechen" und "tezg".
    if flaechen_bereinigen:
        if not db_qkan.sql(
            db_qkan.load_query("linkflaechen_update_flaechen_makevalid"), "k_link.createlinkfl (1)"
        ):
            # progress_bar.reset()
            return False
        if not db_qkan.sql(
            db_qkan.load_query("linkflaechen_update_tezg_makevalid"), "k_link.createlinkfl (2)"
        ):
            # progress_bar.reset()
            return False
        # Flächen prüfen und ggfs. Meldung anzeigen
        if not check_flaechenbilanz(db_qkan):
            return False

    # Vorbereitung flaechen: Falls flnam leer ist, plausibel ergänzen:
    if not checknames(db_qkan, "flaechen", "flnam", "f_", True):
        return False

    # Löschen von Datensätzen ohne Linienobjekt
    if deletelinkGeomNone:
        if not db_qkan.sql(
            db_qkan.load_query("linkflaechen_delete_linkfl_glink_null"),
            "db_qkan: linkflaechen.updatelinks.updatelinkfl (1)",
        ):
            return False

    # 1. Flächen in "linkfl" eintragen (ohne Einschränkung auf auswahl)
    # In der Unterabfrage "linksvalid" wird eine Liste aller nicht korrekter Verknüpfungen
    # aus linkfl erstellt,
    # so dass im UPDATE-Teil nur noch alle darin enthaltenen Verknüpfungen bearbeitet werden

    sql = db_qkan.load_query("linkflaechen_updatelinkfl_set_flnam")

    if not db_qkan.sql(sql, "db_qkan: linkflaechen.updatelinks.updatelinkfl (2)"):
        return False

    # progress_bar.setValue(30)

    # 2. Haltungen in "linkfl" eintragen (ohne Einschränkung auf auswahl)
    # Logik wie vor

    sql = db_qkan.load_query("linkflaechen_updatelinkfl_set_haltnam")

    if not db_qkan.sql(
        sql,
        "db_qkan: linkflaechen.updatelinks.updatelinkfl (3)",
        parameters=(radiusHal, radiusHal),
    ):
        return False

    # progress_bar.setValue(65)

    # 3. TEZG-Flächen in "linkfl" eintragen (ohne Einschränkung auf auswahl), nur für aufteilen = 'ja'
    # Gleiche Logik wie zuvor. Zusätzlich sind alle Flächen, die nicht aufgeteilt werden müssen, in
    # linksvalid enthalten, da Sie auf keinen Fall einen Eintrag in "tezgnam" erhalten sollen.

    sql = db_qkan.load_query("linkflaechen_updatelinkfl_set_tezgnam")

    if not db_qkan.sql(
        sql, "db_qkan: linkflaechen.updatelinks.updatelinkfl (4)", parameters=(radiusHal,)
    ):
        return False

    db_qkan.commit()

    fortschritt("Ende...", 1)

    return True


def updatelinksw(
    db_qkan: DBConnection, radiusHal: float = 0.1, deletelinkGeomNone: bool = True
) -> bool:
    db_qkan.loadmodule("linkflaechen")

    # Datenvorbereitung: Verknüpfung von Einleitpunkt zu Haltung wird durch Tabelle "linksw"
    # repräsentiert. Diese Zuordnung wird zunächst in "einleit.haltnam" übertragen.

    # Statusmeldung in der Anzeige
    # global progress_bar
    # progress_bar = QProgressBar(iface.messageBar())
    # progress_bar.setRange(0, 100)
    # status_message = iface.messageBar().createMessage("",
    # "Bereinigung Einzeleinleiter-Verknüpfungen in Arbeit. Bitte warten.")
    # status_message.layout().addWidget(progress_bar)
    # iface.messageBar().pushWidget(status_message, Qgis.MessageLevel.Info, 10)

    # progress_bar.setValue(1)

    # Löschen von Datensätzen ohne Linienobjekt
    if deletelinkGeomNone:
        sql = db_qkan.load_query("linkflaechen_delete_linksw_glink_null")

        if not db_qkan.sql(sql, "db_qkan: linkflaechen.updatelinks.updatelinksw (2)"):
            return False

    # 1. einleit-Punkt in "linksw" eintragen (ohne Einschränkung auf auswahl)

    sql = db_qkan.load_query("linkflaechen_updatelinksw_set_elnam")

    if not db_qkan.sql(
        sql,
        "db_qkan: linkflaechen.updatelinks.updatelinksw (3)",
        parameters=(radiusHal, radiusHal),
    ):
        return False

    # progress_bar.setValue(30)

    # 2. Haltungen in "linksw" eintragen (ohne Einschränkung auf auswahl)

    sql = db_qkan.load_query("linkflaechen_updatelinksw_set_haltnam")

    logger.debug("\nSQL-4b:\n{}\n".format(sql))

    if not db_qkan.sql(
        sql,
        "db_qkan: linkflaechen.updatelinks.updatelinksw (4)",
        parameters=(radiusHal, radiusHal),
    ):
        return False

    # progress_bar.setValue(60)

    # 3. Haltungen in "einleit" eintragen (ohne Einschränkung auf auswahl)

    # 3.2 Eintrag vornehmen

    sql = db_qkan.load_query("linkflaechen_updatelinksw_sync_einleit_haltnam")

    logger.debug("\nSQL-4d:\n{}\n".format(sql))

    if not db_qkan.sql(sql, "db_qkan: linkflaechen.updatelinks.updatelinksw (6)"):
        return False

    db_qkan.commit()

    fortschritt("Ende...", 1)
    # progress_bar.setValue(100)
    # status_message.setText("Bereinigung Einzeleinleiter-Verknüpfungen abgeschlossen.")
    # status_message.setLevel(Qgis.MessageLevel.Success)

    return True


def updatelinkageb(
    db_qkan: DBConnection, radius_hal: float = 0.1, deletelink_geom_none: bool = True
) -> bool:
    db_qkan.loadmodule("linkflaechen")

    # Datenvorbereitung: Verknüpfung von Aussengebiet zu Schacht wird durch Tabelle "linkageb"
    # repräsentiert. Diese Zuordnung wird zunächst in "aussengebiete.schnam" übertragen.

    # Löschen von Datensätzen ohne Linienobjekt
    if deletelink_geom_none:
        if not db_qkan.sql(
            db_qkan.load_query("linkflaechen_delete_linkageb_glink_null"),
            "db_qkan: linkflaechen.updatelinks.updatelinkageb (2)",
        ):
            return False

    # 1. Aussengebiet in "linkageb" eintragen (ohne Einschränkung auf auswahl)

    sql = db_qkan.load_query("linkflaechen_updatelinkageb_set_gebnam")

    if not db_qkan.sql(sql, "db_qkan: linkflaechen.updatelinks.updatelinkageb (3)"):
        return False

    # progress_bar.setValue(30)

    # 2. Schächte in "linkageb" eintragen (ohne Einschränkung auf auswahl)

    sql = db_qkan.load_query("linkflaechen_updatelinkageb_set_schnam")

    logger.debug("\nSQL-4b:\n%s\n", sql)

    if not db_qkan.sql(
        sql,
        "db_qkan: linkflaechen.updatelinks.updatelinkageb (4)",
        parameters=(radius_hal, radius_hal),
    ):
        return False

    # progress_bar.setValue(60)

    # 3. Schächte in "aussengebiete" eintragen (ohne Einschränkung auf auswahl)

    # 3.2 Eintrag vornehmen

    sql = db_qkan.load_query("linkflaechen_updatelinkageb_sync_aussengebiete_schnam")

    logger.debug("\nSQL-4d:\n%s\n", sql)

    if not db_qkan.sql(sql, "db_qkan: linkflaechen.updatelinks.updatelinkageb (6)"):
        return False

    db_qkan.commit()

    fortschritt("Ende...", 1)
    # progress_bar.setValue(100)
    # status_message.setText("Bereinigung Aussengebiete-Verknüpfungen abgeschlossen.")
    # status_message.setLevel(Qgis.MessageLevel.Success)

    return True
