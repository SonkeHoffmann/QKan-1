-- Ergänzen einiger Felder in Tabelle anschlussleitungen
ALTER TABLE anschlussleitungen ADD COLUMN urstation REAL;                             /* Anschlussposition gegen Fließrichtung */
ALTER TABLE anschlussleitungen ADD COLUMN ursprung TEXT;                                  /* Adresse oder Objektbezeichnung */
