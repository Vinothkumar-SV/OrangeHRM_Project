<?php
/**
 * OrangeHRM Requirements Verification Script
 * Run this script after installing XAMPP to verify all requirements are met
 * 
 * Usage: php verify-requirements.php
 * Or access via browser: http://localhost/orangehrm-5.7/orangehrm-5.7/verify-requirements.php
 */

echo "=== OrangeHRM Requirements Verification ===\n\n";

// Check PHP Version
echo "1. PHP Version Check:\n";
$phpVersion = phpversion();
$requiredVersion = '7.4.0';
$maxVersion = '8.3.0';
echo "   Current: PHP $phpVersion\n";
if (version_compare($phpVersion, $requiredVersion, '>=') && version_compare($phpVersion, $maxVersion, '<')) {
    echo "   ✓ PHP version is compatible\n\n";
} else {
    echo "   ✗ PHP version should be between 7.4 and 8.2\n\n";
}

// Check Required Extensions
echo "2. Required PHP Extensions:\n";
$requiredExtensions = [
    'pdo',
    'pdo_mysql',
    'curl',
    'json',
    'mbstring',
    'zip',
    'dom',
    'xml',
    'simplexml',
    'gd',
    'ldap',
    'openssl'
];

$missingExtensions = [];
foreach ($requiredExtensions as $ext) {
    $loaded = extension_loaded($ext);
    $status = $loaded ? '✓' : '✗';
    echo "   $status $ext\n";
    if (!$loaded) {
        $missingExtensions[] = $ext;
    }
}
echo "\n";

// Check Memory Limit
echo "3. Memory Limit:\n";
$memoryLimit = ini_get('memory_limit');
echo "   Current: $memoryLimit\n";
$memoryBytes = return_bytes($memoryLimit);
if ($memoryBytes >= 256 * 1024 * 1024) {
    echo "   ✓ Memory limit is sufficient\n\n";
} else {
    echo "   ⚠ Recommended: 256M or higher\n\n";
}

// Check File Upload Size
echo "4. Upload Settings:\n";
echo "   Max Upload Size: " . ini_get('upload_max_filesize') . "\n";
echo "   Max Post Size: " . ini_get('post_max_size') . "\n\n";

// Check Directory Permissions
echo "5. Directory Permissions:\n";
$dirsToCheck = [
    __DIR__ . '/src/cache',
    __DIR__ . '/src/log',
    __DIR__ . '/src/plugins',
    __DIR__ . '/lib/confs',
];

foreach ($dirsToCheck as $dir) {
    if (file_exists($dir)) {
        $writable = is_writable($dir);
        $status = $writable ? '✓' : '✗';
        echo "   $status " . basename($dir) . " - " . ($writable ? 'Writable' : 'Not writable') . "\n";
    } else {
        echo "   ⚠ " . basename($dir) . " - Directory not found\n";
    }
}
echo "\n";

// Check Database Connection (if credentials provided)
echo "6. Database Connection:\n";
if (extension_loaded('pdo_mysql')) {
    echo "   ✓ PDO MySQL extension loaded\n";
    echo "   ℹ Database connection will be tested during installation\n\n";
} else {
    echo "   ✗ PDO MySQL extension not loaded\n\n";
}

// Summary
echo "=== Summary ===\n";
if (empty($missingExtensions)) {
    echo "✓ All required PHP extensions are loaded!\n";
} else {
    echo "✗ Missing extensions: " . implode(', ', $missingExtensions) . "\n";
    echo "  Please enable these in php.ini and restart Apache\n";
}

echo "\nNext Steps:\n";
echo "1. If all checks pass, create a database named 'orangehrm'\n";
echo "2. Access the web installer at: http://localhost/orangehrm-5.7/orangehrm-5.7/\n";
echo "3. Follow the installation wizard\n";

// Helper function
function return_bytes($val) {
    $val = trim($val);
    $last = strtolower($val[strlen($val)-1]);
    $val = (int)$val;
    switch($last) {
        case 'g':
            $val *= 1024;
        case 'm':
            $val *= 1024;
        case 'k':
            $val *= 1024;
    }
    return $val;
}
