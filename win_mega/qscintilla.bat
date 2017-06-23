@echo off
set XXX=%~dp0
if ["%MAYAPYQTBUILD%"]==[""] call "%XXX%setup.bat"

pushd %QSCINTILLADIR%
pushd Qt4Qt5
qmake qscintilla.pro
jom
jom install
popd
 
rem python binding
pushd Python
rem "%PY_LOCATION%\Scripts\python" configure.py –pyqt=PyQt5
"%PY_LOCATION%\python" configure.py --pyqt=PyQt5 -w
jom
jom install
popd

rem designer plugin
pushd designer-Qt4Qt5
qmake CONFIG-=debug designer.pro
jom
jom install
popd

popd

