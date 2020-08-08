CREATE TABLE [Integration].[Transaction_Staging] (
    [Transaction Staging Key]     BIGINT          IDENTITY (1, 1) NOT NULL,
    [Date Key]                    DATE            NULL,
    [Customer Key]                INT             NULL,
    [Bill To Customer Key]        INT             NULL,
    [Supplier Key]                INT             NULL,
    [Transaction Type Key]        INT             NULL,
    [Payment Method Key]          INT             NULL,
    [WWI Customer Transaction ID] INT             NULL,
    [WWI Supplier Transaction ID] INT             NULL,
    [WWI Invoice ID]              INT             NULL,
    [WWI Purchase Order ID]       INT             NULL,
    [Supplier Invoice Number]     NVARCHAR (20)   NULL,
    [Total Excluding Tax]         DECIMAL (18, 2) NULL,
    [Tax Amount]                  DECIMAL (18, 2) NULL,
    [Total Including Tax]         DECIMAL (18, 2) NULL,
    [Outstanding Balance]         DECIMAL (18, 2) NULL,
    [Is Finalized]                BIT             NULL,
    [WWI Customer ID]             INT             NULL,
    [WWI Bill To Customer ID]     INT             NULL,
    [WWI Supplier ID]             INT             NULL,
    [WWI Transaction Type ID]     INT             NULL,
    [WWI Payment Method ID]       INT             NULL,
    [Last Modified When]          DATETIME2 (7)   NULL,
    CONSTRAINT [PK_Integration_Transaction_Staging] PRIMARY KEY CLUSTERED ([Transaction Staging Key] ASC) ON [USERDATA]
) ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Transaction staging table', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'DW key for a row in the Transaction fact', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'Transaction Staging Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Transaction date', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'Date Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer (if applicable)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'Customer Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Bill to customer (if applicable)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'Bill To Customer Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier (if applicable)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'Supplier Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Type of transaction', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'Transaction Type Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Payment method (if applicable)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'Payment Method Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer transaction ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'WWI Customer Transaction ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier transaction ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'WWI Supplier Transaction ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Invoice ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'WWI Invoice ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Purchase order ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'WWI Purchase Order ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier invoice number (if applicable)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'Supplier Invoice Number';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Total amount excluding tax', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'Total Excluding Tax';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Total amount of tax', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'Tax Amount';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Total amount including tax', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'Total Including Tax';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Amount still outstanding for this transaction', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'Outstanding Balance';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Has this transaction been finalized?', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'Is Finalized';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'WWI Customer ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Bill to Customer ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'WWI Bill To Customer ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'WWI Supplier ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Transaction Type ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'WWI Transaction Type ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Payment method ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'WWI Payment Method ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'When this row was last modified', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Transaction_Staging', @level2type = N'COLUMN', @level2name = N'Last Modified When';

