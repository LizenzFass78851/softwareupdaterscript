@echo off

pushd "%CD%"
CD /D "%~dp0"

(for %%a IN (softwareupdater*.bat) DO echo %%a && start /WAIT %%a )
exit