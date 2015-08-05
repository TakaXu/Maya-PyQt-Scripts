@echo off
rem setlocal enabledelayedexpansion

set MAYAVERSION=2016
set ADSKQTVERSION=4.8.6
set SIPVERSION=4.16.9
set PYQTVERSION=4.11.4
set QSCINTILLAVERSION=2.9
set PYDRIVE=x:
set BUILDDRIVE=v:

if exist %PYDRIVE%\nul subst %PYDRIVE% /d
subst %PYDRIVE% "C:\Python27"
set PY_LOCATION=%PYDRIVE%

set MAYAPYQTBUILD=%~dp0
rem Removing trailing \
set MAYAPYQTBUILD=%MAYAPYQTBUILD:~0,-1%

if exist %BUILDDRIVE%\nul subst %BUILDDRIVE% /d
subst %BUILDDRIVE% "%MAYAPYQTBUILD%"

set SIPDIR=%BUILDDRIVE%\sip-%SIPVERSION%
set PYQTDIR=%BUILDDRIVE%\PyQt-win-gpl-%PYQTVERSION%
set ADSKQTDIR=%BUILDDRIVE%\Qt\qt-adsk-%ADSKQTVERSION%
set QSCINTILLADIR=%BUILDDRIVE%\QScintilla-gpl-%QSCINTILLAVERSION%

set QTDIR=%ADSKQTDIR%

set "PATH=%QTDIR%\bin;%PATH%"

set MSVC_VERSION=2012
set MSVC_DIR=C:\Program Files (x86)\Microsoft Visual Studio 11.0
set QMAKESPEC=%QTDIR%\mkspecs\win32-msvc%MSVC_VERSION%
set _QMAKESPEC_=win32-msvc%MSVC_VERSION%

if ["%LIBPATH%"]==[""] call "%MSVC_DIR%\VC\vcvarsall" amd64

set "INCLUDE=%INCLUDE%;C:\Python27\include;c:\Program Files\PostgreSQL\9.4\include;C:\Program Files\MySQL\MySQL Server 5.6\include;C:\OpenSSL-Win64\include"
set "LIB=%LIB%;C:\Python27\libs;c:\Program Files\PostgreSQL\9.4\lib;C:\Program Files\MySQL\MySQL Server 5.6\lib;C:\OpenSSL-Win64\lib"

set DXSDK_DIR="C:\Program Files (x86)\Microsoft DirectX SDK (June 2010)"