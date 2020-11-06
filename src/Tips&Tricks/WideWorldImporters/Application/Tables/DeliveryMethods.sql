CREATE TABLE [Application].[DeliveryMethods] (
    [DeliveryMethodID]   INT                                         CONSTRAINT [DF_Application_DeliveryMethods_DeliveryMethodID] DEFAULT (NEXT VALUE FOR [Sequences].[DeliveryMethodID]) NOT NULL,
    [DeliveryMethodName] NVARCHAR (50)                               NOT NULL,
    [LastEditedBy]       INT                                         NOT NULL,
    [ValidFrom]          DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]            DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_Application_DeliveryMethods] PRIMARY KEY CLUSTERED ([DeliveryMethodID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Application_DeliveryMethods_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [UQ_Application_DeliveryMethods_DeliveryMethodName] UNIQUE NONCLUSTERED ([DeliveryMethodName] ASC) ON [USERDATA],
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Application].[DeliveryMethods_Archive], DATA_CONSISTENCY_CHECK=ON));


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Ways that stock items can be delivered (ie: truck/van, post, pickup, courier, etc.', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'DeliveryMethods';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a delivery method within the database', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'DeliveryMethods', @level2type = N'COLUMN', @level2name = N'DeliveryMethodID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Full name of methods that can be used for delivery of customer orders', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'DeliveryMethods', @level2type = N'COLUMN', @level2name = N'DeliveryMethodName';

