-- ssNoVersion unit test for Sales.uspFillOrder  
DECLARE @RC AS INT, @CustomerID AS INT, @Amount AS INT, @FilledDate AS DATETIME, @Status AS CHAR (1);  
DECLARE @CustomerName AS NVARCHAR(40), @OrderID AS INT;  

SELECT @RC = 0,  
       @CustomerID = 0,  
       @OrderID = 0,  
       @CustomerName = N'Fictitious Customer',  
       @Amount = 100,  
       @FilledDate = getdate(),  
       @Status = 'O';  

-- NOTE: Assumes that you inserted a Customer record with CustomerName='Fictitious Customer' in the pre-test script.  
SELECT @CustomerID = [CustomerID] FROM [Sales].[Customer] WHERE [CustomerName] = @CustomerName;  

-- fill an order for that customer  
EXECUTE @RC = [Sales].[uspShowOrderDetails] @CustomerID;  

SELECT @RC AS RC;