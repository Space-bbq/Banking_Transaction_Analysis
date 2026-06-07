USE banking_transaction_analysis_DB;

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
SELECT * FROM
(SELECT Branch_Name,
SUM(Amount) AS Revenue
FROM dbo.bank_transaction_analysis
GROUP BY Branch_Name) AS BranchRevenue
WHERE Revenue > 500000;