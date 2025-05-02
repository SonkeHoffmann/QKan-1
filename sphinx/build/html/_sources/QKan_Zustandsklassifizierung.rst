Zustandsklassifizierung
====

Zustandsklassifizierung
---------------------
Mit der Funktion |Tool_Zustandsklassen| :guilabel:`Zustandsklassifizierung` können Befahrungsdaten nach Unterschidlichen Regelwerken automatisch klassifiziert werden.

.. image:: ./QKan_Bilder/Formulare/zustandsklassen.png
.. |Tool_Zustandsklassen| image:: ./QKan_Bilder/Tool_Zustandsklassen.png
                             :width: 1.25 em

Datenbank
+++++++++++
Hier wird die Datenbank ausgewählt, mit der die Zustandsklassifizierung durchgeführt werden soll.

Auswahl der Daten nach
++++++++++++++++++++
Damit nicht für alle Daten in der Datenbank eine Zustandsklassifizierung durchgeführt wird, gibt es die Auswahlmöglichkeiten "Importdatum" und "Befahrungsdatum". 
Bei der Auswahl "Importdatum" werden nur Daten berücksichtigt die an dem Zeitpunkt der ausgewählt wird importiert wurden. 
Bei der Auswahl "Befahrungsdatum" werden aus der Datenbank alle vorhanden Befahrungsdaten ausgewählt und angezeigt. Aus diesen Daten kann dann ein Datum für die Zustandsklassifizierung ausgewählt werden.

Auswahlmöglichkeiten
+++++++++++++++++++++
Das Tool bietet verschiedene Auswahlmöglichkeiten für die Zustandsklassifizierung an.
Es kann ausgewählt werden, ob die Klassifizierung nach DWA-M 149-3 oder ISYBAU durchgeführt werden soll. 
Des Weiteren ist eine Auswahl der zu klassifizierenden Daten möglich, soadass ausgewählt werden kann ob die Klassifizierung für die Schächte, Haltungen oder Hausanschlussleitungen vorgenommen werden soll.

Da es bei der Klassifizierung nach DWA-M 149-3 nicht für jeden Schaden eine autmatisierte Bewertung gibt, bietet das Tool die Möglichkeit an diese "Einzelfallbetrachtungen" automatisch durch die Klassifizierung nach ISYBAU zu ergänzen.
Eine manuelle Bewertung der "Einzelfallbetrachtungen" über die Attributtabelle ist ebenfalls möglich. Nachdem alle Zustandklassen für die Schäden vorliegen sollte mit dem Tool die Neuberechnung der Zustandsklasse durchgeführt werden.


NEUER TEXT!!!

Um das Plugin Zustandsklassen zu nutzen, muss im Vorhinein eine Datenbank mit den notwendigen Informationen mit Hilfe des Plugins QKan erstellt werden. 
Dafür muss das Plugin QKan heruntergeladen werden und im Plugin Ordner von QGIS gespeichert werden. Dann kann zum Beispiel die Funktion „Import aus ISYBAU-XML" genutzt 
werden um die Stammdaten und die Befahrungsdaten zu importieren. Mit Hilfe dieser Funktion wird eine QKan Datenbank erstellt, die alle benötigten Information für das Plugin 
Zustandsklassen enthält.
Um die Zustandsklassen nun zu ermitteln, muss über die Menüleiste in QGIS die Schaltfläche „QKan" geklickt werden. Dort kann das Plugin Zustandsklassen ausgewählt werden.

BILD

Daraufhin öffnet sich das im folgenden gezeigte Eingabefenster:

BILD

In dem Eingabefenster sind folgende Eingaben möglich:
•	Datenbank
•	Projektionssystem
•	Auswahl der Daten nach Datum
•	Auswahl ob Beschreibungstexte eingefügt werden sollen
•	Auswahl Ob Zustandsklassifizierung der Haltungen nach DWA oder ISYBAU
•	Auswahl ob Zustandsklassifizierung der Schächte nach DWA oder ISYBAU
•	Auswahl Ob Zustandsklassifizierung der Hausanschlussleitungen nach DWA oder ISYBAU
•	Einzelfallbetrachtung durch ISYBAU ergänzen
•	Neuberechnung der Zustandsklassen
In dem Eingabefenster wird zunächst die Datenbank ausgewählt, die für die Berechnung der Zustandsklassen genutzt wird. Danach wird das Projektionssystem ausgewählt. 
Wenn eine Datenbank ausgewählt wurde, erscheinen je nach Auswahl des Datumstyps die Erstellungsdaten oder die Befahrungsdaten der einzelnen Datensätze.
Dann kann jeweils für die Haltungen, Hausanschlussleitungen und Schächte ausgewählt werden, Ob die Zustandsklassen nach DWA-M 149 Oder nach ISYBAU ermittelt werden sollen. 
Mit einem Klick auf OK wird das Plugin gestartet und eine Klassifizierung vorgenommen. Nachdem das Plugin durchgelaufen ist, sind die neuen Daten in der Datenbank enthalten 
und neue Layer wurden dem Projekt zugefügt.
Wenn die Klassifizierung nach DWA-M 149 durchgeführt wurde, werden die in der folgenden Abbildung gezeigten Layer für die Haltungen und Schächte dem Projekt hinzugefügt.

BILD

Bei einer Klassifizierung nach ISYBAU werden die in der folgenden Abbildung gezeigten Layer für die Haltungen und Schächte dem Projekt hinzugefügt.

BILD


Bei einer Klassifizierung nach DWA-M 149 gibt es bei einigen Schäden die Klassifizierung „Einzelfallbetrachtung“. Diese können wie nach DWA vorgesehen über die Attributtabelle 
händisch nach bewertet werden. Alternativ bietet das Tool „Zustandsklassen“ die Möglichkeit eine automatisierte Ergänzung der „Einzelfallbetrachtungen“ durch eine Bewertung nach 
ISYBAU vorzunehmen. 
Im Nachgang an diese Ergänzungen ist die Neuberechnung der Gesamtklassifizierung notwendig. Dies kann mit dem Punkt „Zustandsklassen der Haltungen neu berechnen nach Bewertung der 
Einzelfallbetrachtung“ durchgeführt werden. 

Alternativ kann die Zustandsklassifizierung auch übersprungen werden und nur die Tabellen angelegt werden. Dabei werden schon vorhandene Klassifizierungen aus den Grundlagentabellen 
übernommen.


