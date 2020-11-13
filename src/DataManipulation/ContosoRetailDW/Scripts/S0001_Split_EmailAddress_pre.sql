IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'AE3B26BF-C2C9-42E3-8400-7B0451C694BB')
BEGIN
	EXECUTE ('SELECT [CustomerKey], [EmailAddress] INTO #DimCustomer FROM [dbo].[DimCustomer]');

	ALTER TABLE #DimCustomer ADD CONSTRAINT [PK_#DimCustomer] PRIMARY KEY CLUSTERED 
	(	[CustomerKey] ASC )
END
GO
