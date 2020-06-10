CREATE TABLE [Purchasing].[SupplierTransactions](
	[SupplierTransactionID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[TransactionTypeID] [int] NOT NULL,
	[PurchaseOrderID] [int] NULL,
	[PaymentMethodID] [int] NULL,
	[SupplierInvoiceNumber] [nvarchar](20) COLLATE Latin1_General_100_CI_AS NULL,
	[TransactionDate] [date] NOT NULL,
	[AmountExcludingTax] [decimal](18, 2) NOT NULL,
	[TaxAmount] [decimal](18, 2) NOT NULL,
	[TransactionAmount] [decimal](18, 2) NOT NULL,
	[OutstandingBalance] [decimal](18, 2) NOT NULL,
	[FinalizationDate] [date] NULL,
	[IsFinalized]  AS (case when [FinalizationDate] IS NULL then CONVERT([bit],(0)) else CONVERT([bit],(1)) end) PERSISTED,
	[LastEditedBy] [int] NOT NULL,
	[LastEditedWhen] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Purchasing_SupplierTransactions] PRIMARY KEY CLUSTERED 
(
	[SupplierTransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
) ON [USERDATA]
GO
ALTER TABLE [Purchasing].[SupplierTransactions]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_SupplierTransactions_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Purchasing].[SupplierTransactions] CHECK CONSTRAINT [FK_Purchasing_SupplierTransactions_Application_People]
GO
ALTER TABLE [Purchasing].[SupplierTransactions]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_SupplierTransactions_PaymentMethodID_Application_PaymentMethods] FOREIGN KEY([PaymentMethodID])
REFERENCES [Application].[PaymentMethods] ([PaymentMethodID])
GO

ALTER TABLE [Purchasing].[SupplierTransactions] CHECK CONSTRAINT [FK_Purchasing_SupplierTransactions_PaymentMethodID_Application_PaymentMethods]
GO
ALTER TABLE [Purchasing].[SupplierTransactions]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_SupplierTransactions_PurchaseOrderID_Purchasing_PurchaseOrders] FOREIGN KEY([PurchaseOrderID])
REFERENCES [Purchasing].[PurchaseOrders] ([PurchaseOrderID])
GO

ALTER TABLE [Purchasing].[SupplierTransactions] CHECK CONSTRAINT [FK_Purchasing_SupplierTransactions_PurchaseOrderID_Purchasing_PurchaseOrders]
GO
ALTER TABLE [Purchasing].[SupplierTransactions]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_SupplierTransactions_SupplierID_Purchasing_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [Purchasing].[Suppliers] ([SupplierID])
GO

ALTER TABLE [Purchasing].[SupplierTransactions] CHECK CONSTRAINT [FK_Purchasing_SupplierTransactions_SupplierID_Purchasing_Suppliers]
GO
ALTER TABLE [Purchasing].[SupplierTransactions]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_SupplierTransactions_TransactionTypeID_Application_TransactionTypes] FOREIGN KEY([TransactionTypeID])
REFERENCES [Application].[TransactionTypes] ([TransactionTypeID])
GO

ALTER TABLE [Purchasing].[SupplierTransactions] CHECK CONSTRAINT [FK_Purchasing_SupplierTransactions_TransactionTypeID_Application_TransactionTypes]
GO
ALTER TABLE [Purchasing].[SupplierTransactions] ADD  CONSTRAINT [DF_Purchasing_SupplierTransactions_SupplierTransactionID]  DEFAULT (NEXT VALUE FOR [Sequences].[TransactionID]) FOR [SupplierTransactionID]
GO
ALTER TABLE [Purchasing].[SupplierTransactions] ADD  CONSTRAINT [DF_Purchasing_SupplierTransactions_LastEditedWhen]  DEFAULT (sysdatetime()) FOR [LastEditedWhen]
GO
/****** Object:  Index [FK_Purchasing_SupplierTransactions_PaymentMethodID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Purchasing_SupplierTransactions_PaymentMethodID] ON [Purchasing].[SupplierTransactions]
(
	[PaymentMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Purchasing_SupplierTransactions_PurchaseOrderID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Purchasing_SupplierTransactions_PurchaseOrderID] ON [Purchasing].[SupplierTransactions]
(
	[PurchaseOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Purchasing_SupplierTransactions_SupplierID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Purchasing_SupplierTransactions_SupplierID] ON [Purchasing].[SupplierTransactions]
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Purchasing_SupplierTransactions_TransactionTypeID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Purchasing_SupplierTransactions_TransactionTypeID] ON [Purchasing].[SupplierTransactions]
(
	[TransactionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [IX_Purchasing_SupplierTransactions_IsFinalized]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [IX_Purchasing_SupplierTransactions_IsFinalized] ON [Purchasing].[SupplierTransactions]
(
	[IsFinalized] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used to refer to a supplier transaction within the database' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierTransactions', @level2type=N'COLUMN',@level2name=N'SupplierTransactionID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Supplier for this transaction' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierTransactions', @level2type=N'COLUMN',@level2name=N'SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Type of transaction' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierTransactions', @level2type=N'COLUMN',@level2name=N'TransactionTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID of an purchase order (for transactions associated with a purchase order)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierTransactions', @level2type=N'COLUMN',@level2name=N'PurchaseOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID of a payment method (for transactions involving payments)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierTransactions', @level2type=N'COLUMN',@level2name=N'PaymentMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Invoice number for an invoice received from the supplier' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierTransactions', @level2type=N'COLUMN',@level2name=N'SupplierInvoiceNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Date for the transaction' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierTransactions', @level2type=N'COLUMN',@level2name=N'TransactionDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Transaction amount (excluding tax)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierTransactions', @level2type=N'COLUMN',@level2name=N'AmountExcludingTax'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Tax amount calculated' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierTransactions', @level2type=N'COLUMN',@level2name=N'TaxAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Transaction amount (including tax)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierTransactions', @level2type=N'COLUMN',@level2name=N'TransactionAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Amount still outstanding for this transaction' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierTransactions', @level2type=N'COLUMN',@level2name=N'OutstandingBalance'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Date that this transaction was finalized (if it has been)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierTransactions', @level2type=N'COLUMN',@level2name=N'FinalizationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is this transaction finalized (invoices, credits and payments have been matched)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierTransactions', @level2type=N'COLUMN',@level2name=N'IsFinalized'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierTransactions', @level2type=N'INDEX',@level2name=N'FK_Purchasing_SupplierTransactions_PaymentMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierTransactions', @level2type=N'INDEX',@level2name=N'FK_Purchasing_SupplierTransactions_PurchaseOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierTransactions', @level2type=N'INDEX',@level2name=N'FK_Purchasing_SupplierTransactions_SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierTransactions', @level2type=N'INDEX',@level2name=N'FK_Purchasing_SupplierTransactions_TransactionTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Index used to quickly locate unfinalized transactions' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierTransactions', @level2type=N'INDEX',@level2name=N'IX_Purchasing_SupplierTransactions_IsFinalized'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'All financial transactions that are supplier-related' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierTransactions'