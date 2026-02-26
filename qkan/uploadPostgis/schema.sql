CREATE TABLE qkan.abflussparameter (
	pk integer PRIMARY KEY,
	apnam character varying(255),
	anfangsabflussbeiwert character varying(255),
	endabflussbeiwert character varying(255),
	benetzungsverlust character varying(255),
	muldenverlust character varying(255),
	benetzung_startwert character varying(255),
	mulden_startwert character varying(255),
	rauheit_kst character varying(255),
	pctzero character varying(255),
	bodenklasse character varying(255),
	flaechentyp character varying(255),
	kommentar character varying(255),
	createdat timestamp);


CREATE TABLE qkan.abflusstypen (
	pk integer PRIMARY KEY,
	abflusstyp character varying(19),
	he_nr smallint,
	kp_nr smallint);


CREATE TABLE qkan.anschlussleitungen (
	pk integer PRIMARY KEY,
	leitnam character varying(14),
	schoben character varying(14),
	schunten character varying(14),
	hoehe double precision,
	breite double precision,
	laenge double precision,
	aussendurchmesser double precision,
	sohleoben double precision,
	sohleunten double precision,
	baujahr smallint,
	haltnam character varying(255),
	teilgebiet character varying(255),
	strasse character varying(16),
	entwart character varying(11),
	material character varying(255),
	profilauskleidung character varying(255),
	innenmaterial character varying(255),
	ks double precision,
	anschlusstyp character varying(255),
	simstatus character varying(10),
	xschob double precision,
	yschob double precision,
	xschun double precision,
	yschun double precision,
	kommentar character varying(19),
	createdat timestamp);

SELECT AddGeometryColumn('qkan', 'anschlussleitungen', 'geom', 25832, 'LINESTRING', 2);
CREATE INDEX idx_anschlussleitungen_geom ON qkan.anschlussleitungen USING GIST (geom);


CREATE TABLE qkan.anschlussleitungen_untersucht (
	pk integer PRIMARY KEY,
	leitnam character varying(14),
	bezugspunkt character varying(255),
	schoben character varying(14),
	schunten character varying(14),
	hoehe double precision,
	breite double precision,
	laenge double precision,
	baujahr character varying(255),
	id smallint,
	untersuchtag date,
	untersucher character varying(11),
	untersuchrichtung character varying(1),
	wetter smallint,
	bewertungsart character varying(255),
	bewertungstag character varying(255),
	strasse character varying(255),
	datenart character varying(3),
	auftragsbezeichnung character varying(255),
	max_zd smallint,
	max_zb smallint,
	max_zs smallint,
	xschob character varying(255),
	yschob character varying(255),
	xschun character varying(255),
	yschun character varying(255),
	kommentar character varying(19),
	createdat timestamp);

SELECT AddGeometryColumn('qkan', 'anschlussleitungen_untersucht', 'geom', 25832, 'LINESTRING', 2);
CREATE INDEX idx_anschlussleitungen_untersucht_geom ON qkan.anschlussleitungen_untersucht USING GIST (geom);


CREATE TABLE qkan.auslasstypen (
	pk integer PRIMARY KEY,
	bezeichnung character varying(9),
	he_nr smallint,
	mu_nr character varying(255),
	kp_nr character varying(255));


CREATE TABLE qkan.aussengebiete (
	pk integer PRIMARY KEY,
	gebnam character varying(5),
	schnam character varying(255),
	hoeheob character varying(255),
	hoeheun character varying(255),
	fliessweg character varying(255),
	basisabfluss character varying(255),
	cn character varying(255),
	regenschreiber character varying(255),
	teilgebiet character varying(255),
	kommentar character varying(255),
	createdat character varying(255));

SELECT AddGeometryColumn('qkan', 'aussengebiete', 'geom', 25832, 'MULTIPOLYGON', 2);
CREATE INDEX idx_aussengebiete_geom ON qkan.aussengebiete USING GIST (geom);


CREATE TABLE qkan.bewertungsart (
	pk integer PRIMARY KEY,
	kuerzel smallint,
	bezeichnung character varying(31),
	bemerkung character varying(255));


CREATE TABLE qkan.bodenklassen (
	pk integer PRIMARY KEY,
	bknam character varying(255),
	infiltrationsrateanfang character varying(255),
	infiltrationsrateende character varying(255),
	infiltrationsratestart character varying(255),
	rueckgangskonstante character varying(255),
	regenerationskonstante character varying(255),
	saettigungswassergehalt character varying(255),
	kommentar character varying(255),
	createdat timestamp);


