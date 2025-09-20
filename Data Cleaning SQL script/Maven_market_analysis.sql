-- Creating the DATABASE
CREATE DATABASE Maven_market;
USE Maven_market;
-- Importing all the Data Tables

-- *******************************************************Cleaning the Data Tables (Data Cleaning SQL Script)********************************************************

-- 1) Calendar Table
SELECT * FROM Calendar;
DESC Calendar;
		-- Removing the S.No column
ALTER TABLE Calendar
DROP COLUMN `S.No`;

		-- Formatting the date column
SELECT * FROM Calendar;
UPDATE Calendar
SET date = LPAD(date, 10, "0")
WHERE date LIKE "_/__/____" ;

UPDATE Calendar
SET date = CASE
	WHEN date LIKE "__-__-____" THEN STR_TO_DATE(date, "%m-%d-%Y")
    ELSE STR_TO_DATE(date, "%m/%d/%Y")
END;
DESC Calendar; 

		-- Changing the datatype of date column to DATE
ALTER TABLE Calendar
MODIFY COLUMN date DATE;

-- 2) Customers Table
DESC Customers;

		-- Dropping irrelevant columns 
ALTER TABLE Customers
DROP COLUMN customer_address,
DROP COLUMN customer_postal_code,
DROP COLUMN total_children,
DROP COLUMN num_children_at_home,
DROP COLUMN homeowner,
DROP COLUMN education;

DESC Customers;
SELECT * FROM Customers;

		-- Making the customer_id column the primary key
ALTER TABLE Customers
ADD CONSTRAINT PRIMARY KEY (customer_id);

		-- Changing the datatype of the customer_acct_num to varchar
ALTER TABLE Customers
MODIFY COLUMN customer_acct_num VARCHAR(20);

		-- Removing any leading or trailing spaces from first_name or last_name columns
UPDATE Customers
SET first_name = TRIM(first_name);

UPDATE Customers
SET last_name = TRIM(last_name);

		-- Adding a new Customer_name column
ALTER TABLE Customers
ADD COLUMN Customer_name VARCHAR(30)
AFTER last_name;

UPDATE Customers
SET Customer_name = CONCAT(first_name, " ", last_name);

ALTER TABLE Customers
RENAME COLUMN Customer_name TO customer_name;

		-- Dropping the first_name & last_name columns
ALTER TABLE Customers
DROP COLUMN first_name,
DROP COLUMN last_name;

		-- Removing any leading or trailing spaces from customer_city, customer_state, customer_country column
UPDATE Customers
SET customer_city = TRIM(customer_city),
	customer_state = TRIM(customer_state),
    customer_country = TRIM(customer_country);
    
		-- Changing the datatypes of customer_city, customer_state, customer_country column to varchar
ALTER TABLE Customers
MODIFY COLUMN customer_city VARCHAR(20),
MODIFY COLUMN customer_state VARCHAR(20),
MODIFY COLUMN customer_country VARCHAR(20);
        
		-- Renaming the customer_state_province column to customer_state
ALTER TABLE Customers
RENAME COLUMN customer_state_province TO customer_state;

		-- Formatting the birthdate column
UPDATE Customers
SET birthdate = LPAD(birthdate, 10, "0")
WHERE birthdate LIKE "_/__/____";

UPDATE Customers
SET birthdate = CASE
	WHEN birthdate LIKE "__/__/____" THEN STR_TO_DATE(birthdate, "%m/%d/%Y")
    ELSE STR_TO_DATE(birthdate, "%m-%d-%Y")
END;

		-- Changing the datatype of birthdate to DATE
ALTER TABLE Customers
MODIFY COLUMN birthdate DATE;

		-- Creating a new age column
ALTER TABLE Customers
ADD COLUMN age INT 
AFTER birthdate;

UPDATE Customers
SET age = TIMESTAMPDIFF(YEAR, birthdate, "1998-12-31");

		-- Checking for any outliers in the created age column
SELECT MIN(age) from Customers;
SELECT MAX(age) from Customers;

		-- Dropping the birthdate column
