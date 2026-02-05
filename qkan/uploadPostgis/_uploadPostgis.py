"""
Upload einer SQLite-Datenbank auf PostGIS WebSuite

Dieses Modul ermöglicht den Upload einer QKan SQLite-Datenbank auf einen
PostGIS-Server (z.B. GBD WebSuite), wobei ALLE Tabellen mit ihren Daten
und Geometrien übernommen und auf der Karte der WebSuite angezeigt werden.
"""

import psycopg2
import psycopg2.extras
import getpass
import datetime
import json
import sqlite3
from typing import Optional, Dict, List, Any, Tuple, Callable

from qgis.PyQt.QtCore import QSettings
from qgis.PyQt.QtWidgets import QProgressBar
from qgis.core import QgsProject, QgsVectorLayer, QgsDataSourceUri
from qgis.utils import spatialite_connect

from qkan.utils import get_logger, QkanError
from .connection_dialog import normalize_hostname

logger = get_logger("QKan.uploadPostgis._uploadPostgis")


class UploadPostgisTask:
    """Task für den Upload einer SQLite-Datenbank nach PostGIS WebSuite"""
    
    def __init__(
        self,
        server_connection: str,
        target_database: str,
        source_database_file: str,
        schema_name: str = "qkan",
        overwrite: bool = False,
        progress_bar: Optional[QProgressBar] = None,
        progress_callback: Optional[Callable[[int, int, str], None]] = None,
        add_layers_to_qgis: bool = True,
        srid: int = 25832
    ):
        """
        Initialisiert den Upload-Task.
        
        Args:
            server_connection: Name der PostgreSQL-Verbindung
            target_database: Name der Zieldatenbank auf PostGIS
            source_database_file: Pfad zur SQLite-Quelldatenbank
            schema_name: PostGIS-Schema für die Tabellen (Standard: qkan)
            overwrite: Bestehende Tabellen überschreiben
            progress_bar: Optional QProgressBar für Fortschrittsanzeige
            progress_callback: Optional Callback für Fortschritt (current, total, message)
            add_layers_to_qgis: Layer nach Upload zu QGIS hinzufügen
            srid: Standard-SRID für Geometrien ohne SRID
        """
        self.server_connection = server_connection
        self.target_database = target_database
        self.source_database_file = source_database_file
        self.schema_name = schema_name
        self.overwrite = overwrite
        self.progress_bar = progress_bar
        self.progress_callback = progress_callback
        self.add_layers_to_qgis = add_layers_to_qgis
        self.default_srid = srid
        
        # Zweite Progress Bar für Datensatz-Fortschritt (wird vom Dialog gesetzt)
        self.progress_bar_records = None
        self.record_progress_callback = None
        
        # Verbindungsparameter parsen
        self.connection_params = self._parse_connection_params()
        
        # Datenbank-Verbindungen
        self.pg_conn = None
        self.pg_cursor = None
        self.db_conn = None  # SQLite-Verbindung
        self.db_cursor = None  # SQLite-Cursor
        self.use_spatialite = False  # Flag ob SpatiaLite verfügbar ist
        
        # Tracking für hochgeladene Tabellen
        self.uploaded_tables: List[Dict[str, Any]] = []
        
        # Statistik-Tracking für Upload-Zusammenfassung
        self.tables_with_data: List[Dict[str, Any]] = []  # Tabellen mit Daten
        self.tables_empty: List[str] = []  # Leere Tabellen
        self.tables_skipped: List[Dict[str, str]] = []  # Übersprungene Tabellen mit Grund
        self.tables_failed: List[Dict[str, str]] = []  # Fehlgeschlagene Tabellen

    def _parse_connection_params(self) -> Dict[str, Any]:
        """Verbindungsparameter aus dem ausgewählten Server extrahieren"""
        connection_name = self.server_connection.split(' (')[0] if ' (' in self.server_connection else self.server_connection
        
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
        """
        Verbindung zu PostGIS-Server herstellen.
        
        Verbindet zunächst mit der postgres Systemdatenbank, um die Zieldatenbank
        zu prüfen/erstellen, und wechselt dann zur Zieldatenbank.
        """
        try:
            params = self.connection_params
            
            # SCHRITT 1: Zuerst mit postgres Systemdatenbank verbinden
            # um Zieldatenbank zu prüfen/erstellen
            conn_parts = [
                f"host='{params['host']}'",
                f"port={params['port']}",
                f"dbname='postgres'",  # Zuerst postgres Systemdatenbank
                f"user='{params['user']}'"
            ]
            
            if params.get('password'):
                conn_parts.append(f"password='{params['password']}'")
            
            if params.get('sslmode'):
                conn_parts.append(f"sslmode='{params['sslmode']}'")
            
            conn_parts.append("connect_timeout=10")
            conn_string = ' '.join(conn_parts)
            
            logger.info(f"Verbinde zu PostgreSQL: {params['user']}@{params['host']}:{params['port']}/postgres")
            
            # Verbindung zur postgres DB herstellen
            self.pg_conn = psycopg2.connect(conn_string)
            self.pg_conn.autocommit = True
            self.pg_cursor = self.pg_conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
            
            logger.info("✓ Verbindung zu postgres Systemdatenbank erfolgreich")
            
            # SCHRITT 2: Zieldatenbank prüfen/erstellen wird in _create_target_database() gemacht
            # SCHRITT 3: Wechsel zur Zieldatenbank erfolgt am Ende von _create_target_database()
            
        except Exception as e:
            raise QkanError(f"Fehler beim Verbinden zu PostGIS: {str(e)}")

    def _check_and_reconnect_postgis(self) -> bool:
        """
        Prüft die PostgreSQL-Verbindung und stellt sie bei Bedarf wieder her.
        
        Returns:
            bool: True wenn Verbindung OK oder erfolgreich wiederhergestellt
        """
        try:
            # Schnelle Verbindungsprüfung
            if self.pg_conn is None or self.pg_conn.closed:
                logger.warning("PostgreSQL-Verbindung ist geschlossen - versuche Reconnect...")
                self._reconnect_to_target_database()
                return True
            
            # Aktive Prüfung mit einfacher Query
            try:
                self.pg_cursor.execute("SELECT 1")
                self.pg_cursor.fetchone()
                return True
            except Exception as query_error:
                logger.warning(f"Verbindungsprüfung fehlgeschlagen: {query_error}")
                self._reconnect_to_target_database()
                return True
                
        except Exception as e:
            logger.error(f"Verbindungswiederherstellung fehlgeschlagen: {str(e)}")
            return False

    def _reconnect_to_target_database(self) -> None:
        """Stellt die Verbindung zur Zieldatenbank wieder her"""
        try:
            # Alte Verbindung schließen falls noch vorhanden
            try:
                if self.pg_cursor:
                    self.pg_cursor.close()
                if self.pg_conn:
                    self.pg_conn.close()
            except:
                pass
            
            # Neue Verbindung aufbauen
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
            self.pg_cursor = self.pg_conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
            
            # Search path wieder setzen
            self.pg_cursor.execute(f"SET search_path TO {self.schema_name}, public")
            
            logger.info(f"✓ Verbindung zu {self.target_database} erfolgreich wiederhergestellt")
            
        except Exception as e:
            raise QkanError(f"Reconnect zur Zieldatenbank fehlgeschlagen: {str(e)}")

    def _disconnect_postgis(self) -> None:
        """PostGIS-Verbindung schließen"""
        try:
            if self.pg_cursor:
                self.pg_cursor.close()
            if self.pg_conn:
                self.pg_conn.close()
        except Exception as e:
            logger.warning(f"Fehler beim Schließen der Verbindung: {str(e)}")

    def _create_target_database(self) -> None:
        """Zieldatenbank erstellen falls sie nicht existiert und zur DB wechseln"""
        try:
            # Prüfen ob Datenbank existiert
            self.pg_cursor.execute(
                "SELECT 1 FROM pg_database WHERE datname = %s",
                (self.target_database,)
            )
            
            result = self.pg_cursor.fetchone()
            
            if not result:
                logger.info(f"Erstelle neue Datenbank: {self.target_database}")
                
                # Datenbank erstellen (außerhalb von Transaktionen)
                old_autocommit = self.pg_conn.autocommit
                self.pg_conn.autocommit = True
                
                try:
                    # Sichere Variante mit Escape
                    self.pg_cursor.execute(f'CREATE DATABASE "{self.target_database}"')
                    logger.info(f"✓ Datenbank {self.target_database} erfolgreich erstellt")
                except Exception as create_error:
                    logger.warning(f"Datenbank konnte nicht erstellt werden: {str(create_error)}")
                    # Vielleicht existiert sie schon oder wir haben keine Rechte
                    # Versuche trotzdem fortzufahren
                finally:
                    self.pg_conn.autocommit = old_autocommit
            else:
                logger.info(f"✓ Datenbank {self.target_database} existiert bereits")
            
            # Verbindung zur Zieldatenbank wechseln
            logger.info(f"Wechsle Verbindung zu Datenbank: {self.target_database}")
            self.pg_conn.close()
            
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
            self.pg_cursor = self.pg_conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
            
            logger.info(f"✓ Verbunden mit Datenbank {self.target_database}")
            
        except Exception as e:
            logger.error(f"Fehler bei Datenbankeinrichtung: {str(e)}")
            raise QkanError(f"Konnte Zieldatenbank nicht einrichten: {str(e)}")

    def _setup_postgis(self) -> None:
        """PostGIS-Extension und Schema einrichten für WebSuite-Kompatibilität"""
        try:
            # PostGIS Extension prüfen/aktivieren
            logger.info("Prüfe PostGIS Extension...")
            self.pg_cursor.execute("""
                SELECT EXISTS(
                    SELECT 1 FROM pg_extension WHERE extname = 'postgis'
                ) AS postgis_exists
            """)
            result = self.pg_cursor.fetchone()
            # RealDictCursor gibt Dictionary zurück
            postgis_exists = result.get('postgis_exists', False) if isinstance(result, dict) else result[0]
            logger.info(f"PostGIS vorhanden: {postgis_exists}")
            
            if not postgis_exists:
                logger.info("PostGIS Extension wird aktiviert...")
                try:
                    self.pg_cursor.execute("CREATE EXTENSION IF NOT EXISTS postgis")
                    logger.info("PostGIS Extension erfolgreich aktiviert")
                except Exception as ext_error:
                    logger.warning(f"Konnte PostGIS nicht aktivieren (evtl. keine Rechte): {ext_error}")
                    # Fortfahren - vielleicht ist PostGIS doch verfügbar
            
            # PostGIS-Version prüfen
            try:
                self.pg_cursor.execute("SELECT PostGIS_Version() AS version")
                version_result = self.pg_cursor.fetchone()
                postgis_version = version_result.get('version', str(version_result)) if isinstance(version_result, dict) else version_result[0]
                logger.info(f"PostGIS Version: {postgis_version}")
            except Exception as ver_error:
                logger.warning(f"Konnte PostGIS-Version nicht ermitteln: {ver_error}")
                # Fortfahren ohne Versionsinfo
            
            # Schema erstellen für WebSuite
            logger.info(f"Erstelle Schema '{self.schema_name}'...")
            try:
                self.pg_cursor.execute(f"CREATE SCHEMA IF NOT EXISTS {self.schema_name}")
                logger.info(f"Schema '{self.schema_name}' wurde erstellt/überprüft")
            except Exception as schema_error:
                logger.warning(f"Konnte Schema nicht erstellen (evtl. keine Rechte): {schema_error}")
                # Versuche mit public Schema weiterzumachen
                self.schema_name = "public"
                logger.info("Verwende stattdessen 'public' Schema")
            
            # Search path setzen für einfacheren Zugriff
            try:
                self.pg_cursor.execute(f"SET search_path TO {self.schema_name}, public")
                logger.info(f"Search path gesetzt auf: {self.schema_name}, public")
            except Exception as path_error:
                logger.warning(f"Konnte search_path nicht setzen: {path_error}")
            
            logger.info("PostGIS-Umgebung erfolgreich eingerichtet")
            
        except Exception as e:
            logger.error(f"Fehler beim Einrichten von PostGIS: {str(e)}")
            raise

    def _update_progress(self, value: int, message: str = "") -> None:
        """Progress Bar aktualisieren (Prozent-basiert)"""
        if self.progress_bar:
            self.progress_bar.setValue(value)
        if message:
            logger.info(message)

    def _update_table_progress(self, current: int, total: int, table_name: str) -> None:
        """Fortschritt basierend auf Tabellenanzahl aktualisieren"""
        message = f"Tabelle {current}/{total}: {table_name}"
        if self.progress_callback:
            self.progress_callback(current, total, message)
        if self.progress_bar:
            self.progress_bar.setMaximum(total)
            self.progress_bar.setValue(current)
        logger.info(message)

    def _get_sqlite_tables(self) -> List[str]:
        """Alle relevanten Tabellen aus SQLite-Datenbank ermitteln"""
        # Zuerst alle Tabellen abrufen
        self.db_cursor.execute("""
            SELECT name, sql FROM sqlite_master 
            WHERE type='table' 
            AND name NOT LIKE 'sqlite_%' 
            AND name NOT LIKE 'idx_%'
            AND name NOT IN ('geometry_columns', 'spatial_ref_sys', 
                            'spatialite_history', 'sql_statements_log',
                            'SpatialIndex', 'ElementaryGeometries',
                            'geometry_columns_auth', 'geometry_columns_field_infos',
                            'geometry_columns_statistics', 'geometry_columns_time',
                            'spatial_ref_sys_aux', 'views_geometry_columns',
                            'views_geometry_columns_auth', 'views_geometry_columns_field_infos',
                            'views_geometry_columns_statistics', 'virts_geometry_columns',
                            'virts_geometry_columns_auth', 'virts_geometry_columns_field_infos',
                            'virts_geometry_columns_statistics', 'geom_cols_ref_sys',
                            'raster_coverages', 'raster_coverages_srid',
                            'raster_coverages_keyword', 'vector_coverages',
                            'vector_coverages_srid', 'vector_coverages_keyword',
                            'data_licenses', 'vector_layers', 'vector_layers_auth',
                            'vector_layers_field_infos', 'vector_layers_statistics',
                            'KNN')
            ORDER BY name
        """)
        tables = self.db_cursor.fetchall()
        
        # Virtuelle Tabellen herausfiltern (CREATE VIRTUAL TABLE ...)
        regular_tables = []
        for row in tables:
            table_name = row[0]
            create_sql = row[1] if row[1] else ""
            
            # Überspringe virtuelle Tabellen (SpatiaLite R*Tree, KNN, etc.)
            if create_sql and 'VIRTUAL' in create_sql.upper():
                logger.debug(f"Überspringe virtuelle Tabelle: {table_name}")
                continue
            
            regular_tables.append(table_name)
        
        return regular_tables

    def _get_geometry_info(self, table_name: str) -> Optional[Dict[str, Any]]:
        """Geometrie-Information für eine Tabelle ermitteln"""
        try:
            self.db_cursor.execute(f"""
                SELECT f_geometry_column, type, coord_dimension, srid
                FROM geometry_columns
                WHERE f_table_name = '{table_name}'
            """)
            geom_info = self.db_cursor.fetchall()
            
            if geom_info:
                srid = geom_info[0][3]
                # Verwende Standard-SRID wenn keiner definiert
                if srid is None or srid == 0 or srid == -1:
                    srid = self.default_srid
                    
                return {
                    'column': geom_info[0][0],
                    'type': geom_info[0][1] or 'GEOMETRY',
                    'coord_dimension': geom_info[0][2] or 2,
                    'srid': srid
                }
        except Exception as e:
            logger.debug(f"Keine Geometrie-Info für {table_name}: {str(e)}")
        return None

    def _get_table_structure(self, table_name: str) -> List[Dict[str, Any]]:
        """Tabellenstruktur aus SQLite ermitteln"""
        self.db_cursor.execute(f"PRAGMA table_info({table_name})")
        columns = self.db_cursor.fetchall()
        
        return [{
            'cid': col[0],
            'name': col[1], 
            'type': col[2] or 'TEXT',
            'notnull': col[3],
            'default': col[4],
            'pk': col[5]
        } for col in columns]

    def _sqlite_to_postgres_type(self, sqlite_type: str, column_name: str = "") -> str:
        """SQLite-Datentyp zu PostgreSQL-Datentyp konvertieren"""
        type_map = {
            'INTEGER': 'INTEGER',
            'REAL': 'DOUBLE PRECISION',
            'TEXT': 'TEXT',
            'BLOB': 'BYTEA',
            'NUMERIC': 'NUMERIC',
            'DATETIME': 'TIMESTAMP',
            'DATE': 'DATE',
            'BOOLEAN': 'BOOLEAN',
            'FLOAT': 'DOUBLE PRECISION',
            'DOUBLE': 'DOUBLE PRECISION',
            '': 'TEXT'  # Standard für leere Typen
        }
        
        if not sqlite_type:
            return 'TEXT'
            
        sqlite_type_upper = sqlite_type.upper()
        
        # Spezielle Behandlung für SQLite-Typen mit Längenangaben
        if 'VARCHAR' in sqlite_type_upper or 'CHAR' in sqlite_type_upper:
            return sqlite_type  # VARCHAR(n) bleibt VARCHAR(n)
        elif 'DECIMAL' in sqlite_type_upper or 'NUMERIC' in sqlite_type_upper:
            return sqlite_type
        elif 'INT' in sqlite_type_upper:
            return 'INTEGER'
        elif 'BOOL' in sqlite_type_upper:
            return 'BOOLEAN'
        
        return type_map.get(sqlite_type_upper, 'TEXT')

    def _create_postgres_table(self, table_name: str, columns: List[Dict[str, Any]], 
                              geom_info: Optional[Dict[str, Any]] = None) -> bool:
        """PostgreSQL-Tabelle erstellen für WebSuite-Kompatibilität"""
        
        try:
            # Bei Overwrite: bestehende Tabelle löschen
            if self.overwrite:
                self.pg_cursor.execute(f"""
                    DROP TABLE IF EXISTS {self.schema_name}.{table_name} CASCADE
                """)
            
            # Prüfen ob Tabelle bereits existiert
            self.pg_cursor.execute("""
                SELECT EXISTS (
                    SELECT 1 FROM information_schema.tables 
                    WHERE table_schema = %s AND table_name = %s
                ) AS table_exists
            """, (self.schema_name, table_name))
            
            result = self.pg_cursor.fetchone()
            # RealDictCursor gibt Dictionary zurück
            table_exists = result.get('table_exists', False) if isinstance(result, dict) else result[0]
            
            if table_exists and not self.overwrite:
                logger.info(f"Tabelle {table_name} existiert bereits - wird übersprungen")
                return False
            
            # CREATE TABLE Statement aufbauen
            col_definitions = []
            primary_key_cols = []
            
            for col in columns:
                col_name = col['name'].lower()
                
                # Geometrie-Spalte wird separat hinzugefügt
                if geom_info and col_name in ['geom', 'geop', 'geometry']:
                    continue
                    
                pg_type = self._sqlite_to_postgres_type(col['type'], col['name'])
                
                # Spaltenname quotieren für Sicherheit
                col_def = f'"{col["name"]}" {pg_type}'
                
                if col['notnull']:
                    col_def += ' NOT NULL'
                
                if col['default'] is not None and col['default'] != '':
                    default_val = col['default']
                    # NULL als Default-Wert behandeln
                    if str(default_val).upper() != 'NULL':
                        col_def += f" DEFAULT {default_val}"
                    
                if col['pk']:
                    primary_key_cols.append(f'"{col["name"]}"')
                    
                col_definitions.append(col_def)
            
            if not col_definitions:
                logger.warning(f"Keine Spalten für Tabelle {table_name} gefunden")
                return False
            
            # Tabelle erstellen
            create_sql = f"""
                CREATE TABLE {self.schema_name}.{table_name} (
                    {", ".join(col_definitions)}
                )
            """
            self.pg_cursor.execute(create_sql)
            
            # Primärschlüssel hinzufügen
            if primary_key_cols:
                try:
                    pk_sql = f"""
                        ALTER TABLE {self.schema_name}.{table_name}
                        ADD CONSTRAINT pk_{table_name} PRIMARY KEY ({", ".join(primary_key_cols)})
                    """
                    self.pg_cursor.execute(pk_sql)
                except Exception as pk_error:
                    logger.warning(f"Primärschlüssel für {table_name} konnte nicht erstellt werden: {str(pk_error)}")
            
            # Geometrie-Spalte hinzufügen für WebSuite-Kartendarstellung
            if geom_info:
                geom_type = geom_info['type'].upper()
                coord_dim = geom_info.get('coord_dimension', 2)
                srid = geom_info['srid']
                geom_col = geom_info['column']
                
                # Geometrie-Typ für PostGIS normalisieren
                geom_type_map = {
                    'POINT': 'POINT',
                    'LINESTRING': 'LINESTRING',
                    'POLYGON': 'POLYGON',
                    'MULTIPOINT': 'MULTIPOINT',
                    'MULTILINESTRING': 'MULTILINESTRING',
                    'MULTIPOLYGON': 'MULTIPOLYGON',
                    'GEOMETRYCOLLECTION': 'GEOMETRYCOLLECTION',
                    'GEOMETRY': 'GEOMETRY'
                }
                pg_geom_type = geom_type_map.get(geom_type, 'GEOMETRY')
                
                try:
                    # AddGeometryColumn für WebSuite-Kompatibilität
                    add_geom_sql = f"""
                        SELECT AddGeometryColumn('{self.schema_name}', '{table_name}', 
                            '{geom_col}', {srid}, '{pg_geom_type}', {coord_dim})
                    """
                    self.pg_cursor.execute(add_geom_sql)
                    logger.info(f"Geometrie-Spalte {geom_col} ({pg_geom_type}, SRID {srid}) für {table_name} erstellt")
                except Exception as geom_error:
                    logger.warning(f"Geometrie-Spalte für {table_name} konnte nicht erstellt werden: {str(geom_error)}")
                    # Fallback: Direkte Spaltenerstellung
                    try:
                        self.pg_cursor.execute(f"""
                            ALTER TABLE {self.schema_name}.{table_name}
                            ADD COLUMN "{geom_col}" geometry({pg_geom_type}, {srid})
                        """)
                    except Exception as e2:
                        logger.error(f"Auch Fallback für Geometrie fehlgeschlagen: {str(e2)}")
            
            logger.info(f"Tabelle {table_name} erstellt")
            return True
            
        except Exception as e:
            logger.error(f"Fehler beim Erstellen der Tabelle {table_name}: {str(e)}")
            return False

    def _convert_geometry_to_wkt(self, table_name: str, 
                                  geom_col: str, srid: int) -> str:
        """Erzeugt SQL zum Konvertieren von Geometrie zu WKT mit SRID"""
        return f"""
            SELECT *, 
                CASE 
                    WHEN {geom_col} IS NOT NULL THEN 
                        AsText(ST_Transform({geom_col}, {srid}))
                    ELSE NULL 
                END as _geom_wkt
            FROM {table_name}
        """

    def _transfer_table_data(self, table_name: str, 
                           columns: List[Dict[str, Any]], geom_info: Optional[Dict[str, Any]] = None) -> int:
        """Daten von SQLite zu PostgreSQL übertragen mit Geometrie-Konvertierung"""
        
        try:
            # Anzahl der Datensätze ermitteln
            self.db_cursor.execute(f"SELECT COUNT(*) FROM {table_name}")
            count_result = self.db_cursor.fetchone()
            total_records = count_result[0] if count_result else 0
            
            if total_records == 0:
                logger.info(f"Tabelle {table_name}: Keine Daten zu übertragen")
                return 0
            
            logger.info(f"Übertrage {total_records} Datensätze für Tabelle {table_name}")
            
            # Spaltennamen für SELECT/INSERT vorbereiten
            non_geom_columns = [col['name'] for col in columns 
                               if not (geom_info and col['name'].lower() in ['geom', 'geop', 'geometry'])]
            
            if geom_info:
                geom_col = geom_info['column']
                srid = geom_info['srid']
                
                # Prüfen ob SpatiaLite-Funktionen verfügbar sind
                use_spatialite = getattr(self, 'use_spatialite', False)
                
                if use_spatialite:
                    # Daten mit WKT-konvertierter Geometrie laden (SpatiaLite)
                    select_cols = ', '.join([f'"{c}"' for c in non_geom_columns])
                    select_sql = f"""
                        SELECT {select_cols}, 
                            CASE 
                                WHEN "{geom_col}" IS NOT NULL THEN AsText("{geom_col}")
                                ELSE NULL 
                            END as geom_wkt
                        FROM {table_name}
                    """
                else:
                    # Ohne SpatiaLite: Geometrie als Hex-BLOB lesen
                    select_cols = ', '.join([f'"{c}"' for c in non_geom_columns])
                    select_sql = f"""
                        SELECT {select_cols}, 
                            CASE 
                                WHEN "{geom_col}" IS NOT NULL THEN hex("{geom_col}")
                                ELSE NULL 
                            END as geom_hex
                        FROM {table_name}
                    """
            else:
                select_cols = ', '.join([f'"{c}"' for c in non_geom_columns])
                select_sql = f"SELECT {select_cols} FROM {table_name}"
            
            self.db_cursor.execute(select_sql)
            all_data = self.db_cursor.fetchall()
            
            if not all_data:
                return 0
            
            # INSERT-Statement vorbereiten
            use_spatialite = getattr(self, 'use_spatialite', False)
            
            if geom_info:
                geom_col = geom_info['column']
                srid = geom_info['srid']
                
                insert_cols = ', '.join([f'"{c}"' for c in non_geom_columns] + [f'"{geom_col}"'])
                
                if use_spatialite:
                    # SpatiaLite: WKT-Format
                    placeholders = ', '.join(['%s'] * len(non_geom_columns) + [f'ST_GeomFromText(%s, {srid})'])
                else:
                    # Ohne SpatiaLite: Hex-EWKB-Format (SpatiaLite speichert im GPKG/EWKB-Format)
                    placeholders = ', '.join(['%s'] * len(non_geom_columns) + [f"ST_GeomFromWKB(decode(%s, 'hex'), {srid})"])
                
                insert_sql = f"""
                    INSERT INTO {self.schema_name}.{table_name} ({insert_cols})
                    VALUES ({placeholders})
                """
            else:
                insert_cols = ', '.join([f'"{c}"' for c in non_geom_columns])
                placeholders = ', '.join(['%s'] * len(non_geom_columns))
                insert_sql = f"""
                    INSERT INTO {self.schema_name}.{table_name} ({insert_cols})
                    VALUES ({placeholders})
                """
            
            # Daten in Batches übertragen
            batch_size = 500
            inserted_records = 0
            consecutive_errors = 0  # Zähler für aufeinanderfolgende Fehler
            max_consecutive_errors = 10  # Abbruch nach 10 Fehlern in Folge
            
            for i in range(0, len(all_data), batch_size):
                batch = all_data[i:i + batch_size]
                
                try:
                    for row in batch:
                        try:
                            # Konvertiere None/NULL-Werte korrekt
                            values = list(row)
                            self.pg_cursor.execute(insert_sql, values)
                            inserted_records += 1
                            consecutive_errors = 0  # Fehler-Zähler zurücksetzen bei Erfolg
                        except Exception as row_error:
                            consecutive_errors += 1
                            error_str = str(row_error).lower()
                            
                            # Bei Verbindungsproblemen sofort abbrechen
                            if 'connection' in error_str or 'closed' in error_str or 'timeout' in error_str:
                                logger.error(f"Verbindungsproblem bei {table_name}: {str(row_error)}")
                                raise  # Abbrechen und Verbindung neu aufbauen lassen
                            
                            # Bei zu vielen aufeinanderfolgenden Fehlern Tabelle überspringen
                            if consecutive_errors >= max_consecutive_errors:
                                logger.error(f"Zu viele aufeinanderfolgende Fehler ({consecutive_errors}) bei {table_name} - breche Tabelle ab")
                                return inserted_records
                            
                            logger.debug(f"Fehler bei Datensatz in {table_name}: {str(row_error)}")
                            continue
                    
                    # Progress aktualisieren - separate Progress Bar für Datensätze
                    if self.progress_bar_records and total_records > 0:
                        self.progress_bar_records.setMaximum(total_records)
                        self.progress_bar_records.setValue(inserted_records)
                    
                    # Callback für detaillierte Fortschrittsmeldung
                    if self.record_progress_callback:
                        # Sende Updates alle 500 Datensätze oder bei Abschluss
                        if inserted_records % 500 == 0 or inserted_records == total_records:
                            self.record_progress_callback(inserted_records, total_records, table_name)
                    
                except Exception as e:
                    logger.error(f"Fehler beim Übertragen der Daten für Tabelle {table_name}: {str(e)}")
                    # Bei Batch-Fehler: Prüfen ob Verbindung noch steht
                    error_str = str(e).lower()
                    if 'connection' in error_str or 'closed' in error_str or 'timeout' in error_str:
                        raise  # Nach oben propagieren für Reconnect
            
            return inserted_records
            
        except Exception as e:
            logger.error(f"Fehler bei Datenübertragung für {table_name}: {str(e)}")
            return 0

    def _create_spatial_index(self, table_name: str, geom_info: Optional[Dict[str, Any]] = None) -> None:
        """Spatial-Index erstellen für WebSuite-Performance"""
        
        if geom_info:
            geom_col = geom_info['column']
            try:
                index_sql = f"""
                    CREATE INDEX IF NOT EXISTS idx_{table_name}_{geom_col}_gist 
                    ON {self.schema_name}.{table_name} USING GIST ("{geom_col}")
                """
                self.pg_cursor.execute(index_sql)
                logger.info(f"Spatial-Index für {table_name}.{geom_col} erstellt")
            except Exception as e:
                logger.warning(f"Spatial-Index für {table_name} konnte nicht erstellt werden: {str(e)}")

    def _finalize_table(self, table_name: str) -> None:
        """Tabelle finalisieren: Kommentare, Vacuum, Analyze für WebSuite"""
        
        try:
            # Tabellen-Kommentar setzen
            timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            comment_sql = f"""
                COMMENT ON TABLE {self.schema_name}.{table_name} IS 
                'QKan Import: {self.source_database_file} - {timestamp}'
            """
            self.pg_cursor.execute(comment_sql)
            
            # ANALYZE für Query-Optimierung
            try:
                self.pg_cursor.execute(f"ANALYZE {self.schema_name}.{table_name}")
            except Exception as e:
                logger.debug(f"ANALYZE für {table_name} übersprungen: {str(e)}")
                
        except Exception as e:
            logger.warning(f"Finalisierung für {table_name} teilweise fehlgeschlagen: {str(e)}")

    def _add_layer_to_qgis(self, table_name: str, geom_info: Dict[str, Any]) -> bool:
        """Fügt eine hochgeladene Tabelle als Layer zu QGIS hinzu für Kartendarstellung"""
        try:
            # DataSource URI für PostGIS erstellen
            uri = QgsDataSourceUri()
            uri.setConnection(
                self.connection_params['host'],
                str(self.connection_params['port']),
                self.target_database,
                self.connection_params['user'],
                self.connection_params.get('password', '')
            )
            
            # SSL-Modus setzen wenn verfügbar
            if 'sslmode' in self.connection_params:
                uri.setSslMode(QgsDataSourceUri.SslMode.SslPrefer)
            
            # Geometrie-Informationen setzen
            uri.setDataSource(
                self.schema_name,
                table_name,
                geom_info['column'],
                "",  # SQL filter
                "pk" if table_name in ['schaechte', 'haltungen'] else ""  # Primary key
            )
            
            # SRID setzen
            uri.setSrid(str(geom_info['srid']))
            
            # Layer erstellen
            layer_name = f"{table_name} (PostGIS)"
            layer = QgsVectorLayer(uri.uri(), layer_name, "postgres")
            
            if layer.isValid():
                QgsProject.instance().addMapLayer(layer)
                logger.info(f"Layer '{layer_name}' zu QGIS hinzugefügt")
                return True
            else:
                logger.warning(f"Layer '{layer_name}' konnte nicht erstellt werden")
                return False
                
        except Exception as e:
            logger.error(f"Fehler beim Hinzufügen des Layers {table_name}: {str(e)}")
            return False

    def _register_with_websuite(self) -> None:
        """
        Registriert die hochgeladenen Tabellen für die WebSuite-Kartendarstellung.
        
        Dies erstellt die notwendigen Metadaten-Einträge für GBD WebSuite,
        sodass die Geometrien auf der Karte angezeigt werden können.
        """
        try:
            # Prüfen ob es sich um einen WebSuite-Server handelt
            # (typischerweise erkennbar an gbd-websuite.de Domain)
            is_websuite = 'gbd-websuite' in self.connection_params['host'].lower()
            
            if not is_websuite:
                logger.info("Kein WebSuite-Server erkannt - überspringe WebSuite-Registrierung")
                return
            
            logger.info("Registriere Tabellen für GBD WebSuite Kartendarstellung...")
            
            # Für jede hochgeladene Geometrie-Tabelle
            for table_info in self.uploaded_tables:
                if table_info.get('has_geometry'):
                    table_name = table_info['name']
                    geom_info = table_info['geom_info']
                    
                    # Aktualisiere geometry_columns Metadaten für WebSuite
                    try:
                        self.pg_cursor.execute(f"""
                            SELECT Populate_Geometry_Columns('{self.schema_name}.{table_name}'::regclass)
                        """)
                    except Exception as e:
                        logger.debug(f"Populate_Geometry_Columns für {table_name}: {str(e)}")
                    
                    # Spatial-Index sicherstellen
                    self._create_spatial_index(table_name, geom_info)
            
            logger.info("WebSuite-Registrierung abgeschlossen")
            
        except Exception as e:
            logger.warning(f"WebSuite-Registrierung teilweise fehlgeschlagen: {str(e)}")

    def run(self) -> bool:
        """
        Hauptfunktion für den Upload-Prozess.
        
        Lädt alle Tabellen und Geometrien aus der SQLite-Datenbank
        auf den PostGIS-Server hoch und registriert sie für die
        WebSuite-Kartendarstellung.
        
        Returns:
            bool: True wenn erfolgreich, False bei Fehlern
        """
        try:
            logger.info("=" * 60)
            logger.info("Starte Upload zu PostGIS WebSuite...")
            logger.info(f"Quelldatenbank: {self.source_database_file}")
            logger.info(f"Zieldatenbank: {self.target_database}")
            logger.info(f"Schema: {self.schema_name}")
            logger.info("=" * 60)
            
            # Prüfen ob Quelldatei existiert
            import os
            if not os.path.exists(self.source_database_file):
                error_msg = f"Quelldatenbank nicht gefunden: {self.source_database_file}"
                logger.error(error_msg)
                raise QkanError(error_msg)
            
            file_size = os.path.getsize(self.source_database_file)
            logger.info(f"Quelldatei-Größe: {file_size / 1024:.1f} KB")
            
            self._update_progress(5, "Verbinde zu PostGIS-Server...")
            
            # PostGIS-Verbindung herstellen (zunächst mit postgres DB)
            try:
                self._connect_postgis()
                logger.info("✓ PostGIS-Verbindung hergestellt")
            except Exception as conn_error:
                logger.error(f"✗ PostGIS-Verbindung fehlgeschlagen: {conn_error}")
                raise
            
            # Zieldatenbank prüfen/erstellen und verbinden
            self._update_progress(8, "Prüfe/erstelle Zieldatenbank...")
            try:
                self._create_target_database()
                logger.info("✓ Zieldatenbank verfügbar")
            except Exception as db_error:
                logger.error(f"✗ Zieldatenbank konnte nicht eingerichtet werden: {db_error}")
                raise
            
            self._update_progress(10, "Richte PostGIS-Umgebung ein...")
            try:
                self._setup_postgis()
                logger.info("✓ PostGIS-Umgebung eingerichtet")
            except Exception as setup_error:
                logger.error(f"✗ PostGIS-Setup fehlgeschlagen: {setup_error}")
                raise
            
            self._update_progress(15, "Öffne SQLite-Quelldatenbank...")
            
            # SQLite/SpatiaLite-Datenbank öffnen mit Fallback
            db_conn = None
            db_cursor = None
            use_spatialite = False
            
            # Versuche zuerst SpatiaLite über qgis.utils
            try:
                db_conn = spatialite_connect(
                    database=self.source_database_file, 
                    check_same_thread=False
                )
                db_cursor = db_conn.cursor()
                use_spatialite = True
                logger.info(f"✓ SpatiaLite-Datenbank erfolgreich geöffnet: {self.source_database_file}")
            except Exception as spatialite_error:
                logger.info(f"ℹ SpatiaLite-Modul nicht verfügbar ({spatialite_error})")
                logger.info("→ Verwende Standard-SQLite-Modus (Geometrien werden direkt konvertiert)")
                
                # Fallback auf Standard-SQLite ohne Extensions
                try:
                    db_conn = sqlite3.connect(
                        self.source_database_file,
                        check_same_thread=False
                    )
                    db_cursor = db_conn.cursor()
                    
                    # NICHT versuchen mod_spatialite zu laden - das führt zu VirtualKNN-Fehlern
                    # Geometrien werden als BLOB/Hex behandelt
                    logger.info(f"✓ SQLite-Datenbank geöffnet (Standard-Modus)")
                    logger.info("  → Geometrien werden als BLOB/Hex gelesen und nach PostGIS konvertiert")
                    
                except Exception as sqlite_error:
                    error_msg = f"Kann SQLite-Datenbank nicht öffnen: {str(sqlite_error)}"
                    logger.error(f"✗ {error_msg}")
                    raise QkanError(error_msg)
            
            try:
                self.db_conn = db_conn
                self.db_cursor = db_cursor
                self.use_spatialite = use_spatialite
                
                self._update_progress(20, "Analysiere Quelldatenbank...")
                
                # Alle Tabellen ermitteln
                tables = self._get_sqlite_tables()
                total_tables = len(tables)
                
                if total_tables == 0:
                    logger.warning("Keine Tabellen in der Quelldatenbank gefunden!")
                    return True  # Erfolgreich, aber nichts zu tun
                
                logger.info(f"Gefunden: {total_tables} Tabellen zum Übertragen")
                
                # Fortschrittsanzeige initialisieren
                if self.progress_callback:
                    self.progress_callback(0, total_tables, "Starte Tabellenübertragung...")
                if self.progress_bar:
                    self.progress_bar.setMaximum(total_tables)
                    self.progress_bar.setValue(0)
                
                processed_tables = 0
                geometry_tables_count = 0
                
                # Statistik-Listen zurücksetzen
                self.tables_with_data = []
                self.tables_empty = []
                self.tables_skipped = []
                self.tables_failed = []
                
                for table_name in tables:
                    # Jede Tabelle in einem eigenen try-except verarbeiten,
                    # damit Fehler bei einer Tabelle nicht den gesamten Upload abbrechen
                    try:
                        # PostgreSQL-Verbindung prüfen und bei Bedarf wiederherstellen
                        if not self._check_and_reconnect_postgis():
                            logger.error(f"Verbindung zu PostgreSQL verloren - breche Upload ab")
                            break
                        
                        # Tabellenfortschritt aktualisieren
                        self._update_table_progress(processed_tables, total_tables, table_name)
                        
                        logger.info(f"Verarbeite Tabelle: {table_name}")
                        
                        # Tabellenstruktur ermitteln
                        try:
                            columns = self._get_table_structure(table_name)
                        except Exception as struct_error:
                            logger.error(f"Fehler beim Ermitteln der Tabellenstruktur für {table_name}: {str(struct_error)}")
                            self.tables_failed.append({'name': table_name, 'reason': f'Tabellenstruktur: {str(struct_error)}'})
                            processed_tables += 1
                            continue
                        
                        if not columns:
                            logger.warning(f"Keine Spalten für Tabelle {table_name} gefunden - überspringe")
                            self.tables_skipped.append({'name': table_name, 'reason': 'Keine Spalten gefunden'})
                            processed_tables += 1
                            continue
                        
                        # Geometrie-Information ermitteln
                        try:
                            geom_info = self._get_geometry_info(table_name)
                        except Exception as geom_error:
                            logger.warning(f"Fehler beim Ermitteln der Geometrie-Info für {table_name}: {str(geom_error)}")
                            geom_info = None  # Fortfahren ohne Geometrie
                        
                        # PostgreSQL-Tabelle erstellen
                        try:
                            table_created = self._create_postgres_table(table_name, columns, geom_info)
                            
                            if not table_created:
                                self.tables_skipped.append({'name': table_name, 'reason': 'Tabelle existiert bereits'})
                                processed_tables += 1
                                continue
                        except Exception as create_error:
                            logger.error(f"Fehler beim Erstellen der Tabelle {table_name}: {str(create_error)}")
                            self.tables_failed.append({'name': table_name, 'reason': str(create_error)})
                            processed_tables += 1
                            continue
                        
                        # Daten übertragen
                        try:
                            transferred_records = self._transfer_table_data(table_name, columns, geom_info)
                        except Exception as transfer_error:
                            logger.error(f"Fehler bei Datenübertragung für {table_name}: {str(transfer_error)}")
                            self.tables_failed.append({'name': table_name, 'reason': f'Datenübertragung: {str(transfer_error)}'})
                            transferred_records = 0
                        
                        # Datensatz-Progress Bar zurücksetzen
                        if self.progress_bar_records:
                            self.progress_bar_records.setValue(0)
                            self.progress_bar_records.setMaximum(100)
                        
                        # Spatial-Index erstellen für Geometrie-Tabellen
                        if geom_info:
                            try:
                                self._create_spatial_index(table_name, geom_info)
                            except Exception as idx_error:
                                logger.warning(f"Spatial-Index für {table_name} fehlgeschlagen: {str(idx_error)}")
                            geometry_tables_count += 1
                        
                        # Tabelle finalisieren
                        try:
                            self._finalize_table(table_name)
                        except Exception as fin_error:
                            logger.warning(f"Finalisierung für {table_name} fehlgeschlagen: {str(fin_error)}")
                        
                        # Tracking für WebSuite-Registrierung und Statistik
                        table_info = {
                            'name': table_name,
                            'records': transferred_records,
                            'has_geometry': geom_info is not None,
                            'geom_info': geom_info
                        }
                        self.uploaded_tables.append(table_info)
                        
                        # Statistik: Mit Daten oder leer?
                        if transferred_records > 0:
                            self.tables_with_data.append(table_info)
                        else:
                            self.tables_empty.append(table_name)
                        
                        processed_tables += 1
                        
                        # Fortschritt nach Abschluss der Tabelle aktualisieren
                        self._update_table_progress(processed_tables, total_tables, f"{table_name} ✓ ({transferred_records} Datensätze)")
                        
                        logger.info(f"Tabelle {table_name} erfolgreich übertragen: {transferred_records} Datensätze")
                        
                    except Exception as table_error:
                        # Unerwarteter Fehler bei dieser Tabelle - protokollieren und mit nächster fortfahren
                        logger.error(f"Unerwarteter Fehler bei Tabelle {table_name}: {str(table_error)}")
                        self.tables_failed.append({'name': table_name, 'reason': f'Unerwarteter Fehler: {str(table_error)}'})
                        processed_tables += 1
                        # Weiter mit der nächsten Tabelle statt Abbruch
                        continue
            
            finally:
                # SQLite-Verbindung schließen
                try:
                    if db_cursor:
                        db_cursor.close()
                    if db_conn:
                        db_conn.close()
                except:
                    pass
            
            # Abschlussfortschritt anzeigen
            if self.progress_callback:
                self.progress_callback(total_tables, total_tables, "Registriere für WebSuite...")
            
            # WebSuite-Registrierung durchführen
            self._register_with_websuite()
            
            # Optional: Layer zu QGIS hinzufügen
            if self.add_layers_to_qgis:
                if self.progress_callback:
                    self.progress_callback(total_tables, total_tables, "Füge Layer zu QGIS hinzu...")
                layers_added = 0
                
                for table_info in self.uploaded_tables:
                    if table_info.get('has_geometry') and table_info.get('geom_info'):
                        if self._add_layer_to_qgis(table_info['name'], table_info['geom_info']):
                            layers_added += 1
                
                logger.info(f"{layers_added} Layer zu QGIS hinzugefügt")
            
            # Abschließende Statistik
            if self.progress_callback:
                self.progress_callback(total_tables, total_tables, f"Upload abgeschlossen: {processed_tables} Tabellen")
            
            # Detaillierte Upload-Zusammenfassung erstellen
            total_records = sum(t['records'] for t in self.tables_with_data)
            
            logger.info("=" * 70)
            logger.info("UPLOAD-ZUSAMMENFASSUNG")
            logger.info("=" * 70)
            logger.info(f"Quelldatenbank: {self.source_database_file}")
            logger.info(f"Zieldatenbank:  {self.target_database}")
            logger.info(f"Schema:         {self.schema_name}")
            logger.info(f"Server:         {self.connection_params['host']}")
            logger.info("-" * 70)
            logger.info(f"Tabellen gesamt gefunden:     {total_tables}")
            logger.info(f"Tabellen mit Daten:           {len(self.tables_with_data)}")
            logger.info(f"Tabellen ohne Daten (leer):   {len(self.tables_empty)}")
            logger.info(f"Tabellen übersprungen:        {len(self.tables_skipped)}")
            logger.info(f"Tabellen fehlgeschlagen:      {len(self.tables_failed)}")
            logger.info(f"Tabellen mit Geometrie:       {geometry_tables_count}")
            logger.info(f"Datensätze übertragen:        {total_records}")
            logger.info("-" * 70)
            
            # Tabellen mit Daten auflisten
            if self.tables_with_data:
                logger.info("TABELLEN MIT DATEN:")
                for t in sorted(self.tables_with_data, key=lambda x: x['name']):
                    geom_marker = " [Geometrie]" if t['has_geometry'] else ""
                    logger.info(f"  ✓ {t['name']}: {t['records']} Datensätze{geom_marker}")
            
            # Leere Tabellen auflisten
            if self.tables_empty:
                logger.info("-" * 70)
                logger.info("TABELLEN OHNE DATEN (leer):")
                for name in sorted(self.tables_empty):
                    logger.info(f"  ○ {name}")
            
            # Übersprungene Tabellen auflisten
            if self.tables_skipped:
                logger.info("-" * 70)
                logger.info("ÜBERSPRUNGENE TABELLEN:")
                for t in sorted(self.tables_skipped, key=lambda x: x['name']):
                    logger.info(f"  - {t['name']}: {t['reason']}")
            
            # Fehlgeschlagene Tabellen auflisten
            if self.tables_failed:
                logger.info("-" * 70)
                logger.info("FEHLGESCHLAGENE TABELLEN:")
                for t in sorted(self.tables_failed, key=lambda x: x['name']):
                    logger.info(f"  ✗ {t['name']}: {t['reason']}")
            
            logger.info("=" * 70)
            logger.info(f"Upload {'erfolgreich' if not self.tables_failed else 'mit Warnungen'} abgeschlossen!")
            logger.info("=" * 70)
            
            self._update_progress(100, "Upload erfolgreich abgeschlossen!")
            
            return True
            
        except Exception as e:
            logger.error(f"Upload fehlgeschlagen: {str(e)}")
            raise QkanError(f"Upload fehlgeschlagen: {str(e)}")
            
        finally:
            self._disconnect_postgis()


