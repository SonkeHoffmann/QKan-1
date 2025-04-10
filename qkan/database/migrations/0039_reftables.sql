-- Bestehende Trigger löschen
DROP TRIGGER IF EXISTS trig_ref_profile;
DROP TRIGGER IF EXISTS trig_ref_entwart;
DROP TRIGGER IF EXISTS trig_ref_simstatus;
DROP TRIGGER IF EXISTS trig_ref_material;

-- Änderungen an der Profilbezeichnung in der Detailtabelle nachführen
CREATE TRIGGER IF NOT EXISTS trig_ref_profile AFTER UPDATE OF profilnam ON profile
                BEGIN
                    UPDATE haltungen
                    SET profilnam = new.profilnam
                    WHERE profilnam = old.profilnam AND profilnam IS NOT NULL;
                    UPDATE anschlussleitungen
                    SET profilnam = new.profilnam
                    WHERE profilnam = old.profilnam AND profilnam IS NOT NULL;
                END;

-- Änderungen an der Bezeichnung in der Detailtabelle nachführen
CREATE TRIGGER IF NOT EXISTS trig_ref_entwart AFTER UPDATE OF bezeichnung ON entwaesserungsarten
                BEGIN
                    UPDATE haltungen
                    SET entwart = new.bezeichnung
                    WHERE entwart = old.bezeichnung AND entwart IS NOT NULL;
                    UPDATE schaechte
                    SET entwart = new.bezeichnung
                    WHERE entwart = old.bezeichnung AND entwart IS NOT NULL;
                    UPDATE anschlussleitungen
                    SET entwart = new.bezeichnung
                    WHERE entwart = old.bezeichnung AND entwart IS NOT NULL;
                END;

-- Änderungen an der Bezeichnung in der Detailtabelle nachführen
CREATE TRIGGER IF NOT EXISTS trig_ref_simstatus AFTER UPDATE OF bezeichnung ON simulationsstatus
                BEGIN
                    UPDATE haltungen
                    SET simstatus = new.bezeichnung
                    WHERE simstatus = old.bezeichnung AND simstatus IS NOT NULL;
                    UPDATE schaechte
                    SET simstatus = new.bezeichnung
                    WHERE simstatus = old.bezeichnung AND simstatus IS NOT NULL;
                    UPDATE anschlussleitungen
                    SET simstatus = new.bezeichnung
                    WHERE simstatus = old.bezeichnung AND simstatus IS NOT NULL;
                END;

-- Änderungen an der Bezeichnung in der Detailtabelle nachführen
CREATE TRIGGER IF NOT EXISTS trig_ref_material AFTER UPDATE OF bezeichnung ON material
                BEGIN
                    UPDATE haltungen
                    SET material = new.bezeichnung
                    WHERE material = old.bezeichnung AND material IS NOT NULL;
                    UPDATE schaechte
                    SET material = new.bezeichnung
                    WHERE material = old.bezeichnung AND material IS NOT NULL;
                    UPDATE anschlussleitungen
                    SET material = new.bezeichnung
                    WHERE material = old.bezeichnung AND material IS NOT NULL;
                END;

-- Tabelle Bauwerke ergänzen
CREATE TABLE bauwerke (
    pk INTEGER PRIMARY KEY,
    bezeichnung TEXT,
    art TEXT,               /* QGIS-Referenz Thematische Karte zur Auswahl des Symbols */
    link TEXT,
    kommentar TEXT,
    createdat TEXT DEFAULT CURRENT_TIMESTAMP);

SELECT AddGeometryColumn('qkan', 'bauwerke', 'geom', ?, 'POINT', 2);

CREATE INDEX idx_bauwerke_geom ON qkan.bauwerke USING GIST (geom);

CREATE TABLE bauwerke (
    pk INTEGER PRIMARY KEY,
    bezeichnung TEXT,
    art TEXT,               /* QGIS-Referenz Thematische Karte zur Auswahl des Symbols */
    link TEXT,
    kommentar TEXT,
    createdat TEXT DEFAULT CURRENT_TIMESTAMP);

SELECT AddGeometryColumn('bauwerke', 'geom', ?, 'POINT', 2);

SELECT CreateSpatialIndex('bauwerke', 'geom');

CREATE TABLE qkan.bauwerksarten (
	pkuid SERIAL PRIMARY KEY,
	bezeichnung character varying(30),
	kommentar character varying(255));


INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (2, 'KA geplant', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (3, 'KA vorh', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (4, 'KKA', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (5, 'MS gepl', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (6, 'MS vorh', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (7, 'NW Einl in Gew gepl', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (8, 'NW Einl in Gew vorh', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (9, 'PW gepl', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (10, 'PW vorh', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (11, 'RRB gepl', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (12, 'RRB vorh', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (13, 'RÜ gepl', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (14, 'RÜ vorh', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (15, 'RÜB gepl', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (16, 'RÜB vorh', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (17, 'SW Einl in Gew gepl', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (18, 'SW Einl in Gew vorh', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (19, 'SW Einl in GW gepl', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (20, 'SW Einl in GW vorh', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (21, 'TS gepl', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (22, 'TS vorh', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (23, 'NW Einl in GW gepl', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (24, 'NW Einl in GW vorh', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (25, 'Übergabe gepl', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (26, 'Übergabe vorh', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (27, 'Übernahme gepl', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (28, 'Übernahme vorh', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (29, 'USG', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (30, 'USG fest', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (31, 'USG plan', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (32, 'VSA gepl', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (33, 'wegfallend', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (34, 'WSZ I', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (35, 'WSZ II', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (36, 'WSZ IIIa', NULL);
INSERT INTO bauwerksarten (pkuid, bezeichnung, kommentar) VALUES (37, 'WSZ IIIb', NULL);
