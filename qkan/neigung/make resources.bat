@echo off
call "C:\Program Files\QGIS 3.34.7\bin\o4w_env.bat"
rem call "C:\Program Files\QGIS 3.28\bin\qt5_env.bat"
rem call "C:\Program Files\QGIS 3.28\bin\py3_env.bat"

@echo on
"C:\Program Files\QGIS 3.34.7\apps\Python312\Scripts\pyrcc5.exe" -o resources.py resources.qrc