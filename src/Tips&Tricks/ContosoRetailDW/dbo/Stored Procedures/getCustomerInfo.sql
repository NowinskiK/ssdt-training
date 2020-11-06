CREATE PROCEDURE [dbo].[getCustomerInfo]
	@customerId int
AS
	SELECT [CustomerId], [CountryCode], [FirstName], [Surname], [isActive], [CustomerTypeCode], [Twitter] 
	FROM [$(CRM)].dbo.Customer;

RETURN 0
