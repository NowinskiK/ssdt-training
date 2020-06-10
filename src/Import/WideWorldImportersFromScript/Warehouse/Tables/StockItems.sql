CREATE TABLE [Warehouse].[StockItems](
	[StockItemID] [int] NOT NULL,
	[StockItemName] [nvarchar](100) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[SupplierID] [int] NOT NULL,
	[ColorID] [int] NULL,
	[UnitPackageID] [int] NOT NULL,
	[OuterPackageID] [int] NOT NULL,
	[Brand] [nvarchar](50) COLLATE Latin1_General_100_CI_AS NULL,
	[Size] [nvarchar](20) COLLATE Latin1_General_100_CI_AS NULL,
	[LeadTimeDays] [int] NOT NULL,
	[QuantityPerOuter] [int] NOT NULL,
	[IsChillerStock] [bit] NOT NULL,
	[Barcode] [nvarchar](50) COLLATE Latin1_General_100_CI_AS NULL,
	[TaxRate] [decimal](18, 3) NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[RecommendedRetailPrice] [decimal](18, 2) NULL,
	[TypicalWeightPerUnit] [decimal](18, 3) NOT NULL,
	[MarketingComments] [nvarchar](max) COLLATE Latin1_General_100_CI_AS NULL,
	[InternalComments] [nvarchar](max) COLLATE Latin1_General_100_CI_AS NULL,
	[Photo] [varbinary](max) NULL,
	[CustomFields] [nvarchar](max) COLLATE Latin1_General_100_CI_AS NULL,
	[Tags]  AS (json_query([CustomFields],N'$.Tags')),
	[SearchDetails]  AS (concat([StockItemName],N' ',[MarketingComments])),
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Warehouse_StockItems] PRIMARY KEY CLUSTERED 
(
	[StockItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_Warehouse_StockItems_StockItemName] UNIQUE NONCLUSTERED 
(
	[StockItemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Warehouse].[StockItems_Archive] )
)
GO
ALTER TABLE [Warehouse].[StockItems]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_StockItems_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Warehouse].[StockItems] CHECK CONSTRAINT [FK_Warehouse_StockItems_Application_People]
GO
ALTER TABLE [Warehouse].[StockItems]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_StockItems_ColorID_Warehouse_Colors] FOREIGN KEY([ColorID])
REFERENCES [Warehouse].[Colors] ([ColorID])
GO

ALTER TABLE [Warehouse].[StockItems] CHECK CONSTRAINT [FK_Warehouse_StockItems_ColorID_Warehouse_Colors]
GO
ALTER TABLE [Warehouse].[StockItems]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_StockItems_OuterPackageID_Warehouse_PackageTypes] FOREIGN KEY([OuterPackageID])
REFERENCES [Warehouse].[PackageTypes] ([PackageTypeID])
GO

ALTER TABLE [Warehouse].[StockItems] CHECK CONSTRAINT [FK_Warehouse_StockItems_OuterPackageID_Warehouse_PackageTypes]
GO
ALTER TABLE [Warehouse].[StockItems]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_StockItems_SupplierID_Purchasing_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [Purchasing].[Suppliers] ([SupplierID])
GO

ALTER TABLE [Warehouse].[StockItems] CHECK CONSTRAINT [FK_Warehouse_StockItems_SupplierID_Purchasing_Suppliers]
GO
ALTER TABLE [Warehouse].[StockItems]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_StockItems_UnitPackageID_Warehouse_PackageTypes] FOREIGN KEY([UnitPackageID])
REFERENCES [Warehouse].[PackageTypes] ([PackageTypeID])
GO

ALTER TABLE [Warehouse].[StockItems] CHECK CONSTRAINT [FK_Warehouse_StockItems_UnitPackageID_Warehouse_PackageTypes]
GO
ALTER TABLE [Warehouse].[StockItems] ADD  CONSTRAINT [DF_Warehouse_StockItems_StockItemID]  DEFAULT (NEXT VALUE FOR [Sequences].[StockItemID]) FOR [StockItemID]
GO
/****** Object:  Index [FK_Warehouse_StockItems_ColorID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Warehouse_StockItems_ColorID] ON [Warehouse].[StockItems]
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Warehouse_StockItems_OuterPackageID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Warehouse_StockItems_OuterPackageID] ON [Warehouse].[StockItems]
(
	[OuterPackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Warehouse_StockItems_SupplierID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Warehouse_StockItems_SupplierID] ON [Warehouse].[StockItems]
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Warehouse_StockItems_UnitPackageID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Warehouse_StockItems_UnitPackageID] ON [Warehouse].[StockItems]
(
	[UnitPackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a stock item within the database' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'StockItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of a stock item (but not a full description)' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'StockItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Usual supplier for this stock item' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Color (optional) for this stock item' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'ColorID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Usual package for selling units of this stock item' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'UnitPackageID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Usual package for selling outers of this stock item (ie cartons, boxes, etc.)' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'OuterPackageID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Brand for the stock item (if the item is branded)' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'Brand'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Size of this item (eg: 100mm)' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'Size'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Number of days typically taken from order to receipt of this stock item' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'LeadTimeDays'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Quantity of the stock item in an outer package' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'QuantityPerOuter'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Does this stock item need to be in a chiller?' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'IsChillerStock'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Barcode for this stock item' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Tax rate to be applied' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'TaxRate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Selling price (ex-tax) for one unit of this product' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'UnitPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Recommended retail price for this stock item' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'RecommendedRetailPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Typical weight for one unit of this product (packaged)' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'TypicalWeightPerUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Marketing comments for this stock item (shared outside the organization)' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'MarketingComments'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Internal comments (not exposed outside organization)' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'InternalComments'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Photo of the product' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Custom fields added by system users' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'CustomFields'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Advertising tags associated with this stock item (JSON array retrieved from CustomFields)' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Combination of columns used by full text search' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'COLUMN',@level2name=N'SearchDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'INDEX',@level2name=N'FK_Warehouse_StockItems_ColorID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'INDEX',@level2name=N'FK_Warehouse_StockItems_OuterPackageID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'INDEX',@level2name=N'FK_Warehouse_StockItems_SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems', @level2type=N'INDEX',@level2name=N'FK_Warehouse_StockItems_UnitPackageID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Main entity table for stock items' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItems'