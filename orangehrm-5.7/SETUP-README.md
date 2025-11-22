# OrangeHRM Local Setup - Quick Reference

## Prerequisites Status
- ✅ PHP Dependencies (vendor folder) - Already installed
- ❌ PHP Runtime - **Need to install**
- ❌ MySQL Database - **Need to install**
- ❌ Web Server - **Need to install**

## Recommended: Install XAMPP

**Download**: https://www.apachefriends.org/download.html

### Quick Setup Steps

1. **Install XAMPP** (PHP 8.0+)
2. **Start Services** in XAMPP Control Panel:
   - Apache ✓
   - MySQL ✓
3. **Create Database**:
   - Open: http://localhost/phpmyadmin
   - Create database: `orangehrm`
4. **Access Installer**:
   - Copy this folder to `C:\xampp\htdocs\` OR
   - Configure virtual host (see detailed guide)
5. **Run Web Installer**:
   - Navigate to: `http://localhost/orangehrm-5.7/orangehrm-5.7/`
   - Follow installation wizard

## Database Credentials for Installer

- **Host**: localhost
- **Port**: 3306
- **Database**: orangehrm
- **Username**: root
- **Password**: (leave empty for default XAMPP)

## Need Help?

See the detailed setup guide in your artifacts folder or contact support.

## System Requirements

- PHP 7.4 or 8.0+
- MySQL 5.7+ or MariaDB 10.2+
- Apache 2.4+ or Nginx
- 2GB RAM minimum
- 1GB disk space

## After Installation

Access your OrangeHRM instance at:
- `http://localhost/orangehrm-5.7/orangehrm-5.7/web/index.php/auth/login`

Or if using virtual host:
- `http://orangehrm.local/web/index.php/auth/login`
