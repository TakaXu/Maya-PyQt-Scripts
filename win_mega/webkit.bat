@echo off
set XXX=%~dp0
if ["%MAYAPYQTBUILD%"]==[""] call "%XXX%setup.bat"

pushd %BUILDDRIVE%\qt\qtwebkit

call "%DXSDK_DIR%\utilities\bin\dx_setenv.cmd"

set startTime=%time%

perl Tools\Scripts\build-webkit --qt --release

pushd %BUILDDRIVE%\qt\qtwebkit\WebKitBuild\Release

jom install -j4

popd

echo yeah
echo Start Time: %startTime%
echo Finish Time: %time%