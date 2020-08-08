
CREATE PROCEDURE [Application].[Configuration_PopulateLargeSaleTable]
@EstimatedRowsFor2012 bigint = 12000000
WITH EXECUTE AS OWNER
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

	EXEC Integration.PopulateDateDimensionForYear 2012;
	DECLARE @ReturnValue int;

	EXEC @ReturnValue = [Application].Configuration_ApplyPartitionedColumnstoreIndexing;
	DECLARE @LineageKey int = NEXT VALUE FOR Sequences.LineageKey;

	INSERT Integration.Lineage
		([Lineage Key], [Data Load Started], [Table Name], [Data Load Completed], [Was Successful],
		 [Source System Cutoff Time])
	VALUES
		(@LineageKey, SYSDATETIME(), N'Sale', NULL, 0, '20121231')

	DECLARE @OrderCounter bigint = 0;
	DECLARE @NumberOfSalesPerDay bigint = @EstimatedRowsFor2012 / 365;
	DECLARE @DateCounter date = '20120101';
	DECLARE @StartingSaleKey bigint;
	DECLARE @MaximumSaleKey bigint = (SELECT MAX([Sale Key]) FROM Fact.Sale);

	PRINT 'Targeting ' + CAST(@NumberOfSalesPerDay AS varchar(20)) + ' sales per day.';
	IF @NumberOfSalesPerDay > 50000
	BEGIN
		PRINT 'WARNING: Limiting sales to 40000 per day';
		SET @NumberOfSalesPerDay = 50000;
	END;

	DECLARE @OutputCounter varchar(20);


