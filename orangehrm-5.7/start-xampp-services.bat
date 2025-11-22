@echo off
REM Start XAMPP Services for OrangeHRM
REM This script starts Apache and MySQL services

echo ========================================
echo Starting XAMPP Services for OrangeHRM
echo ========================================
echo.

REM Check if running as administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [WARNING] Not running as Administrator
    echo Some operations may fail. Right-click and "Run as Administrator" if needed.
    echo.
)

REM Start Apache
echo [1/2] Starting Apache...
if exist "C:\xampp\apache_start.bat" (
    call "C:\xampp\apache_start.bat"
    timeout /t 2 >nul
) else (
    echo Starting Apache via xampp_start...
    start "" "C:\xampp\xampp_start.exe"
)

REM Wait a moment
timeout /t 3 >nul

REM Start MySQL
echo [2/2] Starting MySQL...
if exist "C:\xampp\mysql_start.bat" (
    call "C:\xampp\mysql_start.bat"
    timeout /t 2 >nul
)

echo.
echo ========================================
echo Checking Service Status
echo ========================================
echo.

REM Check Apache
tasklist /FI "IMAGENAME eq httpd.exe" 2>NUL | find /I /N "httpd.exe">NUL
if %errorlevel% equ 0 (
    echo [OK] Apache is running
) else (
    echo [FAILED] Apache is not running
    echo Please start it manually from XAMPP Control Panel
)

REM Check MySQL
tasklist /FI "IMAGENAME eq mysqld.exe" 2>NUL | find /I /N "mysqld.exe">NUL
if %errorlevel% equ 0 (
    echo [OK] MySQL is running
) else (
    echo [FAILED] MySQL is not running
    echo Please start it manually from XAMPP Control Panel
)

echo.
echo ========================================
echo Next Steps
echo ========================================
echo.
echo 1. If services didn't start, open XAMPP Control Panel manually
echo 2. Click "Start" for Apache and MySQL
echo 3. Run: setup-database.bat (to create database)
echo 4. Run: copy-to-xampp.bat (to copy files)
echo 5. Open: http://localhost/orangehrm-5.7/
echo.
pause
