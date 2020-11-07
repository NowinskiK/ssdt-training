-- ssNoVersion unit test for Sales.uspNewCustomer  
DECLARE @RC AS INT, @CustomerName AS NVARCHAR (40);  

SELECT @RC = 0,  
       @CustomerName = 'Fictitious Customer';  

EXECUTE @RC = [Sales].[uspNewCustomer] @CustomerName;  

SELECT * FROM [Sales].[Customer];