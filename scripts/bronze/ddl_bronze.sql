use DWHLordUSBQ

IF OBJECT_ID ('bronze.crm_passenger_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_passenger_info;

CREATE TABLE bronze.crm_passenger_info
(
cst_passenger_id INT,
cst_survived INT,
cst_pass_class INT,
cst_pass_name NVARCHAR(100),
cst_sex NVARCHAR(100),
cst_age NVARCHAR(50),
cst_sib_sp INT,
cst_parch INT,
cst_ticket NVARCHAR(50),
cst_fare NVARCHAR(50),
cst_cabin NVARCHAR(50),
cst_embarqued NVARCHAR(50)
)

IF OBJECT_ID ('bronze.erp_food_prices', 'U') IS NOT NULL
	DROP TABLE bronze.erp_food_prices;

CREATE TABLE bronze.erp_food_prices
(
cst_series_reference NVARCHAR(50),
cst_period NVARCHAR(50),
cst_price DECIMAL,
cst_status NVARCHAR(50),
cst_currency NVARCHAR(50),
cst_subject NVARCHAR(150),
cst_group NVARCHAR(150),
cst_series_title NVARCHAR(150)

)

IF OBJECT_ID ('bronze.erp_injuries', 'U') IS NOT NULL
	DROP TABLE bronze.erp_injuries;

CREATE TABLE bronze.erp_injuries
(
cst_year DATETIME,
cst_sex  NVARCHAR(50),
cst_age NVARCHAR(50),
cst_geographic_region NVARCHAR(50),
cst_employment_status NVARCHAR(50),
cst_occupation NVARCHAR(50),
cst_injury NVARCHAR(150),
cst_type_of_injury NVARCHAR(50),
cst_industry NVARCHAR(50),
cst_ind_subgroup NVARCHAR(50),
cst_value DECIMAL,
cst_measure NVARCHAR(150),
cst_status NVARCHAR(50)
)

IF OBJECT_ID ('bronze.erp_serious_injuries', 'U') IS NOT NULL
	DROP TABLE bronze.erp_serious_injuries;

CREATE TABLE bronze.erp_serious_injuries
(
cst_series_reference NVARCHAR(50),
cst_period  NVARCHAR(50),
cst_type NVARCHAR(50),
cst_data_value NVARCHAR(50),
cst_lower_ci NVARCHAR(50),
cst_upper_ci NVARCHAR(50),
cst_units NVARCHAR(50),
cst_indicator NVARCHAR(50),
cst_cause NVARCHAR(50),
cst_validation NVARCHAR(50),
cst_population NVARCHAR(100),
cst_age NVARCHAR(50),
cst_severity NVARCHAR(50)
)

IF OBJECT_ID ('bronze.crm_public_assault', 'U') IS NOT NULL
	DROP TABLE bronze.crm_public_assault;

CREATE TABLE bronze.crm_public_assault
(
cst_index NVARCHAR(50),
cst_area_unit_code  NVARCHAR(50),
cst_area_unit_label NVARCHAR(50),
cst_victimisations_calendar NVARCHAR(50),
cst_population_mid INT,
cst_rate_per_1000 NVARCHAR(50),
cst_rate_ratio_average NVARCHAR(50),
cst_urban_area_code DECIMAL,
cst_urban_area_label NVARCHAR(50),
cst_urban_area_type NVARCHAR(50),
cst_territorial_authority_code NVARCHAR(100),
cst_territorial_authority_label NVARCHAR(100),
cst_region_code NVARCHAR(100),
cst_region_label NVARCHAR(100)
)


