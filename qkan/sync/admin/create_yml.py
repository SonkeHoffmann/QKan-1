# todo: 2026-03-15: geom durch {gobj} ersetzen
# todo: 2026-03-15: Umstellung auf neue Selektion

# Hilfsprogramm zur Erstellung der Datei sqlite.yml
# 1. Erstellen einer leeren QKan-Datenbank 'C:/qkan/demo.sqlite' mit QKan
# 2. Ggfs nachfolgende Listen TABLES_GEOM etc. aktualisieren
# 3. Ausführen der Datei 'create_yml.bat'

import textwrap
import sqlite3
import os, sys
import tkinter

# ggfs. nachfolgende Listen aus der Datei __init__.py aktualisieren
# Vorgabe: Es gibt nur 1 Geoobjekt, Index ist ngeo

TABLES_GEOM = [
    "notizen",
    "haltungen",
    "haltungen_untersucht",
    "untersuchdat_haltung",
    "anschlussleitungen",
    "anschlussleitungen_untersucht",
    "anschlussschaechte",
    "untersuchdat_anschlussleitung",
    "untersuchdat_schacht",
    "einzugsgebiete",
    "teilgebiete",
    "flaechen",
    "tezg",
    "einleit",
    "aussengebiete",
    "symbole",
]

TABLES_GEOP = [
    "schaechte",
    "schaechte_untersucht",
]

TABLES_GLINK = [
    "linkfl",
    "linksw",
    "linkageb",
]

TABLES_ATTR = [
    # "simulationsstatus",
    # "material",
    # "auslasstypen",
    # "abflussparameter",
    # "flaechentypen",
    # "bodenklassen",
    # "abflusstypen",
    # "knotentypen",
    # "schachttypen",
    # "eigentum",
    # "symbolkatalog",
    # # "dynahal",
    # "gruppen",
    # "profile",
    # "entwaesserungsarten",
    # "haltungstypen",
    # "untersuchrichtung",
    # "wetter",
    # "bewertungsart",
    # "pumpentypen",
    "pruefsql",
    # "pruefliste",
    # "reflist_zustand",
    # "info",
    "refdata",
    "fotos",
    "videos",
]

def meldung(anztext):
    def ende():
        main.destroy()
    main = tkinter.Tk()
    anzeige = tkinter.Label(main, text = anztext)
    anzeige.pack()
    bEnde = tkinter.Button(main,text = "O.K.", command=ende)
    bEnde.pack()
    main.mainloop()

