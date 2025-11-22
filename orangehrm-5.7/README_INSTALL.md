# 🚀 OrangeHRM 5.7 - XAMPP Installation

Complete setup package for running OrangeHRM on localhost with XAMPP.

## ⚡ Quick Install (Recommended)

**Just run this one script:**

```powershell
.\INSTALL.bat
```

This automated script will:
1. ✅ Check XAMPP installation
2. 🚀 Guide you to start services
3. 🗄️ Create the database
4. 📁 Copy files to htdocs
5. 🌐 Open the web installer

---

## 📋 Manual Installation

If you prefer step-by-step control:

### 1️⃣ Start XAMPP Services

**Option A:** Use XAMPP Control Panel
- Open XAMPP Control Panel
- Click "Start" for Apache
- Click "Start" for MySQL

**Option B:** Run the script
```powershell
.\start-xampp-services.bat
```

### 2️⃣ Create Database

**Option A:** Run the automated script
```powershell
.\setup-database.bat
```

**Option B:** Manual creation
1. Open http://localhost/phpmyadmin
2. Click "New"
3. Database name: `orangehrm`
4. Collation: `utf8mb4_unicode_ci`
5. Click "Create"

### 3️⃣ Copy Files to XAMPP

**Option A:** Run the script
```powershell
.\copy-to-xampp.bat
```

**Option B:** Manual copy
```powershell
xcopy "d:\orangehrm-5.7\orangehrm-5.7" "C:\xampp\htdocs\orangehrm-5.7\" /E /I /H
```

### 4️⃣ Verify Requirements

```powershell
cd C:\xampp\htdocs\orangehrm-5.7
php verify-requirements.php
```

### 5️⃣ Run Web Installer

Open in browser:
```
http://localhost/orangehrm-5.7/
```

**Database Configuration:**
- Host: `localhost`
- Port: `3306`
- Database: `orangehrm`
- Username: `root`
- Password: *(leave empty)*

---

## 📚 Documentation

| File | Description |
|------|-------------|
| [QUICK_START.md](QUICK_START.md) | 5-minute quick start guide |
| [XAMPP_SETUP_GUIDE.md](XAMPP_SETUP_GUIDE.md) | Comprehensive setup guide with troubleshooting |
| [SETUP-README.md](SETUP-README.md) | Original setup reference |

## 🛠️ Utility Scripts

| Script | Purpose |
|--------|---------|
| `INSTALL.bat` | **Master installer** - runs all steps automatically |
| `check-xampp.bat` | Verify XAMPP installation and services |
| `start-xampp-services.bat` | Start Apache and MySQL |
| `setup-database.bat` | Create OrangeHRM database |
| `copy-to-xampp.bat` | Copy files to htdocs |
| `verify-requirements.php` | Check PHP requirements |

## ✅ System Requirements

- **PHP:** 7.4 - 8.2 ✓ (You have 8.0.30)
- **MySQL:** 5.7+ or MariaDB 10.2+
- **Apache:** 2.4+
- **RAM:** 2GB minimum
- **Disk:** 1GB free space

## 🎯 After Installation

Login at:
```
http://localhost/orangehrm-5.7/web/index.php/auth/login
```

Use the admin credentials you created during installation.

## 🆘 Troubleshooting

### Apache won't start
- **Issue:** Port 80 already in use
- **Fix:** Stop IIS or other web servers

### MySQL won't start
- **Issue:** Port 3306 already in use
- **Fix:** Stop other MySQL instances

### Can't access installer
- **Check:** Apache and MySQL are running (green in XAMPP)
- **Check:** Files are in `C:\xampp\htdocs\orangehrm-5.7\`
- **Check:** URL is correct: `http://localhost/orangehrm-5.7/`

### Database connection failed
- **Check:** Database name is exactly `orangehrm`
- **Check:** Username is `root` with empty password
- **Check:** MySQL is running

**For detailed troubleshooting, see [XAMPP_SETUP_GUIDE.md](XAMPP_SETUP_GUIDE.md)**

--
