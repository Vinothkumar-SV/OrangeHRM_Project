-- OrangeHRM Database Setup Script
-- This script creates the OrangeHRM database with proper character encoding

-- Drop database if it exists (optional - uncomment if you want to reset)
-- DROP DATABASE IF EXISTS orangehrm;

-- Create database with UTF8MB4 encoding for full Unicode support
CREATE DATABASE IF NOT EXISTS orangehrm 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

-- Display success message
SELECT 'Database "orangehrm" created successfully!' AS Status;

-- Show database info
USE orangehrm;
SELECT 
    SCHEMA_NAME as 'Database',
    DEFAULT_CHARACTER_SET_NAME as 'Charset',
    DEFAULT_COLLATION_NAME as 'Collation'
FROM information_schema.SCHEMATA 
WHERE SCHEMA_NAME = 'orangehrm';
