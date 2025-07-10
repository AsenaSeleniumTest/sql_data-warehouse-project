/* Create Database and Schemas for the DataWareHouse

Script Purpose:
	This script creates the new database for the datawarehouse and the required schemas, 
	it checks if already exists and delete the database in case, then create a new empty database
	the schemas created are: 'bronze','silver' and  'gold'

	Warning: 
	Do backupt if needed
	This script deletes any existing database with the same name, please make sure if that is intended
	in order to proceed to execute this script. 

*/

USE master;
GO

--Drop and recreate the datawarehouse database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DWHLordUSBQ')
BEGIN
	ALTER DATABASE DWHLordUSBQ SET SIBLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DWHLordUSBQ;
END;
GO

--Create the datawarehouse database

CREATE DATABASE DWHLordUSBQ;
GO

USE DWHLordUSBQ;
GO

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