-- DROP CONSTRAINTS
	ALTER TABLE [Fact].[Sale] DROP CONSTRAINT [FK_Fact_Sale_City_Key_Dimension_City]
	ALTER TABLE [Fact].[Sale] DROP CONSTRAINT [FK_Fact_Sale_Customer_Key_Dimension_Customer]
	ALTER TABLE [Fact].[Sale] DROP CONSTRAINT [FK_Fact_Sale_Delivery_Date_Key_Dimension_Date]
	ALTER TABLE [Fact].[Sale] DROP CONSTRAINT [FK_Fact_Sale_Invoice_Date_Key_Dimension_Date]
	ALTER TABLE [Fact].[Sale] DROP CONSTRAINT [FK_Fact_Sale_Salesperson_Key_Dimension_Employee]
	ALTER TABLE [Fact].[Sale] DROP CONSTRAINT [FK_Fact_Sale_Stock_Item_Key_Dimension_Stock Item]
	ALTER TABLE [Fact].[Sale] DROP CONSTRAINT [FK_Fact_Sale_Bill_To_Customer_Key_Dimension_Customer]
	ALTER TABLE [Fact].[Sale] DROP CONSTRAINT [PK_Fact_Sale]
	DROP INDEX  IF EXISTS [FK_Fact_Sale_Bill_To_Customer_Key] ON [Fact].[Sale]
	DROP INDEX  IF EXISTS [FK_Fact_Sale_City_Key] ON [Fact].[Sale]
	DROP INDEX  IF EXISTS [FK_Fact_Sale_Customer_Key] ON [Fact].[Sale]
	DROP INDEX  IF EXISTS [FK_Fact_Sale_Delivery_Date_Key] ON [Fact].[Sale]
	DROP INDEX  IF EXISTS [FK_Fact_Sale_Invoice_Date_Key] ON [Fact].[Sale]
	DROP INDEX  IF EXISTS [FK_Fact_Sale_Salesperson_Key] ON [Fact].[Sale]
	DROP INDEX  IF EXISTS [FK_Fact_Sale_Stock_Item_Key] ON [Fact].[Sale]

	WHILE @DateCounter < '20121231'
	BEGIN
		SET @OutputCounter = CONVERT(varchar(20), @DateCounter, 112);
		RAISERROR(@OutputCounter, 0, 1) WITH NOWAIT;

		SET @StartingSaleKey = @MaximumSaleKey - @NumberOfSalesPerDay - FLOOR(RAND() * 20000);
		SET @OrderCounter = 0;

		INSERT Fact.Sale WITH (TABLOCK)
			([City Key], [Customer Key], [Bill To Customer Key], [Stock Item Key], [Invoice Date Key],
			 [Delivery Date Key], [Salesperson Key], [WWI Invoice ID], [Description],
			 Package, Quantity, [Unit Price], [Tax Rate], [Total Excluding Tax],
			 [Tax Amount], Profit, [Total Including Tax], [Total Dry Items], [Total Chiller Items],
			 [Lineage Key])
		SELECT TOP(@NumberOfSalesPerDay)
			   [City Key], [Customer Key], [Bill To Customer Key], [Stock Item Key], @DateCounter,
			   DATEADD(day, 1, @DateCounter), [Salesperson Key], [WWI Invoice ID], [Description],
			   Package, Quantity, [Unit Price], [Tax Rate], [Total Excluding Tax],
			   [Tax Amount], Profit, [Total Including Tax], [Total Dry Items], [Total Chiller Items],
			   @LineageKey
		FROM Fact.Sale
		WHERE [Sale Key] > @StartingSaleKey
			and [Invoice Date Key] >='2013-01-01'
		ORDER BY [Sale Key];

		SET @DateCounter = DATEADD(day, 1, @DateCounter);
	END;

	--RAISERROR('Compressing all open Rowgroups', 0, 1) WITH NOWAIT;

	--ALTER INDEX CCX_Fact_Sale
	--ON Fact.Sale
	--REORGANIZE WITH (COMPRESS_ALL_ROW_GROUPS = ON);

	UPDATE Integration.Lineage
		SET [Data Load Completed] = SYSDATETIME(),
		    [Was Successful] = 1;

	-- Add back Constraints
	RAISERROR('Adding Constraints', 0, 1) WITH NOWAIT;

	ALTER TABLE [Fact].[Sale]
	ADD CONSTRAINT [PK_Fact_Sale] PRIMARY KEY NONCLUSTERED
	(
		[Sale Key] ASC,
		[Invoice Date Key] ASC
	);

	ALTER TABLE [Fact].[Sale]
	WITH CHECK ADD CONSTRAINT [FK_Fact_Sale_Bill_To_Customer_Key_Dimension_Customer]
	FOREIGN KEY([Bill To Customer Key])
	REFERENCES [Dimension].[Customer] ([Customer Key]);

	ALTER TABLE [Fact].[Sale] CHECK CONSTRAINT [FK_Fact_Sale_Bill_To_Customer_Key_Dimension_Customer];

	ALTER TABLE [Fact].[Sale]
	WITH CHECK ADD CONSTRAINT [FK_Fact_Sale_Stock_Item_Key_Dimension_Stock Item]
	FOREIGN KEY([Stock Item Key])
	REFERENCES [Dimension].[Stock Item] ([Stock Item Key]);

	ALTER TABLE [Fact].[Sale] CHECK CONSTRAINT [FK_Fact_Sale_Stock_Item_Key_Dimension_Stock Item];

	ALTER TABLE [Fact].[Sale]
	WITH CHECK ADD  CONSTRAINT [FK_Fact_Sale_Salesperson_Key_Dimension_Employee]
	FOREIGN KEY([Salesperson Key])
	REFERENCES [Dimension].[Employee] ([Employee Key]);

	ALTER TABLE [Fact].[Sale] CHECK CONSTRAINT [FK_Fact_Sale_Salesperson_Key_Dimension_Employee];

	ALTER TABLE [Fact].[Sale]
	WITH CHECK ADD  CONSTRAINT [FK_Fact_Sale_Invoice_Date_Key_Dimension_Date]
	FOREIGN KEY([Invoice Date Key])
	REFERENCES [Dimension].[Date] ([Date]);

	ALTER TABLE [Fact].[Sale] CHECK CONSTRAINT [FK_Fact_Sale_Invoice_Date_Key_Dimension_Date];

	ALTER TABLE [Fact].[Sale]
	WITH CHECK ADD CONSTRAINT [FK_Fact_Sale_Delivery_Date_Key_Dimension_Date]
	FOREIGN KEY([Delivery Date Key])
	REFERENCES [Dimension].[Date] ([Date]);

	ALTER TABLE [Fact].[Sale] CHECK CONSTRAINT [FK_Fact_Sale_Delivery_Date_Key_Dimension_Date];

	ALTER TABLE [Fact].[Sale]
	WITH CHECK ADD CONSTRAINT [FK_Fact_Sale_Customer_Key_Dimension_Customer]
	FOREIGN KEY([Customer Key])
	REFERENCES [Dimension].[Customer] ([Customer Key]);

	ALTER TABLE [Fact].[Sale] CHECK CONSTRAINT [FK_Fact_Sale_Customer_Key_Dimension_Customer];

	ALTER TABLE [Fact].[Sale]
	WITH CHECK ADD  CONSTRAINT [FK_Fact_Sale_City_Key_Dimension_City]
	FOREIGN KEY([City Key])
	REFERENCES [Dimension].[City] ([City Key]);

	ALTER TABLE [Fact].[Sale] CHECK CONSTRAINT [FK_Fact_Sale_City_Key_Dimension_City];

	-- Recreate indexes
	RAISERROR('Adding Non-clustered Indexes', 0, 1) WITH NOWAIT;
	CREATE NONCLUSTERED INDEX [FK_Fact_Sale_Salesperson_Key] ON [Fact].[Sale] ([Salesperson Key] ASC);
	CREATE NONCLUSTERED INDEX [FK_Fact_Sale_Invoice_Date_Key] ON [Fact].[Sale] ([Invoice Date Key] ASC);
	CREATE NONCLUSTERED INDEX [FK_Fact_Sale_Delivery_Date_Key] ON [Fact].[Sale] ([Delivery Date Key] ASC);
	CREATE NONCLUSTERED INDEX [FK_Fact_Sale_Bill_To_Customer_Key] ON [Fact].[Sale] ([Bill To Customer Key] ASC);
	CREATE NONCLUSTERED INDEX [FK_Fact_Sale_City_Key] ON [Fact].[Sale] ([City Key] ASC);
	CREATE NONCLUSTERED INDEX [FK_Fact_Sale_Customer_Key] ON [Fact].[Sale] ([Customer Key] ASC);

	RETURN 0;
END;