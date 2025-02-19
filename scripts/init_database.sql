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
