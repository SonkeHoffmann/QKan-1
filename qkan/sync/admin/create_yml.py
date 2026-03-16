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
    # "notizen",
    "haltungen",
    "haltungen_untersucht",
    # "untersuchdat_haltung",
    "anschlussleitungen",
    "anschlussleitungen_untersucht",
    "anschlussschaechte",
    # "untersuchdat_anschlussleitung",
    # "einzugsgebiete",
    # "teilgebiete",
    "flaechen",
    # "linkfl",
    # "linksw",
    "tezg",
    # "einleit",
    # "aussengebiete",
    # "symbole",
]

TABLES_GEOP = [
    "schaechte",
    "schaechte_untersucht",
]

TABLES_GLINK = [
    "linkfl",
    # "linksw",
    # "linkageb",
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
    # "pruefsql",
    # "pruefliste",
    # "reflist_zustand",
    # "info",
    "refdata",
    # "fotos",
    # "videos",
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

def writesql(cur, fw, tabnam):
    tabtitle = tabnam.title()

    attrlis = []
    typlis  = []
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
            if objnam is None:
                objnam = attr
            if typ[:3] not in ['INT', 'REA', 'TEX']:
                if igeo is None:
                    igeo = nattr
            nattr += 1
    rs.close

    # Nur zum Nachvollziehen des Programms
    # with open('tables.txt', 'w') as fil:
        # for el in attrlis:
            # fil.write(f'{el}\n')
        # for el in typlis:
            # fil.write(f'{el}\n')

    if igeo is None:
        nlis = nattr        # Anzahl Attribute ohne Geoobjekte
    else:
        nlis = igeo         # Anzahl Attribute ohne Geoobjekte

        for i in range(nlis,nattr):
            if attrlis[i] == gobj:
                ngeo = i
        if ngeo is None:
            meldung(f'Fehler: Das Geoobjekt konnte in den Listen "TABLES_XXXX" nicht gefunden werden!')
            return

# ---------------------------------------------------------------------------------------------------------------------
    fw.write(f'# {tabtitle}\n')
    fw.write(f'sync_create_{tabnam}: "\n')
    fw.write(f'CREATE TABLE IF NOT EXISTS sync_{tabnam} (\n')
    fw.write( '    pk INTEGER PRIMARY KEY,\n')
    fw.write( '    pk_best INTEGER,\n')
    fw.write( '    pk_ext INTEGER,\n')
    fw.write( '    aktion TEXT,\n')
    fw.write( '    status INTEGER')

    if gobj is not None:
        fw.write(',\n    objekt TEXT')

    for attr, typ in zip(attrlis[:nlis], typlis[:nlis]):
        if attr != 'createdat':
            fw.write(f',\n    {attr} {typ}')
    fw.write(');"\n\n')

    # Attributlisten ohne und mit prefixen
    attributes = '\n    '.join(textwrap.wrap(', '.join(attrlis[1:nlis])))
    attributes_ex = '\n    '.join(textwrap.wrap(', ex.'.join(attrlis[1:nlis])))
    attributes_be = '\n    '.join(textwrap.wrap(', be.'.join(attrlis[1:nlis])))
    if gobj is not None:
        geoattr =   f',\n    {gobj}'
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

    if gobj is not None:
        typ = typlis[ngeo]
        fw.write(f'sync_create_{tabnam}_geom: "\n')
        fw.write(f'''SELECT AddGeometryColumn('sync_{tabnam}', '{gobj}', :epsg, '{typ}', 2);"\n''')

    # if nlis - ngeo >= 1:
        # fw.write(f'sync_create_{tabnam}_geom: "\n')
        # typ = typlis[ngeo]
        # if tabnam == 'schaechte':
            # fw.write(f'''SELECT AddGeometryColumn('sync_{tabnam}', 'geom', :epsg, 'POINT', 2);"\n''')
        # else:
            # fw.write(f'''SELECT AddGeometryColumn('sync_{tabnam}', 'geom', :epsg, '{typ}', 2);"\n''')
    fw.write( '\n')
    fw.write(f'sync_reset_{tabnam}: "\n')
    fw.write(f'DELETE FROM sync_{tabnam};"\n')
    fw.write( '\n')

# ---------------------------------------------------------------------------------------------------------------------
    fw.write(f'# {tabtitle}, die nur in der externen Datenbank vorkommen, Vergleich anhand Objektbezeichnung\n')
    fw.write(f'sync_{tabnam}_ext: "\n')
    fw.write(f'INSERT INTO sync_{tabnam} (\n')
    fw.write(f'    pk_best, pk_ext, {objnam}, {objattr}aktion, status,\n')
    # if nlis - ngeo == 1:
        # fw.write(f'    pk_best, pk_ext, {objnam}, objekt, aktion, status,\n')
    # elif nlis - ngeo > 1:
        # fw.write(f'    pk_best, pk_ext, {objnam}, grafikobjekt, punktobjekt, aktion, status,\n')
    # else:
        # fw.write(f'    pk_best, pk_ext, {objnam}, aktion, status,\n')
    fw.write(f'    {attributes}{geoattr})\nSELECT \n')
    fw.write(f'    NULL AS pk_best, ex.pk AS pk_ext, ex.{objnam},\n')
    if gobj is not None:
        fw.write( "    'Datensatz nicht im Bestand' AS objekt,\n")
    fw.write( "    'hinzufügen' AS aktion, 1 AS status,      /* hinzufügen */\n")
    fw.write(f'    ex.{attributes_ex}{geoattrex}\n')
    fw.write( 'FROM (\n')
    fw.write( '    SELECT * \n')
    fw.write(f'    FROM ext.{tabnam} AS t\n')
    if gobj is not None and not '_untersucht' in tabnam:               # todo: 2026-03-15 noch zu bearbeiten
        fw.write( '    WHERE NOT :seltgb\n')
        fw.write( '       OR t.teilgebiet IN (SELECT tgnam FROM sel_teilgebiete)\n')
    fw.write(f'    GROUP BY t.{objnam}\n')
    fw.write( '    HAVING count() = 1\n')
    fw.write( ') AS ex\n')
    fw.write( 'LEFT JOIN (\n')
    fw.write( '    SELECT *\n')
    fw.write(f'    FROM main.{tabnam} AS t\n')
    if gobj is not None and not '_untersucht' in tabnam:
        fw.write( '    WHERE NOT :seltgb\n')
        fw.write( '       OR t.teilgebiet IN (SELECT tgnam FROM sel_teilgebiete)\n')
    fw.write(f'    GROUP BY t.{objnam}\n')
    fw.write( '    HAVING count() = 1\n')
    fw.write( ') AS be\n')
    fw.write(f'ON be.{objnam} = ex.{objnam}\n')
    fw.write( 'WHERE be.pk IS NULL;"\n')
    fw.write( '\n')

# ---------------------------------------------------------------------------------------------------------------------
    fw.write(f'# {tabtitle}, die nur in der bestehenden Datenbank vorkommen, Vergleich anhand Objektbezeichnung\n')
    fw.write(f'sync_{tabnam}_local: "\n')
    fw.write(f'INSERT INTO sync_{tabnam} (\n')
    # if nlis - ngeo == 1:
    fw.write(f'    pk_best, pk_ext, {objnam}, {objattr}aktion, status,\n')
    # elif nlis - ngeo > 1:
        # fw.write(f'    pk_best, pk_ext, {objnam}, grafikobjekt, punktobjekt, aktion, status,\n')
    # else:
        # fw.write(f'    pk_best, pk_ext, {objnam}, aktion, status,\n')
    fw.write(f'    {attributes}{geoattr})\nSELECT\n')
    fw.write(f'    be.pk AS pk_best, NULL AS pk_ext, be.{objnam},\n')
    if gobj is not None:
        fw.write( "    'Datensatz extern nicht vorhanden' AS objekt,\n")
    fw.write( "    'löschen' AS aktion, 0 AS status,      /* löschen */\n")
    fw.write(f'    be.{attributes_be}{geoattrbe}\n')
    fw.write( 'FROM (\n')
    fw.write( '    SELECT *\n')
    fw.write(f'    FROM main.{tabnam} AS t\n')
    if gobj is not None and not '_untersucht' in tabnam:
        fw.write( '    WHERE NOT :seltgb\n')
        fw.write( '       OR t.teilgebiet IN (SELECT tgnam FROM sel_teilgebiete)\n')
    fw.write(f'    GROUP BY t.{objnam}\n')
    fw.write( '    HAVING count() = 1\n')
    fw.write( ') AS be\n')
    fw.write( 'LEFT JOIN (\n')
    fw.write( '    SELECT * \n')
    fw.write(f'    FROM ext.{tabnam} AS t\n')
    if gobj is not None and not '_untersucht' in tabnam:
        fw.write( '    WHERE NOT :seltgb\n')
        fw.write( '       OR t.teilgebiet IN (SELECT tgnam FROM sel_teilgebiete)\n')
    fw.write(f'    GROUP BY t.{objnam}\n')
    fw.write( '    HAVING count() = 1\n')
    fw.write( ') AS ex\n')
    fw.write(f'ON be.{objnam} = ex.{objnam}\n')
    fw.write( 'WHERE ex.pk IS NULL;"\n')
    fw.write( '\n\n')

# ---------------------------------------------------------------------------------------------------------------------
    fw.write(f'# {tabtitle} mit gleichem Namen, die sich in mindestens einem Attribut unterscheiden\n')
    if tabnam == 'schaechte':
        fw.write('# geom wird zwar im Vergleich berücksichtigt, aber nicht in sync_schaechte gespeichert. Achtung sync_schachte.geom = schaechte.geop!\n')
    fw.write(f'sync_{tabnam}_dif: "\n')
    fw.write(f'INSERT INTO sync_{tabnam} (\n')
    fw.write(f'    pk_best, pk_ext, {objnam}, {objattr}aktion, status,\n')
    fw.write(f'    {attributes}{geoattr})\n')
    fw.write( 'SELECT\n')
    fw.write( '    be.pk AS pk_best,\n')
    fw.write( '    ex.pk AS pk_ext,\n')
    fw.write(f'    ex.{objnam},\n')
    if gobj is not None:
        fw.write(f"    iif(be.{gobj} <> ex.{gobj}, printf('Geometrie geändert'), NULL) AS objekt,\n")
    fw.write( "    'ändern' AS aktion,\n")
    fw.write( '    1 AS status')
    for attr, typ in zip(attrlis[1:nlis], typlis[1:nlis]):
        if attr == 'createdat':
            pass
        elif typ == 'TEXT':
            fw.write(f",\n    iif(be.{attr} <> ex.{attr}, printf('%s -> %s', be.{attr}, ex.{attr}), NULL) AS {attr}")
        elif typ[:3] == 'INT':
            fw.write(f",\n    iif(be.{attr} <> ex.{attr}, printf('%d -> %d', be.{attr}, ex.{attr}), NULL) AS {attr}")
        elif typ == 'REAL':
            fw.write(f",\n    iif(coalesce(abs(be.{attr} - ex.{attr}), 0) > 0.001, printf('%.3f -> %.3f', be.{attr}, ex.{attr}), NULL) AS {attr}")
        else:
            fw.write(f",\n############################ Fehler 1 ############################## {attr=}, {typ=}\n\n")
    if gobj is not None:
        fw.write(f",\n    be.{gobj} AS {gobj}")
    fw.write( '\n')
    fw.write( 'FROM (\n')
    fw.write( '    SELECT *\n')
    fw.write(f'    FROM main.{tabnam} AS t\n')
    if gobj is not None and not '_untersucht' in tabnam:
        fw.write( '    WHERE NOT :seltgb\n')
        fw.write( '       OR t.teilgebiet IN (SELECT tgnam FROM sel_teilgebiete)\n')
    fw.write(f'    GROUP BY t.{objnam}\n')
    fw.write( '    HAVING count() = 1\n')
    fw.write( ') AS be\n')
    fw.write( 'JOIN (\n')
    fw.write( '    SELECT * \n')
    fw.write(f'    FROM ext.{tabnam} AS t\n')
    if gobj is not None and not '_untersucht' in tabnam:
        fw.write( '    WHERE NOT :seltgb\n')
        fw.write( '       OR t.teilgebiet IN (SELECT tgnam FROM sel_teilgebiete)\n')
    fw.write(f'    GROUP BY t.{objnam}\n')
    fw.write( '    HAVING count() = 1\n')
    fw.write( ') AS ex\n')
    fw.write(f'ON ex.{objnam} = be.{objnam}\n')
    fw.write( 'WHERE\n    ')
    prefix = ''
    for attr, typ in zip(attrlis[1:nlis], typlis[1:nlis]):
        if attr == 'createdat':
            pass
        elif typ in ['TEXT', 'INT', 'INTEGER']:
            fw.write(prefix + f"be.{attr} <> ex.{attr}")
        elif typ == 'REAL':
            fw.write(prefix + f"coalesce(abs(be.{attr} - ex.{attr}), 0) > 0.001")
        if prefix == '':
            prefix = ' OR\n    '
    if gobj is not None:
        fw.write(prefix + f"be.{gobj} <> ex.{gobj}")

    fw.write( ';"\n\n')

# ---------------------------------------------------------------------------------------------------------------------
    fw.write(f'# {tabtitle} hinzufügen\n')
    fw.write(f'sync_{tabnam}_add: "\n')
    fw.write(f'INSERT INTO main.{tabnam} (\n')
    fw.write(f'    {objnam}, {attributes}{geoattrs})\n')
    fw.write( 'SELECT\n')
    fw.write(f'    ex.{objnam}, ex.{attributes_ex}')
    if gobj is not None:
        fw.write(f",\n    ex.{gobj} AS {gobj}")
    fw.write( '\n')
    fw.write(f'FROM ext.{tabnam} AS ex\n')
    fw.write(f'JOIN sync_{tabnam} AS sy ON ex.pk = sy.pk_ext\n')
    fw.write( "WHERE sy.aktion = 'hinzufügen' \n")
    fw.write( '  AND sy.status;"\n')
    fw.write( '\n')

# ---------------------------------------------------------------------------------------------------------------------
    fw.write(f'# {tabtitle} löschen\n')
    fw.write(f'sync_{tabnam}_del: "\n')
    fw.write(f'DELETE FROM main.{tabnam}\n')
    fw.write( 'WHERE pk IN (\n')
    fw.write( '    SELECT pk_best\n')
    fw.write(f'    FROM sync_{tabnam}\n')
    fw.write( "    WHERE aktion = 'löschen'\n")
    fw.write( '      AND status\n);"\n')
    fw.write( '\n')

# ---------------------------------------------------------------------------------------------------------------------
    fw.write(f'# {tabtitle} ändern\n')
    fw.write(f'sync_{tabnam}_mod: "\n')
    fw.write(f'UPDATE main.{tabnam}\n')
    fw.write( 'SET\n')
    # if tabnam in TABLES_GLINK:
        # fw.write('    ' + ',\n    '.join([f'{el} = mo.{el}' for el in attrlis[1:nlis] + attrlis[ngeo+2:ngeo+3]]) + '\n')
    # else:
    fw.write('    ' + ',\n    '.join([f'{el} = mo.{el}' for el in attrlis[1:nlis]]))
    if gobj is None:
        fw.write('\n')
    else:
        fw.write(f',\n    {gobj} = mo.{gobj}\n')
    fw.write( 'FROM (\n')
    fw.write( '    SELECT\n')
    fw.write( '        sy.pk_best AS pk_best')
    for attr, typ in zip(attrlis[1:nlis], typlis[1:nlis]):
        if typ == 'TEXT':
            fw.write(f",\n        iif(sy.{attr} IS NOT NULL AND sy.{attr} <> '', ex.{attr}, be.{attr}) AS {attr}")
        elif typ in ['REAL', 'INT', 'INTEGER']:
            fw.write(f",\n        iif(sy.{attr} IS NOT NULL, ex.{attr}, be.{attr}) AS {attr}")
        else:
            fw.write(f",\n############################ Fehler 2 ############################## {attr=}, {typ=}\n\n")
    if gobj is not None:
        fw.write(f",\n        iif(sy.objekt IS NOT NULL AND sy.objekt <> '', ex.{gobj}, be.{gobj}) AS {gobj}")
    fw.write( '\n')
    fw.write(f'    FROM sync_{tabnam} AS sy\n')
    fw.write(f'    JOIN main.{tabnam} AS be ON be.pk = sy.pk_best\n')
    fw.write(f'    JOIN ext.{tabnam} AS ex ON ex.pk = sy.pk_ext\n')
    fw.write( "    WHERE sy.aktion = 'ändern'\n")
    fw.write( '      AND status\n')
    fw.write( ') AS mo\n')
    fw.write(f'WHERE main.{tabnam}.pk = mo.pk_best;"\n')
    fw.write( '\n')

# ---------------------------------------------------------------------------------------------------------------------
    fw.write(f'# {tabtitle} auflisten\n')
    fw.write(f'sync_{tabnam}_prot: "\n')
    fw.write(f'SELECT * FROM sync_{tabnam} WHERE status;"\n')

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
ATTACH DATABASE ? AS ext"

sync_collect_teilgebiete: "
WITH tgb AS (
    SELECT teilgebiet FROM flaechen
    WHERE teilgebiet IS NOT NULL
    UNION
    SELECT teilgebiet FROM tezg
    WHERE teilgebiet IS NOT NULL
    UNION
    SELECT teilgebiet FROM haltungen
    WHERE teilgebiet IS NOT NULL
    UNION
    SELECT teilgebiet FROM schaechte
    WHERE teilgebiet IS NOT NULL
)
INSERT INTO teilgebiete (tgnam)
SELECT teilgebiet FROM tgb
WHERE teilgebiet NOT IN (SELECT tgnam FROM teilgebiete)
GROUP BY teilgebiet"

sync_list_teilgebiete: "
SELECT tgnam FROM teilgebiete GROUP BY tgnam"

sync_create_sel_teilgebiete: "
CREATE TEMP TABLE IF NOT EXISTS sel_teilgebiete (tgnam TEXT PRIMARY KEY)"

sync_sel_teilgebiete_reset: "
DELETE FROM sel_teilgebiete;"

sync_sel_teilgebiete_add: "
INSERT INTO sel_teilgebiete VALUES (?);"


'''

def main(qkfile):
    con = sqlite3.connect(qkfile)
    cur = con.cursor()

    tables = TABLES_GEOM + TABLES_GEOP + TABLES_GLINK + TABLES_ATTR
    tablis = sorted(list(set(tables)))
    if len(tables) != len(tablis):
        meldung(f'Fehler: Keine Tabelle darf in mehr als einer Liste "TABLES_XXXX" vorkommen!')
        return
             # [
        # "schaechte",                        # geop, geom
        # "haltungen",
        # "anschlussschaechte",
        # "anschlussleitungen",
        # "flaechen",
        # "linkfl",                           # geom, gbuf, glink
        # "tezg",
        # "schaechte_untersucht",             # geop
        # "haltungen_untersucht",
        # "anschlussleitungen_untersucht",

        # "notizen",
        # "untersuchdat_haltung",
        # "untersuchdat_anschlussleitung",
        # "untersuchdat_schacht",
        # "einzugsgebiete",
        # "teilgebiete",
        # "linksw",                           # geom, gbuf, glink
        # "einleit",
        # "aussengebiete",
        # "linkageb",                         # glink
        # "symbole",

        # "refdata",                          # kein Geoobjekt

        # "pruefsql,"                         # kein Geoobjekt
        # "pruefliste,"                       # kein Geoobjekt
        # "info,"                             # kein Geoobjekt
        # "fotos,"                            # kein Geoobjekt
        # "videos,"                           # kein Geoobjekt
        # "symbolkatalog,"                    # kein Geoobjekt
    # ]
    first = True
    with open('sqlite.yml', 'w', encoding = 'utf-8') as fw:
        fw.write(header)
        for tabnam in tablis:
            if not first:
                fw.write('\n\n')
            else:
                first = False

            writesql(cur, fw, tabnam)

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
