@ECHO off
@REM build the windows exe

if [%1] == [] GOTO USAGE

set NEWNUM=%1

mkdir output > NUL 2>&1
mkdir tmp > NUL 2>&1

set name=ElectronCapture%NEWNUM%
echo Building instance number %NEWNUM% named "%name%"

cmd.exe /c call Clean.bat

@REM Backup files that will get modified
echo Backing up package.json and main.js
copy /b /y package.json tmp\package.json
copy /b /y main.js tmp\main.js
copy /b /y yarn.lock tmp\yarn.lock

cmd.exe /c call Rename.bat %name%

echo installing local modules
cmd.exe /c npm install

echo Building for win32
cmd.exe /c npm run build:win32

echo Copying artifact to: output\%name%.exe
copy /b /y dist\%name%.exe output\

@REM Restore files we modified
echo Restoring package.json and main.js
copy /b /y tmp\package.json package.json
copy /b /y tmp\main.js main.js
copy /b /y tmp\yarn.lock yarn.lock

GOTO ENDSCRIPT

:USAGE
echo Usage %0 num
echo     Example: %0 1

GOTO ENDFILE

:ENDSCRIPT
echo Done!

:ENDFILE
