"""
Export einer SQLite-Datenbank als PostgreSQL SQL-Dump

Erstellt einen SQL-Dump, der direkt auf einem PostgreSQL/PostGIS-Server
(z.B. GBD WebSuite) importiert werden kann.
"""

import os
import datetime
from typing import Optional, List, Dict, Any

from qgis.utils import spatialite_connect
from qkan.utils import get_logger, QkanError

logger = get_logger("QKan.uploadPostgis.export_sql_dump")


class SQLiteToPgSQLDumper:
    """Exportiert SQLite-Datenbank als PostgreSQL SQL-Dump"""
    
    def __init__(
        self,
        source_database_file: str,
        output_file: str,
        schema_name: str = "qkan",
        srid: int = 25832
    ):
        self.source_database_file = source_database_file
        self.output_file = output_file
        self.schema_name = schema_name
        self.default_srid = srid
        
        self.db_conn = None
        self.db_cursor = None
    
    def export(self) -> bool:
        """Erstellt den SQL-Dump"""
        try:
            logger.info(f"Erstelle SQL-Dump von {self.source_database_file}")
            logger.info(f"Ausgabe: {self.output_file}")
            
            # SQLite öffnen
            self.db_conn = spatialite_connect(
                database=self.source_database_file,
                check_same_thread=False
            )
            self.db_cursor = self.db_conn.cursor()
            
            with open(self.output_file, 'w', encoding='utf-8') as f:
                # Header schreiben
                self._write_header(f)
                
                # Schema erstellen
                self._write_schema_creation(f)
                
                # PostGIS aktivieren
                self._write_postgis_extension(f)
                
                # Tabellen auslesen und exportieren
                tables = self._get_tables()
                
                for table_name in tables:
                    logger.info(f"Exportiere Tabelle: {table_name}")
                    self._export_table(f, table_name)
                
                # Footer schreiben
                self._write_footer(f)
            
            logger.info(f"SQL-Dump erfolgreich erstellt: {self.output_file}")
            return True
            
        except Exception as e:
            logger.error(f"Fehler beim Erstellen des SQL-Dumps: {e}")
            raise QkanError(f"SQL-Dump Export fehlgeschlagen: {e}")
        
        finally:
            if self.db_cursor:
                self.db_cursor.close()
            if self.db_conn:
                self.db_conn.close()
    
    def _write_header(self, f):
        """Schreibt SQL-Dump Header"""
        timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        f.write(f"""--
-- PostgreSQL SQL-Dump
-- Erstellt von QKan uploadPostgis
-- Quelle: {self.source_database_file}
-- Datum: {timestamp}
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

""")
    
    def _write_schema_creation(self, f):
        """Erstellt Schema"""
        f.write(f"""--
-- Schema: {self.schema_name}
--

DROP SCHEMA IF EXISTS {self.schema_name} CASCADE;
CREATE SCHEMA {self.schema_name};
SET search_path = {self.schema_name}, public;

""")
    
    def _write_postgis_extension(self, f):
        """Aktiviert PostGIS Extension"""
        f.write("""--
-- PostGIS Extension
--

CREATE EXTENSION IF NOT EXISTS postgis;

""")
    
    def _write_footer(self, f):
        """Schreibt Footer"""
        f.write(f"""--
-- QKan SQL-Dump abgeschlossen
--
""")
    
    def _get_tables(self) -> List[str]:
        """Ermittelt alle relevanten Tabellen"""
        self.db_cursor.execute("""
            SELECT name FROM sqlite_master 
            WHERE type='table' 
            AND name NOT LIKE 'sqlite_%' 
            AND name NOT LIKE 'idx_%'
            AND name NOT IN (
                'geometry_columns', 'spatial_ref_sys', 
                'spatialite_history', 'sql_statements_log',
                'SpatialIndex', 'ElementaryGeometries'
            )
            ORDER BY name
        """)
        return [row[0] for row in self.db_cursor.fetchall()]
    
    def _get_geometry_info(self, table_name: str) -> Optional[Dict[str, Any]]:
        """Ermittelt Geometrie-Info"""
        try:
            self.db_cursor.execute(f"""
                SELECT f_geometry_column, type, coord_dimension, srid
                FROM geometry_columns
                WHERE f_table_name = '{table_name}'
            """)
            result = self.db_cursor.fetchone()
            
            if result:
                srid = result[3] if result[3] and result[3] > 0 else self.default_srid
                return {
                    'column': result[0],
                    'type': result[1] or 'GEOMETRY',
                    'dimension': result[2] or 2,
                    'srid': srid
                }
        except:
            pass
        return None
    
    def _get_columns(self, table_name: str) -> List[Dict[str, Any]]:
        """Ermittelt Tabellenstruktur"""
        self.db_cursor.execute(f"PRAGMA table_info({table_name})")
        return [{
            'name': col[1],
            'type': col[2] or 'TEXT',
            'notnull': col[3],
            'default': col[4],
            'pk': col[5]
        } for col in self.db_cursor.fetchall()]
    
    def _export_table(self, f, table_name: str):
        """Exportiert eine Tabelle"""
        geom_info = self._get_geometry_info(table_name)
        columns = self._get_columns(table_name)
        
        # CREATE TABLE
        self._write_create_table(f, table_name, columns, geom_info)
        
        # INSERT Daten
        self._write_insert_data(f, table_name, columns, geom_info)
        
        # Geometrie-Spalte registrieren (falls vorhanden)
        if geom_info:
            self._write_geometry_registration(f, table_name, geom_info)
            self._write_spatial_index(f, table_name, geom_info)
        
        f.write("\n")
    
    def _sqlite_to_pg_type(self, sqlite_type: str) -> str:
        """Konvertiert SQLite zu PostgreSQL Datentyp"""
        type_upper = (sqlite_type or 'TEXT').upper()
        
        type_map = {
            'INTEGER': 'INTEGER',
            'REAL': 'DOUBLE PRECISION',
            'TEXT': 'TEXT',
            'BLOB': 'BYTEA',
            'NUMERIC': 'NUMERIC',
            'BOOLEAN': 'BOOLEAN',
            'DATETIME': 'TIMESTAMP',
            'DATE': 'DATE'
        }
        
        for key, value in type_map.items():
            if key in type_upper:
                return value
        
        return 'TEXT'
    
    def _write_create_table(self, f, table_name: str, columns: List[Dict], geom_info: Optional[Dict]):
        """Schreibt CREATE TABLE Statement"""
        f.write(f"-- Tabelle: {table_name}\n")
        f.write(f"DROP TABLE IF EXISTS {self.schema_name}.{table_name} CASCADE;\n")
        f.write(f"CREATE TABLE {self.schema_name}.{table_name} (\n")
        
        col_defs = []
        pk_cols = []
        
        for col in columns:
            # Geometrie-Spalten überspringen (werden separat hinzugefügt)
            if geom_info and col['name'] == geom_info['column']:
                continue
            
            pg_type = self._sqlite_to_pg_type(col['type'])
            col_def = f'    "{col["name"]}" {pg_type}'
            
            if col['notnull']:
                col_def += ' NOT NULL'
            
            if col['default'] and str(col['default']).upper() != 'NULL':
                col_def += f" DEFAULT {col['default']}"
            
            if col['pk']:
                pk_cols.append(col['name'])
            
            col_defs.append(col_def)
        
        f.write(",\n".join(col_defs))
        
        if pk_cols:
            pk_cols_quoted = ', '.join([f'"{c}"' for c in pk_cols])
            f.write(f',\n    PRIMARY KEY ({pk_cols_quoted})')
        
        f.write("\n);\n\n")
        
        # Geometrie-Spalte hinzufügen (falls vorhanden)
        if geom_info:
            f.write(f"SELECT AddGeometryColumn('{self.schema_name}', '{table_name}', ")
            f.write(f"'{geom_info['column']}', {geom_info['srid']}, ")
            f.write(f"'{geom_info['type']}', {geom_info['dimension']});\n\n")
    
    def _write_insert_data(self, f, table_name: str, columns: List[Dict], geom_info: Optional[Dict]):
        """Schreibt INSERT Statements"""
        # Spaltennamen (ohne Geometrie)
        non_geom_cols = [c['name'] for c in columns 
                        if not (geom_info and c['name'] == geom_info['column'])]
        
        # Daten abfragen
        if geom_info:
            select_cols = ', '.join([f'"{c}"' for c in non_geom_cols])
            select_sql = f"""
                SELECT {select_cols},
                    CASE 
                        WHEN "{geom_info['column']}" IS NOT NULL 
                        THEN AsText("{geom_info['column']}")
                        ELSE NULL 
                    END as geom_wkt
                FROM {table_name}
            """
        else:
            select_cols = ', '.join([f'"{c}"' for c in non_geom_cols])
            select_sql = f"SELECT {select_cols} FROM {table_name}"
        
        self.db_cursor.execute(select_sql)
        rows = self.db_cursor.fetchall()
        
        if not rows:
            return
        
        f.write(f"-- Daten für {table_name} ({len(rows)} Zeilen)\n")
        
        # INSERT Statements
        for row in rows:
            if geom_info:
                # Mit Geometrie
                data_cols = non_geom_cols + [geom_info['column']]
                values = []
                
                for i, val in enumerate(row[:-1]):  # Alle außer WKT
                    values.append(self._format_value(val))
                
                # Geometrie als ST_GeomFromText
                wkt = row[-1]
                if wkt:
                    values.append(f"ST_GeomFromText('{wkt}', {geom_info['srid']})")
                else:
                    values.append('NULL')
            else:
                # Ohne Geometrie
                data_cols = non_geom_cols
                values = [self._format_value(val) for val in row]
            
            col_list = ', '.join([f'"{c}"' for c in data_cols])
            val_list = ', '.join(values)
            f.write(f"INSERT INTO {self.schema_name}.{table_name} ({col_list}) VALUES ({val_list});\n")
        
        f.write("\n")
    
    def _format_value(self, val) -> str:
        """Formatiert einen Wert für SQL"""
        if val is None:
            return 'NULL'
        elif isinstance(val, (int, float)):
            return str(val)
        elif isinstance(val, bool):
            return 'TRUE' if val else 'FALSE'
        else:
            # String - escapen
            val_str = str(val).replace("'", "''")
            return f"'{val_str}'"
    
    def _write_geometry_registration(self, f, table_name: str, geom_info: Dict):
        """Registriert Geometrie-Spalte"""
        # Wird bereits in AddGeometryColumn gemacht
        pass
    
    def _write_spatial_index(self, f, table_name: str, geom_info: Dict):
        """Erstellt Spatial-Index"""
        geom_column = geom_info['column']
        f.write(f"CREATE INDEX idx_{table_name}_{geom_column}_gist ")
        f.write(f"ON {self.schema_name}.{table_name} ")
        f.write(f'USING GIST ("{geom_column}");\n\n')


def export_to_sql_dump(source_db: str, output_file: str, schema_name: str = "qkan") -> bool:
    """
    Exportiert eine SQLite-Datenbank als PostgreSQL SQL-Dump.
    
    Args:
        source_db: Pfad zur SQLite-Quelldatenbank
        output_file: Pfad zur SQL-Dump-Ausgabedatei
        schema_name: PostgreSQL-Schema-Name
    
    Returns:
        bool: True wenn erfolgreich
    """
    dumper = SQLiteToPgSQLDumper(source_db, output_file, schema_name)
    return dumper.export()
