CREATE TABLE [Application].[PaymentMethods_Archive] (
    [PaymentMethodID]   INT           NOT NULL,
    [PaymentMethodName] NVARCHAR (50) NOT NULL,
    [LastEditedBy]      INT           NOT NULL,
    [ValidFrom]         DATETIME2 (7) NOT NULL,
    [ValidTo]           DATETIME2 (7) NOT NULL
) ON [USERDATA];


GO
CREATE CLUSTERED INDEX [ix_PaymentMethods_Archive]
    ON [Application].[PaymentMethods_Archive]([ValidTo] ASC, [ValidFrom] ASC)
    ON [USERDATA];

