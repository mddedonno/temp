-- DuckDB Exercises
------------------------------------------------------

-- go to the folder
cd 03_DuckDB 

-- start duckdb
duckdb

-- Create In-Memory Table
CREATE TABLE ducks AS SELECT 3 AS age, 'mandarin' AS breed;
FROM ducks;

SELECT * FROM ducks;

-- Exit DuckDB
.exit

-- Create persisted DB
duckdb myFirstDuckDB.db;

-- read CSV file
SELECT * FROM read_csv_auto('./cities.csv');

-- CREATE SCHEMA 
CREATE SCHEMA bia;


-- CREATE Table 
CREATE TABLE bia.cities AS SELECT * FROM read_csv_auto('./cities.csv');

CREATE TABLE bia.countries AS SELECT * FROM read_csv_auto('./countries.csv');
CREATE TABLE bia.states AS SELECT * FROM read_csv_auto('./states.csv');
CREATE TABLE bia.wine_quality AS SELECT * FROM read_csv_auto('./WineQuality.csv');


-- read cities table
FROM bia.cities;
FROM bia.countries;
FROM bia.states;
FROM bia.wine_quality;

-- exit
.exit

-- Read the DB with DBeaver
-------------------------------------------

-- login to duckdb
duckdb

-- Install extensions
SELECT * FROM duckdb_extensions();

INSTALL httpfs;
LOAD httpfs;

INSTALL aws;
LOAD aws;


-- reading from AWS S3 parquet files

SET s3_region='us-east-1';

SELECT * FROM read_parquet('s3://us-prd-motherduck-open-datasets/nyc_taxi/parquet/yellow_cab_nyc_2022_11.parquet');

SELECT COUNT(*) FROM read_parquet('s3://us-prd-motherduck-open-datasets/nyc_taxi/parquet/yellow_cab_nyc_2022_11.parquet');

SELECT
   passenger_count,
   avg(total_amount)
FROM read_parquet('s3://us-prd-motherduck-open-datasets/nyc_taxi/parquet/yellow_cab_nyc_2022_11.parquet')
GROUP BY passenger_count
ORDER by passenger_count;

-- exit DuckDB
.exit


-- Run DuckDB with the integrated UI
-------------------------------------------

duckdb myFirstDuckDB.db -ui

-- connect to Motherduck
-------------------------------------------

duckdb myFirstDuckDB.db
INSTALL motherduck;
LOAD motherduck;

-- Token bei Motherduck holen und nachfolgend ersetzen
ATTACH 'md:';

SELECT * FROM sample_data.nyc.service_requests LIMIT 10;

SELECT 
  created_date, agency_name, complaint_type, 
  descriptor, incident_address, resolution_description
FROM 
  sample_data.nyc.service_requests 
WHERE 
  created_date >= '2022-03-27' AND 
  created_date <= '2022-03-31';


-- Upload Data to Motherduck
-------------------------------------------

-- erstelle eine Datenbank 'aw_landing' in Motherduck


duckdb myFirstDuckDB.db


-- test
SELECT * FROM read_csv_auto('./AW_CSV/Person.Person.csv');

INSTALL motherduck;
LOAD motherduck;


-- Verbindung zu MotherDuck herstellen
ATTACH 'md:';

CREATE DATABASE AdventureWorks_Landing;

USE AdventureWorks_Landing;

CREATE OR REPLACE TABLE person_person AS SELECT * FROM read_csv_auto('./AW_CSV/Person.Person.csv');

CREATE OR REPLACE TABLE person_countryregion AS SELECT * FROM read_csv_auto('./AW_CSV/Person.CountryRegion.csv');

CREATE OR REPLACE TABLE person_stateprovince AS SELECT * FROM read_csv_auto('./AW_CSV/Person.StateProvince.csv');

CREATE OR REPLACE TABLE production_product AS SELECT * FROM read_csv_auto('./AW_CSV/Production.Product.csv');

CREATE OR REPLACE TABLE production_productcategory AS SELECT * FROM read_csv_auto('./AW_CSV/Production.ProductCategory.csv');

CREATE OR REPLACE TABLE production_productsubcategory AS SELECT * FROM read_csv_auto('./AW_CSV/Production.ProductSubcategory.csv');

CREATE OR REPLACE TABLE sales_customer AS SELECT * FROM read_csv_auto('./AW_CSV/Sales.Customer.csv');

CREATE OR REPLACE TABLE sales_salesorderdetail AS SELECT * FROM read_csv_auto('./AW_CSV/Sales.SalesOrderDetail.csv');

CREATE OR REPLACE TABLE sales_salesorderheader AS SELECT * FROM read_csv_auto('./AW_CSV/Sales.SalesOrderHeader.csv');

CREATE OR REPLACE TABLE sales_salesterritory AS SELECT * FROM read_csv_auto('./AW_CSV/Sales.SalesTerritory.csv');

CREATE OR REPLACE TABLE person_address AS SELECT * FROM read_csv_auto('./AW_CSV/Person.Address.csv');







