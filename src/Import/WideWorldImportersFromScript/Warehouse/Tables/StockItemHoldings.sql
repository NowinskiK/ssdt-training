CREATE TABLE [Warehouse].[StockItemHoldings](
	[StockItemID] [int] NOT NULL,
	[QuantityOnHand] [int] NOT NULL,
	[BinLocation] [nvarchar](20) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[LastStocktakeQuantity] [int] NOT NULL,
	[LastCostPrice] [decimal](18, 2) NOT NULL,
	[ReorderLevel] [int] NOT NULL,
	[TargetStockLevel] [int] NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[LastEditedWhen] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Warehouse_StockItemHoldings] PRIMARY KEY CLUSTERED 
(
	[StockItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
) ON [USERDATA]
GO
ALTER TABLE [Warehouse].[StockItemHoldings]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_StockItemHoldings_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Warehouse].[StockItemHoldings] CHECK CONSTRAINT [FK_Warehouse_StockItemHoldings_Application_People]
GO
ALTER TABLE [Warehouse].[StockItemHoldings]  WITH CHECK ADD  CONSTRAINT [PKFK_Warehouse_StockItemHoldings_StockItemID_Warehouse_StockItems] FOREIGN KEY([StockItemID])
REFERENCES [Warehouse].[StockItems] ([StockItemID])
GO

ALTER TABLE [Warehouse].[StockItemHoldings] CHECK CONSTRAINT [PKFK_Warehouse_StockItemHoldings_StockItemID_Warehouse_StockItems]
GO
ALTER TABLE [Warehouse].[StockItemHoldings] ADD  CONSTRAINT [DF_Warehouse_StockItemHoldings_LastEditedWhen]  DEFAULT (sysdatetime()) FOR [LastEditedWhen]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID of the stock item that this holding relates to (this table holds non-temporal columns for stock)' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItemHoldings', @level2type=N'COLUMN',@level2name=N'StockItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Quantity currently on hand (if tracked)' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItemHoldings', @level2type=N'COLUMN',@level2name=N'QuantityOnHand'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Bin location (ie location of this stock item within the depot)' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItemHoldings', @level2type=N'COLUMN',@level2name=N'BinLocation'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Quantity at last stocktake (if tracked)' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItemHoldings', @level2type=N'COLUMN',@level2name=N'LastStocktakeQuantity'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Unit cost price the last time this stock item was purchased' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItemHoldings', @level2type=N'COLUMN',@level2name=N'LastCostPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Quantity below which reordering should take place' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItemHoldings', @level2type=N'COLUMN',@level2name=N'ReorderLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Typical quantity ordered' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItemHoldings', @level2type=N'COLUMN',@level2name=N'TargetStockLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Non-temporal attributes for stock items' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItemHoldings'