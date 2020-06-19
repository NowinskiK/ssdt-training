
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
				DECLARE @SQLDataFolder nvarchar(max) = CAST(SERVERPROPERTY('InstanceDefaultDataPath') AS nvarchar(max));
				DECLARE @MemoryOptimizedFilegroupFolder nvarchar(max) = @SQLDataFolder + N'WideWorldImporters_InMemory_Data_1';

				IF NOT EXISTS (SELECT 1 FROM sys.filegroups WHERE name = N'WWI_InMemory_Data')
				BEGIN
				    SET @SQL = N'
ALTER DATABASE CURRENT
ADD FILEGROUP WWI_InMemory_Data CONTAINS MEMORY_OPTIMIZED_DATA;';
					EXECUTE (@SQL);

					SET @SQL = N'
ALTER DATABASE CURRENT
ADD FILE (name = N''WWI_InMemory_Data_1'', filename = '''
		                 + @MemoryOptimizedFilegroupFolder + N''')
TO FILEGROUP WWI_InMemory_Data;';
					EXECUTE (@SQL);

				END;
            END;

			SET @SQL = N'
ALTER DATABASE CURRENT
SET MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = ON;';
			EXECUTE (@SQL);

            IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = N'ColdRoomTemperatures' AND is_memory_optimized <> 0)
            BEGIN

                SET @SQL = N'
ALTER TABLE Warehouse.ColdRoomTemperatures SET (SYSTEM_VERSIONING = OFF);
ALTER TABLE Warehouse.ColdRoomTemperatures DROP PERIOD FOR SYSTEM_TIME;
ALTER TABLE Warehouse.ColdRoomTemperatures DROP CONSTRAINT PK_Warehouse_ColdRoomTemperatures;';
                EXECUTE (@SQL);

                SET @SQL = N'
EXEC dbo.sp_rename @objname = N''Warehouse.ColdRoomTemperatures'',
                   @newname = N''ColdRoomTemperatures_Backup'',
                   @objtype = N''OBJECT'';';
                EXECUTE (@SQL);

                SET @SQL = N'
CREATE TABLE Warehouse.ColdRoomTemperatures
(
    ColdRoomTemperatureID bigint IDENTITY(1,1) NOT NULL,
    ColdRoomSensorNumber int NOT NULL,
    RecordedWhen datetime2(7) NOT NULL,
    Temperature decimal(10, 2) NOT NULL,
    ValidFrom datetime2(7) NOT NULL,
    ValidTo datetime2(7) NOT NULL,
    INDEX [IX_Warehouse_ColdRoomTemperatures_ColdRoomSensorNumber] NONCLUSTERED (ColdRoomSensorNumber),
    CONSTRAINT PK_Warehouse_ColdRoomTemperatures PRIMARY KEY NONCLUSTERED (ColdRoomTemperatureID)
) WITH (MEMORY_OPTIMIZED = ON ,DURABILITY = SCHEMA_AND_DATA);';
                EXECUTE (@SQL);

                SET @SQL = N'
SET IDENTITY_INSERT Warehouse.ColdRoomTemperatures ON;

INSERT Warehouse.ColdRoomTemperatures (ColdRoomTemperatureID, ColdRoomSensorNumber, RecordedWhen, Temperature,
                                       ValidFrom, ValidTo)
SELECT ColdRoomTemperatureID, ColdRoomSensorNumber, RecordedWhen, Temperature, ValidFrom, ValidTo
FROM Warehouse.ColdRoomTemperatures_Backup;

SET IDENTITY_INSERT Warehouse.ColdRoomTemperatures OFF;';
                EXECUTE (@SQL);

                SET @SQL = N'DROP TABLE Warehouse.ColdRoomTemperatures_Backup;';
                EXECUTE (@SQL);

                SET @SQL = N'
ALTER TABLE Warehouse.ColdRoomTemperatures
ADD PERIOD FOR SYSTEM_TIME(ValidFrom, ValidTo);';
                EXECUTE (@SQL);

                SET @SQL = N'
ALTER TABLE Warehouse.ColdRoomTemperatures
SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Warehouse.ColdRoomTemperatures_Archive, DATA_CONSISTENCY_CHECK = ON));';
                EXECUTE (@SQL);

            END; -- of if we need to move ColdRoomTemperatures

            IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = N'VehicleTemperatures' AND is_memory_optimized <> 0)
            BEGIN

                SET @SQL = N'
ALTER TABLE Warehouse.VehicleTemperatures DROP CONSTRAINT PK_Warehouse_VehicleTemperatures;';
                EXECUTE (@SQL);

                SET @SQL = N'
