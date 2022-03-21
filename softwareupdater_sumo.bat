@echo off

pushd "%CD%"
CD /D "%~dp0"

REM Diese Parameter sind zu setzen falls es am Downloadlink Änderungen gibt
SET LinkToDownloadServer=https://kcsoftwares.com/files
SET filename=sumo_lite.exe

REM Wichtig für Download über Proxy sind diese Werte die gesetzt werden müssen wenn das der fall ist
SET proxyyesorno=no
SET proxy=http://test:test@192.168.10.1:8888
if not %proxyyesorno%==yes SET proxy=

REM Stellen Sie hier den Benutzeragenten ein, wenn die Internetverbindung das Herunterladen ohne einen Benutzeragenten verweigert
SET ua=Chrome/90.0.4430.85


:download
aria2c.exe --user-agent=%ua% --all-proxy=%proxy% "%LinkToDownloadServer%/%filename%"
if EXIST "%filename%.aria2" goto :download
goto :install


:install
%filename% /VERYSILENT /NORESTART
del %filename%
exit