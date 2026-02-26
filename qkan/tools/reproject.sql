/* SQL-Skript zur Änderung der Projektion eines QKan-Projektes

1. Daten im neuen Projektionssystem laden, damit die Geo-Objekte schon für das richtige Projektionssystem angelegt werden.
2. Daten mit dem nachfolgenden Skript mit Hilfe des SQL-Fensters im DBManager oder mit dem Programm "DB Browser" konvertieren. 

SpatiaLite: TransformXY(SetSrid(
PostGIS: ST_Transform(ST_SetSrid(
*/
UPDATE linkfl
SET glink = ST_Transform(SetSrid(glink, '31462'), '25832'),
    geom = ST_Transform(SetSrid(geom, '31462'), '25832'),
	gbuf = ST_Transform(SetSrid(gbuf, '31462'), '25832');

UPDATE linksw
SET glink = ST_Transform(SetSrid(glink, '31462'), '25832'),
    geom = ST_Transform(SetSrid(geom, '31462'), '25832'),
	gbuf = ST_Transform(SetSrid(gbuf, '31462'), '25832');

UPDATE notizen SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
UPDATE schaechte SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
UPDATE schaechte SET geop = ST_Transform(SetSrid(geop, '31462'), '25832');
-- UPDATE schaechte_temp SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
-- UPDATE schaechte_temp SET geop = ST_Transform(SetSrid(geop, '31462'), '25832');
UPDATE schaechte_untersucht SET geop = ST_Transform(SetSrid(geop, '31462'), '25832');
UPDATE symbole SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
UPDATE t_strakathausanschluesse SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
UPDATE t_strakatk_ori SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
UPDATE t_strakatk_ori SET geop = ST_Transform(SetSrid(geop, '31462'), '25832');
UPDATE t_strakatkanal SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
UPDATE t_strakatkanal SET geop = ST_Transform(SetSrid(geop, '31462'), '25832');
UPDATE teilgebiete SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
UPDATE tezg SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
UPDATE untersuchdat_anschlussleitung SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
UPDATE untersuchdat_haltung SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
UPDATE untersuchdat_schacht SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');

UPDATE anschlussschaechte SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
UPDATE anschlussleitungen SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
UPDATE anschlussleitungen_untersucht SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
UPDATE aussengebiete SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
UPDATE einleit SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
UPDATE einzugsgebiete SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
UPDATE flaechen SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
-- UPDATE flaechen_he8 SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
UPDATE haltungen SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
UPDATE haltungen_untersucht SET geom = ST_Transform(SetSrid(geom, '31462'), '25832');
UPDATE linkageb SET glink = ST_Transform(SetSrid(glink, '31462'), '25832');

