@echo off

pushd "%CD%"
CD /D "%~dp0"

REM Diese Parameter sind zu setzen falls es am Downloadlink Änderungen gibt
SET LinkToDownloadServer=https://bits.avcdn.net/productfamily_CCLEANER/insttype_SLIM/platform_WIN_PIR/installertype_ONLINE/build_RELEASE

REM Wichtig für Download über Proxy sind diese Werte die gesetzt werden müssen wenn das der fall ist
SET proxyyesorno=no
SET proxy=http://test:test@192.168.10.1:8888
if not %proxyyesorno%==yes SET proxy=

REM Stellen Sie hier den Benutzeragenten ein, wenn die Internetverbindung das Herunterladen ohne einen Benutzeragenten verweigert
SET ua=Chrome/90.0.4430.85


:download
aria2c.exe --user-agent=%ua% --all-proxy=%proxy% "%LinkToDownloadServer%"
if EXIST "ccsetup*.aria2" goto :download
goto :install


:install
(for %%a IN ("ccsetup*.exe") DO "%%a" /S && del "%%a" )
exit