ALTER TABLE Customers
DROP COLUMN birthdate;

		-- Removing any leading or trailing spaces from marital_status column
UPDATE Customers
SET marital_status = TRIM(marital_status);

		-- Changing the datatype of marital_status to char
ALTER TABLE Customers
MODIFY COLUMN marital_status CHAR(1);

		-- Renaming the column yearly_income to annual_income
ALTER TABLE Customers
RENAME COLUMN yearly_income TO annual_income;

		-- Changing the datatype of the annual_income column to varchar
ALTER TABLE Customers
MODIFY COLUMN annual_income VARCHAR(15);	

		-- Changing the datatype of the gender columnn to char
SELECT DISTINCT gender FROM Customers;
ALTER TABLE Customers
MODIFY COLUMN gender CHAR(1);

		-- Formatting the acct_open_date column
UPDATE Customers
SET acct_open_date = LPAD(acct_open_date, 10, "0")
WHERE acct_open_date LIKE "_/__/____";

UPDATE Customers
SET acct_open_date = CASE
	WHEN acct_open_date LIKE "__/__/____" THEN STR_TO_DATE(acct_open_date, "%m/%d/%Y")
    ELSE STR_TO_DATE(acct_open_date, "%m-%d-%Y")
END;

		-- Changing the datatype of the acct_open_date column to date
ALTER TABLE Customers
MODIFY COLUMN acct_open_date DATE;

		-- Changing the datatype of the member_card to varchar
SELECT DISTINCT member_card FROM Customers;
ALTER TABLE Customers
MODIFY COLUMN member_card VARCHAR(10);

-- 3) Products Table
DESC Products;
SELECT * FROM Products;

		-- Dropping the irrelevant columns
ALTER TABLE Products
DROP COLUMN product_weight,
DROP COLUMN low_fat;

		-- Making the product_id column primary key
ALTER TABLE Products
ADD CONSTRAINT PRIMARY KEY (product_id);

		-- Changing the datatype of product_brand column to varchar
ALTER TABLE Products
MODIFY COLUMN product_brand VARCHAR(25);

		-- Handling the missing values in the recyclable column
UPDATE Products
SET recyclable = 0
WHERE recyclable = "";

		-- Changing the datatype of the recyclable column to char
ALTER TABLE Products
MODIFY COLUMN recyclable CHAR(1);

		-- Adding a new column profit_per_unit
ALTER TABLE Products
ADD COLUMN profit_per_unit DOUBLE
AFTER product_cost;

UPDATE Products
SET profit_per_unit = ROUND(product_retail_price - product_cost, 2);

-- 4) Regions Table
DESC Regions;
SELECT * FROM Regions;

		-- Making the region_id column the primary key
ALTER TABLE Regions
ADD CONSTRAINT PRIMARY KEY (region_id);

		-- Renaming THE sales_district column to sales_city
ALTER TABLE Regions 
RENAME COLUMN sales_district TO sales_city;

		-- Changing the datatype of the sales_city column to varchar
ALTER TABLE Regions
MODIFY COLUMN sales_city VARCHAR(25);

		-- Changing the datatype of sales_region column to varchar
ALTER TABLE Regions
MODIFY COLUMN sales_region VARCHAR(25);

-- 5) returns_1997-1998 Table
		-- Renaming the returns_1997-1998 to Returns
ALTER TABLE `returns_1997-1998`
RENAME TO Returns;

DESC Returns;
SELECT * FROM Returns;

		-- Formatting the return_date column 
UPDATE Returns 
SET return_date = CASE
	WHEN return_date LIKE "_/_/____" THEN LPAD(return_date, 9, "0")
    WHEN return_date LIKE "_/__/____" THEN LPAD(return_date, 10, "0")
    ELSE return_date
END;

UPDATE Returns
SET return_date = CONCAT(SUBSTR(return_date, 1, 3), "0",SUBSTR(return_date, 4))
WHERE return_date LIKE "__/_/____";

UPDATE Returns 
SET return_date = STR_TO_DATE(return_date, "%m/%d/%Y");

		-- Changing the datatype of return_date column gto Date
