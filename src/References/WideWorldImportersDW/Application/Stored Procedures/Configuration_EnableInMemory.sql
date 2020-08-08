
CREATE PROCEDURE [Application].[Configuration_EnableInMemory]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF SERVERPROPERTY(N'IsXTPSupported') = 0
    BEGIN
        PRINT N'Warning: In-memory tables cannot be created on this edition.';
    END ELSE BEGIN -- if in-memory can be created

		DECLARE @SQL nvarchar(max) = N'';

		BEGIN TRY
			IF CAST(SERVERPROPERTY(N'EngineEdition') AS int) <> 5   -- Not an Azure SQL DB
			BEGIN
				DECLARE @SQLDataFolder nvarchar(max) = (SELECT SUBSTRING(df.physical_name, 1, CHARINDEX(N'WideWorldImportersDW.mdf', df.physical_name, 1) - 1)
				                                        FROM sys.database_files AS df
				                                        WHERE df.file_id = 1);
				DECLARE @MemoryOptimizedFilegroupFolder nvarchar(max) = @SQLDataFolder + N'WideWorldImportersDW_InMemory_Data_1';

				IF NOT EXISTS (SELECT 1 FROM sys.filegroups WHERE name = N'WWIDW_InMemory_Data')
				BEGIN
				    SET @SQL = N'
ALTER DATABASE CURRENT
ADD FILEGROUP WWIDW_InMemory_Data CONTAINS MEMORY_OPTIMIZED_DATA;';
					EXECUTE (@SQL);

					SET @SQL = N'
ALTER DATABASE CURRENT
ADD FILE (name = N''WWIDW_InMemory_Data_1'', filename = '''
		                 + @MemoryOptimizedFilegroupFolder + N''')
TO FILEGROUP WWIDW_InMemory_Data;';
					EXECUTE (@SQL);

				END;
            END;

			SET @SQL = N'
ALTER DATABASE CURRENT
SET MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = ON;';
			EXECUTE (@SQL);

            IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = N'Customer_Staging' AND is_memory_optimized <> 0)
            BEGIN

                SET @SQL = N'
DROP TABLE IF EXISTS Integration.Customer_Staging;';
                EXECUTE (@SQL);

                SET @SQL = N'
CREATE TABLE [Integration].[Customer_Staging]
(
	[Customer Staging Key] [int] IDENTITY(1,1) NOT NULL,
	[WWI Customer ID] [int] NOT NULL,
	[Customer] [nvarchar](100) NOT NULL,
	[Bill To Customer] [nvarchar](100) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Buying Group] [nvarchar](50) NOT NULL,
	[Primary Contact] [nvarchar](50) NOT NULL,
	[Postal Code] [nvarchar](10) NOT NULL,
	[Valid From] [datetime2](7) NOT NULL,
	[Valid To] [datetime2](7) NOT NULL,
    CONSTRAINT PK_Integration_Customer_Staging PRIMARY KEY NONCLUSTERED ([Customer Staging Key])
) WITH (MEMORY_OPTIMIZED = ON ,DURABILITY = SCHEMA_ONLY);';
                EXECUTE (@SQL);
			END;

            IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = N'Employee_Staging' AND is_memory_optimized <> 0)
            BEGIN

                SET @SQL = N'
DROP TABLE IF EXISTS Integration.Employee_Staging;';
                EXECUTE (@SQL);

                SET @SQL = N'
CREATE TABLE [Integration].[Employee_Staging]
(
	[Employee Staging Key] [int] IDENTITY(1,1) NOT NULL,
	[WWI Employee ID] [int] NOT NULL,
	[Employee] [nvarchar](50) NOT NULL,
	[Preferred Name] [nvarchar](50) NOT NULL,
	[Is Salesperson] [bit] NOT NULL,
	[Photo] [varbinary](max) NULL,
	[Valid From] [datetime2](7) NOT NULL,
	[Valid To] [datetime2](7) NOT NULL,
    CONSTRAINT PK_Integration_Employee_Staging PRIMARY KEY NONCLUSTERED ([Employee Staging Key])
) WITH (MEMORY_OPTIMIZED = ON ,DURABILITY = SCHEMA_ONLY);';
                EXECUTE (@SQL);
			END;

			IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = N'Movement_Staging' AND is_memory_optimized <> 0)
            BEGIN

                SET @SQL = N'
DROP TABLE IF EXISTS Integration.Movement_Staging;';
                EXECUTE (@SQL);

                SET @SQL = N'
