CREATE TABLE [Warehouse].[StockItemTransactions] (
    [StockItemTransactionID]  INT             CONSTRAINT [DF_Warehouse_StockItemTransactions_StockItemTransactionID] DEFAULT (NEXT VALUE FOR [Sequences].[TransactionID]) NOT NULL,
    [StockItemID]             INT             NOT NULL,
    [TransactionTypeID]       INT             NOT NULL,
    [CustomerID]              INT             NULL,
    [InvoiceID]               INT             NULL,
    [SupplierID]              INT             NULL,
    [PurchaseOrderID]         INT             NULL,
    [TransactionOccurredWhen] DATETIME2 (7)   NOT NULL,
    [Quantity]                DECIMAL (18, 3) NOT NULL,
    [LastEditedBy]            INT             NOT NULL,
    [LastEditedWhen]          DATETIME2 (7)   CONSTRAINT [DF_Warehouse_StockItemTransactions_LastEditedWhen] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_Warehouse_StockItemTransactions] PRIMARY KEY CLUSTERED ([StockItemTransactionID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Warehouse_StockItemTransactions_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Warehouse_StockItemTransactions_CustomerID_Sales_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Customers] ([CustomerID]),
    CONSTRAINT [FK_Warehouse_StockItemTransactions_InvoiceID_Sales_Invoices] FOREIGN KEY ([InvoiceID]) REFERENCES [Sales].[Invoices] ([InvoiceID]),
    CONSTRAINT [FK_Warehouse_StockItemTransactions_PurchaseOrderID_Purchasing_PurchaseOrders] FOREIGN KEY ([PurchaseOrderID]) REFERENCES [Purchasing].[PurchaseOrders] ([PurchaseOrderID]),
    CONSTRAINT [FK_Warehouse_StockItemTransactions_StockItemID_Warehouse_StockItems] FOREIGN KEY ([StockItemID]) REFERENCES [Warehouse].[StockItems] ([StockItemID]),
    CONSTRAINT [FK_Warehouse_StockItemTransactions_SupplierID_Purchasing_Suppliers] FOREIGN KEY ([SupplierID]) REFERENCES [Purchasing].[Suppliers] ([SupplierID]),
    CONSTRAINT [FK_Warehouse_StockItemTransactions_TransactionTypeID_Application_TransactionTypes] FOREIGN KEY ([TransactionTypeID]) REFERENCES [Application].[TransactionTypes] ([TransactionTypeID])
) ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Warehouse_StockItemTransactions_CustomerID]
    ON [Warehouse].[StockItemTransactions]([CustomerID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Warehouse_StockItemTransactions_InvoiceID]
    ON [Warehouse].[StockItemTransactions]([InvoiceID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Warehouse_StockItemTransactions_PurchaseOrderID]
    ON [Warehouse].[StockItemTransactions]([PurchaseOrderID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Warehouse_StockItemTransactions_StockItemID]
    ON [Warehouse].[StockItemTransactions]([StockItemID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Warehouse_StockItemTransactions_SupplierID]
    ON [Warehouse].[StockItemTransactions]([SupplierID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Warehouse_StockItemTransactions_TransactionTypeID]
    ON [Warehouse].[StockItemTransactions]([TransactionTypeID] ASC)
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemTransactions', @level2type = N'INDEX', @level2name = N'FK_Warehouse_StockItemTransactions_CustomerID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemTransactions', @level2type = N'INDEX', @level2name = N'FK_Warehouse_StockItemTransactions_InvoiceID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemTransactions', @level2type = N'INDEX', @level2name = N'FK_Warehouse_StockItemTransactions_PurchaseOrderID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemTransactions', @level2type = N'INDEX', @level2name = N'FK_Warehouse_StockItemTransactions_StockItemID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemTransactions', @level2type = N'INDEX', @level2name = N'FK_Warehouse_StockItemTransactions_SupplierID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemTransactions', @level2type = N'INDEX', @level2name = N'FK_Warehouse_StockItemTransactions_TransactionTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Transactions covering all movements of all stock items', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemTransactions';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used to refer to a stock item transaction within the database', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemTransactions', @level2type = N'COLUMN', @level2name = N'StockItemTransactionID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'StockItem for this transaction', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemTransactions', @level2type = N'COLUMN', @level2name = N'StockItemID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Type of transaction', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemTransactions', @level2type = N'COLUMN', @level2name = N'TransactionTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer for this transaction (if applicable)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemTransactions', @level2type = N'COLUMN', @level2name = N'CustomerID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ID of an invoice (for transactions associated with an invoice)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemTransactions', @level2type = N'COLUMN', @level2name = N'InvoiceID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier for this stock transaction (if applicable)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemTransactions', @level2type = N'COLUMN', @level2name = N'SupplierID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ID of an purchase order (for transactions associated with a purchase order)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemTransactions', @level2type = N'COLUMN', @level2name = N'PurchaseOrderID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Date and time when the transaction occurred', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemTransactions', @level2type = N'COLUMN', @level2name = N'TransactionOccurredWhen';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Quantity of stock movement (positive is incoming stock, negative is outgoing)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemTransactions', @level2type = N'COLUMN', @level2name = N'Quantity';