def writesql(cur, fw, tabnam, sqls):
    tabtitle = tabnam.title()

    attrlis = []
    typlis  = []
    fieldlis = []
    objnam = None
    igeo = None             # Index des ersten Geoobjekts
    ngeo   = None           # Index des zu synchronisierenden Geoobjekts in attrlis und typlis. Bei Attributtabellen ist ngeo = None
    nattr  = 0               # Gesamtlänge der Attributliste inkl. Geoobjekte

    if tabnam in TABLES_GEOM:
        gobj = 'geom'
    elif tabnam in TABLES_GEOP:
        gobj = 'geop'
    elif tabnam in TABLES_GLINK:
        gobj = 'glink'
    elif tabnam in TABLES_ATTR:
        gobj = None
    else:
        meldung(f'Fehler: Die Tabelle {tabnam} konnte in den Listen "TABLES_XXXX" nicht gefunden werden!')
        return

    rs = cur.execute(f"PRAGMA table_info('{tabnam}')")
    for _, attr, typ, notnull, dflt_value, is_pk in rs:
        if is_pk == 0 and attr != 'createdat':
            attrlis.append(attr)
            typlis.append(typ)
            fieldlis.append([attr, typ])
            if objnam is None:
                objnam = attr
            if typ[:3] not in ['INT', 'REA', 'TEX']:
                if igeo is None:
                    igeo = nattr
            nattr += 1
    rs.close

    if igeo is None:
        nlis = nattr        # Anzahl Attribute ohne Geoobjekte
    else:
        nlis = igeo         # Anzahl Attribute ohne Geoobjekte

        for i in range(nlis,nattr):
            if attrlis[i] == gobj:
                ngeo = i
        if ngeo is None:
            meldung(f'Fehler: Das Geoobjekt konnte in den Listen "TABLES_XXXX" nicht gefunden werden!')
            raise Exception("Fehler 1")

    # Attributlisten ohne und mit prefixen vorbereiten
    attributes = '\n    '.join(textwrap.wrap(', '.join(attrlis[:nlis])))
    attributes_ex = '\n    '.join(textwrap.wrap(', ex.'.join(attrlis[:nlis])))
    attributes_be = '\n    '.join(textwrap.wrap(', be.'.join(attrlis[:nlis])))
    if gobj is not None:
        geoattr =   f',\n    geom'
        geoattrs =  f',\n    {gobj}'
        geoattrex = f',\n    ex.{gobj} AS {gobj}'
        geoattrbe = f',\n    be.{gobj} AS {gobj}'
        objattr = 'objekt, '
    else:
        geoattr = ''
        geoattrs =  ''
        geoattrex = ''
        geoattrbe = ''
        objattr = ''

    # ---------------------------------------------------------------------------------------------------------------------
    # Synchronisationstabelle erstellen
    sqls[f'sync_create_{tabnam}'] = f'''        CREATE TABLE IF NOT EXISTS sync_{tabnam} (
        pk INTEGER PRIMARY KEY,
        pk_best INTEGER,
        pk_ext INTEGER,
        aktion TEXT,
        status INTEGER''' + \
    (',\n    ' if gobj is None else ',\n    objekt TEXT,\n    ') + \
    ',\n    '.join([f'{attr} {typ}' for attr, typ in fieldlis[:nlis] if attr != 'createdat']) + ');'

    # logger.debug(f'sync_create_{tabnam}:\n')
    # logger.debug(sqls[f'sync_create_{tabnam}'])

    if gobj is not None:
        if ngeo is None:
            meldung(f'Fehler in Tabelle {tabnam}: {gobj=}, aber ngeo = None')
            raise Exception("Fehler 2")
        typ = typlis[ngeo]
        sqls[f'sync_create_{tabnam}_geom'] = \
        f'''SELECT AddGeometryColumn('sync_{tabnam}', 'geom', :epsg, '{typ}', 2);'''

    sqls[f'sync_reset_{tabnam}'] = f'DELETE FROM sync_{tabnam};'

    # ---------------------------------------------------------------------------------------------------------------------
    # Datensätze, die nur in der externen Datenbank vorkommen, Vergleich anhand Objektbezeichnung
    sqls[f'sync_{tabnam}_ext'] = f'''        INSERT INTO sync_{tabnam} (
            pk_best, pk_ext, {objnam}, {objattr}aktion, status,
            {attributes}{geoattr})
        SELECT 
            NULL AS pk_best, ex.pk AS pk_ext, ex.{objnam},''' + \
    ("" if gobj is None else "\n    'Datensatz nicht im Bestand' AS objekt,") + f'''
            'hinzufügen' AS aktion, :status_add AS status,      /* hinzufügen */ 
            ex.{attributes_ex}{geoattrex}
            FROM (
                SELECT * 
              FROM ext.{tabnam} AS t
              GROUP BY t.{objnam}
              HAVING count() = 1
          ) AS ex
          LEFT JOIN (
              SELECT *
              FROM main.{tabnam} AS t
              GROUP BY t.{objnam}
              HAVING count() = 1
          ) AS be
          ON be.{objnam} = ex.{objnam}
          WHERE be.pk IS NULL;'''

    # ---------------------------------------------------------------------------------------------------------------------
    # Datensätze, die nur in der bestehenden Datenbank vorkommen, Vergleich anhand Objektbezeichnung
    sqls[f'sync_{tabnam}_local'] = f'''            INSERT INTO sync_{tabnam} (
                pk_best, pk_ext, {objnam}, {objattr}aktion, status,
                {attributes}{geoattr})\nSELECT
                be.pk AS pk_best, NULL AS pk_ext, be.{objnam},''' + \
    ("" if gobj is None else "\n    'Datensatz extern nicht vorhanden' AS objekt,") + f'''
             'löschen' AS aktion, :status_del AS status,      /* löschen */
              be.{attributes_be}{geoattrbe}
        FROM (
            SELECT *
            FROM main.{tabnam} AS t
            GROUP BY t.{objnam}
            HAVING count() = 1
        ) AS be
        LEFT JOIN (
            SELECT * 
            FROM ext.{tabnam} AS t
            GROUP BY t.{objnam}
            HAVING count() = 1
        ) AS ex
        ON be.{objnam} = ex.{objnam}
        WHERE ex.pk IS NULL;'''

    # ---------------------------------------------------------------------------------------------------------------------
    # Datensätze mit gleichem Namen, die sich in mindestens einem Attribut unterscheiden
    sql = f'''        INSERT INTO sync_{tabnam} (
            pk_best, pk_ext, {objnam}, {objattr}aktion, status,
            {attributes}{geoattr})
        SELECT
            be.pk AS pk_best,
            ex.pk AS pk_ext,
            ex.{objnam},''' + \
    ("" if gobj is None else f"\n    iif(be.{gobj} <> ex.{gobj}, printf('Geometrie geändert'), NULL) AS objekt,") + f'''
            'ändern' AS aktion,
            :status_mod AS status'''
    for attr, typ in fieldlis[:nlis]:
        if attr == 'createdat':
            pass
        elif typ == 'TEXT':
            sql += f",\n    iif(be.{attr} <> ex.{attr}, printf('%s -> %s', be.{attr}, ex.{attr}), NULL) AS {attr}"
        elif typ[:3] == 'INT':
            sql += f",\n    iif(be.{attr} <> ex.{attr}, printf('%d -> %d', be.{attr}, ex.{attr}), NULL) AS {attr}"
        elif typ == 'REAL':
            sql += f",\n    iif(coalesce(abs(be.{attr} - ex.{attr}), 0) > 0.001, printf('%.3f -> %.3f', be.{attr}, ex.{attr}), NULL) AS {attr}"
        else:
            meldung(f'Fehler 1: {attr=}, {typ=}')
            raise Exception("Fehler 3")
    sql += ("" if gobj is None else f",\n    be.{gobj} AS {gobj}") + f'''
        FROM (
            SELECT *
            FROM main.{tabnam} AS t
            GROUP BY t.{objnam}
            HAVING count() = 1
        ) AS be
        JOIN (
            SELECT * 
            FROM ext.{tabnam} AS t
            GROUP BY t.{objnam}
            HAVING count() = 1
        ) AS ex
        ON ex.{objnam} = be.{objnam}
        WHERE
        '''
    prefix = ''
    for attr, typ in fieldlis[:nlis]:
        if attr == 'createdat':
            pass
        elif typ in ['TEXT', 'INT', 'INTEGER']:
            sql += prefix + f"be.{attr} <> ex.{attr}"
        elif typ == 'REAL':
            sql += prefix + f"coalesce(abs(be.{attr} - ex.{attr}), 0) > 0.001"
        if prefix == '':
            prefix = ' OR\n    '
    sql += (";" if gobj is None else prefix + f"be.{gobj} <> ex.{gobj};")
    sqls[f'sync_{tabnam}_dif'] = sql

    # ---------------------------------------------------------------------------------------------------------------------
    # Datensätze hinzufügen
    sqls[f'sync_{tabnam}_add'] = f'''        INSERT INTO main.{tabnam} (
            {objnam}, {attributes}{geoattrs})
        SELECT
            ex.{objnam}, ex.{attributes_ex}''' + \
     ("" if gobj is None else f",\n    ex.{gobj} AS {gobj}") + f'''
        FROM ext.{tabnam} AS ex
        JOIN sync_{tabnam} AS sy ON ex.pk = sy.pk_ext
        WHERE sy.aktion = 'hinzufügen'
          AND sy.status;'''

    # ---------------------------------------------------------------------------------------------------------------------
    # Datensätze löschen
    sqls[f'sync_{tabnam}_del'] = f'''        DELETE FROM main.{tabnam}
        WHERE pk IN (
            SELECT pk_best
            FROM sync_{tabnam}
            WHERE aktion = 'löschen'
              AND status);'''

    # ---------------------------------------------------------------------------------------------------------------------
    # Datensätze ändern
    sql = f'''        UPDATE main.{tabnam}
        SET\n    ''' + \
        ',\n    '.join([f'{el} = mo.{el}' for el in attrlis[:nlis]]) + \
    ('\n' if gobj is None else f',\n    {gobj} = mo.{gobj}\n') + \
       '''           FROM (
           SELECT
               sy.pk_best AS pk_best'''
    for attr, typ in fieldlis[:nlis]:
        if typ == 'TEXT':
            sql += f",\n        iif(sy.{attr} IS NOT NULL AND sy.{attr} <> '', ex.{attr}, be.{attr}) AS {attr}"
        elif typ in ['REAL', 'INT', 'INTEGER']:
            sql += f",\n        iif(sy.{attr} IS NOT NULL, ex.{attr}, be.{attr}) AS {attr}"
        else:
            meldung(f'Fehler 2: {attr=}, {typ=}')
            raise Exception("Fehler 4")
    sql += ("" if gobj is None else f",\n        iif(sy.objekt IS NOT NULL AND sy.objekt <> '', ex.{gobj}, be.{gobj}) AS {gobj}")
    sql += f'''
            FROM sync_{tabnam} AS sy
            JOIN main.{tabnam} AS be ON be.pk = sy.pk_best
            JOIN ext.{tabnam} AS ex ON ex.pk = sy.pk_ext
            WHERE sy.aktion = 'ändern'
              AND status
        ) AS mo
        WHERE main.{tabnam}.pk = mo.pk_best;'''
    sqls[f'sync_{tabnam}_mod'] = sql
    # ---------------------------------------------------------------------------------------------------------------------
    # Datensätze auflisten
    sqls[f'sync_{tabnam}_prot'] = f'SELECT * FROM sync_{tabnam} WHERE status;'