CREATE TABLE [Integration].[Movement_Staging]
(
	[Movement Staging Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Date Key] [date] NULL,
	[Stock Item Key] [int] NULL,
	[Customer Key] [int] NULL,
	[Supplier Key] [int] NULL,
	[Transaction Type Key] [int] NULL,
	[WWI Stock Item Transaction ID] [int] NULL,
	[WWI Invoice ID] [int] NULL,
	[WWI Purchase Order ID] [int] NULL,
	[Quantity] [int] NULL,
	[WWI Stock Item ID] [int] NULL,
	[WWI Customer ID] [int] NULL,
	[WWI Supplier ID] [int] NULL,
	[WWI Transaction Type ID] [int] NULL,
	[Last Modifed When] [datetime2](7) NULL,
    CONSTRAINT PK_Integration_Movement_Staging PRIMARY KEY NONCLUSTERED ([Movement Staging Key])
) WITH (MEMORY_OPTIMIZED = ON ,DURABILITY = SCHEMA_ONLY);';
                EXECUTE (@SQL);
			END;

			IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = N'Order_Staging' AND is_memory_optimized <> 0)
            BEGIN

                SET @SQL = N'
DROP TABLE IF EXISTS Integration.Order_Staging;';
                EXECUTE (@SQL);

                SET @SQL = N'
CREATE TABLE [Integration].[Order_Staging](
	[Order Staging Key] [bigint] IDENTITY(1,1) NOT NULL,
	[City Key] [int] NULL,
	[Customer Key] [int] NULL,
	[Stock Item Key] [int] NULL,
	[Order Date Key] [date] NULL,
	[Picked Date Key] [date] NULL,
	[Salesperson Key] [int] NULL,
	[Picker Key] [int] NULL,
	[WWI Order ID] [int] NULL,
	[WWI Backorder ID] [int] NULL,
	[Description] [nvarchar](100) NULL,
	[Package] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[Unit Price] [decimal](18, 2) NULL,
	[Tax Rate] [decimal](18, 3) NULL,
	[Total Excluding Tax] [decimal](18, 2) NULL,
	[Tax Amount] [decimal](18, 2) NULL,
	[Total Including Tax] [decimal](18, 2) NULL,
	[Lineage Key] [int] NULL,
	[WWI City ID] [int] NULL,
	[WWI Customer ID] [int] NULL,
	[WWI Stock Item ID] [int] NULL,
	[WWI Salesperson ID] [int] NULL,
	[WWI Picker ID] [int] NULL,
	[Last Modified When] [datetime2](7) NULL,
    CONSTRAINT PK_Integration_Order_Staging PRIMARY KEY NONCLUSTERED ([Order Staging Key])
) WITH (MEMORY_OPTIMIZED = ON ,DURABILITY = SCHEMA_ONLY);';
                EXECUTE (@SQL);
			END;

			IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = N'PaymentMethod_Staging' AND is_memory_optimized <> 0)
            BEGIN

                SET @SQL = N'
DROP TABLE IF EXISTS Integration.PaymentMethod_Staging;';
                EXECUTE (@SQL);

                SET @SQL = N'
CREATE TABLE [Integration].[PaymentMethod_Staging]
(
	[Payment Method Staging Key] [int] IDENTITY(1,1) NOT NULL,
	[WWI Payment Method ID] [int] NOT NULL,
	[Payment Method] [nvarchar](50) NOT NULL,
	[Valid From] [datetime2](7) NOT NULL,
	[Valid To] [datetime2](7) NOT NULL,
    CONSTRAINT PK_Integration_Payment_Method_Staging PRIMARY KEY NONCLUSTERED ([Payment Method Staging Key])
) WITH (MEMORY_OPTIMIZED = ON ,DURABILITY = SCHEMA_ONLY);';
                EXECUTE (@SQL);
			END;

			IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = N'Purchase_Staging' AND is_memory_optimized <> 0)
            BEGIN

                SET @SQL = N'
DROP TABLE IF EXISTS Integration.Purchase_Staging;';
                EXECUTE (@SQL);

                SET @SQL = N'
CREATE TABLE [Integration].[Purchase_Staging]
(
	[Purchase Staging Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Date Key] [date] NULL,
	[Supplier Key] [int] NULL,
	[Stock Item Key] [int] NULL,
	[WWI Purchase Order ID] [int] NULL,
	[Ordered Outers] [int] NULL,
	[Ordered Quantity] [int] NULL,
	[Received Outers] [int] NULL,
	[Package] [nvarchar](50) NULL,
	[Is Order Finalized] [bit] NULL,
	[WWI Supplier ID] [int] NULL,
	[WWI Stock Item ID] [int] NULL,
	[Last Modified When] [datetime2](7) NULL,
    CONSTRAINT PK_Integration_Purchase_Staging PRIMARY KEY NONCLUSTERED ([Purchase Staging Key])
) WITH (MEMORY_OPTIMIZED = ON ,DURABILITY = SCHEMA_ONLY);';
                EXECUTE (@SQL);
			END;

			IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = N'Sale_Staging' AND is_memory_optimized <> 0)
            BEGIN

                SET @SQL = N'
