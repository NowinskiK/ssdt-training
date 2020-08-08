CREATE TABLE [Integration].[Sale_Staging] (
    [Sale Staging Key]        BIGINT          IDENTITY (1, 1) NOT NULL,
    [City Key]                INT             NULL,
    [Customer Key]            INT             NULL,
    [Bill To Customer Key]    INT             NULL,
    [Stock Item Key]          INT             NULL,
    [Invoice Date Key]        DATE            NULL,
    [Delivery Date Key]       DATE            NULL,
    [Salesperson Key]         INT             NULL,
    [WWI Invoice ID]          INT             NULL,
    [Description]             NVARCHAR (100)  NULL,
    [Package]                 NVARCHAR (50)   NULL,
    [Quantity]                INT             NULL,
    [Unit Price]              DECIMAL (18, 2) NULL,
    [Tax Rate]                DECIMAL (18, 3) NULL,
    [Total Excluding Tax]     DECIMAL (18, 2) NULL,
    [Tax Amount]              DECIMAL (18, 2) NULL,
    [Profit]                  DECIMAL (18, 2) NULL,
    [Total Including Tax]     DECIMAL (18, 2) NULL,
    [Total Dry Items]         INT             NULL,
    [Total Chiller Items]     INT             NULL,
    [WWI City ID]             INT             NULL,
    [WWI Customer ID]         INT             NULL,
    [WWI Bill To Customer ID] INT             NULL,
    [WWI Stock Item ID]       INT             NULL,
    [WWI Salesperson ID]      INT             NULL,
    [Last Modified When]      DATETIME2 (7)   NULL,
    CONSTRAINT [PK_Integration_Sale_Staging] PRIMARY KEY CLUSTERED ([Sale Staging Key] ASC) ON [USERDATA]
) ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Sale staging table', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'DW key for a row in the Sale fact', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'Sale Staging Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'City for this invoice', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'City Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer for this invoice', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'Customer Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Bill To Customer for this invoice', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'Bill To Customer Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Stock item for this invoice', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'Stock Item Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Invoice date for this invoice', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'Invoice Date Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Date that these items were delivered', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'Delivery Date Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Salesperson for this invoice', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'Salesperson Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'InvoiceID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'WWI Invoice ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Description of the item supplied (Usually the stock item name but can be overridden)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Type of package supplied', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'Package';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Quantity supplied', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'Quantity';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Unit price charged', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'Unit Price';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Tax rate applied', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'Tax Rate';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Total amount excluding tax', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'Total Excluding Tax';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Total amount of tax', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'Tax Amount';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Total amount of profit', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'Profit';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Total amount including tax', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'Total Including Tax';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Total number of dry items', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'Total Dry Items';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Total number of chiller items', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'Total Chiller Items';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'City ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'WWI City ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'WWI Customer ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Bill to Customer ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'WWI Bill To Customer ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Stock Item ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'WWI Stock Item ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Salesperson person ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'WWI Salesperson ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'When this row was last modified', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Sale_Staging', @level2type = N'COLUMN', @level2name = N'Last Modified When';

