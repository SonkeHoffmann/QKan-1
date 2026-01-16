-- Neue Tabelle Anschlussschächte
CREATE TABLE IF NOT EXISTS videos (
    pk INTEGER PRIMARY KEY,
                    name TEXT,
                    untersuchtag TEXT,
                    untersuchrichtung TEXT,
                    objekt TEXT,
                    datei TEXT,
                    createdat TEXT DEFAULT CURRENT_TIMESTAMP);
