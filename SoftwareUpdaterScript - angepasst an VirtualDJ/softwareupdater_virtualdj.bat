@echo off

pushd "%CD%"
CD /D "%~dp0"

REM Diese Parameter sind zu setzen falls es am Downloadlink �nderungen gibt
SET LinkToDownloadServer=https://www.virtualdj.com/download/pc

REM Wichtig f�r Download �ber Proxy sind diese Werte die gesetzt werden m�ssen wenn das der fall ist
SET proxyyesorno=no
SET proxy=http://test:test@192.168.10.1:8888
if not %proxyyesorno%==yes SET proxy=

REM Stellen Sie hier den Benutzeragenten ein, wenn die Internetverbindung das Herunterladen ohne einen Benutzeragenten verweigert
SET ua=Chrome/90.0.4430.85


:download
aria2c.exe --user-agent=%ua% --all-proxy=%proxy% "%LinkToDownloadServer%"
if EXIST "install_virtualdj*.aria2" goto :download
goto :install


:install
(for %%a IN (install_virtualdj*.msi) DO msiexec.exe /i %%a /q /norestart && del %%a )
exit