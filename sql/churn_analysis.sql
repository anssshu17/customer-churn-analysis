CREATE DATABASE CustomerChurnDB;
USE CustomerChurnDB;

SELECT DB_NAME() AS CurrentDB;

SELECT name FROM sys.tables;

SELECT 
    TABLE_SCHEMA, 
    TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES;

SELECT TOP 10 * FROM dbo.Telco_customer_churn;

SELECT TOP 1 * FROM dbo.Telco_customer_churn;

-- 1. Churn Count
SELECT Churn_Label, COUNT(*) AS total_customers
FROM dbo.Telco_customer_churn
GROUP BY Churn_Label;

-- 2. Churn Percentage
SELECT 
    Churn_Label,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dbo.Telco_customer_churn) AS churn_percentage
FROM dbo.Telco_customer_churn
GROUP BY Churn_Label;

-- 3. Churn by Contract
SELECT Contract, Churn_Label, COUNT(*) AS total
FROM dbo.Telco_customer_churn
GROUP BY Contract, Churn_Label
ORDER BY Contract;

-- 4. Churn by Payment Method
SELECT [Payment_Method], Churn_Label, COUNT(*) AS total
FROM dbo.Telco_customer_churn
GROUP BY [Payment_Method], Churn_Label
ORDER BY [Payment_Method];

-- 5. Average Monthly Charges
SELECT Churn_Label, AVG([Monthly_Charges]) AS avg_charges
FROM dbo.Telco_customer_churn
GROUP BY Churn_Label;