def upload_sqlite_to_postgis(
    source_db: str,
    target_host: str,
    target_database: str,
    target_user: str,
    target_password: str = "",
    target_port: int = 5432,
    schema_name: str = "qkan",
    overwrite: bool = False,
    srid: int = 25832
) -> bool:
    """
    Convenience-Funktion für den direkten Upload einer SQLite-Datenbank nach PostGIS.
    
    Diese Funktion kann auch außerhalb von QGIS verwendet werden.
    
    Args:
        source_db: Pfad zur SQLite-Quelldatenbank
        target_host: Hostname des PostGIS-Servers
        target_database: Name der Zieldatenbank
        target_user: Benutzername für PostGIS
        target_password: Passwort für PostGIS
        target_port: Port des PostGIS-Servers (Standard: 5432)
        schema_name: Schema-Name in PostGIS (Standard: qkan)
        overwrite: Bestehende Tabellen überschreiben
        srid: Standard-SRID für Geometrien
        
    Returns:
        bool: True wenn erfolgreich
    """
    # Verbindungsstring erstellen
    connection_string = f"{target_host} ({target_host}:{target_port})"
    
    # Temporär Verbindungsparameter in QSettings speichern
    settings = QSettings()
    temp_connection_name = f"_temp_upload_{datetime.datetime.now().strftime('%Y%m%d%H%M%S')}"
    base_key = f"PostgreSQL/connections/{temp_connection_name}"
    
    settings.setValue(f"{base_key}/host", target_host)
    settings.setValue(f"{base_key}/port", target_port)
    settings.setValue(f"{base_key}/username", target_user)
    settings.setValue(f"{base_key}/password", target_password)
    settings.setValue(f"{base_key}/database", target_database)
    
    try:
        task = UploadPostgisTask(
            server_connection=connection_string,
            target_database=target_database,
            source_database_file=source_db,
            schema_name=schema_name,
            overwrite=overwrite,
            add_layers_to_qgis=False,
            srid=srid
        )
        
        # Verbindungsparameter direkt setzen
        task.connection_params = {
            'host': target_host,
            'port': target_port,
            'user': target_user,
            'password': target_password,
            'database': target_database,
            'sslmode': 'prefer'
        }
        
        return task.run()
        
    finally:
        # Temporäre Verbindung wieder entfernen
        settings.beginGroup(f"PostgreSQL/connections/{temp_connection_name}")
        settings.remove("")
        settings.endGroup()

