Verwaltung
==========

.. index:: Datenbank aktualisieren 
   
Datenbank aktualisieren
-----------------------
							 
Mit der Funktion |Tool_db_aktualisieren| :guilabel:`QKan-Datenbank aktualisieren` kann die QKan Datenbank sowie die 
PRojektdatei auf die aktuelle Version aktualisiert werden. Dabei kann mit der auswahl unter dem Verzeichnis 
eine Sicherheitskopie erstellt werden. Diese stellt sicher, dass das orginal Projekt bei einem fehlerhaften 
Update versuch nciht verloren ist.

.. image:: ./QKan_Bilder/qkan_layersadapt.png
.. |Tool_db_aktualisieren| image:: ./QKan_Bilder/Tool_db_aktualisieren.png
                             :width: 1.25 em
							 
							 
.. index:: Neue Datenbank erstellen

Neue Datenbank erstellen
------------------------

Mit dem Tool |Tool_db_erstellen| :guilabel:`Neue Datenbank anlegen` kann eine leere QKan-Datenbank erstellt werden, 
die als Grundlage für ein neues Projekt dient.

.. image:: ./QKan_Bilder/Formulare/db_anlegen.png
.. |Tool_db_erstellen| image:: ./QKan_Bilder/Tool_datenbank_erstellen.png
                             :width: 1.25 em

Das Tool erstellt automatisch die benötigte Datenbankstruktur mit allen erforderlichen Tabellen und Feldern, die 
für die Arbeit in QKan notwendig sind. Dadurch wird sichergestellt, dass das neue Projekt vollständig kompatibel 
mit allen QKan-Funktionen ist. Dafür mussen vom Nutzer nur die Ziel Pfade der Datenbank und der Projektdate 
angegeben werden. Zusätzlich muss das Koordintensystem ausgewählt werden. Das gewählte Koordinatensystem sollte dem 
der zu importierenden GIS-Daten (z. B. Schächte, Haltungen, Flächen) entsprechen. Es wird empfohlen, das neue 
Projekt in einem eigenen Verzeichnis anzulegen, um eine saubere Trennung zu anderen Projekten sicherzustellen. Nach 
der Erstellung können über die Importfunktionen (z. B. ISYBAU, QKan-XML oder Shape) die gewünschten Daten 
eingelesen werden.


.. index:: Dateipfade suchen

Dateipfade suchen
-----------------

Das Tool :guilabel:`Dateipfad-Suche` dient der automatischen Aktualisierung relativer Dateipfade innerhalb der 
QKan-Datenbank.

.. image:: ./QKan_Bilder/Formulare/dateipfade.png

Hintergrund
+++++++++++

In QKan werden Bilder und Videos von Kanalbefahrungen häufig in separaten Unterordnern gespeichert, die im Laufe 
der Projektbearbeitung umbenannt, verschoben oder restrukturiert werden können. Wenn sich die Ordnerstruktur 
ändert, stimmen die in der Datenbank gespeicherten Pfade nicht mehr mit den tatsächlichen Speicherorten der Dateien 
überein. Dies führt dazu, dass QKan die zugehörigen Dateien (z. B. Videos, Fotos oder Protokolle) nicht mehr 
automatisch findet und anzeigt.

Funktionsweise
++++++++++++++

Das Tool durchsucht automatisch die angegebenen Verzeichnisse nach den gespeicherten Dateinamen und ermittelt den 
neuen Speicherort der Dateien. Anschließend werden die relativen Pfade in der QKan-Datenbank aktualisiert, sodass die Verknüpfung zwischen den 
Kanalelementen und den zugehörigen Medien wiederhergestellt wird.

Einstellungen
+++++++++++++

Der Hauptpfad (Basisverzeichnis für alle relativen Pfade) kann unter QKan → Optionen angepasst werden.
Dies ist besonders hilfreich, wenn das gesamte Projektverzeichnis oder die Medienordner auf ein anderes Laufwerk 
oder in eine neue Struktur verschoben wurden.
