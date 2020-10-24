CREATE PROCEDURE [Sales].[uspNewCustomer]  
@CustomerName NVARCHAR (40)  
AS  
BEGIN  
INSERT INTO [Sales].[Customer] (CustomerName) VALUES (@CustomerName);  
RETURN SCOPE_IDENTITY()  
END