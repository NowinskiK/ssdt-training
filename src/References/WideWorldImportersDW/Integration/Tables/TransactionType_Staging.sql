CREATE TABLE [Integration].[TransactionType_Staging] (
    [Transaction Type Staging Key] INT           IDENTITY (1, 1) NOT NULL,
    [WWI Transaction Type ID]      INT           NOT NULL,
    [Transaction Type]             NVARCHAR (50) NOT NULL,
    [Valid From]                   DATETIME2 (7) NOT NULL,
    [Valid To]                     DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_Integration_TransactionType_Staging] PRIMARY KEY CLUSTERED ([Transaction Type Staging Key] ASC) ON [USERDATA]
) ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Transaction type staging table', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'TransactionType_Staging';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Row ID within the staging table', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'TransactionType_Staging', @level2type = N'COLUMN', @level2name = N'Transaction Type Staging Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a transaction type within the WWI database', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'TransactionType_Staging', @level2type = N'COLUMN', @level2name = N'WWI Transaction Type ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Full name of the transaction type', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'TransactionType_Staging', @level2type = N'COLUMN', @level2name = N'Transaction Type';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid from this date and time', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'TransactionType_Staging', @level2type = N'COLUMN', @level2name = N'Valid From';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid until this date and time', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'TransactionType_Staging', @level2type = N'COLUMN', @level2name = N'Valid To';