EXEC dbo.sp_rename @objname = N''Warehouse.VehicleTemperatures'',
                   @newname = N''VehicleTemperatures_Backup'',
                   @objtype = N''OBJECT'';';
                EXECUTE (@SQL);

                SET @SQL = N'
CREATE TABLE Warehouse.VehicleTemperatures
(
	VehicleTemperatureID bigint IDENTITY(1,1) NOT NULL,
	VehicleRegistration nvarchar(20) COLLATE Latin1_General_CI_AS NOT NULL,
	ChillerSensorNumber int NOT NULL,
	RecordedWhen datetime2(7) NOT NULL,
	Temperature decimal(10, 2) NOT NULL,
	FullSensorData nvarchar(1000) COLLATE Latin1_General_CI_AS NULL,
    IsCompressed bit NOT NULL,
    CompressedSensorData varbinary(max) NULL,
    CONSTRAINT PK_Warehouse_VehicleTemperatures PRIMARY KEY NONCLUSTERED (VehicleTemperatureID)
) WITH (MEMORY_OPTIMIZED = ON , DURABILITY = SCHEMA_AND_DATA);';
                EXECUTE (@SQL);

                SET @SQL = N'
SET IDENTITY_INSERT Warehouse.VehicleTemperatures ON;

INSERT Warehouse.VehicleTemperatures
    (VehicleTemperatureID, VehicleRegistration, ChillerSensorNumber, RecordedWhen, Temperature, FullSensorData, IsCompressed, CompressedSensorData)
SELECT VehicleTemperatureID, VehicleRegistration, ChillerSensorNumber, RecordedWhen, Temperature, FullSensorData, IsCompressed, CompressedSensorData
FROM Warehouse.VehicleTemperatures_Backup;

SET IDENTITY_INSERT Warehouse.VehicleTemperatures OFF;';
                EXECUTE (@SQL);

                SET @SQL = N'DROP TABLE Warehouse.VehicleTemperatures_Backup;';
                EXECUTE (@SQL);

            END; -- of if we need to move VehicleTemperatures

            -- Drop the procedures that are used by the table types

            SET @SQL = N'DROP PROCEDURE IF EXISTS Website.InvoiceCustomerOrders;';
            EXECUTE (@SQL);
            SET @SQL = N'DROP PROCEDURE IF EXISTS Website.InsertCustomerOrders;';
            EXECUTE (@SQL);
			SET @SQL = N'DROP PROCEDURE IF EXISTS Website.RecordColdRoomTemperatures;';
			EXECUTE (@SQL);

            -- Drop the table types

            SET @SQL = N'DROP TYPE IF EXISTS Website.OrderIDList;';
            EXECUTE (@SQL);
            SET @SQL = N'DROP TYPE IF EXISTS Website.OrderLineList;';
            EXECUTE (@SQL);
            SET @SQL = N'DROP TYPE IF EXISTS Website.OrderList;';
            EXECUTE (@SQL);
            SET @SQL = N'DROP TYPE IF EXISTS Website.SensorDataList;';
            EXECUTE (@SQL);

            -- Create the new table types

            SET @SQL = N'
CREATE TYPE Website.OrderIDList AS TABLE
(
    OrderID int PRIMARY KEY NONCLUSTERED
)
WITH (MEMORY_OPTIMIZED = ON);';
            EXECUTE (@SQL);

            SET @SQL = N'
CREATE TYPE Website.OrderList AS TABLE
(
    OrderReference int PRIMARY KEY NONCLUSTERED,
    CustomerID int,
    ContactPersonID int,
    ExpectedDeliveryDate date,
    CustomerPurchaseOrderNumber nvarchar(20),
    IsUndersupplyBackordered bit,
    Comments nvarchar(max),
    DeliveryInstructions nvarchar(max)
)
WITH (MEMORY_OPTIMIZED = ON);';
            EXECUTE (@SQL);

            SET @SQL = N'
CREATE TYPE Website.OrderLineList AS TABLE
(
    OrderReference int,
    StockItemID int,
    [Description] nvarchar(100),
    Quantity int,
    INDEX IX_Website_OrderLineList NONCLUSTERED (OrderReference)
)
WITH (MEMORY_OPTIMIZED = ON);';
            EXECUTE (@SQL);

            SET @SQL = N'
CREATE TYPE Website.SensorDataList AS TABLE
(
	SensorDataListID int IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
	ColdRoomSensorNumber int,
	RecordedWhen datetime2(7),
	Temperature decimal(18,2)
)
WITH (MEMORY_OPTIMIZED = ON);';
            EXECUTE (@SQL);

            SET @SQL = N'
