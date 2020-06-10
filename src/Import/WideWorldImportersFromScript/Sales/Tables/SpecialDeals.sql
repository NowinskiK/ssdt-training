CREATE TABLE [Sales].[SpecialDeals](
	[SpecialDealID] [int] NOT NULL,
	[StockItemID] [int] NULL,
	[CustomerID] [int] NULL,
	[BuyingGroupID] [int] NULL,
	[CustomerCategoryID] [int] NULL,
	[StockGroupID] [int] NULL,
	[DealDescription] [nvarchar](30) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[DiscountAmount] [decimal](18, 2) NULL,
	[DiscountPercentage] [decimal](18, 3) NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[LastEditedBy] [int] NOT NULL,
	[LastEditedWhen] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Sales_SpecialDeals] PRIMARY KEY CLUSTERED 
(
	[SpecialDealID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
) ON [USERDATA]
GO
ALTER TABLE [Sales].[SpecialDeals]  WITH CHECK ADD  CONSTRAINT [FK_Sales_SpecialDeals_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Sales].[SpecialDeals] CHECK CONSTRAINT [FK_Sales_SpecialDeals_Application_People]
GO
ALTER TABLE [Sales].[SpecialDeals]  WITH CHECK ADD  CONSTRAINT [FK_Sales_SpecialDeals_BuyingGroupID_Sales_BuyingGroups] FOREIGN KEY([BuyingGroupID])
REFERENCES [Sales].[BuyingGroups] ([BuyingGroupID])
GO

ALTER TABLE [Sales].[SpecialDeals] CHECK CONSTRAINT [FK_Sales_SpecialDeals_BuyingGroupID_Sales_BuyingGroups]
GO
ALTER TABLE [Sales].[SpecialDeals]  WITH CHECK ADD  CONSTRAINT [FK_Sales_SpecialDeals_CustomerCategoryID_Sales_CustomerCategories] FOREIGN KEY([CustomerCategoryID])
REFERENCES [Sales].[CustomerCategories] ([CustomerCategoryID])
GO

ALTER TABLE [Sales].[SpecialDeals] CHECK CONSTRAINT [FK_Sales_SpecialDeals_CustomerCategoryID_Sales_CustomerCategories]
GO
ALTER TABLE [Sales].[SpecialDeals]  WITH CHECK ADD  CONSTRAINT [FK_Sales_SpecialDeals_CustomerID_Sales_Customers] FOREIGN KEY([CustomerID])
REFERENCES [Sales].[Customers] ([CustomerID])
GO

ALTER TABLE [Sales].[SpecialDeals] CHECK CONSTRAINT [FK_Sales_SpecialDeals_CustomerID_Sales_Customers]
GO
ALTER TABLE [Sales].[SpecialDeals]  WITH CHECK ADD  CONSTRAINT [FK_Sales_SpecialDeals_StockGroupID_Warehouse_StockGroups] FOREIGN KEY([StockGroupID])
REFERENCES [Warehouse].[StockGroups] ([StockGroupID])
GO

ALTER TABLE [Sales].[SpecialDeals] CHECK CONSTRAINT [FK_Sales_SpecialDeals_StockGroupID_Warehouse_StockGroups]
GO
ALTER TABLE [Sales].[SpecialDeals]  WITH CHECK ADD  CONSTRAINT [FK_Sales_SpecialDeals_StockItemID_Warehouse_StockItems] FOREIGN KEY([StockItemID])
REFERENCES [Warehouse].[StockItems] ([StockItemID])
GO

ALTER TABLE [Sales].[SpecialDeals] CHECK CONSTRAINT [FK_Sales_SpecialDeals_StockItemID_Warehouse_StockItems]
GO
ALTER TABLE [Sales].[SpecialDeals] ADD  CONSTRAINT [DF_Sales_SpecialDeals_SpecialDealID]  DEFAULT (NEXT VALUE FOR [Sequences].[SpecialDealID]) FOR [SpecialDealID]
GO
ALTER TABLE [Sales].[SpecialDeals] ADD  CONSTRAINT [DF_Sales_SpecialDeals_LastEditedWhen]  DEFAULT (sysdatetime()) FOR [LastEditedWhen]
GO
ALTER TABLE [Sales].[SpecialDeals]  WITH CHECK ADD  CONSTRAINT [CK_Sales_SpecialDeals_Exactly_One_NOT_NULL_Pricing_Option_Is_Required] CHECK  ((((case when [DiscountAmount] IS NULL then (0) else (1) end+case when [DiscountPercentage] IS NULL then (0) else (1) end)+case when [UnitPrice] IS NULL then (0) else (1) end)=(1)))
GO

ALTER TABLE [Sales].[SpecialDeals] CHECK CONSTRAINT [CK_Sales_SpecialDeals_Exactly_One_NOT_NULL_Pricing_Option_Is_Required]
GO
ALTER TABLE [Sales].[SpecialDeals]  WITH CHECK ADD  CONSTRAINT [CK_Sales_SpecialDeals_Unit_Price_Deal_Requires_Special_StockItem] CHECK  (([StockItemID] IS NOT NULL AND [UnitPrice] IS NOT NULL OR [UnitPrice] IS NULL))
GO

ALTER TABLE [Sales].[SpecialDeals] CHECK CONSTRAINT [CK_Sales_SpecialDeals_Unit_Price_Deal_Requires_Special_StockItem]
GO
/****** Object:  Index [FK_Sales_SpecialDeals_BuyingGroupID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_SpecialDeals_BuyingGroupID] ON [Sales].[SpecialDeals]
(
	[BuyingGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Sales_SpecialDeals_CustomerCategoryID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_SpecialDeals_CustomerCategoryID] ON [Sales].[SpecialDeals]
(
	[CustomerCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Sales_SpecialDeals_CustomerID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_SpecialDeals_CustomerID] ON [Sales].[SpecialDeals]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Sales_SpecialDeals_StockGroupID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_SpecialDeals_StockGroupID] ON [Sales].[SpecialDeals]
(
	[StockGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Sales_SpecialDeals_StockItemID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_SpecialDeals_StockItemID] ON [Sales].[SpecialDeals]
(
	[StockItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID (sequence based) for a special deal' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals', @level2type=N'COLUMN',@level2name=N'SpecialDealID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Stock item that the deal applies to (if NULL, then only discounts are permitted not unit prices)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals', @level2type=N'COLUMN',@level2name=N'StockItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID of the customer that the special pricing applies to (if NULL then all customers)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals', @level2type=N'COLUMN',@level2name=N'CustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID of the buying group that the special pricing applies to (optional)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals', @level2type=N'COLUMN',@level2name=N'BuyingGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID of the customer category that the special pricing applies to (optional)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals', @level2type=N'COLUMN',@level2name=N'CustomerCategoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID of the stock group that the special pricing applies to (optional)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals', @level2type=N'COLUMN',@level2name=N'StockGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Description of the special deal' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals', @level2type=N'COLUMN',@level2name=N'DealDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Date that the special pricing starts from' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Date that the special pricing ends on' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Discount per unit to be applied to sale price (optional)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals', @level2type=N'COLUMN',@level2name=N'DiscountAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Discount percentage per unit to be applied to sale price (optional)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals', @level2type=N'COLUMN',@level2name=N'DiscountPercentage'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Special price per unit to be applied instead of sale price (optional)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals', @level2type=N'COLUMN',@level2name=N'UnitPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals', @level2type=N'INDEX',@level2name=N'FK_Sales_SpecialDeals_BuyingGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals', @level2type=N'INDEX',@level2name=N'FK_Sales_SpecialDeals_CustomerCategoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals', @level2type=N'INDEX',@level2name=N'FK_Sales_SpecialDeals_CustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals', @level2type=N'INDEX',@level2name=N'FK_Sales_SpecialDeals_StockGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals', @level2type=N'INDEX',@level2name=N'FK_Sales_SpecialDeals_StockItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Special pricing (can include fixed prices, discount $ or discount %)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Ensures that each special price row contains one and only one of DiscountAmount, DiscountPercentage, and UnitPrice' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals', @level2type=N'CONSTRAINT',@level2name=N'CK_Sales_SpecialDeals_Exactly_One_NOT_NULL_Pricing_Option_Is_Required'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Ensures that if a specific price is allocated that it applies to a specific stock item' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SpecialDeals', @level2type=N'CONSTRAINT',@level2name=N'CK_Sales_SpecialDeals_Unit_Price_Deal_Requires_Special_StockItem'