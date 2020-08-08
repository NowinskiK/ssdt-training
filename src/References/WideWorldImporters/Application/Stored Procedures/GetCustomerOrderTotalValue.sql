CREATE PROCEDURE [dbo].[GetCustomerOrderTotalValue]
	@CustomerId int
AS
	DECLARE @CustomerKey int
	SELECT @CustomerKey = [Customer Key] 
	FROM [$(srv1020)].[$(WideWorldImportersDW)].Dimension.Customer 
	WHERE [WWI Customer ID] = @CustomerId;

	SELECT @CustomerId, SUM([Total Excluding Tax]) AS TotalValueExTax
	FROM [$(srv1020)].[$(WideWorldImportersDW)].Fact.[Order]
	WHERE [Customer Key] = @CustomerKey;

RETURN 0
