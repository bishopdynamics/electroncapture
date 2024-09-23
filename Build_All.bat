@ECHO off
@REM Build 10 unique instances

set NUM=10

echo Building %NUM% instances

set loopcount=1

:loop

cmd.exe /c call Build.bat %loopcount%

if %loopcount%==%NUM% goto exitloop

set /a loopcount=loopcount+1
goto loop

:exitloop

echo Build complete, check output\

