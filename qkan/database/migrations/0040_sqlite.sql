-- Ergänzen einiger Felder in Tabelle anschlussleitungen
ALTER TABLE anschlussleitungen ADD COLUMN urstation REAL;                             /* Anschlussposition gegen Fließrichtung */
ALTER TABLE anschlussleitungen ADD COLUMN ursprung TEXT;                                  /* Adresse oder Objektbezeichnung */

-- Ergänzen der Referenztabelle Material

CREATE TABLE material (
    pk INTEGER PRIMARY KEY, 
    bezeichnung TEXT,
    kuerzel TEXT,
    isybau TEXT,                        /* BFR Abwasser */
    m150 TEXT,                          /* DWA M150 */
    m145 TEXT,                          /* DWA M145 */
    kommentar TEXT);

-- Ergänzen eines Triggers für die Referenztabelle abflussparameter
CREATE TRIGGER IF NOT EXISTS trig_ref_abflussparameter AFTER UPDATE OF apnam ON abflussparameter
                BEGIN
                    UPDATE flaechen
                    SET abflussparameter = new.apnam
                    WHERE abflussparameter = old.apnam AND abflussparameter IS NOT NULL;
                    UPDATE tezg
                    SET abflussparameter = new.apnam
                    WHERE abflussparameter = old.apnam AND abflussparameter IS NOT NULL;
                END;

-- Ändern des Geotyps für geom von MultiPolygon in MultiLineString

-- 1 Erstellen Zwischentabelle schaechte_temp

CREATE TABLE schaechte_temp (
    pk INTEGER PRIMARY KEY,
    schnam TEXT,
    sohlhoehe REAL,
    deckelhoehe REAL,
    durchm REAL,                                    /* Schachtdurchmesser (m) */
    druckdicht INTEGER, 
    ueberstauflaeche REAL DEFAULT 0,
    entwart TEXT DEFAULT 'Regenwasser',             /* join entwaesserungsarten.bezeichnung */
    strasse TEXT,
    baujahr INTEGER,
    eigentum TEXT,                                  /* join eigentum.name */
    teilgebiet TEXT,                                /* join teilgebiet.tgnam */
    knotentyp TEXT,                                 /* join knotentypen.knotentyp */
    auslasstyp TEXT,                                /* join auslasstypen.bezeichnung */
    schachttyp TEXT DEFAULT 'Schacht',              /* join schachttypen.schachttyp */
    simstatus TEXT DEFAULT 'vorhanden',             /* join simulationsstatus.bezeichnung */
    material TEXT,                                  /* join material.bezeichnung */
    xsch REAL, 
    ysch REAL,
    kommentar TEXT,
    createdat TEXT DEFAULT CURRENT_TIMESTAMP);

SELECT AddGeometryColumn('schaechte_temp', 'geop', {epsg}, 'POINT', 2);

SELECT AddGeometryColumn('schaechte_temp', 'geom', {epsg}, 'MULTIPOLYGON',2);

SELECT CreateSpatialIndex('schaechte_temp', 'geom');

SELECT CreateSpatialIndex('schaechte_temp', 'geop');

INSERT INTO schaechte_temp (schnam, sohlhoehe, deckelhoehe, durchm, druckdicht, ueberstauflaeche, entwart, strasse, baujahr, eigentum, teilgebiet, knotentyp, auslasstyp, schachttyp, simstatus, material, xsch, ysch, kommentar, createdat, geom, geop)
SELECT schnam, sohlhoehe, deckelhoehe, durchm, druckdicht, ueberstauflaeche, entwart, strasse, baujahr, eigentum, teilgebiet, knotentyp, auslasstyp, schachttyp, simstatus, material, xsch, ysch, kommentar, createdat, geom, geop
FROM schaechte;

-- 2 Alte Tabelle schaechte löschen

SELECT DiscardGeometryColumn('schaechte', 'geom');
SELECT DiscardGeometryColumn('schaechte', 'geop');

DROP TABLE schaechte;

-- 3 Neue Tabelle schaechte mit neuer Geospalte geom (MULTILINESTRING)

CREATE TABLE schaechte (
    pk INTEGER PRIMARY KEY,
    schnam TEXT,
    sohlhoehe REAL,
    deckelhoehe REAL,
    durchm REAL,                                    /* Schachtdurchmesser (m) */
    druckdicht INTEGER, 
    ueberstauflaeche REAL DEFAULT 0,
    entwart TEXT DEFAULT 'Regenwasser',             /* join entwaesserungsarten.bezeichnung */
    strasse TEXT,
    baujahr INTEGER,
    eigentum TEXT,                                  /* join eigentum.name */
    teilgebiet TEXT,                                /* join teilgebiet.tgnam */
    knotentyp TEXT,                                 /* join knotentypen.knotentyp */
    auslasstyp TEXT,                                /* join auslasstypen.bezeichnung */
    schachttyp TEXT DEFAULT 'Schacht',              /* join schachttypen.schachttyp */
    simstatus TEXT DEFAULT 'vorhanden',             /* join simulationsstatus.bezeichnung */
    material TEXT,                                  /* join material.bezeichnung */
    xsch REAL, 
    ysch REAL,
    kommentar TEXT,
    createdat TEXT DEFAULT CURRENT_TIMESTAMP);

SELECT AddGeometryColumn('schaechte', 'geop', {epsg}, 'POINT', 2);

SELECT AddGeometryColumn('schaechte', 'geom', {epsg}, 'MULTILINESTRING',2);

SELECT CreateSpatialIndex('schaechte', 'geom');

SELECT CreateSpatialIndex('schaechte', 'geop');

INSERT INTO schaechte (schnam, sohlhoehe, deckelhoehe, durchm, druckdicht, ueberstauflaeche, entwart, strasse, baujahr, eigentum, teilgebiet, knotentyp, auslasstyp, schachttyp, simstatus, material, xsch, ysch, kommentar, createdat, geom, geop)
SELECT schnam, sohlhoehe, deckelhoehe, durchm, druckdicht, ueberstauflaeche, entwart, strasse, baujahr, eigentum, teilgebiet, knotentyp, auslasstyp, schachttyp, simstatus, material, xsch, ysch, kommentar, createdat, CastToMultiLineString(LinesFromRings(geom)) AS geom, geop
FROM schaechte_temp;

-- DROP TABLE schaechte_temp;
