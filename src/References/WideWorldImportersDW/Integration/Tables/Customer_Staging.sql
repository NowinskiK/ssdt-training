CREATE TABLE [Integration].[Customer_Staging] (
    [Customer Staging Key] INT            IDENTITY (1, 1) NOT NULL,
    [WWI Customer ID]      INT            NOT NULL,
    [Customer]             NVARCHAR (100) NOT NULL,
    [Bill To Customer]     NVARCHAR (100) NOT NULL,
    [Category]             NVARCHAR (50)  NOT NULL,
    [Buying Group]         NVARCHAR (50)  NOT NULL,
    [Primary Contact]      NVARCHAR (50)  NOT NULL,
    [Postal Code]          NVARCHAR (10)  NOT NULL,
    [Valid From]           DATETIME2 (7)  NOT NULL,
    [Valid To]             DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_Integration_Customer_Staging] PRIMARY KEY CLUSTERED ([Customer Staging Key] ASC) ON [USERDATA]
) ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [IX_Integration_Customer_Staging_WWI_Customer_ID]
    ON [Integration].[Customer_Staging]([WWI Customer ID] ASC)
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Allows quickly locating by WWI Customer ID', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Customer_Staging', @level2type = N'INDEX', @level2name = N'IX_Integration_Customer_Staging_WWI_Customer_ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Customer staging table', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Customer_Staging';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Row ID within the staging table', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Customer_Staging', @level2type = N'COLUMN', @level2name = N'Customer Staging Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a customer within the WWI database', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Customer_Staging', @level2type = N'COLUMN', @level2name = N'WWI Customer ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer''s full name (usually a trading name)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Customer_Staging', @level2type = N'COLUMN', @level2name = N'Customer';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Bill to customer''s full name', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Customer_Staging', @level2type = N'COLUMN', @level2name = N'Bill To Customer';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer''s category', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Customer_Staging', @level2type = N'COLUMN', @level2name = N'Category';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer''s buying group', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Customer_Staging', @level2type = N'COLUMN', @level2name = N'Buying Group';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Primary contact', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Customer_Staging', @level2type = N'COLUMN', @level2name = N'Primary Contact';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Delivery postal code for the customer', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Customer_Staging', @level2type = N'COLUMN', @level2name = N'Postal Code';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid from this date and time', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Customer_Staging', @level2type = N'COLUMN', @level2name = N'Valid From';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid until this date and time', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Customer_Staging', @level2type = N'COLUMN', @level2name = N'Valid To';