DROP TABLE IF EXISTS Integration.Sale_Staging;';
                EXECUTE (@SQL);

                SET @SQL = N'
CREATE TABLE [Integration].[Sale_Staging]
(
	[Sale Staging Key] [bigint] IDENTITY(1,1) NOT NULL,
	[City Key] [int] NULL,
	[Customer Key] [int] NULL,
	[Bill To Customer Key] [int] NULL,
	[Stock Item Key] [int] NULL,
	[Invoice Date Key] [date] NULL,
	[Delivery Date Key] [date] NULL,
	[Salesperson Key] [int] NULL,
	[WWI Invoice ID] [int] NULL,
	[Description] [nvarchar](100) NULL,
	[Package] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[Unit Price] [decimal](18, 2) NULL,
	[Tax Rate] [decimal](18, 3) NULL,
	[Total Excluding Tax] [decimal](18, 2) NULL,
	[Tax Amount] [decimal](18, 2) NULL,
	[Profit] [decimal](18, 2) NULL,
	[Total Including Tax] [decimal](18, 2) NULL,
	[Total Dry Items] [int] NULL,
	[Total Chiller Items] [int] NULL,
	[WWI City ID] [int] NULL,
	[WWI Customer ID] [int] NULL,
	[WWI Bill To Customer ID] [int] NULL,
	[WWI Stock Item ID] [int] NULL,
	[WWI Salesperson ID] [int] NULL,
	[Last Modified When] [datetime2](7) NULL,
    CONSTRAINT PK_Integration_Sale_Staging PRIMARY KEY NONCLUSTERED ([Sale Staging Key])
) WITH (MEMORY_OPTIMIZED = ON ,DURABILITY = SCHEMA_ONLY);';
                EXECUTE (@SQL);
			END;

			IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = N'StockHolding_Staging' AND is_memory_optimized <> 0)
            BEGIN

                SET @SQL = N'
DROP TABLE IF EXISTS Integration.StockHolding_Staging;';
                EXECUTE (@SQL);

                SET @SQL = N'
CREATE TABLE [Integration].[StockHolding_Staging]
(
	[Stock Holding Staging Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Stock Item Key] [int] NULL,
	[Quantity On Hand] [int] NULL,
	[Bin Location] [nvarchar](20) NULL,
	[Last Stocktake Quantity] [int] NULL,
	[Last Cost Price] [decimal](18, 2) NULL,
	[Reorder Level] [int] NULL,
	[Target Stock Level] [int] NULL,
	[WWI Stock Item ID] [int] NULL,
    CONSTRAINT PK_Integration_Stock_Holding_Staging PRIMARY KEY NONCLUSTERED ([Stock Holding Staging Key])
) WITH (MEMORY_OPTIMIZED = ON ,DURABILITY = SCHEMA_ONLY);';
                EXECUTE (@SQL);
			END;

			IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = N'StockItem_Staging' AND is_memory_optimized <> 0)
            BEGIN

                SET @SQL = N'
DROP TABLE IF EXISTS Integration.StockItem_Staging;';
                EXECUTE (@SQL);

                SET @SQL = N'
CREATE TABLE [Integration].[StockItem_Staging]
(
	[Stock Item Staging Key] [int] IDENTITY(1,1) NOT NULL,
	[WWI Stock Item ID] [int] NOT NULL,
	[Stock Item] [nvarchar](100) NOT NULL,
	[Color] [nvarchar](20) NOT NULL,
	[Selling Package] [nvarchar](50) NOT NULL,
	[Buying Package] [nvarchar](50) NOT NULL,
	[Brand] [nvarchar](50) NOT NULL,
	[Size] [nvarchar](20) NOT NULL,
	[Lead Time Days] [int] NOT NULL,
	[Quantity Per Outer] [int] NOT NULL,
	[Is Chiller Stock] [bit] NOT NULL,
	[Barcode] [nvarchar](50) NULL,
	[Tax Rate] [decimal](18, 3) NOT NULL,
	[Unit Price] [decimal](18, 2) NOT NULL,
	[Recommended Retail Price] [decimal](18, 2) NULL,
	[Typical Weight Per Unit] [decimal](18, 3) NOT NULL,
	[Photo] [varbinary](max) NULL,
	[Valid From] [datetime2](7) NOT NULL,
	[Valid To] [datetime2](7) NOT NULL,
    CONSTRAINT PK_Integration_Stock_Item_Staging PRIMARY KEY NONCLUSTERED ([Stock Item Staging Key])
) WITH (MEMORY_OPTIMIZED = ON ,DURABILITY = SCHEMA_ONLY);';
                EXECUTE (@SQL);
			END;

			IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = N'Supplier_Staging' AND is_memory_optimized <> 0)
            BEGIN

                SET @SQL = N'
