@echo off

set "THIS_DIR=%~dp0"
AutoHotkey.exe "%THIS_DIR%hotkeys.ahk" || pause
exit /b %ERRORLEVEL%
