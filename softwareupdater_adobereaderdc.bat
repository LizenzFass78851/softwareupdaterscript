@echo off

pushd "%CD%"
CD /D "%~dp0"

REM Setze die Versionsnummer des Updates ohne Punkte und Ausf�hrungszeichen hier ein
SET VersionOfReader=2001320074

REM Diese Parameter sind zu setzen falls es am Downloadlink �nderungen gibt
SET LinkToDownloadServer=https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/%VersionOfReader%
SET filename=AcroRdrDCUpd%VersionOfReader%.msp

REM Wichtig f�r Download �ber Proxy sind diese Werte die gesetzt werden m�ssen wenn das der fall ist
SET proxyyesorno=no
SET proxy=http://test:test@192.168.10.1:8888
if not %proxyyesorno%==yes SET proxy=

REM Stellen Sie hier den Benutzeragenten ein, wenn die Internetverbindung das Herunterladen ohne einen Benutzeragenten verweigert
SET ua=Chrome/90.0.4430.85


:download
aria2c.exe --user-agent=%ua% --all-proxy=%proxy% %LinkToDownloadServer%/%filename%
if EXIST %filename%.aria2 goto :download
goto :install


:install
msiexec.exe /p %filename% /q /norestart
del %filename%
exit