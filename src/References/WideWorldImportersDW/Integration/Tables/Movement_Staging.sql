CREATE TABLE [Integration].[Movement_Staging] (
    [Movement Staging Key]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [Date Key]                      DATE          NULL,
    [Stock Item Key]                INT           NULL,
    [Customer Key]                  INT           NULL,
    [Supplier Key]                  INT           NULL,
    [Transaction Type Key]          INT           NULL,
    [WWI Stock Item Transaction ID] INT           NULL,
    [WWI Invoice ID]                INT           NULL,
    [WWI Purchase Order ID]         INT           NULL,
    [Quantity]                      INT           NULL,
    [WWI Stock Item ID]             INT           NULL,
    [WWI Customer ID]               INT           NULL,
    [WWI Supplier ID]               INT           NULL,
    [WWI Transaction Type ID]       INT           NULL,
    [Last Modifed When]             DATETIME2 (7) NULL,
    CONSTRAINT [PK_Integration_Movement_Staging] PRIMARY KEY CLUSTERED ([Movement Staging Key] ASC) ON [USERDATA]
) ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Movement staging table', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Movement_Staging';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'DW key for a row in the Movement fact', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Movement_Staging', @level2type = N'COLUMN', @level2name = N'Movement Staging Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Transaction date', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Movement_Staging', @level2type = N'COLUMN', @level2name = N'Date Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Stock item for this purchase order', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Movement_Staging', @level2type = N'COLUMN', @level2name = N'Stock Item Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer (if applicable)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Movement_Staging', @level2type = N'COLUMN', @level2name = N'Customer Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier (if applicable)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Movement_Staging', @level2type = N'COLUMN', @level2name = N'Supplier Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Type of transaction', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Movement_Staging', @level2type = N'COLUMN', @level2name = N'Transaction Type Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Stock item transaction ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Movement_Staging', @level2type = N'COLUMN', @level2name = N'WWI Stock Item Transaction ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Invoice ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Movement_Staging', @level2type = N'COLUMN', @level2name = N'WWI Invoice ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Purchase order ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Movement_Staging', @level2type = N'COLUMN', @level2name = N'WWI Purchase Order ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Quantity of stock movement (positive is incoming stock, negative is outgoing)', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Movement_Staging', @level2type = N'COLUMN', @level2name = N'Quantity';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Stock Item ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Movement_Staging', @level2type = N'COLUMN', @level2name = N'WWI Stock Item ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Movement_Staging', @level2type = N'COLUMN', @level2name = N'WWI Customer ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Movement_Staging', @level2type = N'COLUMN', @level2name = N'WWI Supplier ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Transaction Type ID in source system', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Movement_Staging', @level2type = N'COLUMN', @level2name = N'WWI Transaction Type ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'When this row was last modified', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Movement_Staging', @level2type = N'COLUMN', @level2name = N'Last Modifed When';

