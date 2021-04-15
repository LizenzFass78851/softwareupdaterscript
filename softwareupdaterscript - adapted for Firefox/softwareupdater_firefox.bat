@echo off

pushd "%CD%"
CD /D "%~dp0"

REM Enter the version number of the update without the execution characters here
SET Version=78.9.0esr
REM insert the architecture here (win32, win64, win-64-aarch64)
SET arch=win32
REM Put in the language here
SET lang=de

REM These parameters are to be set if there are changes to the download link
SET LinkToDownloadServer=https://archive.mozilla.org/pub/firefox/releases/%Version%/%arch%/%lang%
SET filename=Firefox Setup %Version%.exe

REM These values are important for download via proxy and must be set if this is the case
SET proxy=http://test:test@192.168.10.1:8888


:download
aria2c.exe --all-proxy=%proxy% "%LinkToDownloadServer%/%filename%"
if EXIST "%filename%.aria2" goto :download
goto :install


:install
"%filename%" /s
del "%filename%"
exit