CREATE PROCEDURE Website.InvoiceCustomerOrders
@OrdersToInvoice Website.OrderIDList READONLY,
@PackedByPersonID int,
@InvoicedByPersonID int
WITH EXECUTE AS OWNER
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @InvoicesToGenerate TABLE
    (
        OrderID int PRIMARY KEY,
        InvoiceID int NOT NULL,
        TotalDryItems int NOT NULL,
        TotalChillerItems int NOT NULL
    );

    BEGIN TRY;

        -- Check that all orders exist, have been fully picked, and not already invoiced. Also allocate new invoice numbers.
        INSERT @InvoicesToGenerate (OrderID, InvoiceID, TotalDryItems, TotalChillerItems)
        SELECT oti.OrderID,
               NEXT VALUE FOR Sequences.InvoiceID,
               COALESCE((SELECT SUM(CASE WHEN si.IsChillerStock <> 0 THEN 0 ELSE 1 END)
                         FROM Sales.OrderLines AS ol
                         INNER JOIN Warehouse.StockItems AS si
                         ON ol.StockItemID = si.StockItemID
                         WHERE ol.OrderID = oti.OrderID), 0),
               COALESCE((SELECT SUM(CASE WHEN si.IsChillerStock <> 0 THEN 1 ELSE 0 END)
                         FROM Sales.OrderLines AS ol
                         INNER JOIN Warehouse.StockItems AS si
                         ON ol.StockItemID = si.StockItemID
                         WHERE ol.OrderID = oti.OrderID), 0)
        FROM @OrdersToInvoice AS oti
        INNER JOIN Sales.Orders AS o
        ON oti.OrderID = o.OrderID
        WHERE NOT EXISTS (SELECT 1 FROM Sales.Invoices AS i
                                   WHERE i.OrderID = oti.OrderID)
        AND o.PickingCompletedWhen IS NOT NULL;

        IF EXISTS (SELECT 1 FROM @OrdersToInvoice AS oti WHERE NOT EXISTS (SELECT 1 FROM @InvoicesToGenerate AS itg WHERE itg.OrderID = oti.OrderID))
        BEGIN
            PRINT N''At least one order ID either does not exist, is not picked, or is already invoiced'';
            THROW 51000, N''At least one orderID either does not exist, is not picked, or is already invoiced'', 1;
        END;

        BEGIN TRAN;

        INSERT Sales.Invoices
            (InvoiceID, CustomerID, BillToCustomerID, OrderID, DeliveryMethodID, ContactPersonID, AccountsPersonID,
             SalespersonPersonID, PackedByPersonID, InvoiceDate, CustomerPurchaseOrderNumber,
             IsCreditNote, CreditNoteReason, Comments, DeliveryInstructions, InternalComments,
             TotalDryItems, TotalChillerItems,  DeliveryRun, RunPosition,
             ReturnedDeliveryData,
             LastEditedBy, LastEditedWhen)
        SELECT itg.InvoiceID, c.CustomerID, c.BillToCustomerID, itg.OrderID, c.DeliveryMethodID, o.ContactPersonID, btc.PrimaryContactPersonID,
               o.SalespersonPersonID, @PackedByPersonID, SYSDATETIME(), o.CustomerPurchaseOrderNumber,
               0, NULL, NULL, c.DeliveryAddressLine1 + N'', '' + c.DeliveryAddressLine2, NULL,
               itg.TotalDryItems, itg.TotalChillerItems, c.DeliveryRun, c.RunPosition,
               JSON_MODIFY(N''{"Events": []}'', N''append $.Events'',
                   JSON_MODIFY(JSON_MODIFY(JSON_MODIFY(N''{ }'', N''$.Event'', N''Ready for collection''),
                   N''$.EventTime'', CONVERT(nvarchar(20), SYSDATETIME(), 126)),
                   N''$.ConNote'', N''EAN-125-'' + CAST(itg.InvoiceID + 1050 AS nvarchar(20)))),
               @InvoicedByPersonID, SYSDATETIME()
        FROM @InvoicesToGenerate AS itg
        INNER JOIN Sales.Orders AS o
        ON itg.OrderID = o.OrderID
        INNER JOIN Sales.Customers AS c
        ON o.CustomerID = c.CustomerID
        INNER JOIN Sales.Customers AS btc
        ON btc.CustomerID = c.BillToCustomerID;

        INSERT Sales.InvoiceLines
            (InvoiceID, StockItemID, [Description], PackageTypeID,
             Quantity, UnitPrice, TaxRate, TaxAmount, LineProfit, ExtendedPrice,
             LastEditedBy, LastEditedWhen)
        SELECT itg.InvoiceID, ol.StockItemID, ol.[Description], ol.PackageTypeID,
               ol.PickedQuantity, ol.UnitPrice, ol.TaxRate,
               ROUND(ol.PickedQuantity * ol.UnitPrice * ol.TaxRate / 100.0, 2),
               ROUND(ol.PickedQuantity * (ol.UnitPrice - sih.LastCostPrice), 2),
               ROUND(ol.PickedQuantity * ol.UnitPrice, 2)
                 + ROUND(ol.PickedQuantity * ol.UnitPrice * ol.TaxRate / 100.0, 2),
               @InvoicedByPersonID, SYSDATETIME()
        FROM @InvoicesToGenerate AS itg
        INNER JOIN Sales.OrderLines AS ol
        ON itg.OrderID = ol.OrderID
        INNER JOIN Warehouse.StockItems AS si
        ON ol.StockItemID = si.StockItemID
        INNER JOIN Warehouse.StockItemHoldings AS sih
        ON si.StockItemID = sih.StockItemID
        ORDER BY ol.OrderID, ol.OrderLineID;

        INSERT Warehouse.StockItemTransactions
            (StockItemID, TransactionTypeID, CustomerID, InvoiceID, SupplierID, PurchaseOrderID,
             TransactionOccurredWhen, Quantity, LastEditedBy, LastEditedWhen)
        SELECT il.StockItemID, (SELECT TransactionTypeID FROM [Application].TransactionTypes WHERE TransactionTypeName = N''Stock Issue''),
               i.CustomerID, i.InvoiceID, NULL, NULL,
               SYSDATETIME(), 0 - il.Quantity, @InvoicedByPersonID, SYSDATETIME()
        FROM @InvoicesToGenerate AS itg
        INNER JOIN Sales.InvoiceLines AS il
        ON itg.InvoiceID = il.InvoiceID
        INNER JOIN Sales.Invoices AS i
        ON il.InvoiceID = i.InvoiceID
        ORDER BY il.InvoiceID, il.InvoiceLineID;

        WITH StockItemTotals
        AS
        (
            SELECT il.StockItemID, SUM(il.Quantity) AS TotalQuantity
            FROM Sales.InvoiceLines aS il
            WHERE il.InvoiceID IN (SELECT InvoiceID FROM @InvoicesToGenerate)
            GROUP BY il.StockItemID
        )
        UPDATE sih
        SET sih.QuantityOnHand -= sit.TotalQuantity,
            sih.LastEditedBy = @InvoicedByPersonID,
            sih.LastEditedWhen = SYSDATETIME()
        FROM Warehouse.StockItemHoldings AS sih
        INNER JOIN StockItemTotals AS sit
        ON sih.StockItemID = sit.StockItemID;

        INSERT Sales.CustomerTransactions
            (CustomerID, TransactionTypeID, InvoiceID, PaymentMethodID,
             TransactionDate, AmountExcludingTax, TaxAmount, TransactionAmount,
             OutstandingBalance, FinalizationDate, LastEditedBy, LastEditedWhen)
        SELECT i.BillToCustomerID,
               (SELECT TransactionTypeID FROM [Application].TransactionTypes WHERE TransactionTypeName = N''Customer Invoice''),
               itg.InvoiceID,
               NULL,
               SYSDATETIME(),
               (SELECT SUM(il.ExtendedPrice - il.TaxAmount) FROM Sales.InvoiceLines AS il WHERE il.InvoiceID = itg.InvoiceID),
               (SELECT SUM(il.TaxAmount) FROM Sales.InvoiceLines AS il WHERE il.InvoiceID = itg.InvoiceID),
               (SELECT SUM(il.ExtendedPrice) FROM Sales.InvoiceLines AS il WHERE il.InvoiceID = itg.InvoiceID),
               (SELECT SUM(il.ExtendedPrice) FROM Sales.InvoiceLines AS il WHERE il.InvoiceID = itg.InvoiceID),
               NULL,
               @InvoicedByPersonID,
               SYSDATETIME()
        FROM @InvoicesToGenerate AS itg
        INNER JOIN Sales.Invoices AS i
        ON itg.InvoiceID = i.InvoiceID;

        COMMIT;

    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0 ROLLBACK;
        PRINT N''Unable to invoice these orders'';
        THROW;
        RETURN -1;
    END CATCH;

    RETURN 0;
