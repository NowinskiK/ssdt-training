
CREATE PROCEDURE [Application].[Configuration_ApplyPartitionedColumnstoreIndexing]
WITH EXECUTE AS OWNER
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF SERVERPROPERTY(N'IsXTPSupported') = 0 -- TODO !! - currently no separate test for columnstore
    BEGIN                                    -- but same editions with XTP support columnstore
        PRINT N'Warning: Columnstore indexes cannot be created on this edition.';
    END ELSE BEGIN -- if columnstore can be created
        DECLARE @SQL nvarchar(max) = N'';

        BEGIN TRY;

			IF NOT EXISTS (SELECT 1 FROM sys.partition_functions WHERE name = N'PF_Date')
			BEGIN
				SET @SQL =  N'
CREATE PARTITION FUNCTION PF_Date(date)
AS RANGE RIGHT
FOR VALUES (N''20120101'',N''20130101'',N''20140101'', N''20150101'', N''20160101'', N''20170101'');';
				EXECUTE (@SQL);
				PRINT N'Created partition function PF_Date';
			END;

			IF NOT EXISTS (SELECT 1 FROM sys.partition_schemes WHERE name = N'PS_Date')
			BEGIN
				-- for Azure DB, assign to primary filegroup
				IF SERVERPROPERTY('EngineEdition') = 5 
					SET @SQL =  N'
CREATE PARTITION SCHEME PS_Date
AS PARTITION PF_Date
ALL TO ([PRIMARY]);';				
				-- for other engine editions, assign to user data filegroup
				IF SERVERPROPERTY('EngineEdition') != 5 
					SET @SQL =  N'
CREATE PARTITION SCHEME PS_Date
AS PARTITION PF_Date
ALL TO ([USERDATA]);';
				EXECUTE (@SQL);
				PRINT N'Created partition scheme PS_Date';
			END;
			
            IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'CCX_Fact_Movement')
            BEGIN
				BEGIN TRAN;

                SET @SQL = N'

DROP INDEX [FK_Fact_Movement_Customer_Key] ON Fact.Movement;
DROP INDEX [FK_Fact_Movement_Date_Key] ON Fact.Movement;
DROP INDEX [FK_Fact_Movement_Stock_Item_Key] ON Fact.Movement;
DROP INDEX [FK_Fact_Movement_Supplier_Key] ON Fact.Movement;
DROP INDEX [FK_Fact_Movement_Transaction_Type_Key] ON Fact.Movement;
DROP INDEX [IX_Integration_Movement_WWI_Stock_Item_Transaction_ID] ON Fact.Movement;

ALTER TABLE Fact.Movement
DROP CONSTRAINT PK_Fact_Movement;

CREATE CLUSTERED INDEX CCX_Fact_Movement
ON Fact.Movement
(
	[Date Key]
)
ON PS_Date([Date Key]);

CREATE CLUSTERED COLUMNSTORE INDEX CCX_Fact_Movement
ON Fact.Movement WITH (DROP_EXISTING = ON)
ON PS_Date([Date Key]);

