-- Create roles and assign privileges
CREATE ROLE db_manager;
CREATE ROLE table_viewer;
CREATE ROLE column_modifier;

-- Database level privilege
GRANT CONTROL ON DATABASE::JewelryShop TO db_manager;

-- Table level privilege
GRANT SELECT ON OBJECT::Products TO table_viewer;

-- Column level privilege
GRANT UPDATE (Price) ON OBJECT::Products TO column_modifier;

-- Create users and assign roles
CREATE USER db_manager_user FOR LOGIN db_manager_user;
CREATE USER table_viewer_user FOR LOGIN table_viewer_user;
CREATE USER column_modifier_user FOR LOGIN column_modifier_user;

EXEC sp_addrolemember 'db_manager', 'db_manager_user';
EXEC sp_addrolemember 'table_viewer', 'table_viewer_user';
EXEC sp_addrolemember 'column_modifier', 'column_modifier_user';
