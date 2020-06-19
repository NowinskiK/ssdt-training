CREATE TABLE [Sales].[SpecialDeals] (
    [SpecialDealID]      INT             CONSTRAINT [DF_Sales_SpecialDeals_SpecialDealID] DEFAULT (NEXT VALUE FOR [Sequences].[SpecialDealID]) NOT NULL,
    [StockItemID]        INT             NULL,
    [CustomerID]         INT             NULL,
    [BuyingGroupID]      INT             NULL,
    [CustomerCategoryID] INT             NULL,
    [StockGroupID]       INT             NULL,
    [DealDescription]    NVARCHAR (30)   NOT NULL,
    [StartDate]          DATE            NOT NULL,
    [EndDate]            DATE            NOT NULL,
    [DiscountAmount]     DECIMAL (18, 2) NULL,
    [DiscountPercentage] DECIMAL (18, 3) NULL,
    [UnitPrice]          DECIMAL (18, 2) NULL,
    [LastEditedBy]       INT             NOT NULL,
    [LastEditedWhen]     DATETIME2 (7)   CONSTRAINT [DF_Sales_SpecialDeals_LastEditedWhen] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_Sales_SpecialDeals] PRIMARY KEY CLUSTERED ([SpecialDealID] ASC) ON [USERDATA],
    CONSTRAINT [CK_Sales_SpecialDeals_Exactly_One_NOT_NULL_Pricing_Option_Is_Required] CHECK (((case when [DiscountAmount] IS NULL then (0) else (1) end+case when [DiscountPercentage] IS NULL then (0) else (1) end)+case when [UnitPrice] IS NULL then (0) else (1) end)=(1)),
    CONSTRAINT [CK_Sales_SpecialDeals_Unit_Price_Deal_Requires_Special_StockItem] CHECK ([StockItemID] IS NOT NULL AND [UnitPrice] IS NOT NULL OR [UnitPrice] IS NULL),
    CONSTRAINT [FK_Sales_SpecialDeals_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Sales_SpecialDeals_BuyingGroupID_Sales_BuyingGroups] FOREIGN KEY ([BuyingGroupID]) REFERENCES [Sales].[BuyingGroups] ([BuyingGroupID]),
    CONSTRAINT [FK_Sales_SpecialDeals_CustomerCategoryID_Sales_CustomerCategories] FOREIGN KEY ([CustomerCategoryID]) REFERENCES [Sales].[CustomerCategories] ([CustomerCategoryID]),
    CONSTRAINT [FK_Sales_SpecialDeals_CustomerID_Sales_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Customers] ([CustomerID]),
    CONSTRAINT [FK_Sales_SpecialDeals_StockGroupID_Warehouse_StockGroups] FOREIGN KEY ([StockGroupID]) REFERENCES [Warehouse].[StockGroups] ([StockGroupID]),
    CONSTRAINT [FK_Sales_SpecialDeals_StockItemID_Warehouse_StockItems] FOREIGN KEY ([StockItemID]) REFERENCES [Warehouse].[StockItems] ([StockItemID])
) ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_SpecialDeals_BuyingGroupID]
    ON [Sales].[SpecialDeals]([BuyingGroupID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_SpecialDeals_CustomerCategoryID]
    ON [Sales].[SpecialDeals]([CustomerCategoryID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_SpecialDeals_CustomerID]
    ON [Sales].[SpecialDeals]([CustomerID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_SpecialDeals_StockGroupID]
    ON [Sales].[SpecialDeals]([StockGroupID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_SpecialDeals_StockItemID]
    ON [Sales].[SpecialDeals]([StockItemID] ASC)
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals', @level2type = N'INDEX', @level2name = N'FK_Sales_SpecialDeals_BuyingGroupID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals', @level2type = N'INDEX', @level2name = N'FK_Sales_SpecialDeals_CustomerCategoryID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals', @level2type = N'INDEX', @level2name = N'FK_Sales_SpecialDeals_CustomerID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals', @level2type = N'INDEX', @level2name = N'FK_Sales_SpecialDeals_StockGroupID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals', @level2type = N'INDEX', @level2name = N'FK_Sales_SpecialDeals_StockItemID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Ensures that each special price row contains one and only one of DiscountAmount, DiscountPercentage, and UnitPrice', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals', @level2type = N'CONSTRAINT', @level2name = N'CK_Sales_SpecialDeals_Exactly_One_NOT_NULL_Pricing_Option_Is_Required';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Ensures that if a specific price is allocated that it applies to a specific stock item', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals', @level2type = N'CONSTRAINT', @level2name = N'CK_Sales_SpecialDeals_Unit_Price_Deal_Requires_Special_StockItem';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Special pricing (can include fixed prices, discount $ or discount %)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ID (sequence based) for a special deal', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals', @level2type = N'COLUMN', @level2name = N'SpecialDealID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Stock item that the deal applies to (if NULL, then only discounts are permitted not unit prices)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals', @level2type = N'COLUMN', @level2name = N'StockItemID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ID of the customer that the special pricing applies to (if NULL then all customers)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals', @level2type = N'COLUMN', @level2name = N'CustomerID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ID of the buying group that the special pricing applies to (optional)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals', @level2type = N'COLUMN', @level2name = N'BuyingGroupID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ID of the customer category that the special pricing applies to (optional)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals', @level2type = N'COLUMN', @level2name = N'CustomerCategoryID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ID of the stock group that the special pricing applies to (optional)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals', @level2type = N'COLUMN', @level2name = N'StockGroupID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Description of the special deal', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals', @level2type = N'COLUMN', @level2name = N'DealDescription';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Date that the special pricing starts from', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals', @level2type = N'COLUMN', @level2name = N'StartDate';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Date that the special pricing ends on', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals', @level2type = N'COLUMN', @level2name = N'EndDate';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Discount per unit to be applied to sale price (optional)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals', @level2type = N'COLUMN', @level2name = N'DiscountAmount';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Discount percentage per unit to be applied to sale price (optional)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals', @level2type = N'COLUMN', @level2name = N'DiscountPercentage';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Special price per unit to be applied instead of sale price (optional)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialDeals', @level2type = N'COLUMN', @level2name = N'UnitPrice';

