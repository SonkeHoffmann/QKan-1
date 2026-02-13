Zustandsbewertung
=================

.. index:: Zustandsklassifizierung 
   
Zustandsklassifizierung
-----------------------
							 
Mit der Funktion |Tool_zustandsklassifizierung| :guilabel:`Zustandsklassifizierung` kann eine automatisierte Bewertung des baulichen Zustands des Kanalnetzes nach den Regelwerken 
DWA-M 149-3 oder ISYBAU durchgeführt werden.
Diese Funktion dient der einheitlichen und reproduzierbaren Einstufung von Schäden an Haltungen, Schächten und Hausanschlussleitungen, 
die im Rahmen einer Kanalinspektion erfasst wurden.


.. image:: ./QKan_Bilder/Formulare/zustandsklassen.png
.. |Tool_zustandsklassifizierung| image:: ./QKan_Bilder/Tool_zustandsklassen.png
                             :width: 1.25 em
							 

Zunächst wird die QKan-Datenbank ausgewählt, in der die Schadensdaten gespeichert sind.
Zusätzlich kann über ein Datum festgelegt werden, welche Schäden in die Bewertung einbezogen werden sollen (z. B. nur Inspektionen an einem bestimmten Stichtag).
Es kann entschieden werden, ob für die in der Datenbank enthaltenen Schadenskürzel automatisch die zugehörigen Langtexte erzeugt werden sollen.
Diese Option erleichtert die Interpretation und Dokumentation der Schadensdaten, insbesondere bei der späteren Berichtsausgabe.

Anschließend wird festgelegt, ob die Klassifizierung nach DWA-M 149-3 oder ISYBAU durchgeführt werden soll.
Die Bewertung erfolgt dabei automatisiert anhand der in der Datenbank enthaltenen Schadenskürzel und der jeweiligen Regelwerksdefinitionen.
							 
Nach dem Start der Klassifizierung werden alle relevanten Schäden analysiert und die entsprechenden Zustandsklassen (z. B. 0–5) für jedes Objekt berechnet.
Die Ergebnisse werden in die QKan-Datenbank zurückgeschrieben und können anschließend in Berichten, Diagrammen oder Übersichtsplänen visualisiert werden.
						
						
.. index:: Sanierungsbedarfszahl 
 
Sanierungsbedarfszahl
---------------------

Mit dem Tool |Tool_sanierungsbedarfszahl| :guilabel:`Sanierungsbedarfszahl` kann im Anschluss an die Zustandsklassifizierung die Sanierungsbedarfszahl nach DWA-M 149-3 bzw. 
die Schadenszahl nach ISYBAU ermittelt werden.
Diese Kennzahlen dienen der quantitativen Bewertung des Sanierungsbedarfs einzelner Haltungen, Schächte oder Hausanschlussleitungen und 
unterstützen die Priorisierung von Sanierungsmaßnahmen im Kanalnetz.

.. image:: ./QKan_Bilder/Sanierungsklassen/sanierung2.png
.. |Tool_sanierungsbedarfszahl| image:: ./QKan_Bilder/Tool_sanierungsbedarfszahl.png
                             :width: 1.25 em

Bevor die Berechnung durchgeführt werden kann, müssen bestimmte Grundlagendaten in der QKan-Datenbank vorhanden oder ergänzt werden. Dazu gehören insbesondere 
Angaben zum Grundwasserstand (z. B. mittlere Tiefe oder Abstand zur Rohrsohle), Materialdaten der Haltungen und Schächte sowie
Ergebnisse der Zustandsklassifizierung (nach DWA-M 149-3 oder ISYBAU).
