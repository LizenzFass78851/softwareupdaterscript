@echo off

pushd "%CD%"
CD /D "%~dp0"

REM Setze die Versionsnummer des Updates ohne Ausführungszeichen hier ein
SET Version=78.9.0esr
REM setze hier die Aritektur ein (win32, win64, win-64-aarch64)
SET arch=win32
REM Setze hier die Sprache ein
SET lang=de

REM Diese Parameter sind zu setzen falls es am Downloadlink Änderungen gibt
SET LinkToDownloadServer=https://archive.mozilla.org/pub/firefox/releases/%Version%/%arch%/%lang%
SET filename=Firefox Setup %Version%.exe

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
"%filename%" /s
del "%filename%"
exit