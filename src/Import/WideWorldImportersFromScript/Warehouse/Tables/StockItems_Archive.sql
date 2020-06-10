CREATE TABLE [Warehouse].[StockItems_Archive](
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
	[Tags] [nvarchar](max) COLLATE Latin1_General_100_CI_AS NULL,
	[SearchDetails] [nvarchar](max) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
GO
/****** Object:  Index [ix_StockItems_Archive]    Script Date: 10/06/2020 18:14:17 ******/
CREATE CLUSTERED INDEX [ix_StockItems_Archive] ON [Warehouse].[StockItems_Archive]
(
	[ValidTo] ASC,
	[ValidFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]