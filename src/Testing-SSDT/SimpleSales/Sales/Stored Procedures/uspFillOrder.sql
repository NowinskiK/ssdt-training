CREATE PROCEDURE [Sales].[uspFillOrder]  
@OrderID INT, @FilledDate DATETIME  
AS  
BEGIN  
DECLARE @Delta INT, @CustomerID INT  
BEGIN TRANSACTION  
    SELECT @Delta = [Amount], @CustomerID = [CustomerID]  
     FROM [Sales].[Orders] WHERE [OrderID] = @OrderID;  

UPDATE [Sales].[Orders]  
   SET [Status] = 'F',  
       [FilledDate] = @FilledDate  
WHERE [OrderID] = @OrderID;  

UPDATE [Sales].[Customer]  
   SET  
   YTDSales = YTDSales + @Delta  
    WHERE [CustomerID] = @CustomerID  
COMMIT TRANSACTION  
END