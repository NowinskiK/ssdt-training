CREATE PROCEDURE [dbo].[setCustomerName]
	@customerId INT,
	@FirstName NVARCHAR(50),
	@Surname NVARCHAR(50)
AS
	UPDATE [CRM].dbo.Customer
	SET 
		[FirstName] = @FirstName, 
		[Surname] = @Surname
	WHERE [CustomerId] = @customerId;

RETURN 0
