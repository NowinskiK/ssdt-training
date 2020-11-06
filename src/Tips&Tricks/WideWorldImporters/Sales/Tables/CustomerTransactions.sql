CREATE TABLE [Sales].[CustomerTransactions] (
    [CustomerTransactionID] INT             CONSTRAINT [DF_Sales_CustomerTransactions_CustomerTransactionID] DEFAULT (NEXT VALUE FOR [Sequences].[TransactionID]) NOT NULL,
    [CustomerID]            INT             NOT NULL,
    [TransactionTypeID]     INT             NOT NULL,
    [InvoiceID]             INT             NULL,
    [PaymentMethodID]       INT             NULL,
    [TransactionDate]       DATE            NOT NULL,
    [AmountExcludingTax]    DECIMAL (18, 2) NOT NULL,
    [TaxAmount]             DECIMAL (18, 2) NOT NULL,
    [TransactionAmount]     DECIMAL (18, 2) NOT NULL,
    [OutstandingBalance]    DECIMAL (18, 2) NOT NULL,
    [FinalizationDate]      DATE            NULL,
    [IsFinalized]           AS              (case when [FinalizationDate] IS NULL then CONVERT([bit],(0)) else CONVERT([bit],(1)) end) PERSISTED,
    [LastEditedBy]          INT             NOT NULL,
    [LastEditedWhen]        DATETIME2 (7)   CONSTRAINT [DF_Sales_CustomerTransactions_LastEditedWhen] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_Sales_CustomerTransactions] PRIMARY KEY CLUSTERED ([CustomerTransactionID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Sales_CustomerTransactions_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Sales_CustomerTransactions_CustomerID_Sales_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Customers] ([CustomerID]),
    CONSTRAINT [FK_Sales_CustomerTransactions_InvoiceID_Sales_Invoices] FOREIGN KEY ([InvoiceID]) REFERENCES [Sales].[Invoices] ([InvoiceID]),
    CONSTRAINT [FK_Sales_CustomerTransactions_PaymentMethodID_Application_PaymentMethods] FOREIGN KEY ([PaymentMethodID]) REFERENCES [Application].[PaymentMethods] ([PaymentMethodID]),
    CONSTRAINT [FK_Sales_CustomerTransactions_TransactionTypeID_Application_TransactionTypes] FOREIGN KEY ([TransactionTypeID]) REFERENCES [Application].[TransactionTypes] ([TransactionTypeID])
) ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_CustomerTransactions_CustomerID]
    ON [Sales].[CustomerTransactions]([CustomerID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_CustomerTransactions_InvoiceID]
    ON [Sales].[CustomerTransactions]([InvoiceID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_CustomerTransactions_PaymentMethodID]
    ON [Sales].[CustomerTransactions]([PaymentMethodID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_CustomerTransactions_TransactionTypeID]
    ON [Sales].[CustomerTransactions]([TransactionTypeID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [IX_Sales_CustomerTransactions_IsFinalized]
    ON [Sales].[CustomerTransactions]([IsFinalized] ASC)
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerTransactions', @level2type = N'INDEX', @level2name = N'FK_Sales_CustomerTransactions_CustomerID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerTransactions', @level2type = N'INDEX', @level2name = N'FK_Sales_CustomerTransactions_InvoiceID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerTransactions', @level2type = N'INDEX', @level2name = N'FK_Sales_CustomerTransactions_PaymentMethodID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerTransactions', @level2type = N'INDEX', @level2name = N'FK_Sales_CustomerTransactions_TransactionTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Allows quick location of unfinalized transactions', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerTransactions', @level2type = N'INDEX', @level2name = N'IX_Sales_CustomerTransactions_IsFinalized';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'All financial transactions that are customer-related', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerTransactions';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used to refer to a customer transaction within the database', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerTransactions', @level2type = N'COLUMN', @level2name = N'CustomerTransactionID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer for this transaction', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerTransactions', @level2type = N'COLUMN', @level2name = N'CustomerID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Type of transaction', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerTransactions', @level2type = N'COLUMN', @level2name = N'TransactionTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ID of an invoice (for transactions associated with an invoice)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerTransactions', @level2type = N'COLUMN', @level2name = N'InvoiceID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ID of a payment method (for transactions involving payments)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerTransactions', @level2type = N'COLUMN', @level2name = N'PaymentMethodID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Date for the transaction', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerTransactions', @level2type = N'COLUMN', @level2name = N'TransactionDate';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Transaction amount (excluding tax)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerTransactions', @level2type = N'COLUMN', @level2name = N'AmountExcludingTax';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Tax amount calculated', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerTransactions', @level2type = N'COLUMN', @level2name = N'TaxAmount';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Transaction amount (including tax)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerTransactions', @level2type = N'COLUMN', @level2name = N'TransactionAmount';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Amount still outstanding for this transaction', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerTransactions', @level2type = N'COLUMN', @level2name = N'OutstandingBalance';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Date that this transaction was finalized (if it has been)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerTransactions', @level2type = N'COLUMN', @level2name = N'FinalizationDate';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Is this transaction finalized (invoices, credits and payments have been matched)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CustomerTransactions', @level2type = N'COLUMN', @level2name = N'IsFinalized';