CREATE TABLE qkan.eigentum (
	pk integer PRIMARY KEY,
	name character varying(13),
	kommentar character varying(22));


CREATE TABLE qkan.einleit (
	pk integer PRIMARY KEY,
	elnam character varying(5),
	haltnam character varying(255),
	schnam character varying(255),
	teilgebiet character varying(255),
	zufluss character varying(255),
	ew character varying(255),
	einzugsgebiet character varying(255),
	kommentar character varying(255),
	createdat timestamp);

SELECT AddGeometryColumn('qkan', 'einleit', 'geom', 25832, 'POINT', 2);
CREATE INDEX idx_einleit_geom ON qkan.einleit USING GIST (geom);


CREATE TABLE qkan.einzugsgebiete (
	pk integer PRIMARY KEY,
	tgnam character varying(5),
	ewdichte character varying(255),
	wverbrauch character varying(255),
	stdmittel character varying(255),
	fremdwas character varying(255),
	kommentar character varying(255),
	createdat timestamp);

SELECT AddGeometryColumn('qkan', 'einzugsgebiete', 'geom', 25832, 'MULTIPOLYGON', 2);
CREATE INDEX idx_einzugsgebiete_geom ON qkan.einzugsgebiete USING GIST (geom);



CREATE TABLE qkan.entwaesserungsarten (
	pk integer PRIMARY KEY,
	bezeichnung character varying(26),
	kuerzel character varying(15),
	he_nr smallint,
	kp_nr smallint,
	isybau character varying(2),
	m150 character varying(255),
	m145 character varying(255),
	bemerkung character varying(33),
	transport smallint,
	druckdicht smallint);


CREATE TABLE qkan.flaechen (
	pk integer PRIMARY KEY,
	flnam character varying(255),
	haltnam character varying(255),
	schnam character varying(255),
	neigkl smallint,
	neigung character varying(255),
	teilgebiet character varying(255),
	regenschreiber character varying(255),
	abflussparameter character varying(255),
	aufteilen character varying(4),
	kommentar character varying(255),
	createdat timestamp);

SELECT AddGeometryColumn('qkan', 'flaechen', 'geom', 25832, 'MULTIPOLYGON', 2);
CREATE INDEX idx_flaechen_geom ON qkan.flaechen USING GIST (geom);


CREATE TABLE qkan.flaechentypen (
	pk integer PRIMARY KEY,
	bezeichnung character varying(12),
	he_nr smallint);


CREATE TABLE qkan.gruppen (
	pk integer PRIMARY KEY,
	pktab character varying(5),
	grnam character varying(255),
	teilgebiet character varying(255),
	tabelle character varying(255),
	kommentar character varying(255),
	createdat timestamp);


CREATE TABLE qkan.haltungen (
	pk integer PRIMARY KEY,
	haltnam character varying(255),
	schoben character varying(255),
	schunten character varying(255),
	hoehe double precision,
	breite double precision,
	laenge double precision,
	aussendurchmesser character varying(255),
	sohleoben double precision,
	sohleunten double precision,
	baujahr smallint,
	eigentum character varying(13),
	teilgebiet character varying(21),
	strasse character varying(25),
	profilnam character varying(24),
	entwart character varying(26),
	material character varying(21),
	profilauskleidung character varying(255),
	innenmaterial character varying(255),
	ks double precision,
	haltungstyp character varying(7),
	simstatus character varying(10),
	transport smallint,
	druckdicht smallint,
	xschob double precision,
	yschob double precision,
	xschun double precision,
	yschun double precision,
	kommentar character varying(19),
	createdat timestamp);

SELECT AddGeometryColumn('qkan', 'haltungen', 'geom', 25832, 'LINESTRING', 2);
CREATE INDEX idx_haltungen_geom ON qkan.haltungen USING GIST (geom);


CREATE TABLE qkan.haltungen_untersucht (
	pk integer PRIMARY KEY,
	haltnam character varying(11),
	bezugspunkt character varying(255),
	schoben character varying(11),
	schunten character varying(11),
	hoehe double precision,
	breite double precision,
	laenge double precision,
	baujahr smallint,
	id smallint,
	untersuchtag date,
	untersucher character varying(15),
	untersuchrichtung character varying(1),
	wetter smallint,
	bewertungsart character varying(3),
	bewertungstag character varying(255),
	strasse character varying(25),
	datenart character varying(3),
	auftragsbezeichnung character varying(255),
	max_zd smallint,
	max_zb smallint,
	max_zs smallint,
	xschob double precision,
	yschob double precision,
	xschun double precision,
	yschun double precision,
	kommentar character varying(19),
	createdat timestamp);

