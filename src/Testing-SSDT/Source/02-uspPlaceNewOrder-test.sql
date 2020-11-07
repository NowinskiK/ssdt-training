-- ssNoVersion unit test for Sales.uspPlaceNewOrder  
DECLARE @RC AS INT, @CustomerID AS INT, @Amount AS INT, @OrderDate AS DATETIME, @Status AS CHAR (1);  
DECLARE @CustomerName AS NVARCHAR(40);  

SELECT @RC = 0,  
       @CustomerID = 0,  
       @CustomerName = N'Fictitious Customer',  
       @Amount = 100,  
       @OrderDate = getdate(),  
       @Status = 'O';  

-- NOTE: Assumes that you inserted a Customer record with CustomerName='Fictitious Customer' in the pre-test script.  
SELECT @CustomerID = [CustomerID] FROM [Sales].[Customer] WHERE [CustomerName] = @CustomerName;  

-- place an order for that customer  
EXECUTE @RC = [Sales].[uspPlaceNewOrder] @CustomerID, @Amount, @OrderDate, @Status;  

-- verify that the YTDOrders value is correct.  
SELECT @RC = [YTDOrders] FROM [Sales].[Customer] WHERE [CustomerID] = @CustomerID  

SELECT @RC AS RC