@echo off
rem Easy OpenConnectSg installer: double-click to install (asks for administrator rights once).
net session >nul 2>&1
if errorlevel 1 (
  powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
  exit /b
)
echo Installing Easy OpenConnectSg ...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0install-openconnectsg.ps1"
if errorlevel 1 (
  echo.
  echo Installation failed. See the messages above.
  pause
  exit /b 1
)
echo.
echo Done. Starting the OpenConnectSg tray app ...
echo Next time, open it from the Start menu: OpenConnectSg
start "" powershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "%ProgramFiles%\OpenConnect\bin\openconnectsg-tray.ps1"
timeout /t 5 >nul