ALTER TABLE [Fact].[Movement]
ADD  CONSTRAINT [PK_Fact_Movement] PRIMARY KEY NONCLUSTERED
(
	[Movement Key],
	[Date Key]
)
ON PS_Date([Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Movement_Customer_Key]
ON [Fact].[Movement]
(
	[Customer Key]
)
ON PS_Date([Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Movement_Date_Key]
ON [Fact].[Movement]
(
	[Date Key]
)
ON PS_Date([Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Movement_Stock_Item_Key]
ON [Fact].[Movement]
(
	[Stock Item Key]
)
ON PS_Date([Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Movement_Supplier_Key]
ON [Fact].[Movement]
(
	[Supplier Key]
)
ON PS_Date([Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Movement_Transaction_Type_Key]
ON [Fact].[Movement]
(
	[Transaction Type Key]
)
ON PS_Date([Date Key]);

CREATE NONCLUSTERED INDEX [IX_Integration_Movement_WWI_Stock_Item_Transaction_ID]
ON [Fact].[Movement]
(
	[WWI Stock Item Transaction ID]
)
ON PS_Date([Date Key]);

DROP INDEX [FK_Fact_Order_City_Key] ON Fact.[Order];
DROP INDEX [FK_Fact_Order_Customer_Key] ON Fact.[Order];
DROP INDEX [FK_Fact_Order_Order_Date_Key] ON Fact.[Order];
DROP INDEX [FK_Fact_Order_Picked_Date_Key] ON Fact.[Order];
DROP INDEX [FK_Fact_Order_Picker_Key] ON Fact.[Order];
DROP INDEX [FK_Fact_Order_Salesperson_Key] ON Fact.[Order];
DROP INDEX [FK_Fact_Order_Stock_Item_Key] ON Fact.[Order];
DROP INDEX [IX_Integration_Order_WWI_Order_ID] ON Fact.[Order];

ALTER TABLE Fact.[Order]
DROP CONSTRAINT PK_Fact_Order;

CREATE CLUSTERED INDEX CCX_Fact_Order
ON Fact.[Order]
(
	[Order Date Key]
)
ON PS_Date([Order Date Key]);

CREATE CLUSTERED COLUMNSTORE INDEX CCX_Fact_Order
ON Fact.[Order] WITH (DROP_EXISTING = ON)
ON PS_Date([Order Date Key]);

ALTER TABLE [Fact].[Order]
ADD  CONSTRAINT [PK_Fact_Order] PRIMARY KEY NONCLUSTERED
(
	[Order Key],
	[Order Date Key]
)
ON PS_Date([Order Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Order_City_Key]
ON [Fact].[Order]
(
	[City Key]
)
ON PS_Date([Order Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Order_Customer_Key]
ON [Fact].[Order]
(
	[Customer Key]
)
ON PS_Date([Order Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Order_Order_Date_Key]
ON [Fact].[Order]
(
	[Order Date Key]
)
ON PS_Date([Order Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Order_Picked_Date_Key]
ON [Fact].[Order]
(
	[Picked Date Key]
)
ON PS_Date([Order Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Order_Picker_Key]
ON [Fact].[Order]
(
	[Picker Key] ASC
)
ON PS_Date([Order Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Order_Salesperson_Key]
ON [Fact].[Order]
(
	[Salesperson Key]
)
ON PS_Date([Order Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Order_Stock_Item_Key]
ON [Fact].[Order]
(
	[Stock Item Key]
)
ON PS_Date([Order Date Key]);

CREATE NONCLUSTERED INDEX [IX_Integration_Order_WWI_Order_ID]
ON [Fact].[Order]
(
	[WWI Order ID]
)
ON PS_Date([Order Date Key]);

DROP INDEX [FK_Fact_Purchase_Date_Key] ON Fact.Purchase;
DROP INDEX [FK_Fact_Purchase_Stock_Item_Key] ON Fact.Purchase;
DROP INDEX [FK_Fact_Purchase_Supplier_Key] ON Fact.Purchase;

ALTER TABLE Fact.Purchase
DROP CONSTRAINT PK_Fact_Purchase;

CREATE CLUSTERED INDEX CCX_Fact_Purchase
ON Fact.Purchase
(
	[Date Key]
)
ON PS_Date([Date Key]);

CREATE CLUSTERED COLUMNSTORE INDEX CCX_Fact_Purchase
ON Fact.Purchase WITH (DROP_EXISTING = ON)
ON PS_Date([Date Key]);

ALTER TABLE Fact.Purchase
ADD CONSTRAINT [PK_Fact_Purchase] PRIMARY KEY NONCLUSTERED
(
	[Purchase Key],
	[Date Key]
)
ON PS_Date([Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Purchase_Date_Key]
ON [Fact].[Purchase]
(
	[Date Key]
)
ON PS_Date([Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Purchase_Stock_Item_Key]
ON [Fact].[Purchase]
(
	[Stock Item Key]
)
ON PS_Date([Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Purchase_Supplier_Key]
ON [Fact].[Purchase]
(
	[Supplier Key]
)
ON PS_Date([Date Key]);

DROP INDEX [FK_Fact_Sale_Bill_To_Customer_Key] ON Fact.Sale;
DROP INDEX [FK_Fact_Sale_City_Key] ON Fact.Sale;
DROP INDEX [FK_Fact_Sale_Customer_Key] ON Fact.Sale;
DROP INDEX [FK_Fact_Sale_Delivery_Date_Key] ON Fact.Sale;
DROP INDEX [FK_Fact_Sale_Invoice_Date_Key] ON Fact.Sale;
DROP INDEX [FK_Fact_Sale_Salesperson_Key] ON Fact.Sale;
DROP INDEX [FK_Fact_Sale_Stock_Item_Key] ON Fact.Sale;

ALTER TABLE Fact.Sale
DROP CONSTRAINT PK_Fact_Sale;

CREATE CLUSTERED INDEX CCX_Fact_Sale
ON Fact.Sale
(
	[Invoice Date Key]
)
ON PS_Date([Invoice Date Key]);

CREATE CLUSTERED COLUMNSTORE INDEX CCX_Fact_Sale
ON Fact.Sale WITH (DROP_EXISTING = ON)
ON PS_Date([Invoice Date Key]);

ALTER TABLE Fact.Sale
ADD CONSTRAINT [PK_Fact_Sale] PRIMARY KEY NONCLUSTERED
(
	[Sale Key],
	[Invoice Date Key]
)
ON PS_Date([Invoice Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Sale_Bill_To_Customer_Key]
ON [Fact].[Sale]
(
	[Bill To Customer Key]
)
ON PS_Date([Invoice Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Sale_City_Key]
ON [Fact].[Sale]
(
	[City Key]
)
ON PS_Date([Invoice Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Sale_Customer_Key]
ON [Fact].[Sale]
(
	[Customer Key]
)
ON PS_Date([Invoice Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Sale_Delivery_Date_Key]
ON [Fact].[Sale]
(
	[Delivery Date Key]
)
ON PS_Date([Invoice Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Sale_Invoice_Date_Key]
ON [Fact].[Sale]
(
	[Invoice Date Key]
)
ON PS_Date([Invoice Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Sale_Salesperson_Key]
ON [Fact].[Sale]
(
	[Salesperson Key]
)
ON PS_Date([Invoice Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Sale_Stock_Item_Key]
ON [Fact].[Sale]
(
	[Stock Item Key]
)
ON PS_Date([Invoice Date Key]);

ALTER TABLE Fact.[Stock Holding]
DROP CONSTRAINT PK_Fact_Stock_Holding;

ALTER TABLE Fact.[Stock Holding]
ADD CONSTRAINT PK_Fact_Stock_Holding PRIMARY KEY NONCLUSTERED ([Stock Holding Key]);

CREATE CLUSTERED COLUMNSTORE INDEX CCX_Fact_Stock_Holding
ON Fact.[Stock Holding];

DROP INDEX [FK_Fact_Transaction_Bill_To_Customer_Key] ON Fact.[Transaction];
DROP INDEX [FK_Fact_Transaction_Customer_Key] ON Fact.[Transaction];
DROP INDEX [FK_Fact_Transaction_Date_Key] ON Fact.[Transaction];
DROP INDEX [FK_Fact_Transaction_Payment_Method_Key] ON Fact.[Transaction];
DROP INDEX [FK_Fact_Transaction_Supplier_Key] ON Fact.[Transaction];
DROP INDEX [FK_Fact_Transaction_Transaction_Type_Key] ON Fact.[Transaction];

ALTER TABLE Fact.[Transaction]
DROP CONSTRAINT PK_Fact_Transaction;

CREATE CLUSTERED INDEX CCX_Fact_Transaction
ON Fact.[Transaction]
(
	[Date Key]
)
ON PS_Date([Date Key]);

CREATE CLUSTERED COLUMNSTORE INDEX CCX_Fact_Transaction
ON Fact.[Transaction] WITH (DROP_EXISTING = ON)
ON PS_Date([Date Key]);

ALTER TABLE Fact.[Transaction]
ADD CONSTRAINT [PK_Fact_Transaction] PRIMARY KEY NONCLUSTERED
(
	[Transaction Key],
	[Date Key]
)
ON PS_Date([Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Transaction_Bill_To_Customer_Key]
ON [Fact].[Transaction]
(
	[Bill To Customer Key]
)
ON PS_Date([Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Transaction_Customer_Key]
ON [Fact].[Transaction]
(
	[Customer Key]
)
ON PS_Date([Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Transaction_Date_Key]
ON [Fact].[Transaction]
(
	[Date Key]
)
ON PS_Date([Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Transaction_Payment_Method_Key]
ON [Fact].[Transaction]
(
	[Payment Method Key]
)
ON PS_Date([Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Transaction_Supplier_Key]
ON [Fact].[Transaction]
(
	[Supplier Key]
)
ON PS_Date([Date Key]);

CREATE NONCLUSTERED INDEX [FK_Fact_Transaction_Transaction_Type_Key]
ON [Fact].[Transaction]
(
	[Transaction Type Key]
)
ON PS_Date([Date Key]);';
                EXECUTE (@SQL);

				COMMIT;

                PRINT N'Applied partitioned columnstore indexing';
            END;

        END TRY
        BEGIN CATCH
            PRINT N'Unable to apply partitioned columnstore indexing';
            THROW;
        END CATCH;
    END; -- of partitioned columnstore is allowed
END;