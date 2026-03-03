"""
Upload einer SQLite-Datenbank auf PostGIS WebSuite

Dieses Modul ermöglicht den Upload einer QKan SQLite-Datenbank auf einen
PostGIS-Server (z.B. GBD WebSuite). Die Tabellenstruktur wird aus der
Datei schema.sql gelesen (Single Source of Truth) und die Daten werden
aus der SQLite-Quelldatenbank in die entsprechenden PostgreSQL-Tabellen
übertragen. Nur Tabellen, die in schema.sql definiert sind, werden
erstellt und befüllt.
"""

import os
import re
import psycopg2
import psycopg2.extras
import getpass
import datetime
import sqlite3
import struct
from typing import Optional, Dict, List, Any, Tuple, Callable

from qgis.PyQt.QtCore import QSettings
from qgis.PyQt.QtWidgets import QProgressBar, QApplication
from qgis.utils import spatialite_connect

from qkan.utils import get_logger, QkanError
from .connection_dialog import normalize_hostname

logger = get_logger("QKan.uploadPostgis._uploadPostgis")

# Regex für deutsches Datumsformat DD.MM.YYYY HH:MM oder DD.MM.YYYY
_GERMAN_DATETIME_RE = re.compile(
    r'^(\d{2})\.(\d{2})\.(\d{4})\s+(\d{2}):(\d{2})(?::(\d{2}))?$'
)
_GERMAN_DATE_RE = re.compile(r'^(\d{2})\.(\d{2})\.(\d{4})$')

# Pfad zur schema.sql Datei (im selben Verzeichnis wie dieses Modul)
SCHEMA_SQL_PATH = os.path.join(os.path.dirname(__file__), "schema.sql")


def _coord_size_for_type(geom_type: int) -> int:
    """Byte-Größe eines Koordinatenpunkts nach Geometrietyp.

    SpatiaLite/WKB Typ-Bereiche:
      0–999:    2D  (XY)   → 16 Bytes
      1000–1999: Z  (XYZ)  → 24 Bytes
      2000–2999: M  (XYM)  → 24 Bytes
      3000–3999: ZM (XYZM) → 32 Bytes
    """
    if geom_type < 1000:
        return 16
    elif geom_type < 2000:
        return 24
    elif geom_type < 3000:
        return 24
    else:
        return 32


def _convert_spatialite_geometry(
    data: bytes, offset: int, bo: str, endian: int, out: bytearray
) -> int:
    """Parst eine SpatiaLite-Geometrie rekursiv und schreibt Standard-WKB.

    SpatiaLite speichert Geometrien intern NICHT als Standard-WKB:
      - Kein Endian-Byte pro (Sub-)Geometrie
      - 0x69-Separatoren zwischen Ringen (Polygon) und Sub-Geometrien (Multi*)

    Standard-WKB erwartet:
      - Endian-Byte vor jeder (Sub-)Geometrie
      - Keine Separatoren

    Args:
        data:   Geometrie-Body (nach 39-Byte-Header, ohne 0xFE-Ende)
        offset: Aktuelle Leseposition in data
        bo:     struct Byte-Order-Zeichen ('<' für LE, '>' für BE)
        endian: Endian-Byte (0x00=BE, 0x01=LE)
        out:    Ausgabe-Buffer für WKB-Bytes

    Returns:
        Neue Leseposition nach dem Parsen
    """
    geom_type = struct.unpack_from(f'{bo}I', data, offset)[0]
    offset += 4

    # WKB: Endian-Byte + Geometrietyp
    out.append(endian)
    out.extend(struct.pack(f'{bo}I', geom_type))

    base_type = geom_type % 1000
    pt_size = _coord_size_for_type(geom_type)

    if base_type == 1:  # Point
        out.extend(data[offset:offset + pt_size])
        offset += pt_size

    elif base_type == 2:  # LineString
        npts = struct.unpack_from(f'{bo}I', data, offset)[0]
        out.extend(data[offset:offset + 4])
        offset += 4
        nbytes = npts * pt_size
        out.extend(data[offset:offset + nbytes])
        offset += nbytes

    elif base_type == 3:  # Polygon
        nrings = struct.unpack_from(f'{bo}I', data, offset)[0]
        out.extend(data[offset:offset + 4])
        offset += 4
        for i in range(nrings):
            if i > 0:
                offset += 1  # 0x69-Separator zwischen Ringen überspringen
            npts = struct.unpack_from(f'{bo}I', data, offset)[0]
            out.extend(data[offset:offset + 4])
            offset += 4
            nbytes = npts * pt_size
            out.extend(data[offset:offset + nbytes])
            offset += nbytes

    elif base_type in (4, 5, 6, 7):  # Multi* / GeometryCollection
        ngeoms = struct.unpack_from(f'{bo}I', data, offset)[0]
        out.extend(data[offset:offset + 4])
        offset += 4
        for i in range(ngeoms):
            if i > 0:
                offset += 1  # 0x69-Separator überspringen
            offset = _convert_spatialite_geometry(
                data, offset, bo, endian, out
            )

    else:
        raise ValueError(f"Unbekannter Geometrietyp: {geom_type}")

    return offset


def _spatialite_blob_to_wkb_hex(blob: bytes) -> Optional[str]:
    """Konvertiert ein SpatiaLite-BLOB in einen WKB-Hex-String für PostGIS.

    SpatiaLite-BLOB-Format (39 Bytes Header + Body + 1 Byte Ende):
      Byte  0:      0x00 (Start-Marker)
      Byte  1:      Endian (0x00=BE, 0x01=LE)
      Byte  2–5:    SRID (int32)
      Byte  6–37:   MBR (4 × float64: MinX, MinY, MaxX, MaxY)
      Byte 38:      0x7C (MBR-Ende-Marker)
      Byte 39..N-1: Geometrie-Body (SpatiaLite-internes Format)
      Byte N:       0xFE (Ende-Marker)

    Returns:
        WKB als Hex-String oder None bei ungültiger/leerer Geometrie
    """
    if blob is None or len(blob) < 44:
        return None

    # Header-Marker validieren
    if blob[0] != 0x00 or blob[38] != 0x7C or blob[-1] != 0xFE:
        return None

    endian = blob[1]
    if endian not in (0, 1):
        return None

    bo = '<' if endian == 1 else '>'
    body = blob[39:-1]  # Nur Geometrie-Body

    result = bytearray()
    try:
        _convert_spatialite_geometry(body, 0, bo, endian, result)
    except Exception as e:
        logger.debug(f"SpatiaLite-BLOB-Konvertierung fehlgeschlagen: {e}")
        return None

    return result.hex()


