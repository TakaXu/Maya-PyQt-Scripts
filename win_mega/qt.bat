@echo off
set XXX=%~dp0
if ["%MAYAPYQTBUILD%"]==[""] call "%XXX%setup.bat"

pushd %QTDIR%

call "%DXSDK_DIR%\utilities\bin\dx_setenv.cmd"

rem echo y | configure -opensource -platform %_QMAKESPEC_% -release -openssl -qt-zlib -plugin-sql-mysql -plugin-sql-psql -plugin-sql-odbc -mp 

set startTime=%time%
rem jom clean -j4
rem echo y | configure -prefix %BUILDDRIVE%\qt-install -opensource -platform %_QMAKESPEC_% -release -icu -opengl dynamic -openssl -qt-zlib -plugin-sql-mysql -plugin-sql-psql -plugin-sql-odbc -nomake examples -nomake tests

rem pushd %QTBUILDDIR%

echo y | %QTDIR%\configure -v -opensource -platform %_QMAKESPEC_% -opengl desktop -directwrite -openssl -qt-zlib -plugin-sql-mysql -plugin-sql-psql -plugin-sql-odbc -nomake examples -nomake tests  -no-warnings-are-errors -mp -release

rem echo y | %QTDIR%\configure -v -opensource -platform %_QMAKESPEC_% -debug-and-release -force-debug-info -opengl desktop -directwrite -openssl -qt-zlib -plugin-sql-mysql -plugin-sql-psql -plugin-sql-odbc -nomake examples -nomake tests  -no-warnings-are-errors -mp -prefix %BUILDDRIVE%\Qt\qt-install

jom -j4
popd

echo yeah
echo Start Time: %startTime%
echo Finish Time: %time%