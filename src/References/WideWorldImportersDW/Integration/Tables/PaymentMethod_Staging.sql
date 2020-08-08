CREATE TABLE [Integration].[PaymentMethod_Staging] (
    [Payment Method Staging Key] INT           IDENTITY (1, 1) NOT NULL,
    [WWI Payment Method ID]      INT           NOT NULL,
    [Payment Method]             NVARCHAR (50) NOT NULL,
    [Valid From]                 DATETIME2 (7) NOT NULL,
    [Valid To]                   DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_Integration_PaymentMethod_Staging] PRIMARY KEY CLUSTERED ([Payment Method Staging Key] ASC) ON [USERDATA]
) ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [IX_Integration_PaymentMethod_Staging_WWI_Payment_Method_ID]
    ON [Integration].[PaymentMethod_Staging]([WWI Payment Method ID] ASC)
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Allows quickly locating by WWI Payment Method ID', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'PaymentMethod_Staging', @level2type = N'INDEX', @level2name = N'IX_Integration_PaymentMethod_Staging_WWI_Payment_Method_ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Payment method staging table', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'PaymentMethod_Staging';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Row ID within the staging table', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'PaymentMethod_Staging', @level2type = N'COLUMN', @level2name = N'Payment Method Staging Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID for the payment method in the WWI database', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'PaymentMethod_Staging', @level2type = N'COLUMN', @level2name = N'WWI Payment Method ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Payment method name', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'PaymentMethod_Staging', @level2type = N'COLUMN', @level2name = N'Payment Method';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid from this date and time', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'PaymentMethod_Staging', @level2type = N'COLUMN', @level2name = N'Valid From';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid until this date and time', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'PaymentMethod_Staging', @level2type = N'COLUMN', @level2name = N'Valid To';