SELECT AddGeometryColumn('qkan', 'haltungen_untersucht', 'geom', 25832, 'LINESTRING', 2);
CREATE INDEX idx_haltungen_untersucht_geom ON qkan.haltungen_untersucht USING GIST (geom);


CREATE TABLE qkan.haltungstypen (
	pk integer PRIMARY KEY,
	bezeichnung character varying(18),
	bemerkung character varying(15));


CREATE TABLE qkan.info (
	pk integer PRIMARY KEY,
	subject character varying(7),
	value character varying(5),
	createdat timestamp);


CREATE TABLE qkan.knotentypen (
	pk integer PRIMARY KEY,
	knotentyp character varying(14));


CREATE TABLE qkan.linkageb (
	pk integer PRIMARY KEY,
	gebnam character varying(5),
	schnam character varying(255));

SELECT AddGeometryColumn('qkan', 'linkageb', 'glink', 25832, 'LINESTRING', 2);
CREATE INDEX idx_linkageb_glink ON qkan.linkageb USING GIST (glink);


CREATE TABLE qkan.linkfl (
	pk integer PRIMARY KEY,
	flnam character varying(255),
	haltnam character varying(255),
	schnam character varying(255),
	tezgnam character varying(255),
	teilgebiet character varying(255),
	abflusstyp character varying(255),
	speicherzahl character varying(255),
	speicherkonst character varying(255),
	fliesszeitkanal character varying(255),
	fliesszeitflaeche character varying(255));

SELECT AddGeometryColumn('qkan', 'linkfl', 'geom', 25832, 'MULTIPOLYGON', 2);
CREATE INDEX idx_linkfl_geom ON qkan.linkfl USING GIST (geom);
SELECT AddGeometryColumn('qkan', 'linkfl', 'gbuf', 25832, 'MULTIPOLYGON', 2);
CREATE INDEX idx_linkfl_gbuf ON qkan.linkfl USING GIST (gbuf);
SELECT AddGeometryColumn('qkan', 'linkfl', 'glink', 25832, 'LINESTRING', 2);
CREATE INDEX idx_linkfl_glink ON qkan.linkfl USING GIST (glink);


CREATE TABLE qkan.linksw (
	pk integer PRIMARY KEY,
	elnam character varying(5),
	haltnam character varying(255),
	schnam character varying(255),
	teilgebiet character varying(255));

SELECT AddGeometryColumn('qkan', 'linksw', 'geom', 25832, 'MULTIPOLYGON', 2);
CREATE INDEX idx_linksw_geom ON qkan.linksw USING GIST (geom);
SELECT AddGeometryColumn('qkan', 'linksw', 'gbuf', 25832, 'MULTIPOLYGON', 2);
CREATE INDEX idx_linksw_gbuf ON qkan.linksw USING GIST (gbuf);
SELECT AddGeometryColumn('qkan', 'linksw', 'glink', 25832, 'LINESTRING', 2);
CREATE INDEX idx_linksw_glink ON qkan.linksw USING GIST (glink);


CREATE TABLE qkan.material (
	pk integer PRIMARY KEY,
	bezeichnung character varying(5),
	kuerzel character varying(255),
	isybau character varying(255),
	m150 character varying(255),
	m145 character varying(255),
	kommentar character varying(255));


CREATE TABLE qkan.notizen (
	pk integer PRIMARY KEY,
	notiz character varying(5),
	createdat timestamp);

SELECT AddGeometryColumn('qkan', 'notizen', 'geom', 25832, 'POINT', 2);
CREATE INDEX idx_notizen_geom ON qkan.notizen USING GIST (geom);


CREATE TABLE qkan.profile (
	pk integer PRIMARY KEY,
	profilnam character varying(255),
	kuerzel character varying(5),
	he_nr character varying(255),
	mu_nr character varying(255),
	kp_key character varying(255),
	isybau character varying(255),
	m150 character varying(255),
	m145 character varying(255),
	kommentar character varying(22));


CREATE TABLE qkan.pruefliste (
	pk integer PRIMARY KEY,
	warntext character varying(255),
	warntyp character varying(255),
	warnlevel character varying(255),
	layername character varying(255),
	attrname character varying(255),
	objname character varying(255),
	createdat timestamp);


CREATE TABLE qkan.pruefsql (
	pk integer PRIMARY KEY,
	gruppe character varying(40),
	warntext character varying(65),
	warntyp character varying(7),
	warnlevel smallint,
	sql text,
	layername character varying(26),
	attrname character varying(7),
	createdat timestamp);


