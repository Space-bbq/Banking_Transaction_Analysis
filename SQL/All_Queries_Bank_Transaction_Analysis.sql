--USE banking_transaction_analysis_DB;

--To show the data
/*SELECT *
FROM dbo.bank_transaction_analysis*/

--Total Rows and Columns
/*SELECT ( SELECT COUNT(*)
FROM dbo.bank_transaction_analysis) AS TotalRows,
(SELECT COUNT(*)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'bank_transaction_analysis') AS TotalColumns;*/

--Total Transactions
/*SELECT COUNT(*) Total_Transactions
FROM dbo.bank_transaction_analysis*/

--Total Amount
/*SELECT SUM(Amount)
FROM dbo.bank_transaction_analysis*/

--Top 10 Customers
/*SELECT TOP 10
Customer_ID,
SUM(Amount) Total_Spent
FROM dbo.bank_transaction_analysis
GROUP BY Customer_ID
ORDER BY Total_Spent DESC*/

--Fraud Analysis
/*SELECT
Fraud_Flag,
COUNT(*) Total
FROM dbo.bank_transaction_analysis
GROUP BY Fraud_Flag*/

--Branch Performance
/*SELECT
Branch_Name,
SUM(Amount) Revenue
FROM dbo.bank_transaction_analysis
GROUP BY Branch_Name
ORDER BY Revenue DESC*/

-----------------------------------------------------------------------------
--Window Function
/*SELECT Customer_ID, Amount,
RANK() OVER (PARTITION BY Customer_ID
ORDER BY Amount DESC) Rank_No
FROM dbo.bank_transaction_analysis*/

----------------------------------------------------------------------------
--CTE (Common Table Expression)
/*WITH BranchRevenue AS -- BranchRevenue (temperory result name)
(SELECT Branch_Name, SUM(Amount) Revenue
FROM dbo.bank_transaction_analysis
GROUP BY Branch_Name)
SELECT *
FROM BranchRevenue
WHERE Revenue > 500000*/
--|
--OR use this
/*SELECT * FROM
(SELECT Branch_Name,
SUM(Amount) AS Revenue
FROM dbo.bank_transaction_analysis
GROUP BY Branch_Name) AS BranchRevenue
WHERE Revenue > 500000;*/

----------------------------------------------------------------------------
--Stored Procedure
--Step 1
/*ALTER PROCEDURE GetFraudTransactions
AS
BEGIN 
	SELECT *
	FROM [banking_transaction_analysis_DB].[dbo].[bank_transaction_analysis]
	WHERE Fraud_Flag = '1'
END;*/
--|
--Step 2
/*EXECUTE GetFraudTransactions;*/

--Create View
--Step 1
/*CREATE VIEW vw_BranchPerformance
AS

SELECT
Branch_Name,
COUNT(*) Total_Transactions,
SUM(Amount) Revenue

FROM [banking_transaction_analysis_DB].[dbo].[bank_transaction_analysis]

GROUP BY Branch_Name*/
--|
--Step 2
/*SELECT *
FROM vw_BranchPerformance*/