header = '''# Do not modify! File is automatically generated by ./admin/create_yml.py

# SQL name pattern for all tables:
#   sync_create_{table},
#   sync_create_{table}_geom,
#   sync_reset_{table},
#   sync_{table}_ext,
#   sync_{table}_local,
#   sync_{table}_dif,
#
#   sync_{table}_add,
#   sync_{table}_del,
#   sync_{table}_mod

sync_attach_ext: "
ATTACH DATABASE ? AS ext;"

# table_exists: "
# PRAGMA table_info({tabnam});"

'''

sqls = {}

def main(qkfile):
    con = sqlite3.connect(qkfile)
    cur = con.cursor()

    tables = TABLES_GEOM + TABLES_GEOP + TABLES_GLINK + TABLES_ATTR
    tablis = sorted(list(set(tables)))
    if len(tables) != len(tablis):
        meldung(f'Fehler: Keine Tabelle darf in mehr als einer Liste "TABLES_XXXX" vorkommen!')
        return
    with open('sqlite.yml', 'w', encoding = 'utf-8') as fw:
        fw.write(header)
        for tabnam in tablis:
            writesql(cur, fw, tabnam, sqls)

        # SQLs schreiben
        for key in sqls.keys():
            fw.write(f"{key}:\n{sqls[key]}\n\n")


_, *flis = sys.argv
if len(flis) == 1:
    qkfile = flis[0]
else:
    qkfile = 'C:/qkan/demo.sqlite'

if os.path.exists(qkfile):
    main(qkfile)
    meldung(f'SQL-Datei "sqlite.yml" wurde erfolgreich erstellt!')
else:
    meldung(f'Keine Vorlage-QKan-Datenbank gefunden. Bitte neu erzeugen: {qkfile}')
