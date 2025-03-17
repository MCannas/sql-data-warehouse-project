/*
===========================================================================
Create Database and Schemas
===========================================================================

Script Purpose:
	This cript creates a new database named 'DataWarehouse' after checking if it already exists.
	If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
	within the database: 'bronze', 'silver', and 'gold'.

Warning:
	Running this script will drop the entire 'DataWarehouse' database if it exists.
	All data in the database will be permanently deleted. Proceed with caution
	and ensure you have proper backups before running this script.
*/

USE master;
GO

--Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

CREATE TABLE bronze.crm_prd_info (
	prd_id		INT,
	prd_key		NVARCHAR(50),
	prd_nm		NVARCHAR(50)	,
	prd_cost	INT,
	prd_line 	NVARCHAR(50),
	prd_start_dt	DATETIME,
	prd_end_dt	DATETIME
);

CREATE TABLE bronze.crm_sales_details (
	sls_ord_num	NVARCHAR(50),
	sls_prd_key	NVARCHAR(50),
	sls_cust_id	INT,
	sls_order_id	INT,
	sls_ship_dt 	INT,
	sls_due_dt	INT,
	sls_sales	INT,
	sls_quantity	INT,
	sls_price	INT
);
