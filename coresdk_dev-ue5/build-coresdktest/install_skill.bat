@echo off
setlocal EnableExtensions

set "SRC=%~dp0"
if "%SRC:~-1%"=="\" set "SRC=%SRC:~0,-1%"
set "DEST=%USERPROFILE%\.codex\skills\build-coresdktest"

echo Installing build-coresdktest skill...
echo Source: %SRC%
echo Dest:   %DEST%

if not exist "%SRC%\SKILL.md" goto :missing

if not exist "%DEST%" mkdir "%DEST%" >nul 2>&1

robocopy "%SRC%" "%DEST%" /E /COPY:DAT /DCOPY:DAT /R:2 /W:1
set "RC=%ERRORLEVEL%"
if %RC% GEQ 8 goto :fail

echo Install complete. Restart Codex to pick up new skills.
exit /b 0

:missing
echo ERROR: Source does not look like a skill folder (missing SKILL.md).
exit /b 2

:fail
echo Install failed. robocopy exit code %RC%.
exit /b %RC%