END;';
            EXECUTE (@SQL);

			SET @SQL = N'
CREATE PROCEDURE Website.RecordColdRoomTemperatures
@SensorReadings Website.SensorDataList READONLY
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER
AS
BEGIN ATOMIC WITH
(
	TRANSACTION ISOLATION LEVEL = SNAPSHOT,
	LANGUAGE = N''English''
)
    BEGIN TRY

		DECLARE @NumberOfReadings int = (SELECT MAX(SensorDataListID) FROM @SensorReadings);
		DECLARE @Counter int = (SELECT MIN(SensorDataListID) FROM @SensorReadings);

		DECLARE @ColdRoomSensorNumber int;
		DECLARE @RecordedWhen datetime2(7);
		DECLARE @Temperature decimal(18,2);

		-- note that we cannot use a merge here because multiple readings might exist for each sensor

		WHILE @Counter <= @NumberOfReadings
		BEGIN
			SELECT @ColdRoomSensorNumber = ColdRoomSensorNumber,
			       @RecordedWhen = RecordedWhen,
				   @Temperature = Temperature
			FROM @SensorReadings
			WHERE SensorDataListID = @Counter;

			UPDATE Warehouse.ColdRoomTemperatures
				SET RecordedWhen = @RecordedWhen,
				    Temperature = @Temperature
			WHERE ColdRoomSensorNumber = @ColdRoomSensorNumber;

			IF @@ROWCOUNT = 0
			BEGIN
				INSERT Warehouse.ColdRoomTemperatures
					(ColdRoomSensorNumber, RecordedWhen, Temperature)
				VALUES (@ColdRoomSensorNumber, @RecordedWhen, @Temperature);
			END;

			SET @Counter += 1;
		END;

    END TRY
    BEGIN CATCH
        THROW 51000, N''Unable to apply the sensor data'', 2;

        RETURN 1;
    END CATCH;
