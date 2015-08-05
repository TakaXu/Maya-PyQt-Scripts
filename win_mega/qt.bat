@echo off
set XXX=%~dp0
if ["%MAYAPYQTBUILD%"]==[""] call "%XXX%setup.bat"

pushd %QTDIR%

call %DXSDK_DIR%\utilities\bin\dx_setenv.cmd

echo y | configure -opensource -platform %_QMAKESPEC_% -release -openssl -qt-zlib -plugin-sql-mysql -plugin-sql-psql -plugin-sql-odbc -mp 
nmake
popd