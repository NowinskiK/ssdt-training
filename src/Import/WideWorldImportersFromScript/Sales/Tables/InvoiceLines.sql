CREATE TABLE [Sales].[InvoiceLines](
	[InvoiceLineID] [int] NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[StockItemID] [int] NOT NULL,
	[Description] [nvarchar](100) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[PackageTypeID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[TaxRate] [decimal](18, 3) NOT NULL,
	[TaxAmount] [decimal](18, 2) NOT NULL,
	[LineProfit] [decimal](18, 2) NOT NULL,
	[ExtendedPrice] [decimal](18, 2) NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[LastEditedWhen] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Sales_InvoiceLines] PRIMARY KEY CLUSTERED 
(
	[InvoiceLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
) ON [USERDATA]
GO
ALTER TABLE [Sales].[InvoiceLines]  WITH CHECK ADD  CONSTRAINT [FK_Sales_InvoiceLines_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Sales].[InvoiceLines] CHECK CONSTRAINT [FK_Sales_InvoiceLines_Application_People]
GO
ALTER TABLE [Sales].[InvoiceLines]  WITH CHECK ADD  CONSTRAINT [FK_Sales_InvoiceLines_InvoiceID_Sales_Invoices] FOREIGN KEY([InvoiceID])
REFERENCES [Sales].[Invoices] ([InvoiceID])
GO

ALTER TABLE [Sales].[InvoiceLines] CHECK CONSTRAINT [FK_Sales_InvoiceLines_InvoiceID_Sales_Invoices]
GO
ALTER TABLE [Sales].[InvoiceLines]  WITH CHECK ADD  CONSTRAINT [FK_Sales_InvoiceLines_PackageTypeID_Warehouse_PackageTypes] FOREIGN KEY([PackageTypeID])
REFERENCES [Warehouse].[PackageTypes] ([PackageTypeID])
GO

ALTER TABLE [Sales].[InvoiceLines] CHECK CONSTRAINT [FK_Sales_InvoiceLines_PackageTypeID_Warehouse_PackageTypes]
GO
ALTER TABLE [Sales].[InvoiceLines]  WITH CHECK ADD  CONSTRAINT [FK_Sales_InvoiceLines_StockItemID_Warehouse_StockItems] FOREIGN KEY([StockItemID])
REFERENCES [Warehouse].[StockItems] ([StockItemID])
GO

ALTER TABLE [Sales].[InvoiceLines] CHECK CONSTRAINT [FK_Sales_InvoiceLines_StockItemID_Warehouse_StockItems]
GO
ALTER TABLE [Sales].[InvoiceLines] ADD  CONSTRAINT [DF_Sales_InvoiceLines_InvoiceLineID]  DEFAULT (NEXT VALUE FOR [Sequences].[InvoiceLineID]) FOR [InvoiceLineID]
GO
ALTER TABLE [Sales].[InvoiceLines] ADD  CONSTRAINT [DF_Sales_InvoiceLines_LastEditedWhen]  DEFAULT (sysdatetime()) FOR [LastEditedWhen]
GO
/****** Object:  Index [FK_Sales_InvoiceLines_InvoiceID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_InvoiceLines_InvoiceID] ON [Sales].[InvoiceLines]
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Sales_InvoiceLines_PackageTypeID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_InvoiceLines_PackageTypeID] ON [Sales].[InvoiceLines]
(
	[PackageTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Sales_InvoiceLines_StockItemID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_InvoiceLines_StockItemID] ON [Sales].[InvoiceLines]
(
	[StockItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a line on an invoice within the database' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'InvoiceLines', @level2type=N'COLUMN',@level2name=N'InvoiceLineID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Invoice that this line is associated with' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'InvoiceLines', @level2type=N'COLUMN',@level2name=N'InvoiceID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Stock item for this invoice line' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'InvoiceLines', @level2type=N'COLUMN',@level2name=N'StockItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Description of the item supplied (Usually the stock item name but can be overridden)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'InvoiceLines', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Type of package supplied' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'InvoiceLines', @level2type=N'COLUMN',@level2name=N'PackageTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Quantity supplied' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'InvoiceLines', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Unit price charged' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'InvoiceLines', @level2type=N'COLUMN',@level2name=N'UnitPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Tax rate to be applied' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'InvoiceLines', @level2type=N'COLUMN',@level2name=N'TaxRate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Tax amount calculated' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'InvoiceLines', @level2type=N'COLUMN',@level2name=N'TaxAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Profit made on this line item at current cost price' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'InvoiceLines', @level2type=N'COLUMN',@level2name=N'LineProfit'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Extended line price charged' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'InvoiceLines', @level2type=N'COLUMN',@level2name=N'ExtendedPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'InvoiceLines', @level2type=N'INDEX',@level2name=N'FK_Sales_InvoiceLines_InvoiceID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'InvoiceLines', @level2type=N'INDEX',@level2name=N'FK_Sales_InvoiceLines_PackageTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'InvoiceLines', @level2type=N'INDEX',@level2name=N'FK_Sales_InvoiceLines_StockItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Detail lines from customer invoices' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'InvoiceLines'