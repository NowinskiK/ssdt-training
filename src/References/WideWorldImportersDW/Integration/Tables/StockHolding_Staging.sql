CREATE TABLE [Integration].[StockHolding_Staging] (
    [Stock Holding Staging Key] BIGINT          IDENTITY (1, 1) NOT NULL,
    [Stock Item Key]            INT             NULL,
    [Quantity On Hand]          INT             NULL,
    [Bin Location]              NVARCHAR (20)   NULL,
    [Last Stocktake Quantity]   INT             NULL,
    [Last Cost Price]           DECIMAL (18, 2) NULL,
    [Reorder Level]             INT             NULL,
    [Target Stock Level]        INT             NULL,
    [WWI Stock Item ID]         INT             NULL,
    CONSTRAINT [PK_Integration_StockHolding_Staging] PRIMARY KEY CLUSTERED ([Stock Holding Staging Key] ASC) ON [USERDATA]
) ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Stock holding staging table', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockHolding_Staging';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'DW key for a row in the Stock Holding fact', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockHolding_Staging', @level2type = N'COLUMN', @level2name = N'Stock Holding Staging Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Stock item being held', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockHolding_Staging', @level2type = N'COLUMN', @level2name = N'Stock Item Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Quantity on hand', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockHolding_Staging', @level2type = N'COLUMN', @level2name = N'Quantity On Hand';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Bin location (where is this stock in the warehouse)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockHolding_Staging', @level2type = N'COLUMN', @level2name = N'Bin Location';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Quantity present at last stocktake', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockHolding_Staging', @level2type = N'COLUMN', @level2name = N'Last Stocktake Quantity';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Unit cost when the stock item was last purchased', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockHolding_Staging', @level2type = N'COLUMN', @level2name = N'Last Cost Price';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Quantity below which reordering should take place', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockHolding_Staging', @level2type = N'COLUMN', @level2name = N'Reorder Level';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Typical stock level held', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockHolding_Staging', @level2type = N'COLUMN', @level2name = N'Target Stock Level';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Stock Item ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockHolding_Staging', @level2type = N'COLUMN', @level2name = N'WWI Stock Item ID';

