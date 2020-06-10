CREATE TABLE [Sales].[CustomerTransactions](
	[CustomerTransactionID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[TransactionTypeID] [int] NOT NULL,
	[InvoiceID] [int] NULL,
	[PaymentMethodID] [int] NULL,
	[TransactionDate] [date] NOT NULL,
	[AmountExcludingTax] [decimal](18, 2) NOT NULL,
	[TaxAmount] [decimal](18, 2) NOT NULL,
	[TransactionAmount] [decimal](18, 2) NOT NULL,
	[OutstandingBalance] [decimal](18, 2) NOT NULL,
	[FinalizationDate] [date] NULL,
	[IsFinalized]  AS (case when [FinalizationDate] IS NULL then CONVERT([bit],(0)) else CONVERT([bit],(1)) end) PERSISTED,
	[LastEditedBy] [int] NOT NULL,
	[LastEditedWhen] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Sales_CustomerTransactions] PRIMARY KEY CLUSTERED 
(
	[CustomerTransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
) ON [USERDATA]
GO
ALTER TABLE [Sales].[CustomerTransactions]  WITH CHECK ADD  CONSTRAINT [FK_Sales_CustomerTransactions_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Sales].[CustomerTransactions] CHECK CONSTRAINT [FK_Sales_CustomerTransactions_Application_People]
GO
ALTER TABLE [Sales].[CustomerTransactions]  WITH CHECK ADD  CONSTRAINT [FK_Sales_CustomerTransactions_CustomerID_Sales_Customers] FOREIGN KEY([CustomerID])
REFERENCES [Sales].[Customers] ([CustomerID])
GO

ALTER TABLE [Sales].[CustomerTransactions] CHECK CONSTRAINT [FK_Sales_CustomerTransactions_CustomerID_Sales_Customers]
GO
ALTER TABLE [Sales].[CustomerTransactions]  WITH CHECK ADD  CONSTRAINT [FK_Sales_CustomerTransactions_InvoiceID_Sales_Invoices] FOREIGN KEY([InvoiceID])
REFERENCES [Sales].[Invoices] ([InvoiceID])
GO

ALTER TABLE [Sales].[CustomerTransactions] CHECK CONSTRAINT [FK_Sales_CustomerTransactions_InvoiceID_Sales_Invoices]
GO
ALTER TABLE [Sales].[CustomerTransactions]  WITH CHECK ADD  CONSTRAINT [FK_Sales_CustomerTransactions_PaymentMethodID_Application_PaymentMethods] FOREIGN KEY([PaymentMethodID])
REFERENCES [Application].[PaymentMethods] ([PaymentMethodID])
GO

ALTER TABLE [Sales].[CustomerTransactions] CHECK CONSTRAINT [FK_Sales_CustomerTransactions_PaymentMethodID_Application_PaymentMethods]
GO
ALTER TABLE [Sales].[CustomerTransactions]  WITH CHECK ADD  CONSTRAINT [FK_Sales_CustomerTransactions_TransactionTypeID_Application_TransactionTypes] FOREIGN KEY([TransactionTypeID])
REFERENCES [Application].[TransactionTypes] ([TransactionTypeID])
GO

ALTER TABLE [Sales].[CustomerTransactions] CHECK CONSTRAINT [FK_Sales_CustomerTransactions_TransactionTypeID_Application_TransactionTypes]
GO
ALTER TABLE [Sales].[CustomerTransactions] ADD  CONSTRAINT [DF_Sales_CustomerTransactions_CustomerTransactionID]  DEFAULT (NEXT VALUE FOR [Sequences].[TransactionID]) FOR [CustomerTransactionID]
GO
ALTER TABLE [Sales].[CustomerTransactions] ADD  CONSTRAINT [DF_Sales_CustomerTransactions_LastEditedWhen]  DEFAULT (sysdatetime()) FOR [LastEditedWhen]
GO
/****** Object:  Index [FK_Sales_CustomerTransactions_CustomerID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_CustomerTransactions_CustomerID] ON [Sales].[CustomerTransactions]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Sales_CustomerTransactions_InvoiceID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_CustomerTransactions_InvoiceID] ON [Sales].[CustomerTransactions]
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Sales_CustomerTransactions_PaymentMethodID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_CustomerTransactions_PaymentMethodID] ON [Sales].[CustomerTransactions]
(
	[PaymentMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Sales_CustomerTransactions_TransactionTypeID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_CustomerTransactions_TransactionTypeID] ON [Sales].[CustomerTransactions]
(
	[TransactionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [IX_Sales_CustomerTransactions_IsFinalized]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [IX_Sales_CustomerTransactions_IsFinalized] ON [Sales].[CustomerTransactions]
(
	[IsFinalized] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used to refer to a customer transaction within the database' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerTransactions', @level2type=N'COLUMN',@level2name=N'CustomerTransactionID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Customer for this transaction' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerTransactions', @level2type=N'COLUMN',@level2name=N'CustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Type of transaction' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerTransactions', @level2type=N'COLUMN',@level2name=N'TransactionTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID of an invoice (for transactions associated with an invoice)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerTransactions', @level2type=N'COLUMN',@level2name=N'InvoiceID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID of a payment method (for transactions involving payments)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerTransactions', @level2type=N'COLUMN',@level2name=N'PaymentMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Date for the transaction' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerTransactions', @level2type=N'COLUMN',@level2name=N'TransactionDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Transaction amount (excluding tax)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerTransactions', @level2type=N'COLUMN',@level2name=N'AmountExcludingTax'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Tax amount calculated' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerTransactions', @level2type=N'COLUMN',@level2name=N'TaxAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Transaction amount (including tax)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerTransactions', @level2type=N'COLUMN',@level2name=N'TransactionAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Amount still outstanding for this transaction' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerTransactions', @level2type=N'COLUMN',@level2name=N'OutstandingBalance'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Date that this transaction was finalized (if it has been)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerTransactions', @level2type=N'COLUMN',@level2name=N'FinalizationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is this transaction finalized (invoices, credits and payments have been matched)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerTransactions', @level2type=N'COLUMN',@level2name=N'IsFinalized'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerTransactions', @level2type=N'INDEX',@level2name=N'FK_Sales_CustomerTransactions_CustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerTransactions', @level2type=N'INDEX',@level2name=N'FK_Sales_CustomerTransactions_InvoiceID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerTransactions', @level2type=N'INDEX',@level2name=N'FK_Sales_CustomerTransactions_PaymentMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerTransactions', @level2type=N'INDEX',@level2name=N'FK_Sales_CustomerTransactions_TransactionTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Allows quick location of unfinalized transactions' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerTransactions', @level2type=N'INDEX',@level2name=N'IX_Sales_CustomerTransactions_IsFinalized'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'All financial transactions that are customer-related' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerTransactions'