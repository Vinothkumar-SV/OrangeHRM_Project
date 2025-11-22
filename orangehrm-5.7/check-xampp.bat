@echo off
REM OrangeHRM - XAMPP Installation Checker
REM This script verifies XAMPP installation and services

echo ========================================
echo OrangeHRM - XAMPP Installation Checker
echo ========================================
echo.

REM Check if XAMPP is installed
echo [1/5] Checking XAMPP installation...
if exist "C:\xampp\xampp_start.exe" (
    echo [OK] XAMPP found at C:\xampp\
) else (
    echo [ERROR] XAMPP not found at C:\xampp\
    echo Please install XAMPP from: https://www.apachefriends.org/download.html
    pause
    exit /b 1
)
echo.

REM Check if PHP is available
echo [2/5] Checking PHP installation...
where php >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] PHP is available in PATH
    php -v | findstr /C:"PHP"
) else (
    echo [WARNING] PHP not in PATH, checking XAMPP directory...
    if exist "C:\xampp\php\php.exe" (
        echo [OK] PHP found at C:\xampp\php\php.exe
        C:\xampp\php\php.exe -v | findstr /C:"PHP"
    ) else (
        echo [ERROR] PHP not found
        pause
        exit /b 1
    )
)
echo.

REM Check Apache service
echo [3/5] Checking Apache service...
tasklist /FI "IMAGENAME eq httpd.exe" 2>NUL | find /I /N "httpd.exe">NUL
if %errorlevel% equ 0 (
    echo [OK] Apache is running
) else (
    echo [WARNING] Apache is not running
    echo Please start Apache from XAMPP Control Panel
)
echo.

REM Check MySQL service
echo [4/5] Checking MySQL service...
tasklist /FI "IMAGENAME eq mysqld.exe" 2>NUL | find /I /N "mysqld.exe">NUL
if %errorlevel% equ 0 (
    echo [OK] MySQL is running
) else (
    echo [WARNING] MySQL is not running
    echo Please start MySQL from XAMPP Control Panel
)
echo.

REM Test localhost access
echo [5/5] Testing localhost access...
ping -n 1 localhost >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Localhost is accessible
) else (
    echo [ERROR] Cannot reach localhost
)
echo.

echo ========================================
echo Summary
echo ========================================
echo.
echo Next steps:
echo 1. If Apache/MySQL are not running, start them in XAMPP Control Panel
echo 2. Open phpMyAdmin: http://localhost/phpmyadmin
echo 3. Create database named 'orangehrm'
echo 4. Copy this project to C:\xampp\htdocs\
echo 5. Access installer at: http://localhost/orangehrm-5.7/
echo.
echo Opening phpMyAdmin in your browser...
timeout /t 3 >nul
start http://localhost/phpmyadmin
echo.
pause
