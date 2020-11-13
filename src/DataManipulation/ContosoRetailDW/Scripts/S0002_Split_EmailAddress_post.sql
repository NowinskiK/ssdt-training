IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'AE3B26BF-C2C9-42E3-8400-7B0451C694BB')
BEGIN

	;WITH tmp AS (
		SELECT [CustomerKey], EmailAddress
		, SUBSTRING(EmailAddress, 1, CHARINDEX('@', EmailAddress)-1) as EmailPrefix
		, SUBSTRING(EmailAddress, CHARINDEX('@', EmailAddress)+1, 99) as EmailDomain
		FROM #DimCustomer
	)
	UPDATE C
	set [EmailPrefix] = tmp.EmailPrefix
	  ,	[EmailDomain] = tmp.EmailDomain
	FROM [dbo].[DimCustomer] as C
	JOIN tmp ON tmp.[CustomerKey] = C.[CustomerKey];

	INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('AE3B26BF-C2C9-42E3-8400-7B0451C694BB');

END

GO

