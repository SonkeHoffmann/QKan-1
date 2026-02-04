Ueberflutung
============

.. index:: Überflutungsanimation 
   
Überflutungsanimation
---------------------
							 
Mit der Funktion |Tool_ueberflutung| :guilabel:`Überflutungsanimation` können die Ergebnisse von Überflutungsberechnungen aus externen Simulationen 
(z. B. mit FOG) direkt in QGIS visualisiert werden.
Das Tool dient dazu, zeitlich ablaufende Überflutungsszenarien anschaulich als Animation darzustellen – etwa zur Beurteilung von Fließwegen und Wassertiefen im Gelände.

.. image:: ./QKan_Bilder/Formulare/ueberflutung.png
.. |Tool_ueberflutung| image:: ./QKan_Bilder/Tool_ueberflutung.png
                             :width: 1.25 em
							 

Vor der Nutzung dieses Tools müssen die hydraulischen Simulationen mit dem Programm FOG durchgeführt werden.
FOG erzeugt dabei eine Ergebnis-Datenbank im Geodatabase-Format (z. B. Result2D.gdb), die die zeitabhängigen Simulationsergebnisse der Überflutung enthält.

Diese Datenbank bildet die Grundlage für die spätere Visualisierung in QGIS und wird im ersten Schritt ausgewählt.
Anschließend muss eine Datenbank angegeben werden, in der die aufbereiteten Daten für die Visualisierung gespeichert werden sollen.
Zusätzlich kann ausgwewählt werden welche Daten dargestellt werden sollen und welche Skalierfaktoren dafür genutzt werden sollen.