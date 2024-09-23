@ECHO off
@REM Replace any instances of "ElectronCaptureOne" with given string


if [%1] == [] GOTO USAGE

set NEWNAME=%1


echo Renaming "ElectronCaptureOne" instances in package.json to "%NEWNAME%"
@REM NOTE: package.json is ascii encoded
powershell -Command "(Get-Content -encoding ascii package.json) -replace 'ElectronCaptureOne', '"%NEWNAME%"' | Out-File -encoding ascii package.json"


echo Renaming "ElectronCaptureOne" instances in main.js to "%NEWNAME%"
@REM NOTE: main.js uses emoji, utf8
powershell -Command "(Get-Content -encoding utf8 main.js) -replace 'ElectronCaptureOne', '"%NEWNAME%"' | Out-File -encoding utf8 main.js"

GOTO ENDSCRIPT

:USAGE
echo Usage %0 new_name
echo     Example: %0 ElectronCapture2
GOTO ENDFILE

:ENDSCRIPT
echo Done!

:ENDFILE
