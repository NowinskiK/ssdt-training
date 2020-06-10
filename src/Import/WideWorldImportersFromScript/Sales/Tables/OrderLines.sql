CREATE TABLE [Sales].[OrderLines](
	[OrderLineID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[StockItemID] [int] NOT NULL,
	[Description] [nvarchar](100) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[PackageTypeID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[TaxRate] [decimal](18, 3) NOT NULL,
	[PickedQuantity] [int] NOT NULL,
	[PickingCompletedWhen] [datetime2](7) NULL,
	[LastEditedBy] [int] NOT NULL,
	[LastEditedWhen] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Sales_OrderLines] PRIMARY KEY CLUSTERED 
(
	[OrderLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
) ON [USERDATA]
GO
ALTER TABLE [Sales].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_Sales_OrderLines_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Sales].[OrderLines] CHECK CONSTRAINT [FK_Sales_OrderLines_Application_People]
GO
ALTER TABLE [Sales].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_Sales_OrderLines_OrderID_Sales_Orders] FOREIGN KEY([OrderID])
REFERENCES [Sales].[Orders] ([OrderID])
GO

ALTER TABLE [Sales].[OrderLines] CHECK CONSTRAINT [FK_Sales_OrderLines_OrderID_Sales_Orders]
GO
ALTER TABLE [Sales].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_Sales_OrderLines_PackageTypeID_Warehouse_PackageTypes] FOREIGN KEY([PackageTypeID])
REFERENCES [Warehouse].[PackageTypes] ([PackageTypeID])
GO

ALTER TABLE [Sales].[OrderLines] CHECK CONSTRAINT [FK_Sales_OrderLines_PackageTypeID_Warehouse_PackageTypes]
GO
ALTER TABLE [Sales].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_Sales_OrderLines_StockItemID_Warehouse_StockItems] FOREIGN KEY([StockItemID])
REFERENCES [Warehouse].[StockItems] ([StockItemID])
GO

ALTER TABLE [Sales].[OrderLines] CHECK CONSTRAINT [FK_Sales_OrderLines_StockItemID_Warehouse_StockItems]
GO
ALTER TABLE [Sales].[OrderLines] ADD  CONSTRAINT [DF_Sales_OrderLines_OrderLineID]  DEFAULT (NEXT VALUE FOR [Sequences].[OrderLineID]) FOR [OrderLineID]
GO
ALTER TABLE [Sales].[OrderLines] ADD  CONSTRAINT [DF_Sales_OrderLines_LastEditedWhen]  DEFAULT (sysdatetime()) FOR [LastEditedWhen]
GO
/****** Object:  Index [FK_Sales_OrderLines_OrderID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_OrderLines_OrderID] ON [Sales].[OrderLines]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Sales_OrderLines_PackageTypeID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_OrderLines_PackageTypeID] ON [Sales].[OrderLines]
(
	[PackageTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [IX_Sales_OrderLines_AllocatedStockItems]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [IX_Sales_OrderLines_AllocatedStockItems] ON [Sales].[OrderLines]
(
	[StockItemID] ASC
)
INCLUDE([PickedQuantity]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [IX_Sales_OrderLines_Perf_20160301_01]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [IX_Sales_OrderLines_Perf_20160301_01] ON [Sales].[OrderLines]
(
	[PickingCompletedWhen] ASC,
	[OrderID] ASC,
	[OrderLineID] ASC
)
INCLUDE([Quantity],[StockItemID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [IX_Sales_OrderLines_Perf_20160301_02]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [IX_Sales_OrderLines_Perf_20160301_02] ON [Sales].[OrderLines]
(
	[StockItemID] ASC,
	[PickingCompletedWhen] ASC
)
INCLUDE([OrderID],[PickedQuantity]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a line on an Order within the database' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'OrderLineID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Order that this line is associated with' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Stock item for this order line (FK not indexed as separate index exists)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'StockItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Description of the item supplied (Usually the stock item name but can be overridden)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Type of package to be supplied' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'PackageTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Quantity to be supplied' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Unit price to be charged' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'UnitPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Tax rate to be applied' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'TaxRate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Quantity picked from stock' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'PickedQuantity'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'When was picking of this line completed?' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'COLUMN',@level2name=N'PickingCompletedWhen'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'INDEX',@level2name=N'FK_Sales_OrderLines_OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'INDEX',@level2name=N'FK_Sales_OrderLines_PackageTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Allows quick summation of stock item quantites already allocated to uninvoiced orders' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'INDEX',@level2name=N'IX_Sales_OrderLines_AllocatedStockItems'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Improves performance of order picking and invoicing' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'INDEX',@level2name=N'IX_Sales_OrderLines_Perf_20160301_01'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Improves performance of order picking and invoicing' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines', @level2type=N'INDEX',@level2name=N'IX_Sales_OrderLines_Perf_20160301_02'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Detail lines from customer orders' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'OrderLines'