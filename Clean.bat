
@ECHO off
@REM Clean build files to build from fresh again

echo Cleaning up build files

echo Cleaning folder: dist
rmdir /s /q dist > NUL 2>&1

echo Cleaning folder: node_modules
rmdir /s /q node_modules > NUL 2>&1

echo Cleaning file: package-lock.json
del package-lock.json > NUL 2>&1

echo Done
