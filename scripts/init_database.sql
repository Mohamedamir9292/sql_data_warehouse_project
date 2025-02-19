-- this script is to create database named dataWarehouse.
===========================================================

-- We have to use master database first.
USE master;


-- then create database inside master.
create database data_warehouse;


-- then create schemas inside the database for the three layers.
use data_warehouse;
create schema bronze;
create schema silver;
create schema gold;

-- create tables with the same names as from the source and useing BULK INSERT we insert data from the source CSV files into the tables

-- Create Database'DataWarehouse'
USE master;
create database data_warehouse;
use data_warehouse;
create schema bronze;
create schema silver;
create schema gold;


-- for creating the tables we have to follow the naming convension by useing the layerName.Source_TableNameFromTheSource.


create table bronze.crm_cust_info(
cst_id int, 
cst_key nvarchar(50), 
cst_firstname nvarchar(50), 
cst_lastname nvarchar(50), 
cst_marital_status nvarchar(50), 
cst_gndr nvarchar(2), 
cst_create_date date
);

create table bronze.crm_prd_info(
prd_id int, 
prd_key nvarchar(50), 
prd_nm nvarchar(50), 
prd_cost int, 
prd_line nvarchar(50), 
prd_start_dt datetime, 
prd_end_dt datetime
);

create table bronze.crm_sales_details(
sls_ord_num nvarchar (50), 
sls_prd_key nvarchar(50), 
sls_cust_id int, 
sls_order_dt int, 
sls_ship_dt int, 
sls_due_dt int, 
sls_sales int, 
sls_quantity int, 
sls_price int
);

create table bronze.erp_loc_a101(
cid nvarchar(50),
cntry nvarchar(50)
);

create table bronze.erp_cust_az12 (
cid nvarchar(50), 
bdate date, 
gen nvarchar(50)
);

create table bronze.erp_px_cat_g1v2 (
id nvarchar(50), 
cat nvarchar(50),
subcat nvarchar(50),
maintenance nvarchar(50)
);

bulk insert bronze.crm_cust_info
from 'C:\Users\caria\Desktop\IT\INTRO TO DATA ANALYSIS\DATA WAREHOUSE PROJECT\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
with (
firstrow = 2, 
fieldterminator = ',',
tablock 
);

bulk insert bronze.crm_prd_info
from 'C:\Users\caria\Desktop\IT\INTRO TO DATA ANALYSIS\DATA WAREHOUSE PROJECT\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock
);

bulk insert bronze.crm_sales_details
from 'C:\Users\caria\Desktop\IT\INTRO TO DATA ANALYSIS\DATA WAREHOUSE PROJECT\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
with (
firstrow = 2, 
fieldterminator = ',',
tablock
);

bulk insert bronze.erp_cust_az12
from 'C:\Users\caria\Desktop\IT\INTRO TO DATA ANALYSIS\DATA WAREHOUSE PROJECT\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
with (
firstrow = 2, 
fieldterminator = ',',
tablock
);

bulk insert bronze.erp_loc_a101
from 'C:\Users\caria\Desktop\IT\INTRO TO DATA ANALYSIS\DATA WAREHOUSE PROJECT\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
with (
firstrow = 2, 
fieldterminator = ',',
tablock
);

bulk insert bronze.erp_px_cat_g1v2
from 'C:\Users\caria\Desktop\IT\INTRO TO DATA ANALYSIS\DATA WAREHOUSE PROJECT\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
with (
firstrow = 2,
fieldterminator = ',',
tablock
);