CREATE TABLE qkan.pumpentypen (
	pk integer PRIMARY KEY,
	bezeichnung character varying(28),
	he_nr smallint);


CREATE TABLE qkan.reflist_zustand (
	pk integer PRIMARY KEY,
	art character varying(11),
	hauptcode character varying(9),
	charakterisierung1 character varying(18),
	charakterisierung2 character varying(18),
	bereich character varying(7));


CREATE TABLE qkan.schachttypen (
	pk integer PRIMARY KEY,
	schachttyp character varying(16));


CREATE TABLE qkan.schaechte (
	pk integer PRIMARY KEY,
	schnam character varying(255),
	sohlhoehe double precision,
	deckelhoehe double precision,
	durchm double precision,
	druckdicht character varying(255),
	ueberstauflaeche double precision,
	entwart character varying(26),
	strasse character varying(25),
	baujahr smallint,
	eigentum character varying(13),
	teilgebiet character varying(21),
	knotentyp character varying(39),
	auslasstyp character varying(255),
	schachttyp character varying(7),
	simstatus character varying(9),
	material character varying(13),
	xsch double precision,
	ysch double precision,
	kommentar character varying(19),
	createdat timestamp);

SELECT AddGeometryColumn('qkan', 'schaechte', 'geop', 25832, 'POINT', 2);
CREATE INDEX idx_schaechte_geop ON qkan.schaechte USING GIST (geop);
SELECT AddGeometryColumn('qkan', 'schaechte', 'geom', 25832, 'MULTIPOLYGON', 2);
CREATE INDEX idx_schaechte_geom ON qkan.schaechte USING GIST (geom);


CREATE TABLE qkan.schaechte_untersucht (
	pk integer PRIMARY KEY,
	schnam character varying(9),
	durchm double precision,
	baujahr smallint,
	bezugspunkt character varying(255),
	id smallint,
	untersuchtag date,
	untersucher character varying(13),
	wetter smallint,
	strasse character varying(18),
	bewertungsart character varying(3),
	bewertungstag character varying(255),
	datenart character varying(3),
	auftragsbezeichnung character varying(255),
	max_zd smallint,
	max_zb smallint,
	max_zs smallint,
	kommentar character varying(19),
	createdat timestamp);

SELECT AddGeometryColumn('qkan', 'schaechte_untersucht', 'geop', 25832, 'POINT', 2);
CREATE INDEX idx_schaechte_untersucht_geop ON qkan.schaechte_untersucht USING GIST (geop);


CREATE TABLE qkan.simulationsstatus (
	pk integer PRIMARY KEY,
	bezeichnung character varying(26),
	kuerzel character varying(2),
	he_nr smallint,
	mu_nr smallint,
	kp_nr smallint,
	isybau character varying(2),
	m150 character varying(2),
	m145 character varying(2),
	kommentar character varying(13));


CREATE TABLE qkan.teilgebiete (
	pk integer PRIMARY KEY,
	tgnam character varying(21),
	kommentar character varying(22),
	createdat timestamp);

SELECT AddGeometryColumn('qkan', 'teilgebiete', 'geom', 25832, 'MULTIPOLYGON', 2);
CREATE INDEX idx_teilgebiete_geom ON qkan.teilgebiete USING GIST (geom);


CREATE TABLE qkan.tezg (
	pk integer PRIMARY KEY,
	flnam character varying(7),
	haltnam character varying(255),
	schnam character varying(255),
	neigkl smallint,
	neigung character varying(255),
	befgrad character varying(255),
	schwerpunktlaufzeit character varying(255),
	regenschreiber character varying(255),
	teilgebiet character varying(255),
	abflussparameter character varying(255),
	kommentar character varying(255),
	createdat timestamp);

SELECT AddGeometryColumn('qkan', 'tezg', 'geom', 25832, 'MULTIPOLYGON', 2);
CREATE INDEX idx_tezg_geom ON qkan.tezg USING GIST (geom);


CREATE TABLE qkan.untersuchdat_anschlussleitung (
	pk integer PRIMARY KEY,
	untersuchleit character varying(14),
	schoben character varying(14),
	schunten character varying(14),
	id smallint,
	untersuchtag date,
	bandnr character varying(8),
	videozaehler character varying(6),
	inspektionslaenge character varying(255),
	station double precision,
	stationtext character varying(255),
	timecode character varying(255),
	video_offset character varying(255),
	langtext character varying(150),
	kuerzel character varying(4),
	charakt1 character varying(4),
	charakt2 character varying(2),
	quantnr1 double precision,
	quantnr2 double precision,
	streckenschaden character varying(255),
	streckenschaden_lfdnr integer,
	pos_von smallint,
	pos_bis smallint,
	foto_dateiname character varying(66),
	film_dateiname character varying(107),
	ordner_bild character varying(255),
	ordner_video character varying(255),
	filmtyp character varying(255),
	video_start character varying(255),
	video_ende character varying(255),
	zd smallint,
	zb smallint,
	zs smallint,
	kommentar character varying(112),
	createdat timestamp);

