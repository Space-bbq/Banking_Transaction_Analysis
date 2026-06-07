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
SELECT *
FROM vw_BranchPerformance