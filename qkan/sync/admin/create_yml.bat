rem Diese Datei muss nur zur Erstellung eines neuen Release ausgeführt werden. 
rem Es wird empfohlen, einen Link zu dieser Batch-Datei in ein Verzeichnis mit einer nicht zu alten QKan-Datenbank
rem zu verschieben (Arbeitsverzeichnis muss das Verzeichnis dieser Batch-Datei sein), und dort einfach 
rem die Datenbank mit der Maus über den Link zu schieben
rem J. Höttges, 08:08 25.03.2026

"C:\Program Files\Python311\pythonw.exe" create_yml.py %1
move sqlite.yml ..
