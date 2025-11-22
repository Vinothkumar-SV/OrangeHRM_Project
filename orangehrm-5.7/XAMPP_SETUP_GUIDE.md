# OrangeHRM 5.7 - XAMPP Setup Guide

Complete step-by-step guide to run OrangeHRM on your localhost using XAMPP.

## Prerequisites

- ✅ XAMPP installed with PHP 7.4+ or 8.0+
- ✅ OrangeHRM 5.7 files (already downloaded)

## Quick Start (5 Steps)

### Step 1: Verify XAMPP Services

1. Open **XAMPP Control Panel**
2. Start these services:
   - **Apache** - Click "Start"
   - **MySQL** - Click "Start"
3. Both should show green "Running" status

> [!TIP]
> Run the included `check-xampp.bat` script to automatically verify your XAMPP installation.

### Step 2: Create Database

1. Open browser and go to: `http://localhost/phpmyadmin`
2. Click **"New"** in the left sidebar
3. Enter database name: `orangehrm`
4. Select collation: `utf8mb4_unicode_ci`
5. Click **"Create"**

**Alternative:** Run the included `setup-database.sql` script:
```powershell
# From the project directory
mysql -u root -p < setup-database.sql
```

### Step 3: Copy Project to XAMPP

Copy the entire `orangehrm-5.7` folder to XAMPP's htdocs directory:

**Option A - Using File Explorer:**
1. Navigate to: `d:\orangehrm-5.7\orangehrm-5.7\`
2. Copy the entire folder
3. Paste into: `C:\xampp\htdocs\`
4. Result: `C:\xampp\htdocs\orangehrm-5.7\`

**Option B - Using Command Line:**
```powershell
xcopy "d:\orangehrm-5.7\orangehrm-5.7" "C:\xampp\htdocs\orangehrm-5.7\" /E /I /H
```

> [!IMPORTANT]
> Make sure you copy the folder that contains `index.php`, `installer/`, `web/`, etc.

### Step 4: Verify Requirements

Run the requirements verification script:

```powershell
cd C:\xampp\htdocs\orangehrm-5.7
php verify-requirements.php
```

This checks:
- ✅ PHP version (7.4-8.2)
- ✅ Required PHP extensions
- ✅ Memory limits
- ✅ Directory permissions

**Fix common issues:**
- Missing extensions: Edit `C:\xampp\php\php.ini` and uncomment required extensions
- Restart Apache after any php.ini changes

### Step 5: Run Web Installer

1. Open browser and navigate to:
   ```
   http://localhost/orangehrm-5.7/
   ```

2. You'll be redirected to the installer. Follow the wizard:

   **Welcome Screen**
   - Click "Next"

   **License Agreement**
   - Accept the license
   - Click "Next"

   **Database Configuration**
   - Database Host: `localhost`
   - Database Port: `3306`
   - Database Name: `orangehrm`
   - Database Username: `root`
   - Database Password: *(leave empty for default XAMPP)*
   - Click "Next"

   **System Check**
   - Verify all checks pass
   - Click "Next"

   **Admin User Creation**
   - Enter your admin details:
     - First Name
     - Last Name
     - Email
     - Username
     - Password
   - Click "Next"

   **Confirmation**
   - Review settings
   - Click "Install"

3. Wait for installation to complete (may take 1-2 minutes)

## Access Your OrangeHRM

After successful installation:

**Login Page:**
```
http://localhost/orangehrm-5.7/web/index.php/auth/login
```

**Credentials:**
- Username: *(the admin username you created)*
- Password: *(the password you set)*

## Troubleshooting

### Apache won't start
- **Port conflict**: Another service using port 80
- **Solution**: Stop IIS or change Apache port in `httpd.conf`

### MySQL won't start
- **Port conflict**: Another MySQL instance running
- **Solution**: Stop other MySQL services or change port

### "Class not found" errors
- **Issue**: Missing PHP dependencies
- **Solution**: Ensure `vendor/` folder exists in `src/` directory

### Database connection failed
- **Check**: MySQL is running in XAMPP
- **Check**: Database name is exactly `orangehrm`
- **Check**: Username is `root` with empty password

### Blank page after installation
- **Check**: PHP error logs at `C:\xampp\php\logs\php_error_log`
- **Check**: Apache error logs at `C:\xampp\apache\logs\error.log`
- **Solution**: Enable error display in `php.ini`:
  ```ini
  display_errors = On
  error_reporting = E_ALL
  ```

### Permission errors
- **Issue**: Windows file permissions
- **Solution**: Run XAMPP Control Panel as Administrator

## System Requirements

| Component | Requirement |
|-----------|-------------|
| PHP | 7.4 - 8.2 |
| MySQL | 5.7+ or MariaDB 10.2+ |
| Apache | 2.4+ |
| RAM | 2GB minimum |
| Disk Space | 1GB |

### Required PHP Extensions

- pdo
- pdo_mysql
- curl
- json
- mbstring
- zip
- dom
- xml
- simplexml
- gd
- ldap
- openssl

## Next Steps

After successful installation:

1. **Explore the Dashboard**
   - Navigate through different modules
   - Set up your organization details

2. **Configure Email** (Optional)
   - Go to Admin → Email Configuration
   - Set up SMTP for email notifications

3. **Add Employees**
   - Go to PIM → Add Employee
   - Start building your employee database

4. **Customize Settings**
   - Admin → Configuration
   - Set up leave types, work shifts, etc.

## Backup Recommendations

**Database Backup:**
```powershell
# Export database
mysqldump -u root orangehrm > orangehrm_backup.sql

# Import database
mysql -u root orangehrm < orangehrm_backup.sql
```

**File Backup:**
- Copy entire `C:\xampp\htdocs\orangehrm-5.7\` folder
- Important directories:
  - `src/cache/`
  - `src/log/`
  - `src/plugins/`
  - `lib/confs/`

## Support

- **Official Documentation**: https://starterhelp.orangehrm.com
- **Demo Site**: https://opensource-demo.orangehrmlive.com
- **Support Email**: ossupport@orangehrm.com

---

**Setup completed successfully?** You should now be able to access OrangeHRM at `http://localhost/orangehrm-5.7/web/index.php/auth/login`
