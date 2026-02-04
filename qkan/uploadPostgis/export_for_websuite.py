"""
Standalone SQL-Dump Export Tool für QKan zu GBD WebSuite

Dieses Modul bietet eine einfache Möglichkeit, SQLite-Datenbanken
als PostgreSQL SQL-Dumps zu exportieren, die direkt auf einem
GBD WebSuite Server importiert werden können.
"""

import sys
import os
from typing import Optional

def export_qkan_to_sql(
    sqlite_file: str,
    output_sql: Optional[str] = None,
    schema_name: str = "qkan"
) -> bool:
    """
    Exportiert eine QKan SQLite-Datenbank als PostgreSQL SQL-Dump.
    
    Args:
        sqlite_file: Pfad zur SQLite-Datei
        output_sql: Pfad zur Ausgabe-SQL-Datei (optional, wird automatisch generiert)
        schema_name: PostgreSQL Schema-Name (default: "qkan")
    
    Returns:
        bool: True wenn erfolgreich
    
    Usage:
        python3 export_for_websuite.py meine_datenbank.sqlite
    """
    try:
        from export_sql_dump import export_to_sql_dump
    except ImportError:
        print("Fehler: Konnte export_sql_dump nicht importieren")
        print("Stellen Sie sicher, dass Sie sich im richtigen Verzeichnis befinden")
        return False
    
    if not os.path.exists(sqlite_file):
        print(f"Fehler: Datei nicht gefunden: {sqlite_file}")
        return False
    
    if output_sql is None:
        base_name = os.path.splitext(sqlite_file)[0]
        output_sql = f"{base_name}_websuite.sql"
    
    print(f"QKan SQL-Export für GBD WebSuite")
    print(f"=" * 60)
    print(f"Quelle:  {sqlite_file}")
    print(f"Ziel:    {output_sql}")
    print(f"Schema:  {schema_name}")
    print(f"=" * 60)
    print()
    
    try:
        success = export_to_sql_dump(sqlite_file, output_sql, schema_name)
        
        if success:
            file_size = os.path.getsize(output_sql)
            size_mb = file_size / (1024 * 1024)
            
            print()
            print("✓ Export erfolgreich!")
            print(f"✓ Ausgabedatei: {output_sql}")
            print(f"✓ Größe: {size_mb:.2f} MB")
            print()
            print("Nächste Schritte:")
            print("=" * 60)
            print("1. Kopieren Sie die .sql-Datei auf Ihren WebSuite-Server:")
            print(f"   scp {output_sql} user@server:/tmp/")
            print()
            print("2. Verbinden Sie sich per SSH:")
            print("   ssh user@server")
            print()
            print("3. Importieren Sie den Dump:")
            print(f"   psql -d ihre_datenbank -f /tmp/{os.path.basename(output_sql)}")
            print()
            print("4. Prüfen Sie die importierten Tabellen:")
            print(f"   psql -d ihre_datenbank -c '\\dt {schema_name}.*'")
            print()
            print("Alternativ: Import über pgAdmin oder DBeaver")
            print("=" * 60)
            
            return True
        else:
            print("✗ Export fehlgeschlagen")
            return False
            
    except Exception as e:
        print(f"✗ Fehler beim Export: {e}")
        import traceback
        traceback.print_exc()
        return False


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Verwendung: python3 export_for_websuite.py <sqlite-datei> [ausgabe.sql] [schema]")
        print()
        print("Beispiele:")
        print("  python3 export_for_websuite.py projekt.sqlite")
        print("  python3 export_for_websuite.py projekt.sqlite export.sql")
        print("  python3 export_for_websuite.py projekt.sqlite export.sql mein_schema")
        sys.exit(1)
    
    sqlite_file = sys.argv[1]
    output_sql = sys.argv[2] if len(sys.argv) > 2 else None
    schema = sys.argv[3] if len(sys.argv) > 3 else "qkan"
    
    success = export_qkan_to_sql(sqlite_file, output_sql, schema)
    sys.exit(0 if success else 1)
