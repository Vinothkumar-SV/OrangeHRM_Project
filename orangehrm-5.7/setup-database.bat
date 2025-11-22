@echo off
REM Setup OrangeHRM Database
REM This script creates the database using MySQL command line

echo ========================================
echo OrangeHRM Database Setup
echo ========================================
echo.

REM Check if MySQL is running
tasklist /FI "IMAGENAME eq mysqld.exe" 2>NUL | find /I /N "mysqld.exe">NUL
if %errorlevel% neq 0 (
    echo [ERROR] MySQL is not running!
    echo Please start MySQL from XAMPP Control Panel first.
    echo.
    pause
    exit /b 1
)

echo [OK] MySQL is running
echo.

REM Set MySQL path
set MYSQL_PATH=C:\xampp\mysql\bin\mysql.exe

if not exist "%MYSQL_PATH%" (
    echo [ERROR] MySQL client not found at %MYSQL_PATH%
    pause
    exit /b 1
)

echo Creating database 'orangehrm'...
echo.
echo Please enter MySQL root password (press Enter if no password):

REM Execute SQL script
"%MYSQL_PATH%" -u root -p < "%~dp0setup-database.sql"

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo [SUCCESS] Database created successfully!
    echo ========================================
    echo.
    echo Database name: orangehrm
    echo Character set: utf8mb4
    echo Collation: utf8mb4_unicode_ci
    echo.
    echo You can verify by opening: http://localhost/phpmyadmin
    echo.
) else (
    echo.
    echo [ERROR] Database creation failed!
    echo.
    echo You can create it manually:
    echo 1. Open: http://localhost/phpmyadmin
    echo 2. Click "New" in left sidebar
    echo 3. Database name: orangehrm
    echo 4. Collation: utf8mb4_unicode_ci
    echo 5. Click "Create"
    echo.
)

pause
