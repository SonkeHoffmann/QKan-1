Erstellung von QKan-Plugins
===========================

Grundsätzlich entspricht die Erstellung von QKan-Plugins in weiten Teilen der für QGIS empfohlenen Vorgehensweise. 
Wenn das Plugin als Bestandteil von QKan fungieren soll, sind lediglich einige kleinere Anpassungen und Ergänzungen notwendig. 
An dieser Stelle wird der Einfachheit halber der gesamte Workflow erläutert. 


Vorbereitung des Moduls
-----------------------


Am einfachsten ist es, den Vorlage-Ordner "template" in das QKan-Module-Verzeichnis .plugins/qkan zu kopieren und diesen dann entsprechend dem 
gewünschten Modulnamen umzubenennen, wie z. B. das bereits existierende Modul "he8porter". 


Erzeugen von Modul-Icons
------------------------

Ein Modul benötigt mindestens ein Icon, kann aber auch mehrere verwenden. Diese sollten im Dateityp `*`.png in der Größe von 32 x 32 oder 
64 x 64 Pixeln vorliegen, wobei beinahe beliebige Pixelgrößen verarbeitet werden. 
Alle Icons eines Moduls müssen mit dem Programm "pyrcc5.exe" in die Python-Datei resources.py umgewandelt werden. Dazu muss der Pfad zu 
den Icons in der Datei resource.qrc als relatvier Pfad bezogen auf das Modulverzeichnis eingetragen sein. Da für die Umwandlung 
einige Voreinstellungen (hierfür ist das Ausführen der Datei "o4w_env.bat" empfehlenswert) notwendig sind, empfiehlt sich die 
Verwendung der durch das ISCE erstellten Batch-Datei "make resource.bat".


Anpassungen in den Moduldateien (`*`.py)
----------------------------------------

Folgende Bezeichnungen müssen angepasst werden: 
    - "template" durch den gewählten Modulnamen
    - Icon-Bezeichnungen. Bei mehreren Icons müssen auch mehrere Aufrufe von QKan.instance.add_action() erfolgen
    - In der Methode unload(self) müssen alle Dialoge wieder geschlossen werden

Help-Schaltfläche anbinden
++++++++++++++++++++++++++

Die Schaltfläche im Formular ruft die Methode application_dialog.click_help() auf. Hier muss der Link auf die Dokumentation 
angepasst werden. Natürlich muss auch in der Dokumentation der Link, der hinter dem #-Zeichen steht (z. B. **name_des_links**), 
vorhanden sein. Meistens steht in der entsprechenden `*`.rst-Datei über der entsprechenden Überschrift ein 
Eintrag ".. _name_des_links:", wobei das führende Unterstrichzeichen nicht zum Namen des Links gehört.

Allgemein verfügbare Funktionen
+++++++++++++++++++++++++++++++

Im Modul *application* wird eine Klasse mit einem Namen ähnlich dem Modulnamen definiert, die folgende Aufgaben erfüllt: 

- Einbindung des Moduls in die Menüleiste von QKan

- Öffnen des Formulars

- Speichern der im Formular vorgenommenen Einträge

- Aufruf des Modulcodes


Dabei stehen über die geerbte Klasse "QKanPlugin" folgende Funktionen zur Verfügung: 

- self.default_dir: Standardverzeichnis des QKan-Projektes

- self.iface: iface-Modul von QGIS. Beim Debuggen wird es durch ein internes Modul ersetzt, damit die 
  iface-Methodenaufrufe nicht ins Leere laufen

- self.log: Mit diesem Modul können Fehlermeldungen erzeugt werden, die je nach Aufruf in der internen
  Protokolldatei, im Meldungsfenster und/oder in der QGIS-Meldungsleiste erscheinen. Aktuell stehen zur Verfügung:
  - self.log.error_user('Anwenderfehler...')
  - self.log.error_code('Interner Programmierfehler')
  - self.log.error_data('Datenfehler')
  - self.log.notice('Information für den Anwender...')

