
CREATE PROCEDURE [Application].Configuration_ApplyColumnstoreIndexing
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

            BEGIN TRAN;

            -- enable page compression on archive tables
            SET @SQL = N''
            SELECT @SQL +=N'
ALTER INDEX [' + i.name + N'] ON [' + schema_name(o.schema_id) + N'].[' + o.name + N'] REBUILD PARTITION = ALL WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, DATA_COMPRESSION = PAGE);  '
            FROM sys.indexes i JOIN sys.tables o ON i.object_id=o.object_id
            WHERE o.temporal_type = 1 AND i.type=1
            EXECUTE (@SQL);

            IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'NCCX_Sales_OrderLines')
            BEGIN
                SET @SQL = N'
CREATE NONCLUSTERED COLUMNSTORE INDEX NCCX_Sales_OrderLines
ON Sales.OrderLines
(
    OrderID,
    StockItemID,
	[Description],
    Quantity,
    UnitPrice,
    PickedQuantity
)';
				SET @SQL += N';';
                EXECUTE (@SQL);
            END;

            IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'NCCX_Sales_InvoiceLines')
            BEGIN
                SET @SQL = N'
CREATE NONCLUSTERED COLUMNSTORE INDEX NCCX_Sales_InvoiceLines
ON Sales.InvoiceLines
(
    InvoiceID,
    StockItemID,
    Quantity,
    UnitPrice,
    LineProfit,
    LastEditedWhen
)';
				SET @SQL += N';';
                EXECUTE (@SQL);
            END;

            IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'CCX_Warehouse_StockItemTransactions')
            BEGIN
                SET @SQL = N'
ALTER TABLE Warehouse.StockItemTransactions
DROP CONSTRAINT PK_Warehouse_StockItemTransactions;';
                EXECUTE (@SQL);

                SET @SQL = N'
ALTER TABLE Warehouse.StockItemTransactions
ADD CONSTRAINT PK_Warehouse_StockItemTransactions PRIMARY KEY NONCLUSTERED (StockItemTransactionID);';
                EXECUTE (@SQL);

                SET @SQL = N'
CREATE CLUSTERED COLUMNSTORE INDEX CCX_Warehouse_StockItemTransactions
ON Warehouse.StockItemTransactions;';
                EXECUTE (@SQL);

                SET @SQL = N'
ALTER INDEX CCX_Warehouse_StockItemTransactions
ON Warehouse.StockItemTransactions
REORGANIZE WITH (COMPRESS_ALL_ROW_GROUPS = ON);';
                EXECUTE (@SQL);

                PRINT N'Successfully applied columnstore indexing';
            END; -- of if need to apply to stock item transactions

            COMMIT;
        END TRY
        BEGIN CATCH
            PRINT N'Unable to apply columnstore indexing';
            THROW;
        END CATCH;
    END; -- of columnstore is allowed
END;