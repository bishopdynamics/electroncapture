# Notes by BishopDynamics

Changes made were in service of building 10 uniquely-named instances of the Windows standalone executable.
This has not been attempted/tested with other platforms.

App has main thread and three sub-threads

* `ElectronCapture`
  * `Electron 1`
  * `ElectronCapture`
  * `ElectronCapture`

as well as a background thread named `A simple tool to aid with frameless window video capture and VDON publishing`, which is the `description` key from `package.json`

The goal of the changes made here is to tweak the above thread/process names to build several portable binaries that can easily be identified uniquely from eachother.

## Changes Made

In several places, process and file names were adjusted to include `ElectronCaptureOne`.
This was done to provide an easy target for search-and-replace

* `main.js:327` - does not seem to have any affect
* `package.json:23` - affects process name
* `package.json:94` - name for portable exe
* `package.json:4` - change background service description to be unique
* `main.js:333` - window named "Electron 1" gets named here, adjust to use unique name

## Scripts

The main build script:
* `Build_All.bat` - build 10 uniquely named windows artifacts
  * this calls `Build.bat` in a loop 10 times to create `ElectronCapture1.exe`, `ElectronCapture2.exe`, etc

Supporting scripts
* `Build.bat` - build a Windows artifact instance, given a number
  * you can run: `Build.bat 1` to create `output\ElectronCapture1.exe`
* `Clean.bat` - cleans any build related files, and reverts the three files changed by `Rename.bat`, in prep for a fresh build
* `Rename.bat` - search and replace instances of `ElectronCaptureOne` in main.js and package.json with the given string

