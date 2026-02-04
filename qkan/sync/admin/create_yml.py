import textwrap
import sqlite3
import os, sys
import tkinter

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
    ngeo   = None           # Index des ersten Geoobjekts in attrlis und typlis
    i      = 0

    rs = cur.execute(f"PRAGMA table_info('{tabnam}')")
    for _, attr, typ, notnull, dflt_value, is_pk in rs:
        if is_pk == 0 and attr != 'createdat':
            attrlis.append(attr)
            typlis.append(typ)
            if objnam is None:
                objnam = attr
            if typ[:3] not in ['INT', 'REA', 'TEX']:
                if ngeo is None:
                    ngeo = i
            i += 1
    rs.close
    nlis = i
    if ngeo is None:
        # Index ngeo auf Element hinter letztem setzen
        ngeo = nlis

    fw.write(f'# {tabtitle}\n')
    fw.write(f'sync_create_{tabnam}: "\n')
    fw.write(f'CREATE TABLE IF NOT EXISTS sync_{tabnam} (\n')
    fw.write( '    pk INTEGER PRIMARY KEY,\n')
    fw.write( '    pk_best INTEGER,\n')
    fw.write( '    pk_ext INTEGER,\n')
    fw.write( '    aktion TEXT,\n')
    fw.write( '    status INTEGER')

    if nlis - ngeo == 1 or tabnam == 'linkfl':
        fw.write(',\n    objekt TEXT')
    elif nlis - ngeo > 1:
        fw.write(',\n    grafikobjekt TEXT,\n')
        fw.write('    punktobjekt TEXT')
        if nlis - ngeo > 2:
            fw.write('############################# weitere Geoobjekte\n')

    for attr, typ in zip(attrlis[:ngeo], typlis[:ngeo]):
        if attr != 'createdat':
            fw.write(f',\n    {attr} {typ}')
    fw.write(');"\n\n')

    # Attributlisten ohne und mit prefixen
    attributes = '\n    '.join(textwrap.wrap(', '.join(attrlis[1:ngeo])))
    attributes_ex = '\n    '.join(textwrap.wrap(', ex.'.join(attrlis[1:ngeo])))
    attributes_be = '\n    '.join(textwrap.wrap(', be.'.join(attrlis[1:ngeo])))
    if tabnam == 'linkfl':
        geoattr =   ',\n    geom'
        geoattrs =  ',\n    geom'
        geoattrex = ',\n    ex.glink AS geom'
        geoattrbe = ',\n    be.glink AS geom'
        objattr = 'objekt, '
    elif tabnam == 'schaechte_untersucht':
        geoattr =   ',\n    geom'
        geoattrs =  ',\n    geom'
        geoattrex = ',\n    ex.geop AS geom'
        geoattrbe = ',\n    be.geop AS geom'
        objattr = 'objekt, '
    elif nlis - ngeo == 1:
        geoattr =   ',\n    geom'
        geoattrs =  ',\n    geom'
        geoattrex = ',\n    ex.geom'
        geoattrbe = ',\n    be.geom'
        objattr = 'objekt, '
    elif nlis - ngeo > 1: 
        geoattr =   ',\n    geom'
        geoattrs =  ',\n    ' + ', '.join(attrlis[ngeo:])
        geoattrex = ',\n    ex.geop AS geom'
        geoattrbe = ',\n    be.geop AS geom'
        objattr = 'grafikobjekt, punktobjekt, '
    else:
        geoattr = ''
        geoattrs =  ''
        geoattrex = ''
        geoattrbe = ''
        objattr = ''

    if nlis - ngeo >= 1:
        fw.write(f'sync_create_{tabnam}_geom: "\n')
        typ = typlis[ngeo]
        if tabnam == 'schaechte':
            fw.write(f'''SELECT AddGeometryColumn('sync_{tabnam}', 'geom', :epsg, 'POINT', 2);"\n''')
        else:
            fw.write(f'''SELECT AddGeometryColumn('sync_{tabnam}', 'geom', :epsg, '{typ}', 2);"\n''')
    fw.write( '\n')
    fw.write(f'sync_reset_{tabnam}: "\n')
    fw.write(f'DELETE FROM sync_{tabnam};"\n')
    fw.write( '\n')

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
    if tabnam == 'refdata':
        fw.write( "    'hinzufügen' AS aktion, 1 AS status,      /* hinzufügen */\n")
    elif nlis - ngeo == 1 or tabnam == 'linkfl' or tabnam == 'refdata':
        fw.write( "    'Datensatz nicht im Bestand' AS objekt, 'hinzufügen' AS aktion, 1 AS status,      /* hinzufügen */\n")
    elif nlis - ngeo >1:
        fw.write( "    NULL AS grafikobjekt, 'Datensatz nicht im Bestand' AS punktobjekt, 'hinzufügen' AS aktion, 1 AS status,      /* hinzufügen */\n")
    fw.write(f'    ex.{attributes_ex}{geoattrex}\n')
    fw.write( 'FROM (\n')
    fw.write( '    SELECT * \n')
    fw.write(f'    FROM ext.{tabnam} AS t\n')
    if tabnam != 'refdata' and not '_untersucht' in tabnam:
        fw.write( '    WHERE NOT :seltgb\n')
        fw.write( '       OR t.teilgebiet IN (SELECT tgnam FROM sel_teilgebiete)\n')
    fw.write(f'    GROUP BY t.{objnam}\n')
    fw.write( '    HAVING count() = 1\n')
    fw.write( ') AS ex\n')
    fw.write( 'LEFT JOIN (\n')
    fw.write( '    SELECT *\n')
    fw.write(f'    FROM main.{tabnam} AS t\n')
    if tabnam != 'refdata' and not '_untersucht' in tabnam:
        fw.write( '    WHERE NOT :seltgb\n')
        fw.write( '       OR t.teilgebiet IN (SELECT tgnam FROM sel_teilgebiete)\n')
    fw.write(f'    GROUP BY t.{objnam}\n')
    fw.write( '    HAVING count() = 1\n')
    fw.write( ') AS be\n')
    fw.write(f'ON be.{objnam} = ex.{objnam}\n')
    fw.write( 'WHERE be.pk IS NULL;"\n')
    fw.write( '\n')

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
    if tabnam == 'refdata':
        fw.write( "    'löschen' AS aktion, 0 AS status,      /* löschen */\n")
    elif nlis - ngeo > 1 and tabnam != 'linkfl':
        fw.write( "    NULL AS grafikobjekt,\n    'Datensatz extern nicht vorhanden' AS punktobjekt,\n"
                  "    'löschen' AS aktion, 0 AS status,      /* löschen */\n")
    else:
        fw.write( "    'Datensatz extern nicht vorhanden' AS objekt, 'löschen' AS aktion, 0 AS status,      /* löschen */\n")
    fw.write(f'    be.{attributes_be}{geoattrbe}\n')
    fw.write( 'FROM (\n')
    fw.write( '    SELECT *\n')
    fw.write(f'    FROM main.{tabnam} AS t\n')
    if tabnam != 'refdata' and not '_untersucht' in tabnam:
        fw.write( '    WHERE NOT :seltgb\n')
        fw.write( '       OR t.teilgebiet IN (SELECT tgnam FROM sel_teilgebiete)\n')
    fw.write(f'    GROUP BY t.{objnam}\n')
    fw.write( '    HAVING count() = 1\n')
    fw.write( ') AS be\n')
    fw.write( 'LEFT JOIN (\n')
    fw.write( '    SELECT * \n')
    fw.write(f'    FROM ext.{tabnam} AS t\n')
    if tabnam != 'refdata' and not '_untersucht' in tabnam:
        fw.write( '    WHERE NOT :seltgb\n')
        fw.write( '       OR t.teilgebiet IN (SELECT tgnam FROM sel_teilgebiete)\n')
    fw.write(f'    GROUP BY t.{objnam}\n')
    fw.write( '    HAVING count() = 1\n')
    fw.write( ') AS ex\n')
    fw.write(f'ON be.{objnam} = ex.{objnam}\n')
    fw.write( 'WHERE ex.pk IS NULL;"\n')
    fw.write( '\n\n')

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
    if tabnam == 'linkfl':
        fw.write( "    iif(be.glink <> ex.glink, printf('Geometrie geändert'), NULL) AS objekt,\n")
    else:
        for geo in attrlis[ngeo:]:
            if nlis - ngeo > 1:
                if geo == 'geop':
                    fw.write( "    iif(be.geop <> ex.geop, printf('Geometrie geändert'), NULL) AS punktobjekt,\n")
                elif geo == 'geom' and nlis - ngeo > 1:
                    fw.write( "    iif(be.geom <> ex.geom, printf('Geometrie geändert'), NULL) AS grafikobjekt,\n")
            elif nlis - ngeo == 1:
                fw.write(f"    iif(be.{attrlis[-1]} <> ex.{attrlis[-1]}, printf('Geometrie geändert'), NULL) AS objekt,\n")
    fw.write( "    'ändern' AS aktion,\n")
    fw.write( '    1 AS status')
    for attr, typ in zip(attrlis[1:ngeo], typlis[1:ngeo]):
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
    if nlis - ngeo >= 1:
        fw.write(f",\n    be.{attrlis[-1]} AS geom")
    fw.write( '\n')
    fw.write( 'FROM (\n')
    fw.write( '    SELECT *\n')
    fw.write(f'    FROM main.{tabnam} AS t\n')
    if tabnam != 'refdata' and not '_untersucht' in tabnam:
        fw.write( '    WHERE NOT :seltgb\n')
        fw.write( '       OR t.teilgebiet IN (SELECT tgnam FROM sel_teilgebiete)\n')
    fw.write(f'    GROUP BY t.{objnam}\n')
    fw.write( '    HAVING count() = 1\n')
    fw.write( ') AS be\n')
    fw.write( 'JOIN (\n')
    fw.write( '    SELECT * \n')
    fw.write(f'    FROM ext.{tabnam} AS t\n')
    if tabnam != 'refdata' and not '_untersucht' in tabnam:
        fw.write( '    WHERE NOT :seltgb\n')
        fw.write( '       OR t.teilgebiet IN (SELECT tgnam FROM sel_teilgebiete)\n')
    fw.write(f'    GROUP BY t.{objnam}\n')
    fw.write( '    HAVING count() = 1\n')
    fw.write( ') AS ex\n')
    fw.write(f'ON ex.{objnam} = be.{objnam}\n')
    fw.write( 'WHERE\n    ')
    prefix = ''
    # print(', '.join(attrlis[ngeo-1:]))
    for attr, typ in zip(attrlis[1:], typlis[1:]):
        if attr == 'createdat':
            pass
        elif typ in ['TEXT', 'INT', 'INTEGER']:
            fw.write(prefix + f"be.{attr} <> ex.{attr}")
        elif typ == 'REAL':
            fw.write(prefix + f"coalesce(abs(be.{attr} - ex.{attr}), 0) > 0.001")
        elif tabnam == 'linkfl':
            if attr == 'glink':
                fw.write(prefix + f"be.{attr} <> ex.{attr}")
            else:
                pass        # geom und gbuf werden ignoriert
        else:
            fw.write(prefix + f"be.{attr} <> ex.{attr}")
            # fw.write(f"\n############################ Fehler 2 ############################## {attr=}, {typ=}\n")
        if prefix == '':
            prefix = ' OR\n    '
    # if nlis - ngeo >= 1:
        # fw.write(prefix + f'be.{attrlis[ngeo]} <> ex.geom;"\n')
    fw.write( ';"\n\n')

    fw.write(f'# {tabtitle} hinzufügen\n')
    fw.write(f'sync_{tabnam}_add: "\n')
    fw.write(f'INSERT INTO main.{tabnam} (\n')
    fw.write(f'    {objnam}, {attributes}{geoattrs})\n')
    fw.write( 'SELECT\n')
    fw.write(f'    ex.{objnam}, ex.{attributes_ex}')
    if tabnam == 'linkfl':
        fw.write( ",\n    ex.glink AS geom")
    elif nlis - ngeo == 1:
        fw.write( ",\n    ex.geom")
    elif nlis - ngeo > 1:
        fw.write( ",\n    CastToMultiLineString(ex.geom) AS geom, ex.geop")
    fw.write( '\n')
    fw.write(f'FROM ext.{tabnam} AS ex\n')
    fw.write(f'JOIN sync_{tabnam} AS sy ON ex.pk = sy.pk_ext\n')
    fw.write( "WHERE sy.aktion = 'hinzufügen' \n")
    fw.write( '  AND sy.status;"\n')
    fw.write( '\n')

    fw.write(f'# {tabtitle} löschen\n')
    fw.write(f'sync_{tabnam}_del: "\n')
    fw.write(f'DELETE FROM main.{tabnam}\n')
    fw.write( 'WHERE pk IN (\n')
    fw.write( '    SELECT pk_best\n')
    fw.write(f'    FROM sync_{tabnam}\n')
    fw.write( "    WHERE aktion = 'löschen'\n")
    fw.write( '      AND status\n);"\n')
    fw.write( '\n')

    fw.write(f'# {tabtitle} ändern\n')
    fw.write(f'sync_{tabnam}_mod: "\n')
    fw.write(f'UPDATE main.{tabnam}\n')
    fw.write( 'SET\n')
    if tabnam == 'linkfl':
        fw.write('    ' + ',\n    '.join([f'{el} = mo.{el}' for el in attrlis[1:ngeo] + attrlis[ngeo+2:ngeo+3]]) + '\n')
    else:
        fw.write('    ' + ',\n    '.join([f'{el} = mo.{el}' for el in attrlis[1:]]) + '\n')
    fw.write( 'FROM (\n')
    fw.write( '    SELECT\n')
    fw.write( '        sy.pk_best AS pk_best')
    for attr, typ in zip(attrlis[1:ngeo], typlis[1:ngeo]):
        if typ == 'TEXT':
            fw.write(f",\n        iif(sy.{attr} IS NOT NULL AND sy.{attr} <> '', ex.{attr}, be.{attr}) AS {attr}")
        elif typ in ['REAL', 'INT', 'INTEGER']:
            fw.write(f",\n        iif(sy.{attr} IS NOT NULL, ex.{attr}, be.{attr}) AS {attr}")
        else:
            fw.write(f",\n############################ Fehler 2 ############################## {attr=}, {typ=}\n\n")
    if tabnam == 'linkfl':
        fw.write( ",\n        iif(sy.objekt IS NOT NULL AND sy.objekt <> '', ex.glink, be.glink) AS glink")
    elif nlis - ngeo == 1:
        fw.write( ",\n        iif(sy.objekt IS NOT NULL AND sy.objekt <> '', ex.geom, be.geom) AS geom")
    elif nlis - ngeo > 1:
        fw.write(",\n        iif(sy.grafikobjekt IS NOT NULL AND sy.grafikobjekt <> '', CastToMultiLineString(ex.geom), CastToMultiLineString(be.geom)) AS geom")
        fw.write(",\n        iif(sy.punktobjekt IS NOT NULL AND sy.punktobjekt <> '', ex.geop, be.geop) AS geop      /* only geom in table sync */")
    fw.write( '\n')
    fw.write(f'    FROM sync_{tabnam} AS sy\n')
    fw.write(f'    JOIN main.{tabnam} AS be ON be.pk = sy.pk_best\n')
    fw.write(f'    JOIN ext.{tabnam} AS ex ON ex.pk = sy.pk_ext\n')
    fw.write( "    WHERE sy.aktion = 'ändern'\n")
    fw.write( '      AND status\n')
    fw.write( ') AS mo\n')
    fw.write(f'WHERE main.{tabnam}.pk = mo.pk_best;"\n')
    fw.write( '\n')

    fw.write(f'# {tabtitle} auflisten\n')
    fw.write(f'sync_{tabnam}_prot: "\n')
    fw.write(f'SELECT * FROM sync_{tabnam} WHERE status;"\n')

header = '''# Do not modify! File is automatically generated by ./admin/create_ymls.py

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

    tablis = [
        'schaechte',                        # geop, geom
        'haltungen',
        'anschlussschaechte',
        'anschlussleitungen',
        'flaechen',
        'linkfl',                           # geom, gbuf, glink
        'tezg',
        'schaechte_untersucht',             # geop
        'haltungen_untersucht',
        'anschlussleitungen_untersucht',

        'notizen',
        'untersuchdat_haltung',
        'untersuchdat_anschlussleitung',
        'untersuchdat_schacht',
        'einzugsgebiete',
        'teilgebiete',
        'linksw',                           # geom, gbuf, glink
        'einleit',
        'aussengebiete',
        'linkageb',                         # glink
        'symbole',

        'refdata',                          # kein Geoobjekt

        'pruefsql,'                         # kein Geoobjekt
        'pruefliste,'                       # kein Geoobjekt
        'info,'                             # kein Geoobjekt
        'fotos,'                            # kein Geoobjekt
        'videos,'                           # kein Geoobjekt
        'symbolkatalog,'                    # kein Geoobjekt
    ]
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
    meldung(f'SQL-Datei {qkfile} wurde erfolgreich erstellt!')
else:
    meldung(f'Keine Vorlage-QKan-Datenbank gefunden. Bitte neu erzeugen: {qkfile}')
