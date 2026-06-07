--Stored Procedure
--Step 1
ALTER PROCEDURE GetFraudTransactions
AS
BEGIN 
	SELECT *
	FROM [banking_transaction_analysis_DB].[dbo].[bank_transaction_analysis]
	WHERE Fraud_Flag = '1'
END;
--|
--Step 2
EXECUTE GetFraudTransactions;