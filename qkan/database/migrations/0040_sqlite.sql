-- Ergänzen eines Triggers für die Referenztabelle abflussparameter
CREATE TRIGGER IF NOT EXISTS trig_ref_abflussparameter AFTER UPDATE OF apnam ON abflussparameter
                BEGIN
                    UPDATE flaechen
                    SET abflussparameter = new.apnam
                    WHERE abflussparameter = old.apnam AND abflussparameter IS NOT NULL;
                    UPDATE tezg
                    SET abflussparameter = new.apnam
                    WHERE abflussparameter = old.apnam AND abflussparameter IS NOT NULL;
                END;