class SchemaParser:
    """Parser für die schema.sql Datei.

    Extrahiert CREATE TABLE Statements, AddGeometryColumn Aufrufe und
    CREATE INDEX Statements aus der schema.sql Datei. Die schema.sql
    ist die einzige Quelle für die Tabellenstruktur auf PostgreSQL.
    """

    def __init__(self, schema_sql_path: str, target_schema: str = "qkan"):
        self.schema_sql_path = schema_sql_path
        self.target_schema = target_schema
        self.statements: List[str] = []
        self.table_names: List[str] = []
        self.geometry_columns: Dict[str, List[Dict[str, Any]]] = {}
        # Spalten-Metadaten: {tabelle: {spalte: {type, max_length}}}
        self.column_info: Dict[str, Dict[str, Dict[str, Any]]] = {}

    def parse(self) -> None:
        """Liest und parst die schema.sql Datei.

        Extrahiert:
        - Alle SQL-Statements (CREATE TABLE, AddGeometryColumn, CREATE INDEX)
        - Tabellennamen aus CREATE TABLE Statements
        - Geometrie-Spalten-Info aus AddGeometryColumn Aufrufen
        """
        if not os.path.exists(self.schema_sql_path):
            raise QkanError(f"schema.sql nicht gefunden: {self.schema_sql_path}")

        with open(self.schema_sql_path, 'r', encoding='utf-8') as f:
            sql_content = f.read()

        # Schema-Name in allen Statements ersetzen:
        # schema.sql verwendet 'qkan' als Platzhalter-Schema;
        # hier wird es durch das vom Benutzer gewählte Schema ersetzt
        if self.target_schema != "qkan":
            sql_content = sql_content.replace("qkan.", f"{self.target_schema}.")
            sql_content = sql_content.replace("'qkan'", f"'{self.target_schema}'")

        # SQL in einzelne Statements aufteilen (getrennt durch Semikolon)
        raw_statements = sql_content.split(';')

        self.statements = []
        self.table_names = []
        self.geometry_columns = {}

        for stmt in raw_statements:
            stmt = stmt.strip()
            if not stmt:
                continue

            self.statements.append(stmt)

            # CREATE TABLE erkennen und Tabellennamen extrahieren
            # re.search statt re.match, da Statements mit Kommentaren beginnen können
            create_match = re.search(
                r'CREATE\s+TABLE\s+(?:IF\s+NOT\s+EXISTS\s+)?(?:\w+\.)?(\w+)\s*\(',
                stmt, re.IGNORECASE
            )
            if create_match:
                table_name = create_match.group(1)
                self.table_names.append(table_name)
                logger.debug(f"Schema-Tabelle erkannt: {table_name}")
                
                # Spalten-Definitionen extrahieren
                self._parse_column_definitions(table_name, stmt)

                # Inline-Geometrie-Spalten erkennen:
                # colname geometry(TYPE) oder colname geometry(TYPE, SRID)
                for gm in re.finditer(
                    r'(\w+)\s+geometry\s*\(\s*(\w+)\s*(?:,\s*(\d+))?\s*\)',
                    stmt, re.IGNORECASE
                ):
                    col = gm.group(1)
                    gtype = gm.group(2)
                    gsrid = int(gm.group(3)) if gm.group(3) else 0
                    if table_name not in self.geometry_columns:
                        self.geometry_columns[table_name] = []
                    self.geometry_columns[table_name].append({
                        'column': col,
                        'srid': gsrid,
                        'type': gtype,
                        'dim': 2
                    })
                    logger.debug(
                        f"Inline-Geometrie-Spalte erkannt: "
                        f"{table_name}.{col} ({gtype}, SRID {gsrid})"
                    )

            # AddGeometryColumn erkennen und Geometrie-Info extrahieren
            # re.search statt re.match, da Statements mit Kommentaren beginnen können
            geom_match = re.search(
                r"SELECT\s+AddGeometryColumn\s*\(\s*'(\w+)'\s*,\s*'(\w+)'\s*,\s*'(\w+)'\s*,\s*(\d+)\s*,\s*'(\w+)'\s*,\s*(\d+)\s*\)",
                stmt, re.IGNORECASE
            )
            if geom_match:
                table = geom_match.group(2)
                column = geom_match.group(3)
                srid = int(geom_match.group(4))
                geom_type = geom_match.group(5)
                dim = int(geom_match.group(6))

                if table not in self.geometry_columns:
                    self.geometry_columns[table] = []

                self.geometry_columns[table].append({
                    'column': column,
                    'srid': srid,
                    'type': geom_type,
                    'dim': dim
                })
                logger.debug(
                    f"Geometrie-Spalte erkannt: {table}.{column} "
                    f"({geom_type}, SRID {srid})"
                )

        logger.info(
            f"Schema geparst: {len(self.table_names)} Tabellen, "
            f"{sum(len(v) for v in self.geometry_columns.values())} Geometrie-Spalten"
        )

    def get_geometry_columns(self, table_name: str) -> List[Dict[str, Any]]:
        """Gibt die Geometrie-Spalten für eine Tabelle zurück."""
        return self.geometry_columns.get(table_name, [])

    def get_all_geometry_column_names(self, table_name: str) -> set:
        """Gibt ein Set aller Geometrie-Spaltennamen (lowercase) für eine Tabelle zurück."""
        return {gc['column'].lower() for gc in self.get_geometry_columns(table_name)}

    @staticmethod
    def _split_columns(block: str) -> List[str]:
        """Spaltet den Spalten-Block am Komma, aber respektiert Klammern.

        Kommas innerhalb von Klammern (z.B. NUMERIC(4,1) oder
        geometry(MULTIPOLYGON, 25832)) werden NICHT als Trennzeichen
        verwendet.
        """
        parts: List[str] = []
        depth = 0
        current: List[str] = []
        for ch in block:
            if ch == '(':
                depth += 1
                current.append(ch)
            elif ch == ')':
                depth -= 1
                current.append(ch)
            elif ch == ',' and depth == 0:
                parts.append(''.join(current))
                current = []
            else:
                current.append(ch)
        if current:
            parts.append(''.join(current))
        return parts

    def _parse_column_definitions(self, table_name: str, create_stmt: str) -> None:
        """Extrahiert Spaltendefinitionen aus einem CREATE TABLE Statement.
        
        Speichert für jede Spalte:
        - type: 'varchar', 'smallint', 'integer', 'double precision', 'timestamp', 'date', 'text'
        - max_length: für character varying(N)
        """
        # Column-Block: Inhalt der äußersten Klammern extrahieren
        # Wir suchen die erste '(' und die letzte ')' im Statement
        first_paren = create_stmt.find('(')
        last_paren = create_stmt.rfind(')')
        if first_paren < 0 or last_paren <= first_paren:
            return
        
        columns_block = create_stmt[first_paren + 1:last_paren]
        self.column_info[table_name] = {}
        
        # Einzelne Spalten-Definitionen parsen
        # Regex: spaltenname whitespace datentyp [constraints]
        col_pattern = re.compile(
            r'\s*(\w+)\s+(character\s+varying\((\d+)\)|(?:small|big)?int(?:eger)?|double\s+precision|numeric(?:\(\d+(?:,\s*\d+)?\))?|timestamp|date|text)',
            re.IGNORECASE
        )
        
        for line in self._split_columns(columns_block):
            line = line.strip()
            # Inline-Kommentare entfernen /* ... */
            line = re.sub(r'/\*.*?\*/', '', line).strip()
            col_match = col_pattern.match(line)
            if col_match:
                col_name = col_match.group(1).lower()
                col_type_full = col_match.group(2).lower()
                
                # VARCHAR mit Länge
                if 'varying' in col_type_full:
                    varchar_len = int(col_match.group(3))
                    self.column_info[table_name][col_name] = {
                        'type': 'varchar',
                        'max_length': varchar_len
                    }
                # Integer-Typen (für Boolean-Konvertierung ja/nein → 1/0)
                elif re.match(r'(?:small|big)?int(?:eger)?$', col_type_full, re.IGNORECASE):
                    self.column_info[table_name][col_name] = {
                        'type': 'integer'
                    }
                # NUMERIC
                elif col_type_full.startswith('numeric'):
                    self.column_info[table_name][col_name] = {
                        'type': 'numeric'
                    }
                # Andere Typen
                else:
                    self.column_info[table_name][col_name] = {
                        'type': col_type_full.replace(' ', '_')
                    }
    
    def get_column_info(self, table_name: str, column_name: str) -> Optional[Dict[str, Any]]:
        """Gibt Metadaten für eine Spalte zurück oder None."""
        return self.column_info.get(table_name, {}).get(column_name.lower())


