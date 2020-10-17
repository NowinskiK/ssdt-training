CREATE TABLE [Sales].[OrderLines] (
    [OrderLineID]          INT             CONSTRAINT [DF_Sales_OrderLines_OrderLineID] DEFAULT (NEXT VALUE FOR [Sequences].[OrderLineID]) NOT NULL,
    [OrderID]              INT             NOT NULL,
    [StockItemID]          INT             NOT NULL,
    [Description]          NVARCHAR (100)  NOT NULL,
    [PackageTypeID]        INT             NOT NULL,
    [Quantity]             INT             NOT NULL,
    [UnitPrice]            DECIMAL (18, 2) NULL,
    [TaxRate]              DECIMAL (18, 3) NOT NULL,
    [PickedQuantity]       INT             NOT NULL,
    [PickingCompletedWhen] DATETIME2 (7)   NULL,
    [LastEditedBy]         INT             NOT NULL,
    [LastEditedWhen]       DATETIME2 (7)   CONSTRAINT [DF_Sales_OrderLines_LastEditedWhen] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_Sales_OrderLines] PRIMARY KEY CLUSTERED ([OrderLineID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Sales_OrderLines_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Sales_OrderLines_OrderID_Sales_Orders] FOREIGN KEY ([OrderID]) REFERENCES [Sales].[Orders] ([OrderID]),
    CONSTRAINT [FK_Sales_OrderLines_PackageTypeID_Warehouse_PackageTypes] FOREIGN KEY ([PackageTypeID]) REFERENCES [Warehouse].[PackageTypes] ([PackageTypeID]),
    CONSTRAINT [FK_Sales_OrderLines_StockItemID_Warehouse_StockItems] FOREIGN KEY ([StockItemID]) REFERENCES [Warehouse].[StockItems] ([StockItemID])
) ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_OrderLines_OrderID]
    ON [Sales].[OrderLines]([OrderID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_OrderLines_PackageTypeID]
    ON [Sales].[OrderLines]([PackageTypeID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [IX_Sales_OrderLines_AllocatedStockItems]
    ON [Sales].[OrderLines]([StockItemID] ASC)
    INCLUDE([PickedQuantity])
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [IX_Sales_OrderLines_Perf_20160301_01]
    ON [Sales].[OrderLines]([PickingCompletedWhen] ASC, [OrderID] ASC, [OrderLineID] ASC)
    INCLUDE([Quantity], [StockItemID])
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [IX_Sales_OrderLines_Perf_20160301_02]
    ON [Sales].[OrderLines]([StockItemID] ASC, [PickingCompletedWhen] ASC)
    INCLUDE([OrderID], [PickedQuantity])
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderLines', @level2type = N'INDEX', @level2name = N'FK_Sales_OrderLines_OrderID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderLines', @level2type = N'INDEX', @level2name = N'FK_Sales_OrderLines_PackageTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Allows quick summation of stock item quantites already allocated to uninvoiced orders', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderLines', @level2type = N'INDEX', @level2name = N'IX_Sales_OrderLines_AllocatedStockItems';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Improves performance of order picking and invoicing', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderLines', @level2type = N'INDEX', @level2name = N'IX_Sales_OrderLines_Perf_20160301_01';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Improves performance of order picking and invoicing', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderLines', @level2type = N'INDEX', @level2name = N'IX_Sales_OrderLines_Perf_20160301_02';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Detail lines from customer orders', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderLines';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a line on an Order within the database', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderLines', @level2type = N'COLUMN', @level2name = N'OrderLineID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Order that this line is associated with', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderLines', @level2type = N'COLUMN', @level2name = N'OrderID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Stock item for this order line (FK not indexed as separate index exists)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderLines', @level2type = N'COLUMN', @level2name = N'StockItemID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Description of the item supplied (Usually the stock item name but can be overridden)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderLines', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Type of package to be supplied', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderLines', @level2type = N'COLUMN', @level2name = N'PackageTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Quantity to be supplied', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderLines', @level2type = N'COLUMN', @level2name = N'Quantity';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Unit price to be charged', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderLines', @level2type = N'COLUMN', @level2name = N'UnitPrice';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Tax rate to be applied', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderLines', @level2type = N'COLUMN', @level2name = N'TaxRate';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Quantity picked from stock', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderLines', @level2type = N'COLUMN', @level2name = N'PickedQuantity';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'When was picking of this line completed?', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderLines', @level2type = N'COLUMN', @level2name = N'PickingCompletedWhen';

