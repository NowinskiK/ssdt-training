CREATE TABLE [Purchasing].[SupplierTransactions] (
    [SupplierTransactionID] INT             CONSTRAINT [DF_Purchasing_SupplierTransactions_SupplierTransactionID] DEFAULT (NEXT VALUE FOR [Sequences].[TransactionID]) NOT NULL,
    [SupplierID]            INT             NOT NULL,
    [TransactionTypeID]     INT             NOT NULL,
    [PurchaseOrderID]       INT             NULL,
    [PaymentMethodID]       INT             NULL,
    [SupplierInvoiceNumber] NVARCHAR (20)   NULL,
    [TransactionDate]       DATE            NOT NULL,
    [AmountExcludingTax]    DECIMAL (18, 2) NOT NULL,
    [TaxAmount]             DECIMAL (18, 2) NOT NULL,
    [TransactionAmount]     DECIMAL (18, 2) NOT NULL,
    [OutstandingBalance]    DECIMAL (18, 2) NOT NULL,
    [FinalizationDate]      DATE            NULL,
    [IsFinalized]           AS              (case when [FinalizationDate] IS NULL then CONVERT([bit],(0)) else CONVERT([bit],(1)) end) PERSISTED,
    [LastEditedBy]          INT             NOT NULL,
    [LastEditedWhen]        DATETIME2 (7)   CONSTRAINT [DF_Purchasing_SupplierTransactions_LastEditedWhen] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_Purchasing_SupplierTransactions] PRIMARY KEY CLUSTERED ([SupplierTransactionID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Purchasing_SupplierTransactions_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Purchasing_SupplierTransactions_PaymentMethodID_Application_PaymentMethods] FOREIGN KEY ([PaymentMethodID]) REFERENCES [Application].[PaymentMethods] ([PaymentMethodID]),
    CONSTRAINT [FK_Purchasing_SupplierTransactions_PurchaseOrderID_Purchasing_PurchaseOrders] FOREIGN KEY ([PurchaseOrderID]) REFERENCES [Purchasing].[PurchaseOrders] ([PurchaseOrderID]),
    CONSTRAINT [FK_Purchasing_SupplierTransactions_SupplierID_Purchasing_Suppliers] FOREIGN KEY ([SupplierID]) REFERENCES [Purchasing].[Suppliers] ([SupplierID]),
    CONSTRAINT [FK_Purchasing_SupplierTransactions_TransactionTypeID_Application_TransactionTypes] FOREIGN KEY ([TransactionTypeID]) REFERENCES [Application].[TransactionTypes] ([TransactionTypeID])
) ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Purchasing_SupplierTransactions_PaymentMethodID]
    ON [Purchasing].[SupplierTransactions]([PaymentMethodID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Purchasing_SupplierTransactions_PurchaseOrderID]
    ON [Purchasing].[SupplierTransactions]([PurchaseOrderID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Purchasing_SupplierTransactions_SupplierID]
    ON [Purchasing].[SupplierTransactions]([SupplierID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Purchasing_SupplierTransactions_TransactionTypeID]
    ON [Purchasing].[SupplierTransactions]([TransactionTypeID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [IX_Purchasing_SupplierTransactions_IsFinalized]
    ON [Purchasing].[SupplierTransactions]([IsFinalized] ASC)
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierTransactions', @level2type = N'INDEX', @level2name = N'FK_Purchasing_SupplierTransactions_PaymentMethodID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierTransactions', @level2type = N'INDEX', @level2name = N'FK_Purchasing_SupplierTransactions_PurchaseOrderID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierTransactions', @level2type = N'INDEX', @level2name = N'FK_Purchasing_SupplierTransactions_SupplierID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierTransactions', @level2type = N'INDEX', @level2name = N'FK_Purchasing_SupplierTransactions_TransactionTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Index used to quickly locate unfinalized transactions', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierTransactions', @level2type = N'INDEX', @level2name = N'IX_Purchasing_SupplierTransactions_IsFinalized';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'All financial transactions that are supplier-related', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierTransactions';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used to refer to a supplier transaction within the database', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierTransactions', @level2type = N'COLUMN', @level2name = N'SupplierTransactionID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier for this transaction', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierTransactions', @level2type = N'COLUMN', @level2name = N'SupplierID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Type of transaction', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierTransactions', @level2type = N'COLUMN', @level2name = N'TransactionTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ID of an purchase order (for transactions associated with a purchase order)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierTransactions', @level2type = N'COLUMN', @level2name = N'PurchaseOrderID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ID of a payment method (for transactions involving payments)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierTransactions', @level2type = N'COLUMN', @level2name = N'PaymentMethodID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Invoice number for an invoice received from the supplier', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierTransactions', @level2type = N'COLUMN', @level2name = N'SupplierInvoiceNumber';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Date for the transaction', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierTransactions', @level2type = N'COLUMN', @level2name = N'TransactionDate';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Transaction amount (excluding tax)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierTransactions', @level2type = N'COLUMN', @level2name = N'AmountExcludingTax';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Tax amount calculated', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierTransactions', @level2type = N'COLUMN', @level2name = N'TaxAmount';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Transaction amount (including tax)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierTransactions', @level2type = N'COLUMN', @level2name = N'TransactionAmount';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Amount still outstanding for this transaction', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierTransactions', @level2type = N'COLUMN', @level2name = N'OutstandingBalance';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Date that this transaction was finalized (if it has been)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierTransactions', @level2type = N'COLUMN', @level2name = N'FinalizationDate';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Is this transaction finalized (invoices, credits and payments have been matched)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierTransactions', @level2type = N'COLUMN', @level2name = N'IsFinalized';

