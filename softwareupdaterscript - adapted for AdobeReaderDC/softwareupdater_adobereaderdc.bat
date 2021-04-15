@echo off

pushd "%CD%"
CD /D "%~dp0"

REM Enter the version number of the update here, without dots or characters
SET VersionOfReader=2001320074

REM These parameters are to be set if there are changes to the download link
SET LinkToDownloadServer=https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/%VersionOfReader%
SET filename=AcroRdrDCUpd%VersionOfReader%.msp

REM These values are important for download via proxy and must be set if this is the case
SET proxy=http://test:test@192.168.10.1:8888


:download
aria2c.exe --all-proxy=%proxy% %LinkToDownloadServer%/%filename%
if EXIST %filename%.aria2 goto :download
goto :install


:install
msiexec.exe /p %filename% /q /norestart
del %filename%
exit