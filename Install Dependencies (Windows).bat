@echo off

set NODE_VER="5.9.1"
title ----- Install Dependencies -----


Setlocal EnableDelayedExpansion

where node /Q >nul
if %ERRORLEVEL%==1 (
    set SETUP_DIR=%CD%

    echo NodeJs is not installed on this computer...
    echo.
    echo Press any key to download NodeJs...
    pause >nul 2<&1

if not exist "%systemdrive%\Program Files (x86)" (
    start https://nodejs.org/dist/v%NODE_VER%/node-v%NODE_VER%-x86.msi
) else (
    start https://nodejs.org/dist/v%NODE_VER%/node-v%NODE_VER%-x64.msi
)

echo.
echo.
echo Please open the downloaded file and follow the instructions when it's done downloading...
echo Reopen this batch after you have installed NodeJs...
echo.
echo.
echo Press any key to exit...
pause >nul
exit

) else (

if exist "node_modules/." (
echo.
echo Dependencies already installed...
echo.
echo.

set /p update= "Do you want to update? (Y/N)"
cls
if /I "!update!"=="n" (
echo.
echo Press any key to exit...
pause >nul
exit
)
rd /s /q "node_modules/"
)

echo.
echo.
echo Clearing cache... Please wait...
call npm cache clean
cls
echo.
echo.
echo Installing dependencies, please wait...
call npm install
call npm install request
cls
echo.
echo.
echo Installed successfully...

cls
echo.
echo.
echo All dependencies installed successfully...
echo.
echo Press any key to exit...
pause >nul
)
