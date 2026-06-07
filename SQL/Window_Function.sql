USE banking_transaction_analysis_DB;

--Window Function
SELECT Customer_ID, Amount,
RANK() OVER (PARTITION BY Customer_ID
ORDER BY Amount DESC) Rank_No
FROM dbo.bank_transaction_analysis