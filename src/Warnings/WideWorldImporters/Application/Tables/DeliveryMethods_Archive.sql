CREATE TABLE [Application].[DeliveryMethods_Archive] (
    [DeliveryMethodID]   INT           NOT NULL,
    [DeliveryMethodName] NVARCHAR (50) NOT NULL,
    [LastEditedBy]       INT           NOT NULL,
    [ValidFrom]          DATETIME2 (7) NOT NULL,
    [ValidTo]            DATETIME2 (7) NOT NULL
) ON [USERDATA];


GO
CREATE CLUSTERED INDEX [ix_DeliveryMethods_Archive]
    ON [Application].[DeliveryMethods_Archive]([ValidTo] ASC, [ValidFrom] ASC)
    ON [USERDATA];

