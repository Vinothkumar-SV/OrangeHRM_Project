# OrangeHRM - Quick Start Guide

Get OrangeHRM running in 5 minutes! ⚡

## Step 1: Check XAMPP ✓

Run the checker script:
```powershell
.\check-xampp.bat
```

Make sure Apache and MySQL are **running** (green in XAMPP Control Panel).

## Step 2: Create Database 🗄️

The checker script opens phpMyAdmin automatically, or go to:
```
http://localhost/phpmyadmin
```

1. Click **"New"** (left sidebar)
2. Database name: `orangehrm`
3. Collation: `utf8mb4_unicode_ci`
4. Click **"Create"**

## Step 3: Copy to XAMPP 📁

Copy this entire folder to XAMPP:

```powershell
xcopy "d:\orangehrm-5.7\orangehrm-5.7" "C:\xampp\htdocs\orangehrm-5.7\" /E /I /H
```

Or manually copy `d:\orangehrm-5.7\orangehrm-5.7\` to `C:\xampp\htdocs\`

## Step 4: Verify Requirements ✅

```powershell
cd C:\xampp\htdocs\orangehrm-5.7
php verify-requirements.php
```

All checks should pass ✓

## Step 5: Install 🚀

Open browser:
```
http://localhost/orangehrm-5.7/
```

Follow the installer wizard:
- Database: `orangehrm`
- Username: `root`
- Password: *(empty)*
- Create your admin account

## Done! 🎉

Login at:
```
http://localhost/orangehrm-5.7/web/index.php/auth/login
```

---

**Need help?** See [XAMPP_SETUP_GUIDE.md](XAMPP_SETUP_GUIDE.md) for detailed instructions and troubleshooting.
