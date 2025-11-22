@echo off
REM Copy OrangeHRM to XAMPP htdocs
REM This script copies the project files to XAMPP's web directory

echo ========================================
echo Copy OrangeHRM to XAMPP htdocs
echo ========================================
echo.

set SOURCE_DIR=%~dp0
set DEST_DIR=C:\xampp\htdocs\orangehrm-5.7

echo Source: %SOURCE_DIR%
echo Destination: %DEST_DIR%
echo.

REM Check if XAMPP htdocs exists
if not exist "C:\xampp\htdocs\" (
    echo [ERROR] XAMPP htdocs directory not found at C:\xampp\htdocs\
    echo Please ensure XAMPP is installed correctly.
    pause
    exit /b 1
)

REM Check if destination already exists
if exist "%DEST_DIR%" (
    echo [WARNING] Destination folder already exists!
    echo %DEST_DIR%
    echo.
    choice /C YN /M "Do you want to overwrite it"
    if errorlevel 2 (
        echo Copy cancelled.
        pause
        exit /b 0
    )
    echo Removing old files...
    rmdir /S /Q "%DEST_DIR%"
)

echo.
echo Copying files... This may take a minute.
echo.

REM Copy files
xcopy "%SOURCE_DIR%*" "%DEST_DIR%\" /E /I /H /Y

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo [SUCCESS] Files copied successfully!
    echo ========================================
    echo.
    echo Project location: %DEST_DIR%
    echo.
    echo Next steps:
    echo 1. Ensure Apache and MySQL are running
    echo 2. Create database (run: setup-database.bat)
    echo 3. Open browser: http://localhost/orangehrm-5.7/
    echo.
) else (
    echo.
    echo [ERROR] Copy failed!
    echo Please try copying manually:
    echo From: %SOURCE_DIR%
    echo To: %DEST_DIR%
    echo.
)

pause
