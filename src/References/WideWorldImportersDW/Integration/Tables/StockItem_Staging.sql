CREATE TABLE [Integration].[StockItem_Staging] (
    [Stock Item Staging Key]   INT             IDENTITY (1, 1) NOT NULL,
    [WWI Stock Item ID]        INT             NOT NULL,
    [Stock Item]               NVARCHAR (100)  NOT NULL,
    [Color]                    NVARCHAR (20)   NOT NULL,
    [Selling Package]          NVARCHAR (50)   NOT NULL,
    [Buying Package]           NVARCHAR (50)   NOT NULL,
    [Brand]                    NVARCHAR (50)   NOT NULL,
    [Size]                     NVARCHAR (20)   NOT NULL,
    [Lead Time Days]           INT             NOT NULL,
    [Quantity Per Outer]       INT             NOT NULL,
    [Is Chiller Stock]         BIT             NOT NULL,
    [Barcode]                  NVARCHAR (50)   NULL,
    [Tax Rate]                 DECIMAL (18, 3) NOT NULL,
    [Unit Price]               DECIMAL (18, 2) NOT NULL,
    [Recommended Retail Price] DECIMAL (18, 2) NULL,
    [Typical Weight Per Unit]  DECIMAL (18, 3) NOT NULL,
    [Photo]                    VARBINARY (MAX) NULL,
    [Valid From]               DATETIME2 (7)   NOT NULL,
    [Valid To]                 DATETIME2 (7)   NOT NULL,
    CONSTRAINT [PK_Integration_StockItem_Staging] PRIMARY KEY CLUSTERED ([Stock Item Staging Key] ASC) ON [USERDATA]
) ON [USERDATA] TEXTIMAGE_ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [IX_Integration_StockItem_Staging_WWI_Stock_Item_ID]
    ON [Integration].[StockItem_Staging]([WWI Stock Item ID] ASC)
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Allows quickly locating by WWI Stock Item ID', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'INDEX', @level2name = N'IX_Integration_StockItem_Staging_WWI_Stock_Item_ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Stock item staging table', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Row ID within the staging table', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'COLUMN', @level2name = N'Stock Item Staging Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a stock item within the WWI database', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'COLUMN', @level2name = N'WWI Stock Item ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Full name of a stock item (but not a full description)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'COLUMN', @level2name = N'Stock Item';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Color (optional) for this stock item', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'COLUMN', @level2name = N'Color';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Usual package for selling units of this stock item', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'COLUMN', @level2name = N'Selling Package';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Usual package for selling outers of this stock item (ie cartons, boxes, etc.)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'COLUMN', @level2name = N'Buying Package';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Brand for the stock item (if the item is branded)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'COLUMN', @level2name = N'Brand';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Size of this item (eg: 100mm)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'COLUMN', @level2name = N'Size';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Number of days typically taken from order to receipt of this stock item', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'COLUMN', @level2name = N'Lead Time Days';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Quantity of the stock item in an outer package', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'COLUMN', @level2name = N'Quantity Per Outer';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Does this stock item need to be in a chiller?', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'COLUMN', @level2name = N'Is Chiller Stock';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Barcode for this stock item', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'COLUMN', @level2name = N'Barcode';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Tax rate to be applied', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'COLUMN', @level2name = N'Tax Rate';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Selling price (ex-tax) for one unit of this product', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'COLUMN', @level2name = N'Unit Price';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Recommended retail price for this stock item', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'COLUMN', @level2name = N'Recommended Retail Price';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Typical weight for one unit of this product (packaged)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'COLUMN', @level2name = N'Typical Weight Per Unit';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Photo of the product', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'COLUMN', @level2name = N'Photo';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid from this date and time', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'COLUMN', @level2name = N'Valid From';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid until this date and time', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'StockItem_Staging', @level2type = N'COLUMN', @level2name = N'Valid To';

