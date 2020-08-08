CREATE TABLE [Integration].[Order_Staging] (
    [Order Staging Key]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [City Key]            INT             NULL,
    [Customer Key]        INT             NULL,
    [Stock Item Key]      INT             NULL,
    [Order Date Key]      DATE            NULL,
    [Picked Date Key]     DATE            NULL,
    [Salesperson Key]     INT             NULL,
    [Picker Key]          INT             NULL,
    [WWI Order ID]        INT             NULL,
    [WWI Backorder ID]    INT             NULL,
    [Description]         NVARCHAR (100)  NULL,
    [Package]             NVARCHAR (50)   NULL,
    [Quantity]            INT             NULL,
    [Unit Price]          DECIMAL (18, 2) NULL,
    [Tax Rate]            DECIMAL (18, 3) NULL,
    [Total Excluding Tax] DECIMAL (18, 2) NULL,
    [Tax Amount]          DECIMAL (18, 2) NULL,
    [Total Including Tax] DECIMAL (18, 2) NULL,
    [Lineage Key]         INT             NULL,
    [WWI City ID]         INT             NULL,
    [WWI Customer ID]     INT             NULL,
    [WWI Stock Item ID]   INT             NULL,
    [WWI Salesperson ID]  INT             NULL,
    [WWI Picker ID]       INT             NULL,
    [Last Modified When]  DATETIME2 (7)   NULL,
    CONSTRAINT [PK_Integration_Order_Staging] PRIMARY KEY CLUSTERED ([Order Staging Key] ASC) ON [USERDATA]
) ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Order staging table', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'DW key for a row in the Order fact', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'Order Staging Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'City for this order', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'City Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer for this order', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'Customer Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Stock item for this order', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'Stock Item Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Order date for this order', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'Order Date Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Picked date for this order', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'Picked Date Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Salesperson for this order', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'Salesperson Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Picker for this order', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'Picker Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'OrderID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'WWI Order ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'BackorderID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'WWI Backorder ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Description of the item supplied (Usually the stock item name but can be overridden)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Type of package to be supplied', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'Package';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Quantity to be supplied', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'Quantity';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Unit price to be charged', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'Unit Price';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Tax rate to be applied', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'Tax Rate';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Total amount excluding tax', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'Total Excluding Tax';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Total amount of tax', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'Tax Amount';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Total amount including tax', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'Total Including Tax';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Lineage Key for the data load for this row', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'Lineage Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'City ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'WWI City ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'WWI Customer ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Stock Item ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'WWI Stock Item ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Salesperson person ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'WWI Salesperson ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Picker person ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'WWI Picker ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'When this row was last modified', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Order_Staging', @level2type = N'COLUMN', @level2name = N'Last Modified When';

