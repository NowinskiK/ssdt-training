CREATE PROCEDURE [dbo].[getCustomerInfo]
	@customerId int
AS
	SELECT [CustomerId], [CountryCode], [FirstName], [Surname], [isActive], [CustomerTypeCode], [Twitter] 
	FROM [$(LS_SRV1019)].[$(CRM)].dbo.Customer;

RETURN 0
GO