DROP TABLE IF EXISTS Integration.Supplier_Staging;';
                EXECUTE (@SQL);

                SET @SQL = N'
CREATE TABLE [Integration].[Supplier_Staging]
(
	[Supplier Staging Key] [int] IDENTITY(1,1) NOT NULL,
	[WWI Supplier ID] [int] NOT NULL,
	[Supplier] [nvarchar](100) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Primary Contact] [nvarchar](50) NOT NULL,
	[Supplier Reference] [nvarchar](20) NULL,
	[Payment Days] [int] NOT NULL,
	[Postal Code] [nvarchar](10) NOT NULL,
	[Valid From] [datetime2](7) NOT NULL,
	[Valid To] [datetime2](7) NOT NULL,
    CONSTRAINT PK_Integration_Supplier_Staging PRIMARY KEY NONCLUSTERED ([Supplier Staging Key])
) WITH (MEMORY_OPTIMIZED = ON ,DURABILITY = SCHEMA_ONLY);';
                EXECUTE (@SQL);
			END;

			IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = N'Transaction_Staging' AND is_memory_optimized <> 0)
            BEGIN

                SET @SQL = N'
DROP TABLE IF EXISTS Integration.Transaction_Staging;';
                EXECUTE (@SQL);

                SET @SQL = N'
CREATE TABLE [Integration].[Transaction_Staging]
(
	[Transaction Staging Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Date Key] [date] NULL,
	[Customer Key] [int] NULL,
	[Bill To Customer Key] [int] NULL,
	[Supplier Key] [int] NULL,
	[Transaction Type Key] [int] NULL,
	[Payment Method Key] [int] NULL,
	[WWI Customer Transaction ID] [int] NULL,
	[WWI Supplier Transaction ID] [int] NULL,
	[WWI Invoice ID] [int] NULL,
	[WWI Purchase Order ID] [int] NULL,
	[Supplier Invoice Number] [nvarchar](20) NULL,
	[Total Excluding Tax] [decimal](18, 2) NULL,
	[Tax Amount] [decimal](18, 2) NULL,
	[Total Including Tax] [decimal](18, 2) NULL,
	[Outstanding Balance] [decimal](18, 2) NULL,
	[Is Finalized] [bit] NULL,
	[WWI Customer ID] [int] NULL,
	[WWI Bill To Customer ID] [int] NULL,
	[WWI Supplier ID] [int] NULL,
	[WWI Transaction Type ID] [int] NULL,
	[WWI Payment Method ID] [int] NULL,
	[Last Modified When] [datetime2](7) NULL,
    CONSTRAINT PK_Integration_Transaction_Staging PRIMARY KEY NONCLUSTERED ([Transaction Staging Key])
) WITH (MEMORY_OPTIMIZED = ON ,DURABILITY = SCHEMA_ONLY);';
                EXECUTE (@SQL);
			END;

			IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = N'TransactionType_Staging' AND is_memory_optimized <> 0)
            BEGIN

                SET @SQL = N'
DROP TABLE IF EXISTS Integration.TransactionType_Staging;';
                EXECUTE (@SQL);

                SET @SQL = N'
CREATE TABLE [Integration].[TransactionType_Staging]
(
	[Transaction Type Staging Key] [int] IDENTITY(1,1) NOT NULL,
	[WWI Transaction Type ID] [int] NOT NULL,
	[Transaction Type] [nvarchar](50) NOT NULL,
	[Valid From] [datetime2](7) NOT NULL,
	[Valid To] [datetime2](7) NOT NULL
    CONSTRAINT PK_Integration_Transaction_Type_Staging PRIMARY KEY NONCLUSTERED ([Transaction Type Staging Key])
) WITH (MEMORY_OPTIMIZED = ON ,DURABILITY = SCHEMA_ONLY);';
                EXECUTE (@SQL);
			END;

        END TRY
        BEGIN CATCH
            PRINT N'Unable to apply in-memory tables';
            THROW;
        END CATCH;
    END; -- of in-memory is allowed
END;