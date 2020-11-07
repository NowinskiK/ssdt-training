/*  
Add Transact-SQL statements here that you want to run before  
the test script is run.  
*/  
-- Add a customer for this test with the name 'Fictitious Customer'  
DECLARE @NewCustomerID AS INT, @CustomerID AS INT, @RC AS INT, @CustomerName AS NVARCHAR (40);  

SELECT @RC = 0,  
       @NewCustomerID = 0,  
   @CustomerID = 0,  
       @CustomerName = N'Fictitious Customer';  

IF NOT EXISTS(SELECT * FROM [Sales].[Customer] WHERE CustomerName = @CustomerName)  
BEGIN  
EXECUTE @NewCustomerID = [Sales].[uspNewCustomer] @CustomerName;  
END  

-- NOTE: Assumes that you inserted a Customer record with CustomerName='Fictitious Customer' in the pre-test script.  
SELECT @CustomerID = [CustomerID] FROM [Sales].[Customer] WHERE [CustomerName] = @CustomerName;  

-- delete any old records in the Orders table and clear out the YTD Sales/Orders fields  
DELETE from [Sales].[Orders] WHERE [CustomerID] = @CustomerID;  
UPDATE [Sales].[Customer] SET YTDOrders = 0, YTDSales = 0 WHERE [CustomerID] = @CustomerID;