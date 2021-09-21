@echo off

pushd "%CD%"
CD /D "%~dp0"

REM Setze die Versionsnummer des Updates ohne Punkte und Ausführungszeichen hier ein
SET Version=3545
REM setze hier die Aritektur ein (x86, x64)
SET arch=x64

REM Diese Parameter sind zu setzen falls es am Downloadlink Änderungen gibt
SET LinkToDownloadServer=https://www.xmedia-recode.de/download/
SET filename=XMediaRecode%Version%_%arch%_setup.exe
if %arch%==x86 SET filename=XMediaRecode%Version%_setup.exe

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
%filename% /s
del %filename%
exit