END;';
			EXECUTE (@SQL);

            SET @SQL = N'
CREATE PROCEDURE Website.InsertCustomerOrders
@Orders Website.OrderList READONLY,
@OrderLines Website.OrderLineList READONLY,
@OrdersCreatedByPersonID int,
@SalespersonPersonID int
WITH EXECUTE AS OWNER
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @OrdersToGenerate AS TABLE
    (
        OrderReference int PRIMARY KEY,   -- reference from the application
        OrderID int
    );

    -- allocate the new order numbers

    INSERT @OrdersToGenerate (OrderReference, OrderID)
    SELECT OrderReference, NEXT VALUE FOR Sequences.OrderID
    FROM @Orders;

    BEGIN TRY

        BEGIN TRAN;

        INSERT Sales.Orders
            (OrderID, CustomerID, SalespersonPersonID, PickedByPersonID, ContactPersonID, BackorderOrderID, OrderDate,
             ExpectedDeliveryDate, CustomerPurchaseOrderNumber, IsUndersupplyBackordered, Comments, DeliveryInstructions, InternalComments,
             PickingCompletedWhen, LastEditedBy, LastEditedWhen)
        SELECT otg.OrderID, o.CustomerID, @SalespersonPersonID, NULL, o.ContactPersonID, NULL, SYSDATETIME(),
               o.ExpectedDeliveryDate, o.CustomerPurchaseOrderNumber, o.IsUndersupplyBackordered, o.Comments, o.DeliveryInstructions, NULL,
               NULL, @OrdersCreatedByPersonID, SYSDATETIME()
        FROM @OrdersToGenerate AS otg
        INNER JOIN @Orders AS o
        ON otg.OrderReference = o.OrderReference;

        INSERT Sales.OrderLines
            (OrderID, StockItemID, [Description], PackageTypeID, Quantity, UnitPrice,
             TaxRate, PickedQuantity, PickingCompletedWhen, LastEditedBy, LastEditedWhen)
        SELECT otg.OrderID, ol.StockItemID, ol.[Description], si.UnitPackageID, ol.Quantity,
               Website.CalculateCustomerPrice(o.CustomerID, ol.StockItemID, SYSDATETIME()),
               si.TaxRate, 0, NULL, @OrdersCreatedByPersonID, SYSDATETIME()
        FROM @OrdersToGenerate AS otg
        INNER JOIN @OrderLines AS ol
        ON otg.OrderReference = ol.OrderReference
		INNER JOIN @Orders AS o
		ON ol.OrderReference = o.OrderReference
        INNER JOIN Warehouse.StockItems AS si
        ON ol.StockItemID = si.StockItemID;

        COMMIT;

    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0 ROLLBACK;
        PRINT N''Unable to create the customer orders.'';
        THROW;
        RETURN -1;
    END CATCH;

    RETURN 0;
END;';
            EXECUTE (@SQL);

        END TRY
        BEGIN CATCH
            PRINT N'Unable to apply in-memory tables';
            THROW;
        END CATCH;
    END; -- of in-memory is allowed
END;