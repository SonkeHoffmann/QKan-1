import psycopg2
import psycopg2.extras
import getpass
import datetime
from typing import Optional, Dict, List, Any

from qgis.PyQt.QtCore import QSettings
from qgis.PyQt.QtWidgets import QProgressBar

from qkan.database.dbfunc import DBConnection
from qkan.utils import get_logger, QkanError
from .connection_dialog import normalize_hostname

logger = get_logger("QKan.uploadPostgis._uploadPostgis")


class UploadPostgisTask:
    def __init__(
        self,
        server_connection: str,
        target_database: str,
        source_database_file: str,
        schema_name: str = "qkan",
        overwrite: bool = False,
        progress_bar: Optional[QProgressBar] = None
    ):
        self.server_connection = server_connection
        self.target_database = target_database
        self.source_database_file = source_database_file
        self.schema_name = schema_name
        self.overwrite = overwrite
        self.progress_bar = progress_bar
        
        # Verbindungsparameter parsen
        self.connection_params = self._parse_connection_params()
        
        # Datenbank-Verbindungen
        self.pg_conn = None
        self.pg_cursor = None
        self.db_qkan = None

    def _parse_connection_params(self) -> Dict[str, Any]:
        """Verbindungsparameter aus dem ausgewählten Server extrahieren"""
        connection_name = self.server_connection.split(' (')[0] if ' (' in self.server_connection else self.server_connection
        
        if connection_name.lower() == "localhost":
            # PostgreSQL.app verwendet den aktuellen Benutzer als Standard
            current_user = getpass.getuser()
            
            return {
                'host': 'localhost',
                'port': 5432,
                'user': current_user,  # Für PostgreSQL.app
                'password': '',
                'database': self.target_database,
                'sslmode': 'prefer'
            }
        else:
            settings = QSettings()
            base_key = f"PostgreSQL/connections/{connection_name}"
            
            # Hostname aus Settings laden und normalisieren
            host_raw = settings.value(f"{base_key}/host", "localhost")
            host = normalize_hostname(host_raw)
            if host != host_raw:
                logger.info(f"Hostname normalisiert: '{host_raw}' -> '{host}'")
            
            return {
                'host': host,
                'port': int(settings.value(f"{base_key}/port", 5432)),
                'user': settings.value(f"{base_key}/username", ""),
                'password': settings.value(f"{base_key}/password", ""),
                'database': self.target_database,
                'sslmode': settings.value(f"{base_key}/sslmode", "prefer")
            }

    def _connect_postgis(self) -> None:
        """Verbindung zu PostGIS-Server herstellen"""
        try:
            # Verschiedene Verbindungsoptionen für macOS ausprobieren
            connection_attempts = []
            
            # Standard-Parameter
            base_params = self.connection_params.copy()
            connection_attempts.append(base_params)
            
            # Für PostgreSQL.app und lokale Installationen
            if base_params['host'] == 'localhost':
                current_user = getpass.getuser()
                
                # Versuch 1: Aktueller Benutzer (PostgreSQL.app Standard)
                alt_params1 = base_params.copy()
                alt_params1['user'] = current_user
                connection_attempts.append(alt_params1)
                
                # Versuch 2: postgres Benutzer (Homebrew/klassische Installation)
                alt_params2 = base_params.copy()
                alt_params2['user'] = 'postgres'
                connection_attempts.append(alt_params2)
                
                # Versuch 3: Mit 'postgres' Datenbank falls Ziel-DB nicht existiert
                alt_params3 = base_params.copy()
                alt_params3['user'] = current_user
                alt_params3['database'] = 'postgres'
                connection_attempts.append(alt_params3)
            
            last_error = None
            
            for attempt, params in enumerate(connection_attempts, 1):
                try:
                    # Verbindungsstring erstellen
                    conn_parts = [
                        f"host='{params['host']}'",
                        f"port={params['port']}",
                        f"dbname='{params['database']}'",
                        f"user='{params['user']}'"
                    ]
                    
                    if 'password' in params and params['password']:
                        conn_parts.append(f"password='{params['password']}'")
                    
                    if 'sslmode' in params:
                        conn_parts.append(f"sslmode='{params['sslmode']}'")
                    
                    # Timeout hinzufügen
                    conn_parts.append("connect_timeout=10")
                    
                    conn_string = ' '.join(conn_parts)
                    
                    logger.info(f"Verbindungsversuch {attempt}: {params['user']}@{params['host']}:{params['port']}/{params['database']}")
                    
                    # DNS-Auflösung vorab testen für externe Hosts
                    if params['host'] != 'localhost' and params['host'] != '127.0.0.1':
                        try:
                            import socket
                            # Versuche IPv4-Auflösung
                            ip = socket.getaddrinfo(params['host'], params['port'], socket.AF_INET)[0][4][0]
                            logger.info(f"DNS aufgelöst: {params['host']} -> {ip}")
                            # Ersetze Host durch IP in conn_string
                            conn_string = conn_string.replace(f"host='{params['host']}'", f"host='{ip}'")
                        except socket.gaierror as dns_error:
                            logger.warning(f"DNS-Auflösung fehlgeschlagen für {params['host']}: {dns_error}")
                            # Verwende ursprünglichen Hostnamen
                    
                    self.pg_conn = psycopg2.connect(conn_string)
                    self.pg_conn.autocommit = True
                    self.pg_cursor = self.pg_conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
                    
                    # Erfolgreich verbunden - Zieldatenbank erstellen falls nötig
                    if params['database'] != self.target_database:
                        self._create_target_database()
                    
                    logger.info(f"PostGIS-Verbindung erfolgreich hergestellt!")
                    return
                    
                except Exception as e:
                    last_error = e
                    logger.warning(f"Verbindungsversuch {attempt} fehlgeschlagen: {str(e)}")
                    if self.pg_conn:
                        try:
                            self.pg_conn.close()
                        except:
                            pass
                        self.pg_conn = None
                    continue
            
            # Alle Versuche fehlgeschlagen
            raise QkanError(f"Alle Verbindungsversuche fehlgeschlagen. Letzter Fehler: {str(last_error)}")
            
        except Exception as e:
            raise QkanError(f"Fehler beim Verbinden zu PostGIS: {str(e)}")

    def _disconnect_postgis(self) -> None:
        """PostGIS-Verbindung schließen"""
        if self.pg_cursor:
            self.pg_cursor.close()
        if self.pg_conn:
            self.pg_conn.close()

    def _create_target_database(self) -> None:
        """Zieldatenbank erstellen falls sie nicht existiert"""
        try:
            # Prüfen ob Zieldatenbank existiert
            self.pg_cursor.execute(
                self.db_qkan.sqls['uploadPostgis_check_database_exists'],
                (self.target_database,)
            )
            
            if not self.pg_cursor.fetchone():
                logger.info(f"Erstelle Datenbank: {self.target_database}")
                
                # Neue Verbindung zur Zieldatenbank
                self.pg_cursor.execute(f'CREATE DATABASE "{self.target_database}"')
                
                # Verbindung zur neuen Datenbank wechseln
                self.pg_conn.close()
                
                # Neue Verbindung mit Zieldatenbank
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
                
                conn_string = ' '.join(conn_parts)
                
                self.pg_conn = psycopg2.connect(conn_string)
                self.pg_conn.autocommit = True
                self.pg_cursor = self.pg_conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
                
            logger.info(f"Datenbank {self.target_database} ist verfügbar")
            
        except Exception as e:
            logger.warning(f"Konnte Zieldatenbank nicht erstellen: {str(e)}")

    def _setup_postgis(self) -> None:
        """PostGIS-Extension und Schema einrichten"""
        # PostGIS Extension prüfen/aktivieren
        self.pg_cursor.execute(self.db_qkan.sqls['uploadPostgis_check_postgis'])
        postgis_exists = self.pg_cursor.fetchone()[0]
        
        if not postgis_exists:
            logger.info("PostGIS Extension wird aktiviert...")
            self.pg_cursor.execute(self.db_qkan.sqls['uploadPostgis_enable_postgis'])
        
        # Schema erstellen
        schema_sql = self.db_qkan.sqls['uploadPostgis_create_schema'].format(schema_name=self.schema_name)
        self.pg_cursor.execute(schema_sql)
        logger.info(f"Schema '{self.schema_name}' wurde erstellt/überprüft")

    def _update_progress(self, value: int, message: str = "") -> None:
        """Progress Bar aktualisieren"""
        if self.progress_bar:
            self.progress_bar.setValue(value)
        if message:
            logger.info(message)

    def _get_sqlite_tables(self, db_qkan: DBConnection) -> List[str]:
        """Alle relevanten Tabellen aus SQLite-Datenbank ermitteln"""
        db_qkan.sql(db_qkan.sqls['uploadPostgis_get_all_tables'])
        tables = db_qkan.fetchall()
        return [row[0] for row in tables]

    def _get_geometry_info(self, db_qkan: DBConnection, table_name: str) -> Optional[Dict[str, Any]]:
        """Geometrie-Information für eine Tabelle ermitteln"""
        sql = db_qkan.sqls['uploadPostgis_get_geometry_info'].format(table_name=table_name)
        db_qkan.sql(sql)
        geom_info = db_qkan.fetchall()
        
        if geom_info:
            return {
                'column': geom_info[0][0],
                'type': geom_info[0][1],
                'coord_dimension': geom_info[0][2],
                'srid': geom_info[0][3]
            }
        return None

    def _get_table_structure(self, db_qkan: DBConnection, table_name: str) -> List[Dict[str, Any]]:
        """Tabellenstruktur aus SQLite ermitteln"""
        sql = db_qkan.sqls['uploadPostgis_get_table_columns'].format(table_name=table_name)
        db_qkan.sql(sql)
        columns = db_qkan.fetchall()
        
        return [{
            'cid': col[0],
            'name': col[1], 
            'type': col[2],
            'notnull': col[3],
            'default': col[4],
            'pk': col[5]
        } for col in columns]

    def _sqlite_to_postgres_type(self, sqlite_type: str) -> str:
        """SQLite-Datentyp zu PostgreSQL-Datentyp konvertieren"""
        type_map = {
            'INTEGER': 'INTEGER',
            'REAL': 'DOUBLE PRECISION',
            'TEXT': 'TEXT',
            'BLOB': 'BYTEA',
            'NUMERIC': 'NUMERIC',
            'DATETIME': 'TIMESTAMP',
            'DATE': 'DATE',
            'BOOLEAN': 'BOOLEAN'
        }
        
        sqlite_type = sqlite_type.upper()
        
        # Spezielle Behandlung für SQLite-Typen mit Längenangaben
        if 'VARCHAR' in sqlite_type or 'CHAR' in sqlite_type:
            return sqlite_type  # VARCHAR(n) bleibt VARCHAR(n)
        elif 'DECIMAL' in sqlite_type or 'NUMERIC' in sqlite_type:
            return sqlite_type  # DECIMAL(p,s) bleibt DECIMAL(p,s)
        
        return type_map.get(sqlite_type, 'TEXT')

    def _create_postgres_table(self, table_name: str, columns: List[Dict[str, Any]], 
                              geom_info: Optional[Dict[str, Any]] = None) -> None:
        """PostgreSQL-Tabelle erstellen"""
        
        # Bei Overwrite: bestehende Tabelle löschen
        if self.overwrite:
            drop_sql = self.db_qkan.sqls['uploadPostgis_drop_table'].format(
                schema_name=self.schema_name,
                table_name=table_name
            )
            self.pg_cursor.execute(drop_sql)
        
        # Prüfen ob Tabelle bereits existiert
        self.pg_cursor.execute(
            self.db_qkan.sqls['uploadPostgis_check_table_exists'],
            (self.schema_name, table_name)
        )
        
        table_exists = self.pg_cursor.fetchone()[0]
        
        if table_exists and not self.overwrite:
            logger.info(f"Tabelle {table_name} existiert bereits - wird übersprungen")
            return
        
        # CREATE TABLE Statement aufbauen
        col_definitions = []
        primary_key_cols = []
        
        for col in columns:
            if col['name'].lower() in ['geom', 'geometry'] and geom_info:
                # Geometrie-Spalte wird separat hinzugefügt
                continue
                
            pg_type = self._sqlite_to_postgres_type(col['type'])
            col_def = f'"{col["name"]}" {pg_type}'
            
            if col['notnull']:
                col_def += ' NOT NULL'
            
            if col['default'] is not None:
                col_def += f" DEFAULT {col['default']}"
                
            if col['pk']:
                primary_key_cols.append(col['name'])
                
            col_definitions.append(col_def)
        
        # Tabelle erstellen
        create_sql = self.db_qkan.sqls['uploadPostgis_create_table'].format(
            schema_name=self.schema_name,
            table_name=table_name,
            column_definitions=", ".join(col_definitions)
        )
        self.pg_cursor.execute(create_sql)
        
        # Primärschlüssel hinzufügen
        if primary_key_cols:
            pk_sql = self.db_qkan.sqls['uploadPostgis_add_primary_key'].format(
                schema_name=self.schema_name,
                table_name=table_name,
                primary_key_columns=", ".join(primary_key_cols)
            )
            self.pg_cursor.execute(pk_sql)
        
        # Geometrie-Spalte hinzufügen
        if geom_info:
            geom_type = geom_info['type'].upper()
            coord_dim = geom_info['coord_dimension']
            srid = geom_info['srid']
            geom_col = geom_info['column']
            
            # AddGeometryColumn verwenden
            add_geom_sql = self.db_qkan.sqls['uploadPostgis_add_geometry_column'].format(
                schema_name=self.schema_name,
                table_name=table_name,
                geom_column=geom_col,
                srid=srid,
                geom_type=geom_type,
                coord_dimension=coord_dim
            )
            self.pg_cursor.execute(add_geom_sql)
        
        logger.info(f"Tabelle {table_name} erstellt")

    def _transfer_table_data(self, db_qkan: DBConnection, table_name: str, 
                           columns: List[Dict[str, Any]], geom_info: Optional[Dict[str, Any]] = None) -> int:
        """Daten von SQLite zu PostgreSQL übertragen"""
        
        # Anzahl der Datensätze ermitteln
        count_sql = db_qkan.sqls['uploadPostgis_count_records'].format(table_name=table_name)
        db_qkan.sql(count_sql)
        count_result = db_qkan.fetchone()
        total_records = count_result[0] if count_result else 0
        
        if total_records == 0:
            logger.info(f"Tabelle {table_name}: Keine Daten zu übertragen")
            return 0
        
        logger.info(f"Übertrage {total_records} Datensätze für Tabelle {table_name}")
        
        # Alle Daten aus SQLite lesen
        data_sql = db_qkan.sqls['uploadPostgis_select_all_data'].format(table_name=table_name)
        db_qkan.sql(data_sql)
        all_data = db_qkan.fetchall()
        
        if not all_data:
            return 0
        
        # Spaltennamen für INSERT vorbereiten
        column_names = [col['name'] for col in columns]
        
        # INSERT-Statement vorbereiten
        placeholders = ', '.join(['%s'] * len(column_names))
        quoted_columns = ', '.join([f'"{name}"' for name in column_names])
        insert_sql = (f'INSERT INTO {self.schema_name}.{table_name} '
                     f'({quoted_columns}) '
                     f'VALUES ({placeholders})')
        
        # Daten in Batches übertragen
        batch_size = 1000
        inserted_records = 0
        
        for i in range(0, len(all_data), batch_size):
            batch = all_data[i:i + batch_size]
            
            try:
                self.pg_cursor.executemany(insert_sql, batch)
                inserted_records += len(batch)
                
                # Progress aktualisieren
                progress = min(100, int(50 + (inserted_records / total_records) * 40))
                self._update_progress(progress, f"Übertragen: {inserted_records}/{total_records} Datensätze")
                
            except Exception as e:
                logger.error(f"Fehler beim Übertragen der Daten für Tabelle {table_name}: {str(e)}")
                raise
        
        return inserted_records

    def _create_indexes(self, table_name: str, geom_info: Optional[Dict[str, Any]] = None) -> None:
        """Indizes erstellen"""
        
        # Spatial Index für Geometrie-Spalte
        if geom_info:
            geom_col = geom_info['column']
            index_sql = self.db_qkan.sqls['uploadPostgis_create_spatial_index'].format(
                table_name=table_name,
                geom_column=geom_col,
                schema_name=self.schema_name
            )
            self.pg_cursor.execute(index_sql)
            logger.info(f"Spatial-Index für {table_name}.{geom_col} erstellt")
        
        # Weitere Standard-Indizes für wichtige Spalten (schnam, haltnam, etc.)

    def _finalize_table(self, table_name: str) -> None:
        """Tabelle finalisieren: Kommentare, Vacuum, Analyze"""
        
        # Tabellen-Kommentar setzen
        timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        comment_sql = (f'COMMENT ON TABLE {self.schema_name}.{table_name} IS '
                      f"'Importiert aus QKan SQLite-Datenbank am {timestamp}'")
        self.pg_cursor.execute(comment_sql)
        
        # Vacuum und Analyze
        # Achtung: Diese Befehle können nicht in Transaktionen ausgeführt werden
        old_autocommit = self.pg_conn.autocommit
        self.pg_conn.autocommit = True
        
        try:
            vacuum_sql = self.db_qkan.sqls['uploadPostgis_vacuum_analyze'].format(
                schema_name=self.schema_name,
                table_name=table_name
            )
            self.pg_cursor.execute(vacuum_sql)
        except Exception as e:
            logger.warning(f"Vacuum/Analyze für {table_name} fehlgeschlagen: {str(e)}")
        finally:
            self.pg_conn.autocommit = old_autocommit

    def run(self) -> bool:
        """Hauptfunktion für den Upload-Prozess"""
        try:
            logger.info("Starte Upload zu PostGIS...")
            self._update_progress(5, "Verbinde zu PostGIS-Server...")
            
            # PostGIS-Verbindung herstellen
            self._connect_postgis()
            
            self._update_progress(10, "Richte PostGIS-Umgebung ein...")
            self._setup_postgis()
            
            # QKan-Datenbank öffnen
            with DBConnection(dbname=self.source_database_file) as db_qkan:
                self.db_qkan = db_qkan
                
                # SQL-Statements für dieses Modul laden
                db_qkan.loadmodule('uploadPostgis')
                
                self._update_progress(15, "Analysiere Quelldatenbank...")
                
                # Alle Tabellen ermitteln
                tables = self._get_sqlite_tables(db_qkan)
                total_tables = len(tables)
                
                logger.info(f"Gefunden: {total_tables} Tabellen zum Übertragen")
                
                processed_tables = 0
                
                for table_name in tables:
                    try:
                        logger.info(f"Verarbeite Tabelle: {table_name}")
                        
                        # Tabellenstruktur ermitteln
                        columns = self._get_table_structure(db_qkan, table_name)
                        
                        # Geometrie-Information ermitteln
                        geom_info = self._get_geometry_info(db_qkan, table_name)
                        
                        # Progress berechnen
                        base_progress = 20 + int((processed_tables / total_tables) * 70)
                        self._update_progress(base_progress, f"Erstelle Tabelle: {table_name}")
                        
                        # PostgreSQL-Tabelle erstellen
                        self._create_postgres_table(table_name, columns, geom_info)
                        
                        # Daten übertragen
                        self._update_progress(base_progress + 5, f"Übertrage Daten: {table_name}")
                        transferred_records = self._transfer_table_data(db_qkan, table_name, columns, geom_info)
                        
                        # Indizes erstellen
                        self._update_progress(base_progress + 10, f"Erstelle Indizes: {table_name}")
                        self._create_indexes(table_name, geom_info)
                        
                        # Tabelle finalisieren
                        self._finalize_table(table_name)
                        
                        processed_tables += 1
                        
                        logger.info(f"Tabelle {table_name} erfolgreich übertragen: {transferred_records} Datensätze")
                        
                    except Exception as e:
                        logger.error(f"Fehler beim Verarbeiten der Tabelle {table_name}: {str(e)}")
                        continue  # Tabelle überspringen, aber weitermachen
            
            self._update_progress(95, "Finalisiere Upload...")
            
            # Abschließende Arbeiten
            logger.info(f"Upload erfolgreich abgeschlossen: {processed_tables}/{total_tables} Tabellen übertragen")
            
            self._update_progress(100, "Upload erfolgreich abgeschlossen!")
            
            return True
            
        except Exception as e:
            logger.error(f"Upload fehlgeschlagen: {str(e)}")
            raise QkanError(f"Upload fehlgeschlagen: {str(e)}")
            
        finally:
            self._disconnect_postgis()

