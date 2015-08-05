@echo off
set XXX=%~dp0
if ["%MAYAPYQTBUILD%"]==[""] call "%XXX%setup.bat"

rem set QMAKESPEC=%QTDIR%\mkspecs\%_QMAKESPEC_%

pushd %PYQTDIR%

pushd pylupdate
del moc_translator.cpp 2> nul
del moc_translator.obj 2> nul
%QTDIR%\bin\moc.exe -o moc_translator.cpp translator.h
popd

echo yes | "%PY_LOCATION%\python" configure.py -p %QMAKESPEC% LIBDIR_QT="%QTDIR%\lib" INCDIR_QT="%QTDIR%\include" MOC="%QTDIR%\bin\moc.exe" -w 
nmake
nmake install
popd

