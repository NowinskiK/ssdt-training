CREATE TABLE [Purchasing].[PurchaseOrderLines](
	[PurchaseOrderLineID] [int] NOT NULL,
	[PurchaseOrderID] [int] NOT NULL,
	[StockItemID] [int] NOT NULL,
	[OrderedOuters] [int] NOT NULL,
	[Description] [nvarchar](100) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[ReceivedOuters] [int] NOT NULL,
	[PackageTypeID] [int] NOT NULL,
	[ExpectedUnitPricePerOuter] [decimal](18, 2) NULL,
	[LastReceiptDate] [date] NULL,
	[IsOrderLineFinalized] [bit] NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[LastEditedWhen] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Purchasing_PurchaseOrderLines] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
) ON [USERDATA]
GO
ALTER TABLE [Purchasing].[PurchaseOrderLines]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_PurchaseOrderLines_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Purchasing].[PurchaseOrderLines] CHECK CONSTRAINT [FK_Purchasing_PurchaseOrderLines_Application_People]
GO
ALTER TABLE [Purchasing].[PurchaseOrderLines]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_PurchaseOrderLines_PackageTypeID_Warehouse_PackageTypes] FOREIGN KEY([PackageTypeID])
REFERENCES [Warehouse].[PackageTypes] ([PackageTypeID])
GO

ALTER TABLE [Purchasing].[PurchaseOrderLines] CHECK CONSTRAINT [FK_Purchasing_PurchaseOrderLines_PackageTypeID_Warehouse_PackageTypes]
GO
ALTER TABLE [Purchasing].[PurchaseOrderLines]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_PurchaseOrderLines_PurchaseOrderID_Purchasing_PurchaseOrders] FOREIGN KEY([PurchaseOrderID])
REFERENCES [Purchasing].[PurchaseOrders] ([PurchaseOrderID])
GO

ALTER TABLE [Purchasing].[PurchaseOrderLines] CHECK CONSTRAINT [FK_Purchasing_PurchaseOrderLines_PurchaseOrderID_Purchasing_PurchaseOrders]
GO
ALTER TABLE [Purchasing].[PurchaseOrderLines]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_PurchaseOrderLines_StockItemID_Warehouse_StockItems] FOREIGN KEY([StockItemID])
REFERENCES [Warehouse].[StockItems] ([StockItemID])
GO

ALTER TABLE [Purchasing].[PurchaseOrderLines] CHECK CONSTRAINT [FK_Purchasing_PurchaseOrderLines_StockItemID_Warehouse_StockItems]
GO
ALTER TABLE [Purchasing].[PurchaseOrderLines] ADD  CONSTRAINT [DF_Purchasing_PurchaseOrderLines_PurchaseOrderLineID]  DEFAULT (NEXT VALUE FOR [Sequences].[PurchaseOrderLineID]) FOR [PurchaseOrderLineID]
GO
ALTER TABLE [Purchasing].[PurchaseOrderLines] ADD  CONSTRAINT [DF_Purchasing_PurchaseOrderLines_LastEditedWhen]  DEFAULT (sysdatetime()) FOR [LastEditedWhen]
GO
/****** Object:  Index [FK_Purchasing_PurchaseOrderLines_PackageTypeID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Purchasing_PurchaseOrderLines_PackageTypeID] ON [Purchasing].[PurchaseOrderLines]
(
	[PackageTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Purchasing_PurchaseOrderLines_PurchaseOrderID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Purchasing_PurchaseOrderLines_PurchaseOrderID] ON [Purchasing].[PurchaseOrderLines]
(
	[PurchaseOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Purchasing_PurchaseOrderLines_StockItemID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Purchasing_PurchaseOrderLines_StockItemID] ON [Purchasing].[PurchaseOrderLines]
(
	[StockItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [IX_Purchasing_PurchaseOrderLines_Perf_20160301_4]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [IX_Purchasing_PurchaseOrderLines_Perf_20160301_4] ON [Purchasing].[PurchaseOrderLines]
(
	[IsOrderLineFinalized] ASC,
	[StockItemID] ASC
)
INCLUDE([OrderedOuters],[ReceivedOuters]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a line on a purchase order within the database' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrderLines', @level2type=N'COLUMN',@level2name=N'PurchaseOrderLineID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Purchase order that this line is associated with' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrderLines', @level2type=N'COLUMN',@level2name=N'PurchaseOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Stock item for this purchase order line' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrderLines', @level2type=N'COLUMN',@level2name=N'StockItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Quantity of the stock item that is ordered' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrderLines', @level2type=N'COLUMN',@level2name=N'OrderedOuters'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Description of the item to be supplied (Often the stock item name but could be supplier description)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrderLines', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Total quantity of the stock item that has been received so far' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrderLines', @level2type=N'COLUMN',@level2name=N'ReceivedOuters'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Type of package received' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrderLines', @level2type=N'COLUMN',@level2name=N'PackageTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The unit price that we expect to be charged' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrderLines', @level2type=N'COLUMN',@level2name=N'ExpectedUnitPricePerOuter'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The last date on which this stock item was received for this purchase order' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrderLines', @level2type=N'COLUMN',@level2name=N'LastReceiptDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is this purchase order line now considered finalized? (Receipted quantities and weights are often not precise)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrderLines', @level2type=N'COLUMN',@level2name=N'IsOrderLineFinalized'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrderLines', @level2type=N'INDEX',@level2name=N'FK_Purchasing_PurchaseOrderLines_PackageTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrderLines', @level2type=N'INDEX',@level2name=N'FK_Purchasing_PurchaseOrderLines_PurchaseOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrderLines', @level2type=N'INDEX',@level2name=N'FK_Purchasing_PurchaseOrderLines_StockItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Improves performance of order picking and invoicing' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrderLines', @level2type=N'INDEX',@level2name=N'IX_Purchasing_PurchaseOrderLines_Perf_20160301_4'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Detail lines from supplier purchase orders' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrderLines'