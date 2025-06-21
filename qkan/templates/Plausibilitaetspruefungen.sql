/* SQL-Abfragen für das Plausibilitätsprüfungs-Tool

Diese Datei wird beim Öffnen des Tools als SQL-Datei ausgeführt und fügt noch nicht in der Tabelle 'pruefsql' enthaltene Datensätze hinzu. 

Achtung: Innerhalb des SQL-Statements müssen Anführungsstriche doppelt gesetzt werden (''), weil das SQL-Statement selbst
schon ein String ist!

Die Attribute der Datensätze haben folgende Bedeutung:
 - gruppe: Bezeichnung erscheint im Formular und dient der Auswahl
 - warnbez: interne Bezeichnung. Muss eindeutig sein.
 - warntyp: Erscheint nach der Ausführung in der Tabelle 'Fehlerliste'
 - warnlevel: Erscheint nach der Ausführung in der Tabelle 'Fehlerliste': Gewichtung des Fehlers (1-9)
 - sql: SQL-Anweisung mit folgenden Attributen:
    - objid: Attribut, das zur Identifikation des fehlerhaften Objektes verwendet werden kann, meistens 'pk AS objid'
    - bemerkung: wird in der Fehlerliste in der Spalte 'Warntext' angezeigt
 - layername: Name des Layers, in dem sich das fehlerhafte Objekt befindet
 - attrname: Name des Attributs (string), anhand dessen das fehlerhafte Objekt in der entsprechenden Aktion im Layer "Fehlerliste" identifiziert werden kann 
 
 Hinweis zur Fehlersuche: Diese Datei kann im SQL-Fenster des DB-Browser (bei geöffneter QKan-Datenbank) ausgeführt werden. 
 */

/* Löschen aller QKan-Standardabfragen, erkennbar am Schluss des Feldes warntext: */
DELETE FROM pruefsql WHERE gruppe IN ('Netzstruktur', 'Geoobjekte', 'HYSTEM-EXTRAN', 'Zustandsklassen', 'Kreuzende Haltungen (3D, braucht sehr lang!)', 'Kreuzende Haltungen (im Plan)');

