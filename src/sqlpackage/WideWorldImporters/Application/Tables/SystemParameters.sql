CREATE TABLE [Application].[SystemParameters] (
    [SystemParameterID]    INT               CONSTRAINT [DF_Application_SystemParameters_SystemParameterID] DEFAULT (NEXT VALUE FOR [Sequences].[SystemParameterID]) NOT NULL,
    [DeliveryAddressLine1] NVARCHAR (60)     NOT NULL,
    [DeliveryAddressLine2] NVARCHAR (60)     NULL,
    [DeliveryCityID]       INT               NOT NULL,
    [DeliveryPostalCode]   NVARCHAR (10)     NOT NULL,
    [DeliveryLocation]     [sys].[geography] NOT NULL,
    [PostalAddressLine1]   NVARCHAR (60)     NOT NULL,
    [PostalAddressLine2]   NVARCHAR (60)     NULL,
    [PostalCityID]         INT               NOT NULL,
    [PostalPostalCode]     NVARCHAR (10)     NOT NULL,
    [ApplicationSettings]  NVARCHAR (MAX)    NOT NULL,
    [LastEditedBy]         INT               NOT NULL,
    [LastEditedWhen]       DATETIME2 (7)     CONSTRAINT [DF_Application_SystemParameters_LastEditedWhen] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_Application_SystemParameters] PRIMARY KEY CLUSTERED ([SystemParameterID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Application_SystemParameters_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Application_SystemParameters_DeliveryCityID_Application_Cities] FOREIGN KEY ([DeliveryCityID]) REFERENCES [Application].[Cities] ([CityID]),
    CONSTRAINT [FK_Application_SystemParameters_PostalCityID_Application_Cities] FOREIGN KEY ([PostalCityID]) REFERENCES [Application].[Cities] ([CityID])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Application_SystemParameters_DeliveryCityID]
    ON [Application].[SystemParameters]([DeliveryCityID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Application_SystemParameters_PostalCityID]
    ON [Application].[SystemParameters]([PostalCityID] ASC)
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'SystemParameters', @level2type = N'INDEX', @level2name = N'FK_Application_SystemParameters_DeliveryCityID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'SystemParameters', @level2type = N'INDEX', @level2name = N'FK_Application_SystemParameters_PostalCityID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Any configurable parameters for the whole system', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'SystemParameters';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for row holding system parameters', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'SystemParameters', @level2type = N'COLUMN', @level2name = N'SystemParameterID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'First address line for the company', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'SystemParameters', @level2type = N'COLUMN', @level2name = N'DeliveryAddressLine1';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Second address line for the company', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'SystemParameters', @level2type = N'COLUMN', @level2name = N'DeliveryAddressLine2';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ID of the city for this address', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'SystemParameters', @level2type = N'COLUMN', @level2name = N'DeliveryCityID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Postal code for the company', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'SystemParameters', @level2type = N'COLUMN', @level2name = N'DeliveryPostalCode';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Geographic location for the company office', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'SystemParameters', @level2type = N'COLUMN', @level2name = N'DeliveryLocation';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'First postal address line for the company', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'SystemParameters', @level2type = N'COLUMN', @level2name = N'PostalAddressLine1';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Second postaladdress line for the company', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'SystemParameters', @level2type = N'COLUMN', @level2name = N'PostalAddressLine2';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ID of the city for this postaladdress', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'SystemParameters', @level2type = N'COLUMN', @level2name = N'PostalCityID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Postal code for the company when sending via mail', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'SystemParameters', @level2type = N'COLUMN', @level2name = N'PostalPostalCode';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'JSON-structured application settings', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'SystemParameters', @level2type = N'COLUMN', @level2name = N'ApplicationSettings';

