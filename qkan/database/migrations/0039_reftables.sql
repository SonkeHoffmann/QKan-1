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

-- Trigger für neue oder geänderte Haltungen aktualisieren

DROP TRIGGER IF EXISTS trig_new_hal;
DROP TRIGGER IF EXISTS trig_mod_hal;

-- Tabelle Symbole ergänzen
CREATE TABLE symbole (
    pk INTEGER PRIMARY KEY,
    bezeichnung TEXT,
    art TEXT,               /* QGIS-Referenz Thematische Karte zur Auswahl des Symbols */
    link TEXT,
    gruppe TEXT,
    kommentar TEXT,
    createdat TEXT DEFAULT CURRENT_TIMESTAMP);

SELECT AddGeometryColumn('symbole', 'geom', {epsg}, 'POINT', 2);

SELECT CreateSpatialIndex('symbole', 'geom');

CREATE TABLE symbolkatalog (
    pk INTEGER PRIMARY KEY,
    bezeichnung TEXT,
    gruppe TEXT,                            /* zur Aufteilung auf verschiedene Layer */
    kommentar TEXT);

INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('KA geplant', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('KA vorh', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('KKA', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('MS gepl', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('MS vorh', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('NW Einl in Gew gepl', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('NW Einl in Gew vorh', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('PW gepl', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('PW vorh', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('RRB gepl', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('RRB vorh', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('RÜ gepl', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('RÜ vorh', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('RÜB gepl', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('RÜB vorh', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('SW Einl in Gew gepl', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('SW Einl in Gew vorh', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('SW Einl in GW gepl', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('SW Einl in GW vorh', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('TS gepl', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('TS vorh', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('NW Einl in GW gepl', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('NW Einl in GW vorh', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('Übergabe gepl', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('Übergabe vorh', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('Übernahme gepl', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('Übernahme vorh', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('USG', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('USG fest', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('USG plan', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('VSA gepl', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('wegfallend', 'ABK NRW', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('Abflusslose Grube', 'Entwässerung', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('Be-/Entlüftungsschacht', 'Entwässerung', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('Molchschacht', 'Entwässerung', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('Strassenablauf', 'Entwässerung', NULL);
INSERT INTO symbolkatalog (bezeichnung, gruppe, kommentar) VALUES ('Vakuumstation', 'Entwässerung', NULL);
