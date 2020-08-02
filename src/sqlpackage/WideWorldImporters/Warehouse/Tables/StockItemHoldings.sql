CREATE TABLE [Warehouse].[StockItemHoldings] (
    [StockItemID]           INT             NOT NULL,
    [QuantityOnHand]        INT             NOT NULL,
    [BinLocation]           NVARCHAR (20)   NOT NULL,
    [LastStocktakeQuantity] INT             NOT NULL,
    [LastCostPrice]         DECIMAL (18, 2) NOT NULL,
    [ReorderLevel]          INT             NOT NULL,
    [TargetStockLevel]      INT             NOT NULL,
    [LastEditedBy]          INT             NOT NULL,
    [LastEditedWhen]        DATETIME2 (7)   CONSTRAINT [DF_Warehouse_StockItemHoldings_LastEditedWhen] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_Warehouse_StockItemHoldings] PRIMARY KEY CLUSTERED ([StockItemID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Warehouse_StockItemHoldings_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [PKFK_Warehouse_StockItemHoldings_StockItemID_Warehouse_StockItems] FOREIGN KEY ([StockItemID]) REFERENCES [Warehouse].[StockItems] ([StockItemID])
) ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Non-temporal attributes for stock items', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemHoldings';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ID of the stock item that this holding relates to (this table holds non-temporal columns for stock)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemHoldings', @level2type = N'COLUMN', @level2name = N'StockItemID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Quantity currently on hand (if tracked)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemHoldings', @level2type = N'COLUMN', @level2name = N'QuantityOnHand';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Bin location (ie location of this stock item within the depot)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemHoldings', @level2type = N'COLUMN', @level2name = N'BinLocation';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Quantity at last stocktake (if tracked)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemHoldings', @level2type = N'COLUMN', @level2name = N'LastStocktakeQuantity';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Unit cost price the last time this stock item was purchased', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemHoldings', @level2type = N'COLUMN', @level2name = N'LastCostPrice';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Quantity below which reordering should take place', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemHoldings', @level2type = N'COLUMN', @level2name = N'ReorderLevel';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Typical quantity ordered', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemHoldings', @level2type = N'COLUMN', @level2name = N'TargetStockLevel';

