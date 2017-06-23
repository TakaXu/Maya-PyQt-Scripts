@echo off
rem setlocal enabledelayedexpansion

set MAYAVERSION=2017
set ADSKQTVERSION=5.6.1
set SIPVERSION=4.19.2
set PYQTVERSION=5.8.2
set QSCINTILLAVERSION=2.10
set PYDRIVE=x:
set BUILDDRIVE=v:

if exist %PYDRIVE%\nul subst %PYDRIVE% /d
rem subst %PYDRIVE% "D:\venv\pyqt5"
subst %PYDRIVE% "C:\Python27"
set PY_LOCATION=%PYDRIVE%

set MAYAPYQTBUILD=%~dp0
rem Removing trailing \
set MAYAPYQTBUILD=%MAYAPYQTBUILD:~0,-1%

if exist %BUILDDRIVE%\nul subst %BUILDDRIVE% /d
subst %BUILDDRIVE% "%MAYAPYQTBUILD%"

set SIPDIR=%BUILDDRIVE%\sip-%SIPVERSION%
set PYQTDIR=%BUILDDRIVE%\PyQt5_gpl-%PYQTVERSION%
set ADSKQTDIR=%BUILDDRIVE%\Qt\qt-adsk-%ADSKQTVERSION%
set QSCINTILLADIR=%BUILDDRIVE%\QScintilla_gpl-%QSCINTILLAVERSION%

rem set QTBUILDDIR=%BUILDDRIVE%\qt-build
rem md %QTBUILDDIR%

set QTDIR=%ADSKQTDIR%

SET ICU_SOURCE=%MAYAPYQTBUILD%\icu\source
SET ICU_DIST=%MAYAPYQTBUILD%\icu\dist

set PATH=%BUILDDRIVE%\tools;%QTDIR%\qtbase\bin;%QTDIR%\gnuwin32\bin;%QTDIR%\qtwebengine\src\3rdparty\ninja;%PY_LOCATION%;%PY_LOCATION%\Scripts;%MAYAPYQTBUILD%\jom;%ICU_DIST%\bin;%ICU_DIST%\lib;C:\Program Files\cmake\bin;%PATH%

set MSVC_VERSION=2013
set MSVC_DIR=C:\Program Files (x86)\Microsoft Visual Studio 12.0
set QMAKESPEC=%QTDIR%\qtbase\mkspecs\win32-msvc%MSVC_VERSION%
set _QMAKESPEC_=win32-msvc%MSVC_VERSION%

set SQLITE3SRCDIR=%BUILDDRIVE%\sqlite

rem set _CL_="%_CL_% /utf-8"
rem set _CL_="%_CL_% /source-charset:utf-8 /execution-charset:utf-8"

if ["%LIBPATH%"]==[""] call "%MSVC_DIR%\VC\vcvarsall" amd64


set INCLUDE=%INCLUDE%;%ICU_DIST%\include;C:\Python27\include;c:\Program Files\PostgreSQL\9.5\include;C:\Program Files\MySQL\MySQL Server 5.7\include;C:\OpenSSL-Win64\include
set LIB=%LIB%;%ICU_DIST%\lib;D:\venv\pyqt5\Lib;C:\Python27\libs;c:\Program Files\PostgreSQL\9.5\lib;C:\Program Files\MySQL\MySQL Server 5.7\lib;C:\OpenSSL-Win64\lib

rem set "LIBPATH=%LIBPATH%;C:\Python27\

set DXSDK_DIR_MINE="C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)"
