@echo off
call "C:\Programe\QGIS 3.34.7\bin\o4w_env.bat"
call "C:\Programe\QGIS 3.34.7\bin\qt5_env.bat"
call "C:\Programe\QGIS 3.34.7\bin\py3_env.bat"

@echo on
"C:\Programe\QGIS 3.34.7\apps\Python312\Scripts\pyrcc5.exe" -o resources.py resources.qrc