INSERT INTO pruefsql (gruppe, warntext, warntyp, warnlevel, sql, layername, attrname)
SELECT pn.gruppe, pn.warnbez, pn.warntyp, pn.warnlevel, pn.sql, pn.layername, pn.attrname FROM
(   SELECT column1 AS gruppe, column2 AS warnbez, column3 AS warntyp, column4 AS warnlevel, column5 AS sql, column6 AS layername, column7 AS attrname FROM 
    (   VALUES

('Netzstruktur', 'Schacht oben mehr als 1.0 m von Haltungsende entfernt', 'Fehler', 9, 
    'SELECT ha.pk AS objid, printf(''Schacht oben "%s" mehr als 1.0 m von Ende der Haltung "%s" entfernt'', so.schnam, ha.haltnam) AS bemerkung
    FROM haltungen AS ha
    LEFT JOIN schaechte AS so ON ha.schoben = so.schnam
    WHERE within(so.geop, buffer(pointn(ha.geom,1), 1.0)) <> 1 AND (ha.haltungstyp = ''Haltung'' OR ha.haltungstyp IS NULL)',
 'Haltungen', 'pk'),

('Netzstruktur', 'Schacht unten mehr als 1.0 m von Haltungsende entfernt', 'Fehler', 9, 
    'SELECT ha.pk AS objid, printf(''Schacht unten "%s" mehr als 1.0 m von Ende der Haltung "%s" entfernt'', su.schnam, ha.haltnam) AS bemerkung
    FROM haltungen AS ha
    LEFT JOIN schaechte AS su ON ha.schunten = su.schnam
    WHERE within(su.geop, buffer(pointn(ha.geom,-1), 1.0)) <> 1 AND (haltungstyp = ''Haltung'' OR haltungstyp IS NULL)',
 'Haltungen', 'pk'),

('Kreuzende Haltungen (im Plan)', 'Zwei Haltungen kreuzen sich', 'Fehler', 9,
    'WITH haltungen_selected AS (SELECT ROWID, pk, geom, haltnam, schoben, schunten FROM haltungen WHERE rwanschluss = 1 AND (haltungstyp = ''Haltung'' OR haltungstyp IS NULL)),
    fls AS (SELECT ROWID, pk, geom, haltnam, schoben, schunten,
		MakePolygon(AddPoint(AddPoint(AddPoint(
						MakeLine(pointn(geom,1),makepoint(x(centroid(geom))-(y(pointn(geom,-1))-y(pointn(geom,1)))*0.01,y(centroid(geom))+(x(pointn(geom,-1))-x(pointn(geom,1)))*0.01)),
						pointn(geom,-1)),
					makepoint(x(centroid(geom))+(y(pointn(geom,-1))-y(pointn(geom,1)))*0.01,y(centroid(geom))-(x(pointn(geom,-1))-x(pointn(geom,1)))*0.01)),pointn(geom,1))
		) AS geof
	FROM
		haltungen_selected 
    )
    SELECT n1.pk AS objid, printf(''Haltung "%s" und "%s" kreuzen sich. Bei einer von beiden muss der Status RW-Anschlüsse deaktiviert werden!'', n1.haltnam, n2.haltnam) AS bemerkung
    FROM fls AS n1 JOIN fls AS n2 ON ST_Intersects(n1.geof, n2.geof) = 1
    WHERE 
    	n1.ROWID IN (SELECT ROWID FROM SpatialIndex WHERE f_table_name=''haltungen'' AND search_frame=n2.geof) 
      AND n1.pk <> n2.pk
      AND n1.schoben not in (n2.schunten, n2.schoben)
      AND n2.schoben not in (n1.schunten, n1.schoben)
      AND n1.schunten not in (n2.schunten, n2.schoben)
      AND n2.schunten not in (n1.schunten, n1.schoben)',
'Haltungen', 'pk'),

('Netzstruktur', 'Zwei Schächte haben ein identisches Geoobjekt', 'Warnung', 5,
    'SELECT a.pk AS objid,
    printf(''Schacht "%s" ist identisch mit Schacht "%s"'', a.schnam, b.schnam) AS bemerkung
    FROM schaechte AS a
    JOIN schaechte AS b ON ST_Equals(a.geop, b.geop) = 1
    WHERE b.ROWID IN (SELECT ROWID FROM SpatialIndex WHERE f_table_name=''schaechte'' AND search_frame=a.geop) AND a.pk < b.pk',
'Schächte', 'pk'),

('Netzstruktur', 'Zwei Haltungen haben ein identisches Geoobjekt', 'Warnung', 5,
    'SELECT a.pk as objid, printf(''Haltung "%s" ist identisch mit "%s"'', a.haltnam, b.haltnam) As bemerkung
    FROM haltungen AS a JOIN haltungen AS b ON ST_Equals(a.geom, b.geom) = 1
    WHERE b.ROWID IN (SELECT ROWID FROM SpatialIndex WHERE f_table_name=''haltungen'' AND search_frame=a.geom) AND a.pk < b.pk
      AND (a.haltungstyp = ''Haltung'' OR a.haltungstyp IS NULL)',
'Haltungen', 'pk'),

('Netzstruktur', 'Zwei Haltungen mit identischen Schachtobjekten', 'Warnung', 5,
    'SELECT a.pk AS objid, printf(''Haltung "%s" hat die gleichen Schächte wie Haltung "%s"'', a.haltnam, b.haltnam) As bemerkung
    FROM haltungen AS a JOIN haltungen AS b ON (a.schoben = b.schoben AND a.schunten = b.schunten) OR (a.schoben = b.schunten AND a.schunten = b.schoben)
    WHERE a.pk < b.pk AND (a.haltungstyp = ''Haltung'' OR a.haltungstyp IS NULL)',
'Haltungen', 'pk'),

('Netzstruktur', 'Zwei Anschlussleitungen haben ein identisches Geoobjekt', 'Warnung', 5,
    'SELECT a.pk as objid, printf(''Anschlussleitung "%s" ist identisch mit "%s"'', a.leitnam, b.leitnam) As bemerkung
    FROM anschlussleitungen AS a JOIN anschlussleitungen AS b ON ST_Equals(a.geom, b.geom) = 1
    WHERE b.ROWID IN (SELECT ROWID FROM SpatialIndex WHERE f_table_name=''anschlussleitungen'' AND search_frame=a.geom) AND a.pk < b.pk',
'HA-Leitungen', 'pk'),

('Netzstruktur', 'Haltungslänge unplausibel', 'Warnung', 3,
    'SELECT pk as objid, printf(''Länge der Haltung "%s" (%.2f) ist unplausibel'', haltnam, st_length(geom)) AS bemerkung
    FROM haltungen WHERE st_length(geom)<2 OR st_length(geom)>80 AND (haltungstyp = ''Haltung'' OR haltungstyp IS NULL)',
'Haltungen', 'pk'),

('Netzstruktur', 'Haltungslänge ungleich Geoobjekt', 'Fehler', 9,
    'SELECT pk as objid,
    printf(''Haltung "%s": vorgegebene Haltungslänge %.2f m weicht deutlich von der des Geometrieobjekts (%.2f m) ab'', haltnam, laenge, st_length(geom)) AS bemerkung
    FROM haltungen WHERE abs(st_length(geom)-laenge) / (st_length(geom) + laenge + 5.0) > 0.1',
'Haltungen', 'pk'),

('Netzstruktur', 'Haltungsgefälle unplausibel', 'Fehler', 9,
    'SELECT pk as objid, printf(''Unplausibles Gefälle %.2f ‰ in Haltung "%s"'', abs(sohleoben - sohleunten)/st_length(geom) * 1000.0, haltnam) AS bemerkung
    FROM haltungen
    WHERE (abs(sohleoben - sohleunten)/st_length(geom) < 0.001 OR abs(sohleoben - sohleunten )/st_length(geom) > 0.030)
      AND (haltungstyp = ''Haltung'' OR haltungstyp IS NULL)',
'Haltungen', 'pk'),

('Netzstruktur', 'Entwässerungsart Haltung und angeschlossene Schächte unterschiedlich', 'Fehler', 9,
    'SELECT ha.pk as objid, printf(''Entwässerungsart in Haltung "%s" ("%s") und angeschlossenen Schächten "%s" ("%s"), "%s" ("%s") ist unterschiedlich'', ha.haltnam, ha.entwart, so.schnam, so.entwart, su.schnam, su.entwart) as bemerkung
    FROM haltungen AS ha LEFT JOIN schaechte AS so ON ha.schoben = so.schnam LEFT JOIN schaechte AS su ON ha.schoben = su.schnam
    WHERE (ha.entwart <> so.entwart OR ha.entwart <> su.entwart)
      AND (ha.haltungstyp = ''Haltung'' OR ha.haltungstyp IS NULL)', 'Haltungen', 'pk'),

('Netzstruktur', 'Haltungssohlhöhe oben tiefer als Schachtsohlhöhe', 'Fehler', 9,
    'SELECT ha.pk as objid, printf(''Sohlhöhe oben von Haltung "%s" (%.3f) ist tiefer als Schachtsohle "%s" (%.3f)'', ha.haltnam, ha.sohleoben, so.schnam, so.sohlhoehe) as bemerkung
    FROM schaechte AS so JOIN haltungen AS ha ON ha.schoben = so.schnam
    WHERE ha.sohleoben < so.sohlhoehe AND (ha.haltungstyp = ''Haltung'' OR ha.haltungstyp IS NULL)',
'Haltungen', 'pk'),

('Netzstruktur', 'Haltungssohlhöhe unten tiefer als Schachtsohlhöhe', 'Fehler', 9,
    'SELECT su.pk AS objid, printf(''Sohlhöhe unten von Haltung "%s" (%.3f) ist tiefer als Schachtsohle "%s" (%.3f)'', ha.haltnam, ha.sohleunten, su.schnam, su.sohlhoehe) AS bemerkung
    FROM schaechte AS su JOIN haltungen AS ha ON ha.schunten = su.schnam
    WHERE ha.sohleunten < su.sohlhoehe AND (ha.haltungstyp = ''Haltung'' OR ha.haltungstyp IS NULL)',
 'Haltungen', 'pk'),

('Netzstruktur', 'Abstand Deckel- und Sohlhöhe prüfen', 'Warnung', 3,
    'SELECT pk AS objid, printf(''Schacht "%s" Abstand Deckel- und Sohlhöhe prüfen'', schaechte.schnam) AS bemerkung
    FROM schaechte WHERE 0.8< deckelhoehe-sohlhoehe >= 8',
 'Schaechte', 'pk'),

('Netzstruktur', 'Schächte ohne zugehörge Haltung', 'Warnung', 3,
    'SELECT pk AS objid, printf(''Schacht "%s" ist an keiner Haltung angeschlossen'', schaechte.schnam) AS bemerkung
    FROM schaechte WHERE schaechte.schnam NOT IN (SELECT haltungen.schoben FROM haltungen UNION SELECT haltungen.schunten FROM haltungen)',
 'Haltungen', 'pk'),

('Geoobjekte', 'Haltungen ohne graphisches Linienobjekt', 'Fehler', 9,
    'SELECT pk AS objid, printf(''Haltung "%s" hat kein graphisches Linienobjekt'', haltnam) AS bemerkung
    FROM haltungen WHERE geom IS NULL AND (haltungstyp = ''Haltung'' OR haltungstyp IS NULL)',
 'Haltungen', 'pk'),

('Geoobjekte', 'Pumpe ohne graphisches Linienobjekt', 'Warnung', 9,
    'SELECT pk AS objid, printf(''Pumpe "%s" hat kein graphisches Linienobjekt'', haltnam) AS bemerkung
    FROM haltungen WHERE geom IS NULL AND (haltungstyp = ''Pumpe'')',
 'Pumpen', 'pk'),

('Geoobjekte', 'Wehre ohne graphisches Linienobjekt', 'Fehler', 9,
    'SELECT pk AS objid, printf(''Wehr "%s" hat kein graphisches Linienobjekt'', haltnam) AS bemerkung
    FROM haltungen WHERE geom IS NULL AND (haltungstyp = ''Wehr'')',
 'Wehre', 'pk'),

('Geoobjekte', 'Schächte ohne graphisches Punktobjekt', 'Fehler', 9,
    'SELECT pk AS objid, printf(''Schacht "%s" hat kein graphisches Punktobjekt'', schnam) AS bemerkung
    FROM schaechte WHERE geop IS NULL AND (schachttyp = ''Schacht'' OR schachttyp IS NULL)',
 'Schächte', 'pk'),

('Geoobjekte', 'Auslässe ohne graphisches Punktobjekt', 'Fehler', 9,
    'SELECT pk AS objid, printf(''Auslass "%s" hat kein graphisches Punktobjekt'', schnam) AS bemerkung
    FROM schaechte WHERE geop IS NULL AND schachttyp = ''Auslass''',
 'Auslässe', 'pk'),

('Geoobjekte', 'Speicher ohne graphisches Punktobjekt', 'Fehler', 9,
    'SELECT pk AS objid, printf(''Speicher "%s" hat kein graphisches Punktobjekt'', schnam) AS bemerkung
    FROM schaechte WHERE geop IS NULL AND (schachttyp = ''Speicher''',
 'Speicher', 'pk'),

('Geoobjekte', 'Kein Flächenobjekt', 'Fehler', 9,
    'SELECT pk AS objid, printf(''Fläche "%s" hat kein graphisches Flächenobjekt'', flnam) AS bemerkung
    FROM flaechen WHERE geom IS NULL',
 'Einzelflächen', 'pk'),

('Geoobjekte', 'Kein Flächenobjekt', 'Fehler', 9,
    'SELECT pk AS objid, printf(''Haltungsfläche "%s" hat kein Flächenobjekt'', tgnam) AS bemerkung
    FROM tezg WHERE geom IS NULL',
 'Haltungsflächen', 'pk'),

('Geoobjekte', 'Flächenanbindung ohne graphisches Linienobjekt', 'Fehler', 9,
    'SELECT pk AS objid, printf(''Anbindungen Flächen "%s" hat kein graphisches Linienobjekt'', flnam) AS bemerkung
    FROM linkfl WHERE geom IS NULL',
 'Anbindungen Flächen', 'pk'),

('HYSTEM-EXTRAN', 'Abflussparameter fehlen', 'Fehler', 9,
    'SELECT pk AS objid,
    printf(''Abflussparameter in Fläche "%s" fehlt'', flnam) AS bemerkung
    FROM flaechen
    WHERE abflussparameter IS NULL', 
 'Abflussparameter', 'pk'),

('HYSTEM-EXTRAN', 'Abflussparameter nicht in Referenzliste', 'Fehler', 9,
    'SELECT f1.pk AS objid,
    printf(''Abflussparameter "%s" wird in Fläche "%s" verwendet, fehlt aber in Referenztabelle "Abflussparameter"'', f1.abflussparameter, f1.flnam) AS bemerkung
    FROM flaechen AS f1
    LEFT JOIN abflussparameter ON f1.abflussparameter = abflussparameter.apnam
    WHERE abflussparameter.pk IS NULL AND f1.abflussparameter IS NOT NULL', 
 'Abflussparameter', 'pk'),

('HYSTEM-EXTRAN', 'Schwerpunktlaufzeiten fehlen', 'Fehler', 9, 
    'SELECT pk AS objid,
    printf(''"Fliesszeit Flaeche" fehlt in "Anbindungen Flächen" "%s"'', linkfl.flnam) AS bemerkung
    FROM linkfl WHERE fliesszeitflaeche IS NULL',
 'Anbindungen Flächen', 'pk'),

('HYSTEM-EXTRAN', 'Simulationsstatus fehlt', 'Fehler', 9,
    'SELECT pk AS objid,
    printf(''"Simulationsstatus" fehlt in Schacht "%s"'', schnam) AS bemerkung
    FROM schaechte WHERE simstatus IS NULL AND (schachttyp = ''Schacht'' OR schachttyp IS NULL)', 
 'Schächte', 'pk'),

('HYSTEM-EXTRAN', 'Simulationsstatus nicht in Referenzliste', 'Fehler', 9,
    'SELECT s.pk AS objid,
    printf(''Planungsstatus "%s" wird in Schacht "%s" verwendet, fehlt aber in Referenzliste "Planungsstatus")'', s.simstatus, s.schnam) AS bemerkung
    FROM schaechte AS s
    LEFT JOIN simulationsstatus AS u ON s.simstatus = u.bezeichnung
    WHERE u.bezeichnung IS NULL AND (s.schachttyp = ''Schacht'' OR s.schachttyp IS NULL)', 
 'Schächte', 'pk'),

('HYSTEM-EXTRAN', 'Neigungsklasse fehlt', 'Fehler', 9,
    'SELECT pk AS objid,
    printf(''"Neigungsklasse" fehlt in Fläche "%s"'', flnam) AS bemerkung
    FROM flaechen WHERE neigkl IS NULL',
 'Einzelflächen', 'pk'),

('HYSTEM-EXTRAN', 'Rohrprofil fehlt', 'Fehler', 9,
    'SELECT pk AS objid,
    printf(''"Profilname" fehlt in Haltung "%s"'', haltnam) AS bemerkung
    FROM haltungen
    WHERE profilnam IS NULL AND (haltungstyp = ''Haltung'' OR haltungstyp IS NULL)',
 'Haltungen', 'pk'),

('HYSTEM-EXTRAN', 'Rohrprofil nicht in Referenzliste', 'Fehler', 9,
    'SELECT h.pk AS objid,
    printf(''Profil "%s" wird in Haltung "%s" verwendet, fehlt aber in Referenzliste "Profile"'', h.profilnam, h.haltnam) AS bemerkung 
    FROM haltungen AS h
    LEFT JOIN profile AS p
    ON h.profilnam = p.profilnam
    WHERE p.profilnam IS NULL AND (haltungstyp = ''Haltung'' OR haltungstyp IS NULL) AND h.profilnam IS NOT NULL',
 'Haltungen', 'pk'),

('Netzstruktur', 'Schachtnamen mehrfach', 'Fehler', 9,
    'SELECT pk AS objid,
    printf(''Schachtnamen "%s" mehrfach vergeben'', schnam) AS bemerkung
    FROM schaechte GROUP BY schnam HAVING count() > 1', 
 'Schächte', 'pk'),

('Netzstruktur', 'Haltungsnamen mehrfach', 'Fehler', 9,
    'SELECT pk AS objid,
    printf(''Haltungsnamen "%s" mehrfach vergeben'', haltnam) AS bemerkung
    FROM haltungen GROUP BY haltnam HAVING count() > 1', 
 'Haltungen', 'pk'),

('Kreuzende Haltungen (3D, braucht sehr lang!)', 'Kreuzende Haltungen', 'Warnung', 6, 
    'WITH elems AS (
    SELECT
      ha.pk AS pk,
      ha.haltnam AS haltnam,
      ha.schoben AS schoben,
      ha.schunten AS schunten,
      ha.geom AS geom, 
      COALESCE(ha.sohleoben, so.sohlhoehe)  + COALESCE(ha.hoehe, ha.breite)*0.5 AS zoben, 
      COALESCE(ha.sohleunten, su.sohlhoehe) + COALESCE(ha.hoehe, ha.breite)*0.5 AS zunten,
      COALESCE(ha.hoehe, ha.breite) AS durchm, 
      CASE WHEN COALESCE(ha.hoehe, 0) = 0 THEN ha.breite ELSE ha.hoehe END AS hoehe
    FROM haltungen AS ha 
    INNER JOIN schaechte AS so 
    ON ha.schoben = so.schnam
    INNER JOIN schaechte AS su 
    ON ha.schunten = su.schnam
    WHERE (haltungstyp = ''Haltung'' OR haltungstyp IS NULL))
SELECT
         pk AS objid, 
         printf(''Theoretischer Abstand zu Haltung "%s" beträgt d = %.2f m'', haltna2, COALESCE(abstkreuz, d3)) as bemerkung
    FROM (
    SELECT 
      pk, haltna1, haltna2, hoehob, hoehun, 
      abs((p3x-p1x)*ex+(p3y-p1y)*ey+(p3z-p1z)*ez)/SQRT(ex*ex+ey*ey+ez*ez) AS abstkreuz, 
      abs(L13/SQRT(L12))         AS abstpar,
      ((sx-p1x)*(p2x-p1x)+(sy-p1y)*(p2y-p1y))*((sx-p2x)*(p2x-p1x)+(sy-p2y)*(p2y-p1y)) AS d1, 
      ((sx-p3x)*(p4x-p3x)+(sy-p3y)*(p4y-p3y))*((sx-p4x)*(p4x-p3x)+(sy-p4y)*(p4y-p3y)) AS d2, 
      MAX(0, L12, L13, L14)-MIN(0, L12, L13, L14)-ABS(L12)-ABS(L34)                   AS d3
    FROM (
      SELECT 
        pk, haltna1, haltna2, hoehob, hoehun, 
        p1x, p1y, p1z, p2x, p2y, p2z, p3x, p3y, p3z, p4x, p4y, p4z, ex, ey, ez,
        CASE WHEN abs(det) > 0.000001 * bet THEN
          p1x+(p2x-p1x)*((p3x-p1x)*(p3y-p4y)-(p3y-p1y)*(p3x-p4x))/det ELSE NULL END     AS sx,
        CASE WHEN abs(det) > 0.000001 * bet THEN
          p1y+(p2y-p1y)*((p3x-p1x)*(p3y-p4y)-(p3y-p1y)*(p3x-p4x))/det ELSE NULL END     AS sy,
        ((p2x-p1x)*(p2x-p1x)+(p2y-p1y)*(p2y-p1y))                                       AS L12,
        ((p3x-p1x)*(p2x-p1x)+(p3y-p1y)*(p2y-p1y))                                       AS L13,
        ((p4x-p1x)*(p2x-p1x)+(p4y-p1y)*(p2y-p1y))                                       AS L14,
        ((p4x-p3x)*(p2x-p1x)+(p4y-p3y)*(p2y-p1y))                                       AS L34
      FROM (
        SELECT 
          pk, haltna1, haltna2, hoehob, hoehun, 
          p1x, p1y, p1z, p2x, p2y, p2z, p3x, p3y, p3z, p4x, p4y, p4z, 
          (p2y-p1y)*(p4z-p3z)-(p2z-p1z)*(p4y-p3y) AS ex, 
          (p2z-p1z)*(p4x-p3x)-(p2x-p1x)*(p4z-p3z) AS ey,
          (p2x-p1x)*(p4y-p3y)-(p2y-p1y)*(p4x-p3x) AS ez,
          ((p2x-p1x)*(p3y-p4y)-(p2y-p1y)*(p3x-p4x)) AS det,
          ((p2x-p1x)*(p3x-p4x)+(p2y-p1y)*(p3y-p4y)) AS bet
        FROM (
          SELECT
            ho.pk                 AS pk,
            ho.haltnam            AS haltna1, 
            hu.haltnam            AS haltna2, 
            ho.hoehe              AS hoehob, 
            hu.hoehe              AS hoehun, 
            x(PointN(ho.geom,1))  AS p1x, 
            y(PointN(ho.geom,1))  AS p1y, 
            ho.zoben              AS p1z, 
            x(PointN(ho.geom,-1)) AS p2x, 
            y(PointN(ho.geom,-1)) AS p2y, 
            ho.zunten             AS p2z, 
            x(PointN(hu.geom,1))  AS p3x, 
            y(PointN(hu.geom,1))  AS p3y, 
            hu.zoben              AS p3z, 
            x(PointN(hu.geom,-1)) AS p4x, 
            y(PointN(hu.geom,-1)) AS p4y, 
            hu.zunten             AS p4z
          FROM elems AS ho 
          INNER JOIN elems AS hu
          ON Distance(ho.geom, hu.geom) < 0.5 + (ho.durchm + hu.durchm) / 2.0
          WHERE
            ho.haltnam <> hu.haltnam AND 
            ho.schoben not in (hu.schoben, hu.schunten) AND 
            ho.schunten not in (hu.schoben, hu.schunten) AND 
            ho.zoben + ho.zunten >= hu.zoben + hu.zunten
          )
        )
      )
    WHERE
    CASE WHEN d1 IS NOT NULL AND d1 <= 0 AND d2 <= 0
        THEN abstkreuz <= (hoehob + hoehun) / 2.0 + 0.5
    WHEN d1 IS NULL AND d3 <= 0
        THEN abstpar <= (hoehob + hoehun) / 2.0 + 0.5
    ELSE FALSE END)',
 'Haltungen', 'pk'),

('Zustandsklassen', 'Der Schadenskode hat mehr als 3 Zeichen', 'Fehler', 9,
    'SELECT pk AS objid, ''Der Schadenskode hat mehr als 3 Zeichen'' AS bemerkung
    FROM Untersuchdat_haltung
    WHERE LENGTH(kuerzel) IS NOT 3',
 'Einzelschäden_Haltungen', 'pk'),
 
 ('Zustandsklassen', 'Untersuchungslänge prüfen', 'Fehler', 9,
    'SELECT 
    haltungen_untersucht.pk AS objid, ''Untersuchungslänge prüfen'' AS bemerkung
    FROM 
    haltungen_untersucht 
	LEFT JOIN 
    haltungen ON haltungen_untersucht.haltnam = haltungen.haltnam
	WHERE 
    ABS(haltungen_untersucht.laenge - haltungen.laenge) * 100.0 / ((haltungen_untersucht.laenge + haltungen.laenge) / 2.0) > 5
	GROUP BY haltungen_untersucht.haltnam',
 'Einzelschäden_Haltungen', 'pk'),

('Zustandsklassen', 'Haltungsname mehrfach', 'Fehler', 9,
    'SELECT pk AS objid, ''Haltungsname doppelt'' AS bemerkung
    FROM haltungen_untersucht group by haltnam having count(*)>1 ',
 'Zustand_Haltungen_gesamt', 'pk'),

('Zustandsklassen', 'Schachtname mehrfach', 'Fehler', 9,
    'SELECT pk AS objid, ''Schachtname doppelt'' AS bemerkung
    FROM schaechte_untersucht group by schnam having count(*)>1 ',
 'Zustand_Schächte_gesamt', 'pk'),

('Zustandsklassen', 'Der Schadenskode hat mehr als 3 Zeichen', 'Fehler', 9,
    'SELECT pk AS objid, ''Der Schadenskode hat mehr als 3 Zeichen'' AS bemerkung
    FROM Untersuchdat_schacht
    WHERE LENGTH(kuerzel) IS NOT 3',
 'Einzelschäden_Schächte', 'pk'),

('Zustandsklassen', 'Fehlende Angabe der Streckenschadensnummer', 'Fehler', 9,
    'SELECT pk AS objid, ''Fehlende Angabe der Streckenschadensnummer'' AS bemerkung
    FROM Untersuchdat_haltung
    WHERE streckenschaden IS NOT "not found" and streckenschaden_lfdnr IS 0',
 'Einzelschäden_Haltungen', 'pk'),

('Zustandsklassen', 'Fehlende Angabe des Streckenschadens', 'Fehler', 9,
    'SELECT pk AS objid, ''Fehlende Angabe des Streckenschadens'' AS bemerkung
    FROM Untersuchdat_haltung
    WHERE (streckenschaden IS "not found" or streckenschaden IS NULL) and streckenschaden_lfdnr IS NOT 0',
 'Einzelschäden_Haltungen', 'pk'),
 
 ('Zustandsklassen', 'Fehlende Angabe vom Ende des Streckenschadens', 'Fehler', 9,
    'SELECT pk AS objid, ''Fehlende Angabe vom Ende des Streckenschadens'' AS bemerkung
    FROM Untersuchdat_haltung
    GROUP BY untersuchhal
	HAVING SUM(CASE WHEN streckenschaden = ''A'' THEN 1 ELSE 0 END) > 0
   AND SUM(CASE WHEN streckenschaden = ''B'' THEN 1 ELSE 0 END) = 0',
 'Einzelschäden_Haltungen', 'pk'),

('Zustandsklassen', 'Das vergebene Schadenskürzel prüfen (DWA)', 'Fehler', 9,
    'SELECT pk AS objid, ''Das vergebene Schadenskürzel prüfen (DWA)'' AS bemerkung
    FROM Untersuchdat_haltung
    WHERE  Untersuchdat_haltung.kuerzel
							not in (select reflist_zustand.hauptcode from reflist_zustand WHERE art = "Haltung DWA")
							AND  Untersuchdat_haltung.untersuchhal in (select haltungen_untersucht.haltnam from haltungen_untersucht WHERE datenart = "DWA")',
 'Einzelschäden_Haltungen', 'pk'),

('Zustandsklassen', 'Das vergebene Schadenskürzel prüfen (ISYBAU)', 'Fehler', 9,
    'SELECT pk AS objid, ''Das vergebene Schadenskürzel prüfen (ISYBAU)'' AS bemerkung
    FROM Untersuchdat_haltung
    WHERE  Untersuchdat_haltung.kuerzel
							not in (select reflist_zustand.hauptcode from reflist_zustand WHERE art = "Haltung ISYBAU")
							AND  Untersuchdat_haltung.untersuchhal in (select haltungen_untersucht.haltnam from haltungen_untersucht WHERE datenart = "ISYBAU")',
 'Einzelschäden_Haltungen', 'pk'),

('Zustandsklassen', 'Das vergebene Schadenskürzel prüfen (DWA)', 'Fehler', 9,
    'SELECT pk AS objid, ''Das vergebene Schadenskürzel prüfen (DWA)'' AS bemerkung
    FROM Untersuchdat_schacht
    WHERE  Untersuchdat_schacht.kuerzel
							not in (select reflist_zustand.hauptcode from reflist_zustand WHERE art = "Schacht DWA")
							AND  Untersuchdat_schacht.untersuchsch in (select schaechte_untersucht.schnam from schaechte_untersucht WHERE datenart = "DWA")',
 'Einzelschäden_Schächte', 'pk'),

('Zustandsklassen', 'Das vergebene Schadenskürzel prüfen (ISYBAU)', 'Fehler', 9,
    'SELECT pk AS objid, ''Das vergebene Schadenskürzel prüfen (ISYBAU)'' AS bemerkung
    FROM Untersuchdat_schacht
    WHERE Untersuchdat_schacht.kuerzel
							not in (select reflist_zustand.hauptcode from reflist_zustand WHERE art = "Schacht ISYBAU")
							AND  Untersuchdat_schacht.untersuchsch in (select schaechte_untersucht.schnam from schaechte_untersucht WHERE datenart = "ISYBAU")',
 'Einzelschäden_Schächte', 'pk'),

('Zustandsklassen', 'Die Charakterisierung 1 prüfen (DWA)', 'Fehler', 9,
    'SELECT pk AS objid, ''Die Charakterisierung 1 prüfen (DWA)'' AS bemerkung
    FROM Untersuchdat_haltung
    WHERE Untersuchdat_haltung.kuerzel
							in (select reflist_zustand.hauptcode from reflist_zustand WHERE art = "Haltung DWA")
							AND Untersuchdat_haltung.charakt1
							not in (select reflist_zustand.charakterisierung1 from reflist_zustand WHERE reflist_zustand.charakterisierung1 like Untersuchdat_haltung.charakt1 AND Untersuchdat_haltung.kuerzel = reflist_zustand.hauptcode)
							AND  Untersuchdat_haltung.untersuchhal in (select haltungen_untersucht.haltnam from haltungen_untersucht WHERE datenart = "DWA")',
 'Einzelschäden_Haltungen', 'pk'),

('Zustandsklassen', 'Die Charakterisierung 1 prüfen (ISYBAU)', 'Fehler', 9,
    'SELECT pk AS objid, ''Die Charakterisierung 1 prüfen (ISYBAU)'' AS bemerkung
    FROM Untersuchdat_haltung
    WHERE Untersuchdat_haltung.kuerzel
							in (select reflist_zustand.hauptcode from reflist_zustand WHERE art = "Haltung ISYBAU")
							AND Untersuchdat_haltung.charakt1
							not in (select reflist_zustand.charakterisierung1 from reflist_zustand WHERE reflist_zustand.charakterisierung1 like Untersuchdat_haltung.charakt1 AND Untersuchdat_haltung.kuerzel = reflist_zustand.hauptcode)
							AND  Untersuchdat_haltung.untersuchhal in (select haltungen_untersucht.haltnam from haltungen_untersucht WHERE datenart = "ISYBAU")',
 'Einzelschäden_Haltungen', 'pk'),

('Zustandsklassen', 'Die Charakterisierung 1 prüfen (DWA)', 'Fehler', 9,
    'SELECT pk AS objid, ''Die Charakterisierung 1 prüfen (DWA)'' AS bemerkung
    FROM Untersuchdat_schacht
    WHERE Untersuchdat_schacht.kuerzel
							in (select reflist_zustand.hauptcode from reflist_zustand WHERE art = "Schacht DWA")
							AND Untersuchdat_schacht.charakt1
							not in (select reflist_zustand.charakterisierung1 from reflist_zustand WHERE reflist_zustand.charakterisierung1 like Untersuchdat_schacht.charakt1 AND Untersuchdat_schacht.kuerzel = reflist_zustand.hauptcode)
							AND  Untersuchdat_schacht.untersuchsch in (select schaechte_untersucht.schnam from schaechte_untersucht WHERE datenart = "DWA")',
 'Einzelschäden_Schächte', 'pk'),

('Zustandsklassen', 'Die Charakterisierung 1 prüfen (ISYBAU)', 'Fehler', 9,
    'SELECT pk AS objid, ''Die Charakterisierung 1 prüfen (ISYBAU)'' AS bemerkung
    FROM Untersuchdat_schacht
    WHERE Untersuchdat_schacht.kuerzel
							in (select reflist_zustand.hauptcode from reflist_zustand WHERE art = "Schacht ISYBAU")
							AND Untersuchdat_schacht.charakt1
							not in (select reflist_zustand.charakterisierung1 from reflist_zustand WHERE reflist_zustand.charakterisierung1 like Untersuchdat_schacht.charakt1 AND Untersuchdat_schacht.kuerzel = reflist_zustand.hauptcode)
							AND  Untersuchdat_schacht.untersuchsch in (select schaechte_untersucht.schnam from schaechte_untersucht WHERE datenart = "ISYBAU")',
 'Einzelschäden_Schächte', 'pk'),

('Zustandsklassen', 'Die Charakterisierung 2 prüfen (DWA)', 'Fehler', 9,
    'SELECT pk AS objid, ''Die Charakterisierung 2 prüfen (DWA)'' AS bemerkung
    FROM Untersuchdat_haltung
    WHERE Untersuchdat_haltung.kuerzel
							in (select reflist_zustand.hauptcode from reflist_zustand WHERE art = "Haltung DWA")
							AND Untersuchdat_haltung.charakt2
							not in (select reflist_zustand.charakterisierung2 from reflist_zustand WHERE reflist_zustand.charakterisierung1 like Untersuchdat_haltung.charakt1 AND Untersuchdat_haltung.kuerzel = reflist_zustand.hauptcode)
							AND  Untersuchdat_haltung.untersuchhal in (select haltungen_untersucht.haltnam from haltungen_untersucht WHERE datenart = "DWA")',
 'Einzelschäden_Haltungen', 'pk'),

('Zustandsklassen', 'Die Charakterisierung 2 prüfen (ISYBAU)', 'Fehler', 9,
    'SELECT pk AS objid, ''Die Charakterisierung 2 prüfen (ISYBAU)'' AS bemerkung
    FROM Untersuchdat_haltung
    WHERE Untersuchdat_haltung.kuerzel
							in (select reflist_zustand.hauptcode from reflist_zustand WHERE art = "Haltung ISYBAU")
							AND Untersuchdat_haltung.charakt2
							not in (select reflist_zustand.charakterisierung2 from reflist_zustand WHERE reflist_zustand.charakterisierung1 like Untersuchdat_haltung.charakt1 AND Untersuchdat_haltung.kuerzel = reflist_zustand.hauptcode)
							AND  Untersuchdat_haltung.untersuchhal in (select haltungen_untersucht.haltnam from haltungen_untersucht WHERE datenart = "ISYBAU")',
 'Einzelschäden_Haltungen', 'pk'),

('Zustandsklassen', 'Die Charakterisierung 2 prüfen (DWA)', 'Fehler', 9,
    'SELECT pk AS objid, ''Die Charakterisierung 2 prüfen (DWA)'' AS bemerkung
    FROM Untersuchdat_schacht
    WHERE Untersuchdat_schacht.kuerzel
							in (select reflist_zustand.hauptcode from reflist_zustand WHERE art = "Schacht DWA")
							AND Untersuchdat_schacht.charakt2
							not in (select reflist_zustand.charakterisierung2 from reflist_zustand WHERE reflist_zustand.charakterisierung1 like Untersuchdat_schacht.charakt1 AND Untersuchdat_schacht.kuerzel = reflist_zustand.hauptcode)
							AND  Untersuchdat_schacht.untersuchsch in (select schaechte_untersucht.schnam from schaechte_untersucht WHERE datenart = "DWA")',
 'Einzelschäden_Schächte', 'pk'),

('Zustandsklassen', 'Die Charakterisierung 2 prüfen(ISYBAU)', 'Fehler', 9,
    'SELECT pk AS objid, ''Die Charakterisierung 2 prüfen (ISYBAU)'' AS bemerkung
    FROM Untersuchdat_schacht
    WHERE Untersuchdat_schacht.kuerzel
							in (select reflist_zustand.hauptcode from reflist_zustand WHERE art = "Schacht ISYBAU")
							AND Untersuchdat_schacht.charakt2
							not in (select reflist_zustand.charakterisierung2 from reflist_zustand WHERE reflist_zustand.charakterisierung1 like Untersuchdat_schacht.charakt1 AND Untersuchdat_schacht.kuerzel = reflist_zustand.hauptcode)
							AND  Untersuchdat_schacht.untersuchsch in (select schaechte_untersucht.schnam from schaechte_untersucht WHERE datenart = "ISYBAU")',
 'Einzelschäden_Schächte', 'pk'),

('Zustandsklassen', 'Die Angabe vom Bereich prüfen (DWA)', 'Fehler', 9,
    'SELECT pk AS objid, ''Die Angabe vom Bereich prüfen (DWA)'' AS bemerkung
    FROM Untersuchdat_schacht
    WHERE Untersuchdat_schacht.kuerzel
							in (select reflist_zustand.hauptcode from reflist_zustand WHERE art = "Schacht DWA")
							AND Untersuchdat_schacht.bereich
							not in (select reflist_zustand.bereich from reflist_zustand WHERE reflist_zustand.charakterisierung1 like Untersuchdat_schacht.charakt1 AND Untersuchdat_schacht.kuerzel = reflist_zustand.hauptcode)
							AND  Untersuchdat_schacht.untersuchsch in (select schaechte_untersucht.schnam from schaechte_untersucht WHERE datenart = "DWA")',
 'Einzelschäden_Schächte', 'pk'),

('Zustandsklassen', 'Die Angabe vom Bereich prüfen (ISYBAU)', 'Fehler', 9,
    'SELECT pk AS objid, ''Die Angabe vom Bereich prüfen (ISYBAU)'' AS bemerkung
    FROM Untersuchdat_schacht
    WHERE Untersuchdat_schacht.kuerzel
							in (select reflist_zustand.hauptcode from reflist_zustand WHERE art = "Schacht ISYBAU")
							AND Untersuchdat_schacht.bereich
							not in (select reflist_zustand.bereich from reflist_zustand WHERE reflist_zustand.charakterisierung1 like Untersuchdat_schacht.charakt1 AND Untersuchdat_schacht.kuerzel = reflist_zustand.hauptcode)
							AND  Untersuchdat_schacht.untersuchsch in (select schaechte_untersucht.schnam from schaechte_untersucht WHERE datenart = "ISYBAU")',
 'Einzelschäden_Schächte', 'pk')
    )
) AS pn
LEFT JOIN pruefsql AS ps
ON (pn.gruppe = ps.gruppe AND pn.warnbez = ps.warntext)
WHERE ps.warntext IS NULL;
