CREATE PROCEDURE [Sales].[uspShowOrderDetails]  
@CustomerID INT=0  
AS  
BEGIN  
SELECT [C].[CustomerName], CONVERT(date, [O].[OrderDate]), CONVERT(date, [O].[FilledDate]), [O].[Status], [O].[Amount]  
  FROM [Sales].[Customer] AS C  
  INNER JOIN [Sales].[Orders] AS O  
     ON [O].[CustomerID] = [C].[CustomerID]  
  WHERE [C].[CustomerID] = @CustomerID  
END