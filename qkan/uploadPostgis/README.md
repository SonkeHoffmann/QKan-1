# Upload PostGIS

QGIS-Plugin-Modul zum Upload von QKan SQLite-Datenbanken und QGIS-Projekten auf einen PostGIS-Server.

## Funktionen

- Upload von SQLite-Datenbanken nach PostGIS
- Upload von QGIS-Projektdateien (.qgs/.qgz)
- Unterstützung für mehrere Datenbanken gleichzeitig
- Automatische Konvertierung von Geometrien
- Verwaltung von PostGIS-Verbindungen

## Bedienung

### Server-Verbindung einrichten

1. Plugin-Menü: "Upload nach PostGIS WebSuite"
2. Server auswählen oder neue Verbindung erstellen
3. Verbindung testen

### Upload durchführen

1. SQLite-Quelldatenbanken auswählen (optional)
2. QGIS-Projekt-Upload aktivieren (optional)
3. Ziel-Schema wählen oder neu erstellen (obligatorisch)
4. "Upload starten"

Mindestens eine Quelle (SQLite oder QGIS-Projekt) muss ausgewählt sein.

## Optionen

- **Bestehende Tabellen überschreiben**: Löscht vorhandene Daten im Schema
- **QGIS-Projekt hochladen**: Speichert Projektdatei in der Datenbank (nur eine pro Schema)


