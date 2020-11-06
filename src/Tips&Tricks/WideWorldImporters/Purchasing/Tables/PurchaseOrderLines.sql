CREATE TABLE [Purchasing].[PurchaseOrderLines] (
    [PurchaseOrderLineID]       INT             CONSTRAINT [DF_Purchasing_PurchaseOrderLines_PurchaseOrderLineID] DEFAULT (NEXT VALUE FOR [Sequences].[PurchaseOrderLineID]) NOT NULL,
    [PurchaseOrderID]           INT             NOT NULL,
    [StockItemID]               INT             NOT NULL,
    [OrderedOuters]             INT             NOT NULL,
    [Description]               NVARCHAR (100)  NOT NULL,
    [ReceivedOuters]            INT             NOT NULL,
    [PackageTypeID]             INT             NOT NULL,
    [ExpectedUnitPricePerOuter] DECIMAL (18, 2) NULL,
    [LastReceiptDate]           DATE            NULL,
    [IsOrderLineFinalized]      BIT             NOT NULL,
    [LastEditedBy]              INT             NOT NULL,
    [LastEditedWhen]            DATETIME2 (7)   CONSTRAINT [DF_Purchasing_PurchaseOrderLines_LastEditedWhen] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_Purchasing_PurchaseOrderLines] PRIMARY KEY CLUSTERED ([PurchaseOrderLineID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Purchasing_PurchaseOrderLines_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Purchasing_PurchaseOrderLines_PackageTypeID_Warehouse_PackageTypes] FOREIGN KEY ([PackageTypeID]) REFERENCES [Warehouse].[PackageTypes] ([PackageTypeID]),
    CONSTRAINT [FK_Purchasing_PurchaseOrderLines_PurchaseOrderID_Purchasing_PurchaseOrders] FOREIGN KEY ([PurchaseOrderID]) REFERENCES [Purchasing].[PurchaseOrders] ([PurchaseOrderID]),
    CONSTRAINT [FK_Purchasing_PurchaseOrderLines_StockItemID_Warehouse_StockItems] FOREIGN KEY ([StockItemID]) REFERENCES [Warehouse].[StockItems] ([StockItemID])
) ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Purchasing_PurchaseOrderLines_PackageTypeID]
    ON [Purchasing].[PurchaseOrderLines]([PackageTypeID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Purchasing_PurchaseOrderLines_PurchaseOrderID]
    ON [Purchasing].[PurchaseOrderLines]([PurchaseOrderID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Purchasing_PurchaseOrderLines_StockItemID]
    ON [Purchasing].[PurchaseOrderLines]([StockItemID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [IX_Purchasing_PurchaseOrderLines_Perf_20160301_4]
    ON [Purchasing].[PurchaseOrderLines]([IsOrderLineFinalized] ASC, [StockItemID] ASC)
    INCLUDE([OrderedOuters], [ReceivedOuters])
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrderLines', @level2type = N'INDEX', @level2name = N'FK_Purchasing_PurchaseOrderLines_PackageTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrderLines', @level2type = N'INDEX', @level2name = N'FK_Purchasing_PurchaseOrderLines_PurchaseOrderID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrderLines', @level2type = N'INDEX', @level2name = N'FK_Purchasing_PurchaseOrderLines_StockItemID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Improves performance of order picking and invoicing', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrderLines', @level2type = N'INDEX', @level2name = N'IX_Purchasing_PurchaseOrderLines_Perf_20160301_4';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Detail lines from supplier purchase orders', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrderLines';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a line on a purchase order within the database', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrderLines', @level2type = N'COLUMN', @level2name = N'PurchaseOrderLineID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Purchase order that this line is associated with', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrderLines', @level2type = N'COLUMN', @level2name = N'PurchaseOrderID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Stock item for this purchase order line', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrderLines', @level2type = N'COLUMN', @level2name = N'StockItemID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Quantity of the stock item that is ordered', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrderLines', @level2type = N'COLUMN', @level2name = N'OrderedOuters';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Description of the item to be supplied (Often the stock item name but could be supplier description)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrderLines', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Total quantity of the stock item that has been received so far', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrderLines', @level2type = N'COLUMN', @level2name = N'ReceivedOuters';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Type of package received', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrderLines', @level2type = N'COLUMN', @level2name = N'PackageTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'The unit price that we expect to be charged', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrderLines', @level2type = N'COLUMN', @level2name = N'ExpectedUnitPricePerOuter';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'The last date on which this stock item was received for this purchase order', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrderLines', @level2type = N'COLUMN', @level2name = N'LastReceiptDate';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Is this purchase order line now considered finalized? (Receipted quantities and weights are often not precise)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrderLines', @level2type = N'COLUMN', @level2name = N'IsOrderLineFinalized';