SELECT AddGeometryColumn('qkan', 'untersuchdat_anschlussleitung', 'geom', 25832, 'LINESTRING', 2);
CREATE INDEX idx_untersuchdat_anschlussleitung_geom ON qkan.untersuchdat_anschlussleitung USING GIST (geom);


CREATE TABLE qkan.untersuchdat_haltung (
	pk integer PRIMARY KEY,
	untersuchhal character varying(11),
	schoben character varying(11),
	schunten character varying(11),
	id smallint,
	untersuchtag date,
	bandnr character varying(8),
	videozaehler character varying(6),
	inspektionslaenge double precision,
	station double precision,
	stationtext character varying(255),
	timecode character varying(255),
	video_offset character varying(255),
	langtext character varying(152),
	kuerzel character varying(10),
	charakt1 character varying(2),
	charakt2 character varying(2),
	quantnr1 double precision,
	quantnr2 double precision,
	streckenschaden character varying(255),
	streckenschaden_lfdnr integer,
	pos_von smallint,
	pos_bis smallint,
	foto_dateiname character varying(66),
	film_dateiname character varying(111),
	ordner_bild character varying(255),
	ordner_video character varying(255),
	filmtyp character varying(255),
	video_start character varying(255),
	video_ende character varying(255),
	zd smallint,
	zb smallint,
	zs smallint,
	kommentar character varying(123),
	createdat timestamp);

SELECT AddGeometryColumn('qkan', 'untersuchdat_haltung', 'geom', 25832, 'LINESTRING', 2);
CREATE INDEX idx_untersuchdat_haltung_geom ON qkan.untersuchdat_haltung USING GIST (geom);


CREATE TABLE qkan.untersuchdat_schacht (
	pk integer PRIMARY KEY,
	untersuchsch character varying(9),
	id smallint,
	untersuchtag date,
	bandnr character varying(255),
	videozaehler character varying(5),
	timecode character varying(255),
	langtext character varying(149),
	kuerzel character varying(3),
	charakt1 character varying(1),
	charakt2 character varying(1),
	quantnr1 double precision,
	quantnr2 double precision,
	streckenschaden character varying(255),
	streckenschaden_lfdnr integer,
	pos_von smallint,
	pos_bis smallint,
	vertikale_lage character varying(255),
	inspektionslaenge character varying(255),
	bereich character varying(255),
	foto_dateiname character varying(63),
	ordner character varying(255),
	film_dateiname character varying(106),
	ordner_video character varying(255),
	filmtyp character varying(255),
	video_start character varying(255),
	video_ende character varying(255),
	zd smallint,
	zb smallint,
	zs smallint,
	kommentar character varying(35),
	createdat timestamp);

SELECT AddGeometryColumn('qkan', 'untersuchdat_schacht', 'geom', 25832, 'LINESTRING', 2);
CREATE INDEX idx_untersuchdat_schacht_geom ON qkan.untersuchdat_schacht USING GIST (geom);


CREATE TABLE qkan.untersuchrichtung (
	pk integer PRIMARY KEY,
	bezeichnung character varying(20),
	kuerzel character varying(255),
	isybau character varying(255),
	m150 character varying(255),
	m145 character varying(255),
	bemerkung character varying(24));


CREATE TABLE qkan.wetter (
	pk integer PRIMARY KEY,
	kuerzel smallint,
	bezeichnung character varying(29),
	isybau character varying(255),
	m150 character varying(255),
	m145 character varying(255),
	bemerkung character varying(255));


CREATE TABLE qkan.symbole (
	pk integer PRIMARY KEY,
	bezeichnung character varying(30),
	art character varying(30),
	link character varying(255),
	kommentar character varying(255),
	createdat timestamp);

SELECT AddGeometryColumn('qkan', 'symbole', 'geom', 25832, 'POINT', 2);
CREATE INDEX idx_symbole_geom ON qkan.symbole USING GIST (geom);

CREATE TABLE qkan.symbolkatalog (
    pk SERIAL PRIMARY KEY,
    bezeichnung character varying(30),
    kommentar character varying(255));

