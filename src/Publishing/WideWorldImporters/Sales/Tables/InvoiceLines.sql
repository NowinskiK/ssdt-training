CREATE TABLE [Sales].[InvoiceLines] (
    [InvoiceLineID]  INT             CONSTRAINT [DF_Sales_InvoiceLines_InvoiceLineID] DEFAULT (NEXT VALUE FOR [Sequences].[InvoiceLineID]) NOT NULL,
    [InvoiceID]      INT             NOT NULL,
    [StockItemID]    INT             NOT NULL,
    [Description]    NVARCHAR (100)  NOT NULL,
    [PackageTypeID]  INT             NOT NULL,
    [Quantity]       INT             NOT NULL,
    [UnitPrice]      DECIMAL (18, 2) NULL,
    [TaxRate]        DECIMAL (18, 3) NOT NULL,
    [TaxAmount]      DECIMAL (18, 2) NOT NULL,
    [LineProfit]     DECIMAL (18, 2) NOT NULL,
    [ExtendedPrice]  DECIMAL (18, 2) NOT NULL,
    [LastEditedBy]   INT             NOT NULL,
    [LastEditedWhen] DATETIME2 (7)   CONSTRAINT [DF_Sales_InvoiceLines_LastEditedWhen] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_Sales_InvoiceLines] PRIMARY KEY CLUSTERED ([InvoiceLineID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Sales_InvoiceLines_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Sales_InvoiceLines_InvoiceID_Sales_Invoices] FOREIGN KEY ([InvoiceID]) REFERENCES [Sales].[Invoices] ([InvoiceID]),
    CONSTRAINT [FK_Sales_InvoiceLines_PackageTypeID_Warehouse_PackageTypes] FOREIGN KEY ([PackageTypeID]) REFERENCES [Warehouse].[PackageTypes] ([PackageTypeID]),
    CONSTRAINT [FK_Sales_InvoiceLines_StockItemID_Warehouse_StockItems] FOREIGN KEY ([StockItemID]) REFERENCES [Warehouse].[StockItems] ([StockItemID])
) ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_InvoiceLines_InvoiceID]
    ON [Sales].[InvoiceLines]([InvoiceID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_InvoiceLines_PackageTypeID]
    ON [Sales].[InvoiceLines]([PackageTypeID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_InvoiceLines_StockItemID]
    ON [Sales].[InvoiceLines]([StockItemID] ASC)
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'InvoiceLines', @level2type = N'INDEX', @level2name = N'FK_Sales_InvoiceLines_InvoiceID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'InvoiceLines', @level2type = N'INDEX', @level2name = N'FK_Sales_InvoiceLines_PackageTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'InvoiceLines', @level2type = N'INDEX', @level2name = N'FK_Sales_InvoiceLines_StockItemID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Detail lines from customer invoices', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'InvoiceLines';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a line on an invoice within the database', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'InvoiceLines', @level2type = N'COLUMN', @level2name = N'InvoiceLineID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Invoice that this line is associated with', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'InvoiceLines', @level2type = N'COLUMN', @level2name = N'InvoiceID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Stock item for this invoice line', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'InvoiceLines', @level2type = N'COLUMN', @level2name = N'StockItemID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Description of the item supplied (Usually the stock item name but can be overridden)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'InvoiceLines', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Type of package supplied', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'InvoiceLines', @level2type = N'COLUMN', @level2name = N'PackageTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Quantity supplied', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'InvoiceLines', @level2type = N'COLUMN', @level2name = N'Quantity';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Unit price charged', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'InvoiceLines', @level2type = N'COLUMN', @level2name = N'UnitPrice';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Tax rate to be applied', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'InvoiceLines', @level2type = N'COLUMN', @level2name = N'TaxRate';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Tax amount calculated', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'InvoiceLines', @level2type = N'COLUMN', @level2name = N'TaxAmount';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Profit made on this line item at current cost price', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'InvoiceLines', @level2type = N'COLUMN', @level2name = N'LineProfit';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Extended line price charged', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'InvoiceLines', @level2type = N'COLUMN', @level2name = N'ExtendedPrice';