class UploadPostgisTask:
    """Task für den Upload einer SQLite-Datenbank nach PostGIS WebSuite.

    Die Tabellenstruktur wird ausschließlich aus der schema.sql Datei gelesen.
    Daten werden aus der SQLite-Quelldatenbank nur in die dort definierten
    PostgreSQL-Tabellen übertragen.
    """

    def __init__(
        self,
        server_connection: str,
        target_database: str,
        source_database_file: str,
        schema_name: str = "qkan",
        overwrite: bool = False,
        progress_bar: Optional[QProgressBar] = None,
        progress_callback: Optional[Callable[[int, int, str], None]] = None,
        srid: int = 25832
    ):
        self.server_connection = server_connection
        self.target_database = target_database
        self.source_database_file = source_database_file
        self.schema_name = schema_name
        self.overwrite = overwrite
        self.progress_bar = progress_bar
        self.progress_callback = progress_callback
        self.default_srid = srid

        # Zweite Progress Bar für Datensatz-Fortschritt (wird vom Dialog gesetzt)
        self.progress_bar_records = None
        self.record_progress_callback = None

        # Verbindungsparameter parsen
        self.connection_params = self._parse_connection_params()

        # Datenbank-Verbindungen
        self.pg_conn = None
        self.pg_cursor = None
        self.db_conn = None
        self.db_cursor = None
        self.use_spatialite = False

        # Tracking für hochgeladene Tabellen
        self.uploaded_tables: List[Dict[str, Any]] = []

        # Statistik-Tracking für Upload-Zusammenfassung
        self.tables_with_data: List[Dict[str, Any]] = []
        self.tables_empty: List[str] = []
        self.tables_skipped: List[Dict[str, str]] = []
        self.tables_failed: List[Dict[str, str]] = []

        # Schema-Parser initialisieren
        self.schema_parser = SchemaParser(SCHEMA_SQL_PATH, self.schema_name)

    # ---------------------------------------------------------------
    # Verbindungsverwaltung
    # ---------------------------------------------------------------

    def _parse_connection_params(self) -> Dict[str, Any]:
        """Verbindungsparameter aus dem ausgewählten Server extrahieren."""
        connection_name = (
            self.server_connection.split(' (')[0]
            if ' (' in self.server_connection
            else self.server_connection
        )

        if connection_name.lower() == "localhost":
            current_user = getpass.getuser()
            return {
                'host': 'localhost',
                'port': 5432,
                'user': current_user,
                'password': '',
                'database': self.target_database,
                'sslmode': 'prefer'
            }
        else:
            settings = QSettings()
            base_key = f"PostgreSQL/connections/{connection_name}"

            host_raw = settings.value(f"{base_key}/host", "localhost")
            host = normalize_hostname(host_raw)

            return {
                'host': host,
                'port': int(settings.value(f"{base_key}/port", 5432)),
                'user': settings.value(f"{base_key}/username", ""),
                'password': settings.value(f"{base_key}/password", ""),
                'database': self.target_database,
                'sslmode': settings.value(f"{base_key}/sslmode", "prefer")
            }

    def _connect_postgis(self) -> None:
        """Verbindung zu PostGIS-Server herstellen (direkt zur konfigurierten Datenbank)."""
        try:
            params = self.connection_params

            conn_parts = [
                f"host='{params['host']}'",
                f"port={params['port']}",
                f"dbname='{params['database']}'",
                f"user='{params['user']}'"
            ]

            if params.get('password'):
                conn_parts.append(f"password='{params['password']}'")
            if params.get('sslmode'):
                conn_parts.append(f"sslmode='{params['sslmode']}'")

            conn_parts.append("connect_timeout=10")
            conn_string = ' '.join(conn_parts)

            logger.info(
                f"Verbinde zu PostgreSQL: "
                f"{params['user']}@{params['host']}:{params['port']}/{params['database']}"
            )

            self.pg_conn = psycopg2.connect(conn_string)
            self.pg_conn.autocommit = True
            self.pg_cursor = self.pg_conn.cursor(
                cursor_factory=psycopg2.extras.RealDictCursor
            )

            logger.info(f"Verbindung zu Datenbank '{params['database']}' erfolgreich")

        except Exception as e:
            raise QkanError(f"Fehler beim Verbinden zu PostGIS: {str(e)}")

    def _check_and_reconnect_postgis(self) -> bool:
        """Prüft die PostgreSQL-Verbindung und stellt sie bei Bedarf wieder her."""
        try:
            if self.pg_conn is None or self.pg_conn.closed:
                logger.warning("PostgreSQL-Verbindung geschlossen - Reconnect...")
                self._reconnect_to_target_database()
                return True

            try:
                self.pg_cursor.execute("SELECT 1")
                self.pg_cursor.fetchone()
                return True
            except Exception:
                logger.warning("Verbindungsprüfung fehlgeschlagen")
                self._reconnect_to_target_database()
                return True

        except Exception as e:
            logger.error(f"Verbindungswiederherstellung fehlgeschlagen: {str(e)}")
            return False

    def _reconnect_to_target_database(self) -> None:
        """Stellt die Verbindung zur Zieldatenbank wieder her."""
        try:
            try:
                if self.pg_cursor:
                    self.pg_cursor.close()
                if self.pg_conn:
                    self.pg_conn.close()
            except Exception:
                pass

            params = self.connection_params.copy()
            params['database'] = self.target_database

            conn_parts = [
                f"host='{params['host']}'",
                f"port={params['port']}",
                f"dbname='{params['database']}'",
                f"user='{params['user']}'"
            ]

            if params.get('password'):
                conn_parts.append(f"password='{params['password']}'")
            if params.get('sslmode'):
                conn_parts.append(f"sslmode='{params['sslmode']}'")

            conn_parts.append("connect_timeout=10")
            conn_string = ' '.join(conn_parts)

            self.pg_conn = psycopg2.connect(conn_string)
            self.pg_conn.autocommit = True
            self.pg_cursor = self.pg_conn.cursor(
                cursor_factory=psycopg2.extras.RealDictCursor
            )

            self.pg_cursor.execute(
                f"SET search_path TO {self.schema_name}, public"
            )

            logger.info(
                f"Verbindung zu {self.target_database} wiederhergestellt"
            )

        except Exception as e:
            raise QkanError(
                f"Reconnect zur Zieldatenbank fehlgeschlagen: {str(e)}"
            )

    def _disconnect_postgis(self) -> None:
        """PostGIS-Verbindung schließen."""
        try:
            if self.pg_cursor:
                self.pg_cursor.close()
            if self.pg_conn:
                self.pg_conn.close()
        except Exception as e:
            logger.warning(f"Fehler beim Schließen der Verbindung: {str(e)}")



    def _setup_postgis(self) -> None:
        """PostGIS-Extension und Schema einrichten."""
        try:
            # PostGIS Extension prüfen/aktivieren
            logger.info("Prüfe PostGIS Extension...")
            self.pg_cursor.execute("""
                SELECT EXISTS(
                    SELECT 1 FROM pg_extension WHERE extname = 'postgis'
                ) AS postgis_exists
            """)
            result = self.pg_cursor.fetchone()
            postgis_exists = (
                result.get('postgis_exists', False)
                if isinstance(result, dict) else result[0]
            )

            if not postgis_exists:
                logger.info("PostGIS Extension wird aktiviert...")
                try:
                    self.pg_cursor.execute(
                        "CREATE EXTENSION IF NOT EXISTS postgis"
                    )
                    logger.info("PostGIS Extension erfolgreich aktiviert")
                except Exception as ext_error:
                    logger.warning(
                        f"Konnte PostGIS nicht aktivieren: {ext_error}"
                    )

            # PostGIS-Version prüfen
            try:
                self.pg_cursor.execute(
                    "SELECT PostGIS_Version() AS version"
                )
                version_result = self.pg_cursor.fetchone()
                postgis_version = (
                    version_result.get('version', str(version_result))
                    if isinstance(version_result, dict)
                    else version_result[0]
                )
                logger.info(f"PostGIS Version: {postgis_version}")
            except Exception as ver_error:
                logger.warning(
                    f"Konnte PostGIS-Version nicht ermitteln: {ver_error}"
                )

            # Schema erstellen
            logger.info(f"Erstelle Schema '{self.schema_name}'...")
            try:
                self.pg_cursor.execute(
                    f"CREATE SCHEMA IF NOT EXISTS {self.schema_name}"
                )
                logger.info(
                    f"Schema '{self.schema_name}' wurde erstellt/überprüft"
                )
            except Exception as schema_error:
                logger.warning(
                    f"Konnte Schema nicht erstellen: {schema_error}"
                )
                self.schema_name = "public"
                logger.info("Verwende stattdessen 'public' Schema")

            # Search path setzen
            try:
                self.pg_cursor.execute(
                    f"SET search_path TO {self.schema_name}, public"
                )
            except Exception as path_error:
                logger.warning(
                    f"Konnte search_path nicht setzen: {path_error}"
                )

            logger.info("PostGIS-Umgebung erfolgreich eingerichtet")

        except Exception as e:
            logger.error(f"Fehler beim Einrichten von PostGIS: {str(e)}")
            raise

    # ---------------------------------------------------------------
    # Fortschrittsanzeige
    # ---------------------------------------------------------------

    def _update_progress(self, value: int, message: str = "") -> None:
        """Progress Bar aktualisieren (Prozent-basiert)."""
        if self.progress_bar:
            self.progress_bar.setValue(value)
        if message:
            logger.info(message)

    def _update_table_progress(
        self, current: int, total: int, table_name: str
    ) -> None:
        """Fortschritt basierend auf Tabellenanzahl aktualisieren."""
        message = f"Tabelle {current}/{total}: {table_name}"
        if self.progress_callback:
            self.progress_callback(current, total, message)
        if self.progress_bar:
            self.progress_bar.setMaximum(total)
            self.progress_bar.setValue(current)
        logger.info(message)

    # ---------------------------------------------------------------
    # Schema-Erstellung aus schema.sql
    # ---------------------------------------------------------------

    def _execute_schema_sql(self) -> List[str]:
        """Führt die schema.sql Statements aus und erstellt alle Tabellen.

        Liest die schema.sql Datei, parst die Statements und führt sie
        auf dem PostgreSQL-Server aus. Bei overwrite=True werden bestehende
        Tabellen vorher gelöscht.

        Returns:
            Liste der erfolgreich verfügbaren Tabellennamen
        """
        # Schema-Parser mit aktuellem Schema-Namen synchronisieren
        # (self.schema_name kann in _setup_postgis geändert worden sein)
        self.schema_parser.target_schema = self.schema_name
        self.schema_parser.parse()

        # Schema sicherstellen bevor Tabellen angelegt werden
        try:
            self.pg_cursor.execute(
                f"CREATE SCHEMA IF NOT EXISTS {self.schema_name}"
            )
        except Exception as e:
            logger.warning(f"Schema '{self.schema_name}' konnte nicht erstellt werden: {e}")

        # Bei Overwrite: Alle Schema-Tabellen vorher löschen
        # (in umgekehrter Reihenfolge wegen möglicher Abhängigkeiten)
        if self.overwrite:
            for table_name in reversed(self.schema_parser.table_names):
                try:
                    self.pg_cursor.execute(
                        f"DROP TABLE IF EXISTS "
                        f"{self.schema_name}.{table_name} CASCADE"
                    )
                    logger.debug(f"Tabelle {table_name} gelöscht (overwrite)")
                except Exception as e:
                    logger.warning(
                        f"DROP TABLE {table_name} fehlgeschlagen: {e}"
                    )

        # Alle Statements aus schema.sql ausführen
        for stmt in self.schema_parser.statements:
            try:
                self.pg_cursor.execute(stmt)
            except Exception as e:
                error_msg = str(e).lower()
                # Wenn Objekt bereits existiert und kein Overwrite:
                # erwarteter Fehler
                if 'already exists' in error_msg:
                    logger.debug(
                        f"Objekt existiert bereits: {str(e)[:100]}"
                    )
                else:
                    logger.warning(
                        f"Schema-Statement fehlgeschlagen: {str(e)[:200]}"
                    )
                    logger.debug(f"Statement: {stmt[:300]}")

        # Prüfen welche Tabellen tatsächlich verfügbar sind
        available_tables = []
        for table_name in self.schema_parser.table_names:
            try:
                self.pg_cursor.execute("""
                    SELECT EXISTS (
                        SELECT 1 FROM information_schema.tables
                        WHERE table_schema = %s AND table_name = %s
                    ) AS table_exists
                """, (self.schema_name, table_name))
                result = self.pg_cursor.fetchone()
                exists = (
                    result.get('table_exists', False)
                    if isinstance(result, dict) else result[0]
                )
                if exists:
                    available_tables.append(table_name)
                else:
                    logger.warning(
                        f"Tabelle {table_name} nach Schema-Ausführung "
                        f"nicht vorhanden"
                    )
            except Exception as e:
                logger.warning(
                    f"Prüfung für {table_name} fehlgeschlagen: {e}"
                )

        logger.info(
            f"Schema-Erstellung abgeschlossen: "
            f"{len(available_tables)}/{len(self.schema_parser.table_names)} "
            f"Tabellen verfügbar"
        )
        return available_tables

    # ---------------------------------------------------------------
    # Datenübertragung SQLite -> PostgreSQL
    # ---------------------------------------------------------------

    def _get_postgres_columns(self, table_name: str) -> List[str]:
        """Ermittelt die Spaltennamen einer PostgreSQL-Tabelle."""
        self.pg_cursor.execute("""
            SELECT column_name
            FROM information_schema.columns
            WHERE table_schema = %s AND table_name = %s
            ORDER BY ordinal_position
        """, (self.schema_name, table_name))

        return [
            row['column_name'] if isinstance(row, dict) else row[0]
            for row in self.pg_cursor.fetchall()
        ]

    def _get_sqlite_table_and_columns(
        self, table_name: str
    ) -> Tuple[Optional[str], List[str]]:
        """Sucht eine Tabelle in SQLite (case-insensitive) und gibt
        den tatsächlichen Namen und die Spaltennamen zurück.

        Returns:
            Tuple aus (tatsächlicher_sqlite_tabellenname, spaltennamen)
            oder (None, []) wenn die Tabelle nicht existiert.
        """
        self.db_cursor.execute(
            "SELECT name FROM sqlite_master WHERE type='table'"
        )
        all_tables = {
            row[0].lower(): row[0] for row in self.db_cursor.fetchall()
        }

        sqlite_table_name = all_tables.get(table_name.lower())
        if sqlite_table_name is None:
            return None, []

        self.db_cursor.execute(f'PRAGMA table_info("{sqlite_table_name}")')
        columns = [row[1] for row in self.db_cursor.fetchall()]
        return sqlite_table_name, columns

    def _transfer_table_data(self, table_name: str) -> int:
        """Überträgt Daten einer Tabelle von SQLite nach PostgreSQL.

        Ermittelt die gemeinsamen Spalten zwischen PostgreSQL (aus schema.sql
        erstellt) und SQLite, und überträgt die entsprechenden Daten.
        Geometrie-Spalten werden über SpatiaLite (AsText) oder hex-Konvertierung
        korrekt nach PostGIS übertragen.

        Args:
            table_name: Name der Tabelle (wie in schema.sql definiert)

        Returns:
            Anzahl der übertragenen Datensätze
        """
        # Prüfe ob Tabelle in SQLite existiert (case-insensitive)
        sqlite_table_name, sqlite_columns = (
            self._get_sqlite_table_and_columns(table_name)
        )
        if sqlite_table_name is None:
            logger.info(
                f"Tabelle {table_name} nicht in SQLite vorhanden - "
                f"überspringe Datenübertragung"
            )
            return 0

        # PostgreSQL-Spalten ermitteln (aus der erstellten Tabelle)
        pg_columns = self._get_postgres_columns(table_name)

        # Mapping SQLite-Spalten: lowercase -> tatsächlicher Name
        sqlite_col_map = {c.lower(): c for c in sqlite_columns}

        # Geometrie-Spalten aus schema.sql
        geom_col_names = (
            self.schema_parser.get_all_geometry_column_names(table_name)
        )
        geom_infos_map = {
            gc['column'].lower(): gc
            for gc in self.schema_parser.get_geometry_columns(table_name)
        }

        # Gemeinsame Spalten finden, aufgeteilt in reguläre und Geometrie
        regular_pg_cols = []
        regular_sqlite_cols = []
        geom_pg_cols = []
        geom_sqlite_cols = []
        geom_infos_ordered = []

        for pg_col in pg_columns:
            pg_col_lower = pg_col.lower()
            if pg_col_lower in sqlite_col_map:
                sqlite_col = sqlite_col_map[pg_col_lower]
                if pg_col_lower in geom_col_names:
                    geom_pg_cols.append(pg_col)
                    geom_sqlite_cols.append(sqlite_col)
                    geom_infos_ordered.append(geom_infos_map[pg_col_lower])
                else:
                    regular_pg_cols.append(pg_col)
                    regular_sqlite_cols.append(sqlite_col)

        if not regular_pg_cols and not geom_pg_cols:
            logger.warning(
                f"Keine gemeinsamen Spalten zwischen PostgreSQL und "
                f"SQLite für {table_name}"
            )
            return 0

        # Datenanzahl ermitteln
        self.db_cursor.execute(
            f'SELECT COUNT(*) FROM "{sqlite_table_name}"'
        )
        total_records = self.db_cursor.fetchone()[0]
        if total_records == 0:
            return 0

        logger.info(
            f"Übertrage {total_records} Datensätze für Tabelle {table_name} "
            f"({len(regular_pg_cols)} Spalten, "
            f"{len(geom_pg_cols)} Geometrie-Spalten)"
        )

        # SELECT von SQLite aufbauen
        select_parts = [f'"{c}"' for c in regular_sqlite_cols]

        for geom_col in geom_sqlite_cols:
            if self.use_spatialite:
                select_parts.append(f'AsText("{geom_col}")')
            else:
                # SpatiaLite-BLOB direkt als bytes lesen;
                # Konvertierung zu Standard-WKB erfolgt in _preprocess_value()
                select_parts.append(f'"{geom_col}"')

        select_sql = (
            f'SELECT {", ".join(select_parts)} '
            f'FROM "{sqlite_table_name}"'
        )

        # INSERT in PostgreSQL aufbauen
        insert_col_parts = [f'"{c}"' for c in regular_pg_cols]
        template_parts = ['%s'] * len(regular_pg_cols)

        for pg_col, geom_info in zip(geom_pg_cols, geom_infos_ordered):
            srid = geom_info['srid']
            insert_col_parts.append(f'"{pg_col}"')
            if self.use_spatialite:
                template_parts.append(f'ST_GeomFromText(%s, {srid})')
            else:
                template_parts.append(
                    f"ST_GeomFromWKB(decode(%s, 'hex'), {srid})"
                )

        insert_cols = ', '.join(insert_col_parts)
        value_template = '(' + ', '.join(template_parts) + ')'
        insert_sql = (
            f"INSERT INTO {self.schema_name}.{table_name} "
            f"({insert_cols}) OVERRIDING SYSTEM VALUE VALUES %s"
        )

        # Daten aus SQLite lesen
        self.db_cursor.execute(select_sql)
        all_data = self.db_cursor.fetchall()

        if not all_data:
            return 0

        # Batch-Insert für Performance
        batch_size = 2000
        inserted_records = 0
        error_count = 0
        # Geometrien liegen als Hex-WKB vor wenn SpatiaLite nicht verfügbar
        use_geom_hex = not self.use_spatialite and bool(geom_pg_cols)
        num_regular = len(regular_pg_cols)

        old_autocommit = self.pg_conn.autocommit
        self.pg_conn.autocommit = False

        # Alle Spaltennamen für Metadaten-Lookup
        all_column_names = regular_pg_cols + geom_pg_cols
        
        try:
            for i in range(0, len(all_data), batch_size):
                batch = all_data[i:i + batch_size]

                try:
                    # Werte bereinigen und konvertieren
                    batch_values = [
                        self._preprocess_row(
                            row, num_regular, use_geom_hex,
                            table_name, all_column_names
                        )
                        for row in batch
                    ]

                    psycopg2.extras.execute_values(
                        self.pg_cursor,
                        insert_sql,
                        batch_values,
                        template=value_template,
                        page_size=batch_size
                    )

                    self.pg_conn.commit()
                    inserted_records += len(batch)

                    # Progress aktualisieren
                    if self.progress_bar_records and total_records > 0:
                        self.progress_bar_records.setMaximum(total_records)
                        self.progress_bar_records.setValue(inserted_records)

                    if self.record_progress_callback:
                        self.record_progress_callback(
                            inserted_records, total_records, table_name
                        )

                    QApplication.processEvents()

                except Exception as batch_error:
                    self.pg_conn.rollback()
                    error_str = str(batch_error).lower()

                    # Bei Verbindungsproblemen sofort abbrechen
                    if any(
                        kw in error_str
                        for kw in ('connection', 'closed', 'timeout')
                    ):
                        logger.error(
                            f"Verbindungsproblem bei {table_name}: "
                            f"{str(batch_error)}"
                        )
                        raise

                    # Fallback: Einzelinserts für diesen Batch
                    logger.warning(
                        f"Batch-Insert fehlgeschlagen für {table_name}: "
                        f"{str(batch_error)[:200]}"
                    )

                    single_insert_sql = (
                        f"INSERT INTO {self.schema_name}.{table_name} "
                        f"({insert_cols}) "
                        f"OVERRIDING SYSTEM VALUE "
                        f"VALUES ({', '.join(template_parts)})"
                    )

                    for row in batch:
                        try:
                            cleaned_row = self._preprocess_row(
                                row, num_regular, use_geom_hex,
                                table_name, all_column_names
                            )
                            self.pg_cursor.execute(
                                single_insert_sql, cleaned_row
                            )
                            inserted_records += 1
                        except Exception as e:
                            error_count += 1
                            if error_count <= 3:
                                logger.debug(
                                    f"Einzelinsert-Fehler in {table_name}: "
                                    f"{str(e)[:100]}"
                                )

                    self.pg_conn.commit()

        finally:
            self.pg_conn.autocommit = old_autocommit

        if error_count > 0:
            logger.warning(
                f"Tabelle {table_name}: {error_count} von "
                f"{total_records} Datensätzen fehlgeschlagen"
            )

        return inserted_records

    # ---------------------------------------------------------------
    # Wert-Vorverarbeitung
    # ---------------------------------------------------------------

    def _preprocess_value(
        self,
        value: Any,
        is_geometry_hex: bool = False,
        column_info: Optional[Dict[str, Any]] = None,
        table_name: str = "",
        column_name: str = ""
    ) -> Any:
        """Bereinigt und konvertiert einen einzelnen Wert für PostgreSQL.

        - Entfernt NUL-Zeichen (\x00) aus Strings
        - Konvertiert deutsches Datumsformat DD.MM.YYYY [HH:MM[:SS]]
          in ISO-Format YYYY-MM-DD [HH:MM:SS]
        - Entfernt SpatiaLite WKB-Header (38 Bytes) aus Geometrie-Hex-Strings
          wenn is_geometry_hex=True
        - Konvertiert deutsche Boolean-Werte (ja/nein) zu smallint (1/0)
        - Kürzt VARCHAR-Werte die zu lang sind mit Warnung
        """
        if value is None:
            return None

        # SpatiaLite-BLOB (bytes) → WKB-Hex-String für PostGIS
        if is_geometry_hex and isinstance(value, (bytes, memoryview)):
            return _spatialite_blob_to_wkb_hex(bytes(value))

        if isinstance(value, str):
            # NUL-Zeichen entfernen
            if '\x00' in value:
                value = value.replace('\x00', '')

            if is_geometry_hex:
                # Fallback: Wert ist bereits ein Hex-String
                pass
            else:
                # Deutsche Boolean-Werte für Integer-Spalten konvertieren
                if column_info and column_info.get('type') in ('smallint', 'integer'):
                    value_lower = value.lower().strip()
                    if value_lower in ('ja', 'yes', 'wahr', 'true', '1'):
                        return 1
                    elif value_lower in ('nein', 'no', 'falsch', 'false', '0'):
                        return 0
                    # Wenn es bereits eine Zahl ist, durchlassen
                    # Sonst wird PostgreSQL den Fehler werfen
                
                # Deutsches Datumsformat DD.MM.YYYY HH:MM[:SS] konvertieren
                m = _GERMAN_DATETIME_RE.match(value)
                if m:
                    sec = m.group(6) or '00'
                    value = (
                        f"{m.group(3)}-{m.group(2)}-{m.group(1)} "
                        f"{m.group(4)}:{m.group(5)}:{sec}"
                    )
                else:
                    m = _GERMAN_DATE_RE.match(value)
                    if m:
                        value = f"{m.group(3)}-{m.group(2)}-{m.group(1)}"
                
                # VARCHAR-Länge prüfen und kürzen falls nötig
                if column_info and column_info.get('type') == 'varchar':
                    max_len = column_info.get('max_length')
                    if max_len and len(value) > max_len:
                        original_value = value
                        value = value[:max_len]
                        logger.warning(
                            f"VARCHAR zu lang in {table_name}.{column_name}: "
                            f"'{original_value}' ({len(original_value)} Zeichen) "
                            f"→ '{value}' ({max_len} Zeichen)"
                        )

        return value

    def _preprocess_row(
        self,
        row: tuple,
        num_regular: int,
        use_geometry_hex: bool,
        table_name: str,
        column_names: List[str]
    ) -> tuple:
        """Verarbeitet eine Zeile aus SQLite bevor sie in PostgreSQL eingefügt wird.

        Args:
            row: Zeilen-Tupel aus SQLite
            num_regular: Anzahl der regulären (nicht-Geometrie) Spalten am Anfang
            use_geometry_hex: True wenn Geometrien als Hex-WKB vorliegen
                              (d.h. kein SpatiaLite-Modus)
            table_name: Name der Tabelle (für Logging)
            column_names: Namen aller Spalten in dieser Zeile
        """
        result = []
        for idx, value in enumerate(row):
            is_geom_hex = use_geometry_hex and idx >= num_regular
            col_name = column_names[idx] if idx < len(column_names) else ""
            col_info = self.schema_parser.get_column_info(table_name, col_name)
            
            result.append(
                self._preprocess_value(
                    value,
                    is_geometry_hex=is_geom_hex,
                    column_info=col_info,
                    table_name=table_name,
                    column_name=col_name
                )
            )
        return tuple(result)

    # ---------------------------------------------------------------
    # Finalisierung und QGIS-Integration
    # ---------------------------------------------------------------

    def _finalize_table(self, table_name: str) -> None:
        """Tabelle finalisieren: Kommentare und ANALYZE."""
        try:
            timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            comment_sql = (
                f"COMMENT ON TABLE {self.schema_name}.{table_name} IS "
                f"'QKan Import: {self.source_database_file} - {timestamp}'"
            )
            self.pg_cursor.execute(comment_sql)

            try:
                self.pg_cursor.execute(
                    f"ANALYZE {self.schema_name}.{table_name}"
                )
            except Exception as e:
                logger.debug(
                    f"ANALYZE für {table_name} übersprungen: {str(e)}"
                )

        except Exception as e:
            logger.warning(
                f"Finalisierung für {table_name} teilweise "
                f"fehlgeschlagen: {str(e)}"
            )

    def _register_with_websuite(self) -> None:
        """Registriert die Tabellen für die WebSuite-Kartendarstellung."""
        try:
            is_websuite = (
                'gbd-websuite' in self.connection_params['host'].lower()
            )

            if not is_websuite:
                logger.info(
                    "Kein WebSuite-Server erkannt - "
                    "überspringe WebSuite-Registrierung"
                )
                return

            logger.info(
                "Registriere Tabellen für GBD WebSuite Kartendarstellung..."
            )

            for table_info in self.uploaded_tables:
                if table_info.get('has_geometry'):
                    table_name = table_info['name']
                    try:
                        self.pg_cursor.execute(
                            f"SELECT Populate_Geometry_Columns("
                            f"'{self.schema_name}.{table_name}'::regclass)"
                        )
                    except Exception as e:
                        logger.debug(
                            f"Populate_Geometry_Columns für "
                            f"{table_name}: {str(e)}"
                        )

            logger.info("WebSuite-Registrierung abgeschlossen")

        except Exception as e:
            logger.warning(
                f"WebSuite-Registrierung teilweise fehlgeschlagen: {str(e)}"
            )

    # ---------------------------------------------------------------
    # Hauptfunktion
    # ---------------------------------------------------------------

    def run(self) -> bool:
        """
        Hauptfunktion für den Upload-Prozess.

        Ablauf:
        1. PostGIS-Verbindung herstellen und Zieldatenbank einrichten
        2. Tabellen aus schema.sql erstellen (Single Source of Truth)
        3. SQLite-Quelldatenbank öffnen
        4. Daten nur für schema.sql-Tabellen übertragen
        5. WebSuite-Registrierung und QGIS-Layer hinzufügen

        Returns:
            bool: True wenn erfolgreich
        """
        try:
            logger.info("=" * 60)
            logger.info("Starte Upload zu PostGIS WebSuite...")
            logger.info(f"Quelldatenbank: {self.source_database_file}")
            logger.info(f"Zieldatenbank: {self.target_database}")
            logger.info(f"Schema: {self.schema_name}")
            logger.info(f"Schema-Definition: {SCHEMA_SQL_PATH}")
            logger.info("=" * 60)

            # Prüfen ob Quelldatei existiert
            if not os.path.exists(self.source_database_file):
                error_msg = (
                    f"Quelldatenbank nicht gefunden: "
                    f"{self.source_database_file}"
                )
                logger.error(error_msg)
                raise QkanError(error_msg)

            file_size = os.path.getsize(self.source_database_file)
            logger.info(f"Quelldatei-Größe: {file_size / 1024:.1f} KB")

            # ---- PostGIS-Verbindung ----
            self._update_progress(5, "Verbinde zu PostGIS-Server...")
            try:
                self._connect_postgis()
                logger.info("PostGIS-Verbindung hergestellt")
            except Exception as conn_error:
                logger.error(
                    f"PostGIS-Verbindung fehlgeschlagen: {conn_error}"
                )
                raise

            # ---- PostGIS-Setup ----
            self._update_progress(10, "Richte PostGIS-Umgebung ein...")
            try:
                self._setup_postgis()
                logger.info("PostGIS-Umgebung eingerichtet")
            except Exception as setup_error:
                logger.error(f"PostGIS-Setup fehlgeschlagen: {setup_error}")
                raise

            # ---- Schema aus schema.sql erstellen ----
            self._update_progress(
                15, "Erstelle Tabellen aus schema.sql..."
            )
            try:
                created_tables = self._execute_schema_sql()
                logger.info(
                    f"{len(created_tables)} Tabellen aus schema.sql erstellt"
                )
            except Exception as schema_error:
                logger.error(
                    f"Schema-Erstellung fehlgeschlagen: {schema_error}"
                )
                raise

            if not created_tables:
                logger.warning("Keine Tabellen aus schema.sql erstellt!")
                return True

            # ---- SQLite-Quelldatenbank öffnen ----
            self._update_progress(20, "Öffne SQLite-Quelldatenbank...")

            db_conn = None
            db_cursor = None
            use_spatialite = False

            try:
                db_conn = spatialite_connect(
                    database=self.source_database_file,
                    check_same_thread=False
                )
                db_cursor = db_conn.cursor()
                use_spatialite = True
                logger.info(
                    f"SpatiaLite-Datenbank erfolgreich geöffnet: "
                    f"{self.source_database_file}"
                )
            except Exception as spatialite_error:
                logger.info(
                    f"SpatiaLite nicht verfügbar ({spatialite_error}). "
                    f"Verwende Standard-SQLite."
                )
                try:
                    db_conn = sqlite3.connect(
                        self.source_database_file,
                        check_same_thread=False
                    )
                    db_cursor = db_conn.cursor()
                    logger.info("SQLite-Datenbank geöffnet (Standard-Modus)")
                except Exception as sqlite_error:
                    error_msg = (
                        f"Kann SQLite-Datenbank nicht öffnen: "
                        f"{str(sqlite_error)}"
                    )
                    logger.error(error_msg)
                    raise QkanError(error_msg)

            try:
                self.db_conn = db_conn
                self.db_cursor = db_cursor
                self.use_spatialite = use_spatialite

                total_tables = len(created_tables)
                logger.info(
                    f"{total_tables} Tabellen zur Datenübertragung bereit"
                )

                # Fortschritt initialisieren
                if self.progress_callback:
                    self.progress_callback(
                        0, total_tables, "Starte Datenübertragung..."
                    )
                if self.progress_bar:
                    self.progress_bar.setMaximum(total_tables)
                    self.progress_bar.setValue(0)

                processed_tables = 0
                geometry_tables_count = 0

                # Statistik zurücksetzen
                self.tables_with_data = []
                self.tables_empty = []
                self.tables_skipped = []
                self.tables_failed = []

                # ---- Daten für jede schema.sql-Tabelle übertragen ----
                for table_name in created_tables:
                    try:
                        # Verbindung prüfen
                        if not self._check_and_reconnect_postgis():
                            logger.error(
                                "Verbindung zu PostgreSQL verloren"
                            )
                            break

                        self._update_table_progress(
                            processed_tables, total_tables, table_name
                        )
                        logger.info(f"Verarbeite Tabelle: {table_name}")

                        # Daten übertragen
                        try:
                            transferred_records = self._transfer_table_data(
                                table_name
                            )
                        except Exception as transfer_error:
                            logger.error(
                                f"Datenübertragung für {table_name} "
                                f"fehlgeschlagen: {str(transfer_error)}"
                            )
                            self.tables_failed.append({
                                'name': table_name,
                                'reason': (
                                    f'Datenübertragung: '
                                    f'{str(transfer_error)}'
                                )
                            })
                            transferred_records = 0

                        # Datensatz-Progress Bar zurücksetzen
                        if self.progress_bar_records:
                            self.progress_bar_records.setValue(0)
                            self.progress_bar_records.setMaximum(100)

                        # Geometrie-Info aus schema.sql
                        geom_infos = (
                            self.schema_parser.get_geometry_columns(
                                table_name
                            )
                        )
                        has_geometry = len(geom_infos) > 0

                        if has_geometry:
                            geometry_tables_count += 1

                        # Tabelle finalisieren
                        try:
                            self._finalize_table(table_name)
                        except Exception as fin_error:
                            logger.warning(
                                f"Finalisierung für {table_name} "
                                f"fehlgeschlagen: {str(fin_error)}"
                            )

                        # Tracking
                        table_info = {
                            'name': table_name,
                            'records': transferred_records,
                            'has_geometry': has_geometry,
                        }
                        self.uploaded_tables.append(table_info)

                        if transferred_records > 0:
                            self.tables_with_data.append(table_info)
                        else:
                            self.tables_empty.append(table_name)

                        processed_tables += 1

                        self._update_table_progress(
                            processed_tables, total_tables,
                            f"{table_name} ({transferred_records} Datensätze)"
                        )

                        QApplication.processEvents()

                    except Exception as table_error:
                        logger.error(
                            f"Unerwarteter Fehler bei Tabelle "
                            f"{table_name}: {str(table_error)}"
                        )
                        self.tables_failed.append({
                            'name': table_name,
                            'reason': (
                                f'Unerwarteter Fehler: '
                                f'{str(table_error)}'
                            )
                        })
                        processed_tables += 1
                        continue

            finally:
                try:
                    if db_cursor:
                        db_cursor.close()
                    if db_conn:
                        db_conn.close()
                except Exception:
                    pass

            # ---- WebSuite-Registrierung ----
            if self.progress_callback:
                self.progress_callback(
                    total_tables, total_tables,
                    "Registriere für WebSuite..."
                )
            self._register_with_websuite()

            # ---- Abschließende Statistik ----
            if self.progress_callback:
                self.progress_callback(
                    total_tables, total_tables,
                    f"Upload abgeschlossen: {processed_tables} Tabellen"
                )

            total_records = sum(
                t['records'] for t in self.tables_with_data
            )

            logger.info("=" * 70)
            logger.info("UPLOAD-ZUSAMMENFASSUNG")
            logger.info("=" * 70)
            logger.info(f"Quelldatenbank: {self.source_database_file}")
            logger.info(f"Zieldatenbank:  {self.target_database}")
            logger.info(f"Schema:         {self.schema_name}")
            logger.info(f"Server:         {self.connection_params['host']}")
            logger.info(f"Schema-Datei:   {SCHEMA_SQL_PATH}")
            logger.info("-" * 70)
            logger.info(
                f"Tabellen in schema.sql:       "
                f"{len(self.schema_parser.table_names)}"
            )
            logger.info(
                f"Tabellen erstellt:            {len(created_tables)}"
            )
            logger.info(
                f"Tabellen mit Daten:           "
                f"{len(self.tables_with_data)}"
            )
            logger.info(
                f"Tabellen ohne Daten (leer):   {len(self.tables_empty)}"
            )
            logger.info(
                f"Tabellen übersprungen:        "
                f"{len(self.tables_skipped)}"
            )
            logger.info(
                f"Tabellen fehlgeschlagen:      "
                f"{len(self.tables_failed)}"
            )
            logger.info(
                f"Tabellen mit Geometrie:       {geometry_tables_count}"
            )
            logger.info(
                f"Datensätze übertragen:        {total_records}"
            )
            logger.info("-" * 70)

            if self.tables_with_data:
                logger.info("TABELLEN MIT DATEN:")
                for t in sorted(
                    self.tables_with_data, key=lambda x: x['name']
                ):
                    geom_marker = (
                        " [Geometrie]" if t['has_geometry'] else ""
                    )
                    logger.info(
                        f"  {t['name']}: "
                        f"{t['records']} Datensätze{geom_marker}"
                    )

            if self.tables_empty:
                logger.info("-" * 70)
                logger.info("TABELLEN OHNE DATEN (leer):")
                for name in sorted(self.tables_empty):
                    logger.info(f"  {name}")

            if self.tables_skipped:
                logger.info("-" * 70)
                logger.info("ÜBERSPRUNGENE TABELLEN:")
                for t in sorted(
                    self.tables_skipped, key=lambda x: x['name']
                ):
                    logger.info(f"  {t['name']}: {t['reason']}")

            if self.tables_failed:
                logger.info("-" * 70)
                logger.info("FEHLGESCHLAGENE TABELLEN:")
                for t in sorted(
                    self.tables_failed, key=lambda x: x['name']
                ):
                    logger.info(f"  {t['name']}: {t['reason']}")

            logger.info("=" * 70)
            logger.info(
                f"Upload "
                f"{'erfolgreich' if not self.tables_failed else 'mit Warnungen'}"
                f" abgeschlossen!"
            )
            logger.info("=" * 70)

            self._update_progress(100, "Upload erfolgreich abgeschlossen!")

            return True

        except Exception as e:
            logger.error(f"Upload fehlgeschlagen: {str(e)}")
            raise QkanError(f"Upload fehlgeschlagen: {str(e)}")

        finally:
            self._disconnect_postgis()