ALTER TABLE Returns
MODIFY COLUMN return_date DATE;

-- 6) Stores Table
DESC Stores;
SELECT * FROM Stores;

		-- Droppin irrelevant columns
ALTER TABLE Stores
DROP COLUMN store_street_address,
DROP COLUMN store_phone,
DROP COLUMN grocery_sqft;

		-- Changing the datatype of store_name column to varchar
ALTER TABLE Stores
MODIFY COLUMN store_name VARCHAR(12);

		-- Changing the datatype of store_city to varchar
ALTER TABLE Stores
MODIFY COLUMN store_city VARCHAR(25);

		-- Changing the datatype of store_state to varchar
ALTER TABLE Stores
MODIFY COLUMN store_state VARCHAR(15);

		-- Changing the datatype of store_country to varchar
ALTER TABLE Stores
MODIFY COLUMN store_country VARCHAR(15);

		-- Formatting the first_opened_date column
UPDATE Stores 
SET first_opened_date = CASE
	WHEN first_opened_date LIKE "_/_/____" THEN LPAD(first_opened_date, 9, "0")
    WHEN first_opened_date LIKE "_/__/____" THEN LPAD(first_opened_date, 10, "0")
    ELSE first_opened_date
END;

UPDATE Stores
SET first_opened_date = CONCAT(SUBSTR(first_opened_date, 1, 3), "0",SUBSTR(first_opened_date, 4))
WHERE first_opened_date LIKE "__/_/____";

UPDATE Stores 
SET first_opened_date = STR_TO_DATE(first_opened_date, "%m/%d/%Y");

		-- Changing the datatype of first_opened_date to date
ALTER TABLE Stores
MODIFY COLUMN first_opened_date DATE;

		-- Formatting the last_remodel_date
UPDATE Stores 
SET last_remodel_date = CASE
	WHEN last_remodel_date LIKE "_/_/____" THEN LPAD(last_remodel_date, 9, "0")
    WHEN last_remodel_date LIKE "_/__/____" THEN LPAD(last_remodel_date, 10, "0")
    ELSE last_remodel_date
END;

UPDATE Stores
SET last_remodel_date = CONCAT(SUBSTR(last_remodel_date, 1, 3), "0",SUBSTR(last_remodel_date, 4))
WHERE last_remodel_date LIKE "__/_/____";

UPDATE Stores 
SET last_remodel_date = STR_TO_DATE(last_remodel_date, "%m/%d/%Y");

		-- Changing the datatype of last_remodel_date column
ALTER TABLE Stores
MODIFY COLUMN last_remodel_date DATE;

-- 7) Transactions_1997 & Transactions_1998

		-- Creating a new table "Transactions" by appending both the Transaction_1997 & Transaction_1998 tables.
CREATE TABLE Transactions AS
SELECT * FROM Transactions_1997
UNION ALL
SELECT * FROM Transactions_1998;

		-- Dropping both the Transactions_1997 & Transactions_1998 Tables
DROP TABLE Transactions_1997;
DROP TABLE Transactions_1998;

		-- Cleaning the new Transactions table
DESC Transactions;
SELECT * FROM Transactions;

		-- Dropping the stock_date column
ALTER TABLE Transactions
DROP COLUMN stock_date;

		-- Formatting the transaction_date column
UPDATE Transactions 
SET transaction_date = CASE
	WHEN transaction_date LIKE "_/_/____" THEN LPAD(transaction_date, 9, "0")
    WHEN transaction_date LIKE "_/__/____" THEN LPAD(transaction_date, 10, "0")
    ELSE transaction_date
END;

UPDATE Transactions
SET transaction_date = CONCAT(SUBSTR(transaction_date, 1, 3), "0",SUBSTR(transaction_date, 4))
WHERE transaction_date LIKE "__/_/____";

UPDATE Transactions 
SET transaction_date = STR_TO_DATE(transaction_date, "%m/%d/%Y");

		-- Changing the datatype of transaction_date column to Date
ALTER TABLE Transactions
MODIFY COLUMN transaction_date DATE;