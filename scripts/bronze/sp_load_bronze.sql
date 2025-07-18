/*
==================================================================================
Store Procedure: Load Bronze Layer (Source -Bronze)
==================================================================================
Script Purpose
	This store procedure loads the data from source .csv files into 'bronze' schema 
	performing the following actions:
	- Truncates the bronze tables before loading data
	- Uses the BULK INSERT command to load data from csv files to bronze tables

Parameters:
	None
	This store procedure does not accept any parameters or return any values

*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS

BEGIN
	DECLARE @begin_batch_time DATETIME;
	DECLARE @end_batch_time DATETIME;
	DECLARE @begin_time  DATETIME;
	DECLARE @end_time  DATETIME;
	
	BEGIN TRY
		SET @begin_batch_time = GETDATE();
		PRINT '----------------------------------------------------------';
		PRINT 'Loading the Bronze Layer';
		PRINT '----------------------------------------------------------';
	
		SET @begin_time = GETDATE();
		PRINT '>>Truncating the table: bronze.crm_passenger_info'
		TRUNCATE TABLE bronze.crm_passenger_info;
		PRINT '>>Inserting Data to the table: bronze.crm_passenger_info'
		BULK INSERT bronze.crm_passenger_info
		FROM 'C:\Users\amigo\Documents\ETL_Project\Datasets\passenger.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ','
	
		);
		SET @end_time = GETDATE()
		PRINT '>> TABLE process time : '+ CAST(DATEDIFF(second,@begin_time,@end_time) AS NVARCHAR);

		PRINT '----------------------------------------------------------';
		SET @begin_time = GETDATE();
		PRINT '>>Truncating the table: bronze.crm_public_assault'
		TRUNCATE TABLE bronze.crm_public_assault
		PRINT '>>Inserting Data to the table: bronze.crm_public_assault'
		BULK INSERT bronze.crm_public_assault
		FROM 'C:\Users\amigo\Documents\ETL_Project\Datasets\public_assault.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ','	
		);
		SET @end_time = GETDATE()
		PRINT '>> TABLE process time : '+ CAST(DATEDIFF(second,@begin_time,@end_time) AS NVARCHAR);

		PRINT '----------------------------------------------------------';
		SET @begin_time = GETDATE();
		PRINT '>>Truncating the table: bronze.erp_food_prices'
		TRUNCATE TABLE bronze.erp_food_prices
		PRINT '>>Inserting Data to the table: bronze.erp_food_prices'
		BULK INSERT bronze.erp_food_prices
		FROM 'C:\Users\amigo\Documents\ETL_Project\Datasets\food_price.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ','	
		);
		SET @end_time = GETDATE()
		PRINT '>> TABLE process time : '+ CAST(DATEDIFF(second,@begin_time,@end_time) AS NVARCHAR);

		PRINT '----------------------------------------------------------';
		SET @begin_time = GETDATE()
		PRINT '>>Truncating the table: bronze.erp_injuries'
		TRUNCATE TABLE bronze.erp_injuries
		PRINT '>>Inserting Data to the table: bronze.erp_injuries'
		BULK INSERT bronze.erp_injuries
		FROM 'C:\Users\amigo\Documents\ETL_Project\Datasets\injury.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ','	
		);
		SET @end_time = GETDATE();
		PRINT '>>TABLE Process time: ' + CAST(DATEDIFF(second,@begin_time,@end_time) AS NVARCHAR);

		PRINT '----------------------------------------------------------';

		SET @begin_time = GETDATE();
		PRINT '>>Truncating the table: bronze.erp_serious_injuries'
		TRUNCATE TABLE bronze.erp_serious_injuries

		PRINT '>>Inserting Data to the table: bronze.erp_serious_injuries'
		BULK INSERT bronze.erp_serious_injuries
		FROM 'C:\Users\amigo\Documents\ETL_Project\Datasets\serious_injury.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ','
	
		);
		SET @end_time = GETDATE();
		PRINT '>>TABLE Process Time: ' + CAST(DATEDIFF(second,@begin_time,@end_time) AS NVARCHAR) ;
		PRINT '===========================================================';
		PRINT '<< BRONZE LAYER Process Completed';
		SET @end_batch_time = GETDATE();
		PRINT '<<TOTAL BACTCH PROCESS TIME : ' + CAST(DATEDIFF(second,@begin_batch_time,@end_batch_time) AS VARCHAR) ;
		PRINT '----------------------------------------------------------';
	END TRY
	BEGIN CATCH
		PRINT '===========================================================';
		PRINT 'ERROR OCCURED WHILE PROCESSING DATA: BRONZE LAYER PROCESS';
		PRINT 'ERROR MESSAGE : '+ ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE : '+ CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR MESSAGE : '+ CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '===========================================================';
	END CATCH
END

