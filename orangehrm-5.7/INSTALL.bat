@echo off
REM OrangeHRM - Complete Setup Automation
REM This script runs all setup steps in sequence

echo ========================================
echo OrangeHRM - Complete Setup Automation
echo ========================================
echo.

echo This script will:
echo 1. Check XAMPP installation
echo 2. Start Apache and MySQL services
echo 3. Create the database
echo 4. Copy files to htdocs
echo 5. Open the installer in your browser
echo.
pause

REM Step 1: Check XAMPP
echo.
echo ========================================
echo Step 1: Checking XAMPP Installation
echo ========================================
call "%~dp0check-xampp.bat"

REM Step 2: Start Services
echo.
echo ========================================
echo Step 2: Starting XAMPP Services
echo ========================================
echo.
echo Please start Apache and MySQL from XAMPP Control Panel
echo Press any key after services are started...
pause

REM Step 3: Create Database
echo.
echo ========================================
echo Step 3: Creating Database
echo ========================================
call "%~dp0setup-database.bat"

REM Step 4: Copy Files
echo.
echo ========================================
echo Step 4: Copying Files to XAMPP
echo ========================================
call "%~dp0copy-to-xampp.bat"

REM Step 5: Open Installer
echo.
echo ========================================
echo Step 5: Opening Web Installer
echo ========================================
echo.
echo Opening OrangeHRM installer in your browser...
timeout /t 3 >nul
start http://localhost/orangehrm-5.7/

echo.
echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo Follow the web installer to complete installation:
echo 1. Accept license agreement
echo 2. Enter database details:
echo    - Host: localhost
echo    - Database: orangehrm
echo    - Username: root
echo    - Password: (leave empty)
echo 3. Create your admin account
echo 4. Complete installation
echo.
echo After installation, login at:
echo http://localhost/orangehrm-5.7/web/index.php/auth/login
echo.
pause
