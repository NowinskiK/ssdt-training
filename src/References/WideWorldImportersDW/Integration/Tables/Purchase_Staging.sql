CREATE TABLE [Integration].[Purchase_Staging] (
    [Purchase Staging Key]  BIGINT        IDENTITY (1, 1) NOT NULL,
    [Date Key]              DATE          NULL,
    [Supplier Key]          INT           NULL,
    [Stock Item Key]        INT           NULL,
    [WWI Purchase Order ID] INT           NULL,
    [Ordered Outers]        INT           NULL,
    [Ordered Quantity]      INT           NULL,
    [Received Outers]       INT           NULL,
    [Package]               NVARCHAR (50) NULL,
    [Is Order Finalized]    BIT           NULL,
    [WWI Supplier ID]       INT           NULL,
    [WWI Stock Item ID]     INT           NULL,
    [Last Modified When]    DATETIME2 (7) NULL,
    CONSTRAINT [PK_Integration_Purchase_Staging] PRIMARY KEY CLUSTERED ([Purchase Staging Key] ASC) ON [USERDATA]
) ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Purchase staging table', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Purchase_Staging';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'DW key for a row in the Purchase fact', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Purchase_Staging', @level2type = N'COLUMN', @level2name = N'Purchase Staging Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Purchase order date', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Purchase_Staging', @level2type = N'COLUMN', @level2name = N'Date Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier for this purchase order', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Purchase_Staging', @level2type = N'COLUMN', @level2name = N'Supplier Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Stock item for this purchase order', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Purchase_Staging', @level2type = N'COLUMN', @level2name = N'Stock Item Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Purchase order ID in source system ', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Purchase_Staging', @level2type = N'COLUMN', @level2name = N'WWI Purchase Order ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Quantity of outers (ordering packages)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Purchase_Staging', @level2type = N'COLUMN', @level2name = N'Ordered Outers';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Quantity of inners (selling packages)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Purchase_Staging', @level2type = N'COLUMN', @level2name = N'Ordered Quantity';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Received outers (so far)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Purchase_Staging', @level2type = N'COLUMN', @level2name = N'Received Outers';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Package ordered', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Purchase_Staging', @level2type = N'COLUMN', @level2name = N'Package';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Is this purchase order now finalized?', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Purchase_Staging', @level2type = N'COLUMN', @level2name = N'Is Order Finalized';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Purchase_Staging', @level2type = N'COLUMN', @level2name = N'WWI Supplier ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Stock Item ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Purchase_Staging', @level2type = N'COLUMN', @level2name = N'WWI Stock Item ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'When this row was last modified', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Purchase_Staging', @level2type = N'COLUMN', @level2name = N'Last Modified When';

