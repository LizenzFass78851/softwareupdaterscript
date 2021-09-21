@echo off

pushd "%CD%"
CD /D "%~dp0"

REM Setze die Versionsnummer des Updates ohne Punkte und Ausf�hrungszeichen hier ein
SET Version=1900
REM setze hier die Aritektur ein (x86, x64)
SET arch=x64

REM Diese Parameter sind zu setzen falls es am Downloadlink �nderungen gibt
SET LinkToDownloadServer=https://www.7-zip.org/a
SET filename=7z%Version%-%arch%.exe
if %arch%==x86 SET filename=7z%Version%.exe

REM Wichtig f�r Download �ber Proxy sind diese Werte die gesetzt werden m�ssen wenn das der fall ist
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