CREATE TABLE [Application].[PaymentMethods] (
    [PaymentMethodID]   INT                                         CONSTRAINT [DF_Application_PaymentMethods_PaymentMethodID] DEFAULT (NEXT VALUE FOR [Sequences].[PaymentMethodID]) NOT NULL,
    [PaymentMethodName] NVARCHAR (50)                               NOT NULL,
    [LastEditedBy]      INT                                         NOT NULL,
    [ValidFrom]         DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]           DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_Application_PaymentMethods] PRIMARY KEY CLUSTERED ([PaymentMethodID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Application_PaymentMethods_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [UQ_Application_PaymentMethods_PaymentMethodName] UNIQUE NONCLUSTERED ([PaymentMethodName] ASC) ON [USERDATA],
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Application].[PaymentMethods_Archive], DATA_CONSISTENCY_CHECK=ON));


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Ways that payments can be made (ie: cash, check, EFT, etc.', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'PaymentMethods';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a payment type within the database', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'PaymentMethods', @level2type = N'COLUMN', @level2name = N'PaymentMethodID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Full name of ways that customers can make payments or that suppliers can be paid', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'PaymentMethods', @level2type = N'COLUMN', @level2name = N'PaymentMethodName';

