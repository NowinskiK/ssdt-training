BEGIN TRANSACTION  

-- Add a customer for this test with the name 'CustomerB'  
DECLARE @NewCustomerID AS INT, @RC AS INT, @CustomerName AS NVARCHAR (40);  

SELECT @RC = 0,  
       @NewCustomerID = 0,  
       @CustomerName = N'Fictitious Customer';  

IF NOT EXISTS(SELECT * FROM [Sales].[Customer] WHERE CustomerName = @CustomerName)  
BEGIN  
EXECUTE @NewCustomerID = [Sales].[uspNewCustomer] @CustomerName;  
END  

DECLARE @CustomerID AS INT, @Amount AS INT, @OrderDate AS DATETIME, @Status AS CHAR (1);  

SELECT @RC = 0,  
       @CustomerID = 0,  
       @CustomerName = N'Fictitious Customer',  
       @OrderDate = getdate(),  
       @Status = 'O';  

-- NOTE: Assumes that you inserted a Customer record with CustomerName='Fictitious Customer' in the pre-test script.  
SELECT @CustomerID = [CustomerID] FROM [Sales].[Customer] WHERE [CustomerName] = @CustomerName;  

-- delete any old records in the Orders table and clear out the YTD Sales/Orders fields  
DELETE from [Sales].[Orders] WHERE [CustomerID] = @CustomerID;  
UPDATE [Sales].[Customer] SET YTDOrders = 0, YTDSales = 0 WHERE [CustomerID] = @CustomerID;  

-- place 3 orders for that customer  
EXECUTE @RC = [Sales].[uspPlaceNewOrder] @CustomerID, 100, @OrderDate, @Status;  
EXECUTE @RC = [Sales].[uspPlaceNewOrder] @CustomerID, 50, @OrderDate, @Status;  
EXECUTE @RC = [Sales].[uspPlaceNewOrder] @CustomerID, 5, @OrderDate, @Status;  

COMMIT TRANSACTION  

-- ssNoVersion unit test for Sales.uspFillOrder  
DECLARE @FilledDate AS DATETIME;  
DECLARE @OrderID AS INT;  

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