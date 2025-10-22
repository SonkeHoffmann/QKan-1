XML-Importe
===========

Import aus DWA-M150
-------------------
Mit der Funktion |Tool_import_dwa_m150| :guilabel:`Import aus DWA-150-XML` können DWA-M150-Dateien im XML-Format in ein QKan-Projekt importiert werden.

.. image:: ./QKan_Bilder/Formulare/import_dwa_m150.png
.. |Tool_import_dwa_m150| image:: ./QKan_Bilder/Tool_import_dwa.png
                             :width: 1.25 em
                             

Datenquelle
+++++++++++
In diesem Bereich wird die XML-Datei ausgewählt. Darunter muss das Projektionssystem ausgewählt werden, 
in dem die Daten **in der Datenquelle** gespeichert sind. In dem gleichen Projektionssystem wird das QKan-Projekt aufgebaut, sodass beide 
Projektionssysteme identisch sind.
    
Datenart
++++++++
Mit dem Auswahlfeld kann das Bewertungssystem festgelegt werden, das in der XML-Datei verwendet wurde. 
    
Datenbank-Verbindung
++++++++++++++++++++
Hier wird das Datenziel - die Sqlite-Datenbank - ausgewählt. Ist noch keine Zieldatenbank vorhanden, wird diese neu aus der QKan-Vorlage erzeugt. 
Andernfalls werden die Daten beim Import zu den bestehenden hinzugefügt. 
   
Projektdatei erzeugen
+++++++++++++++++++++
Werden die Daten in ein bereits existierendes Projekt geladen, dann ist hier bereits der Pfad der verwendeten Projektdatei angegeben.
Existiert noch keine Projektdatei, kann diese hier erstellt werden. Dabei ist es empfehlenswert, diese im selben Verzeichnis mit der
QKan-Datenbank zu speichern.

Zu importierende Daten
++++++++++++++++++++++

Mit der Auswahl können die zu importierenden Daten eingegrenzt werden. Wenn alle Haken gesetzt sind, werden alle in der Datei enthaltenen 
Daten importiert. Andernfalls werden sie beim import übergangen. 

Quelle TV-Befahrungen
+++++++++++++++++++++

Die Auswahl der beiden Verzeichnisse für Bilder und Videos dient dazu, deren Speicherort festzulegen. 

Start des Importes
++++++++++++++++++

Wenn in der zu importierenden Datei individuelle Knotentypen abweichend vom M150-Standard (Referenztabelle Nr. 116 "Knotenart" gemäß DWA-M 150) 
enthalten sind, muss wegen der abweichenden Interpretation von Sonderbauwerken in QKan gegenüber der DWA-Richtlinie eine Zuordnung zu 
der Knotenarten zu den Schachttypen in QKan vorgenommen werden. 

.. image:: ./QKan_Bilder/M150_Knotenarten.png

Der Dateiimport zeigt die entsprechende Tabelle an, damit nach Aktivierung des Bearbeitungsmodus der Anwender die Spalte *QKan-Schachttyp* 
entsprechend bearbeitet. Solange diese Zuordnung nicht vollständig ist, wird statt des Datenimportes jedes Mal diese Tabelle angezeigt. 

Ausführliche Erläuterungen zu dieser Funktion finden Sie im Kapitel :ref:`DWA-M 150 <dwa-m-150>`

    
    
Import aus ISYBAU-XML
---------------------




Export nach ISYBAU-XML
----------------------
Mit der Funktion |Tool_export_isybau| :guilabel:`Export nach ISYBAU-XML` kann aus der QKan-Datenbank (\*.sqlite) eine ISYBAU-XML-Datei
erzeugt werden.

.. image:: ./QKan_Bilder/Formulare/export_isybau.png
.. |Tool_export_isybau| image:: ./QKan_Bilder/Tool_export_isybau.png
                             :width: 1.25 em
                             
..
    (?Jörg?): (Bitte Erklärungen ergänzen)
    Datenbank
    +++++++++
    
    Exportdatei
    +++++++++++
    
    Exportieren
    +++++++++++