@echo off

setlocal

set VS150COMNTOOLS=%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Community\Common7\Tools\

if not exist "%VS150COMNTOOLS%VsDevCmd.bat" goto noVS2017

call "%VS150COMNTOOLS%VsDevCmd.bat"

set SLN_PATH="%~dp0cppunit\src\CppUnit.sln"

devenv %SLN_PATH% /rebuild  "Debug|Win32"
if errorlevel 1 goto error

devenv %SLN_PATH% /rebuild "Release|Win32"
if errorlevel 1 goto error

devenv %SLN_PATH% /rebuild "Debug|x64"
if errorlevel 1 goto error

devenv %SLN_PATH% /rebuild "Release|x64"
if errorlevel 1 goto error

goto exit

:noVS2017
@echo Visual Studio 2017 not installed.
goto exit

:error

goto exit

:exit
endlocal
