CREATE TABLE [Purchasing].[Suppliers] (
    [SupplierID]               INT                                                CONSTRAINT [DF_Purchasing_Suppliers_SupplierID] DEFAULT (NEXT VALUE FOR [Sequences].[SupplierID]) NOT NULL,
    [SupplierName]             NVARCHAR (100)                                     NOT NULL,
    [SupplierCategoryID]       INT                                                NOT NULL,
    [PrimaryContactPersonID]   INT                                                NOT NULL,
    [AlternateContactPersonID] INT                                                NOT NULL,
    [DeliveryMethodID]         INT                                                NULL,
    [DeliveryCityID]           INT                                                NOT NULL,
    [PostalCityID]             INT                                                NOT NULL,
    [SupplierReference]        NVARCHAR (20)                                      NULL,
    [BankAccountName]          NVARCHAR (50) MASKED WITH (FUNCTION = 'default()') NULL,
    [BankAccountBranch]        NVARCHAR (50) MASKED WITH (FUNCTION = 'default()') NULL,
    [BankAccountCode]          NVARCHAR (20) MASKED WITH (FUNCTION = 'default()') NULL,
    [BankAccountNumber]        NVARCHAR (20) MASKED WITH (FUNCTION = 'default()') NULL,
    [BankInternationalCode]    NVARCHAR (20) MASKED WITH (FUNCTION = 'default()') NULL,
    [PaymentDays]              INT                                                NOT NULL,
    [InternalComments]         NVARCHAR (MAX)                                     NULL,
    [PhoneNumber]              NVARCHAR (20)                                      NOT NULL,
    [FaxNumber]                NVARCHAR (20)                                      NOT NULL,
    [WebsiteURL]               NVARCHAR (256)                                     NOT NULL,
    [DeliveryAddressLine1]     NVARCHAR (60)                                      NOT NULL,
    [DeliveryAddressLine2]     NVARCHAR (60)                                      NULL,
    [DeliveryPostalCode]       NVARCHAR (10)                                      NOT NULL,
    [DeliveryLocation]         [sys].[geography]                                  NULL,
    [PostalAddressLine1]       NVARCHAR (60)                                      NOT NULL,
    [PostalAddressLine2]       NVARCHAR (60)                                      NULL,
    [PostalPostalCode]         NVARCHAR (10)                                      NOT NULL,
    [LastEditedBy]             INT                                                NOT NULL,
    [ValidFrom]                DATETIME2 (7) GENERATED ALWAYS AS ROW START        NOT NULL,
    [ValidTo]                  DATETIME2 (7) GENERATED ALWAYS AS ROW END          NOT NULL,
    CONSTRAINT [PK_Purchasing_Suppliers] PRIMARY KEY CLUSTERED ([SupplierID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Purchasing_Suppliers_AlternateContactPersonID_Application_People] FOREIGN KEY ([AlternateContactPersonID]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Purchasing_Suppliers_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Purchasing_Suppliers_DeliveryCityID_Application_Cities] FOREIGN KEY ([DeliveryCityID]) REFERENCES [Application].[Cities] ([CityID]),
    CONSTRAINT [FK_Purchasing_Suppliers_DeliveryMethodID_Application_DeliveryMethods] FOREIGN KEY ([DeliveryMethodID]) REFERENCES [Application].[DeliveryMethods] ([DeliveryMethodID]),
    CONSTRAINT [FK_Purchasing_Suppliers_PostalCityID_Application_Cities] FOREIGN KEY ([PostalCityID]) REFERENCES [Application].[Cities] ([CityID]),
    CONSTRAINT [FK_Purchasing_Suppliers_PrimaryContactPersonID_Application_People] FOREIGN KEY ([PrimaryContactPersonID]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Purchasing_Suppliers_SupplierCategoryID_Purchasing_SupplierCategories] FOREIGN KEY ([SupplierCategoryID]) REFERENCES [Purchasing].[SupplierCategories] ([SupplierCategoryID]),
    CONSTRAINT [UQ_Purchasing_Suppliers_SupplierName] UNIQUE NONCLUSTERED ([SupplierName] ASC) ON [USERDATA],
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Purchasing].[Suppliers_Archive], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [FK_Purchasing_Suppliers_AlternateContactPersonID]
    ON [Purchasing].[Suppliers]([AlternateContactPersonID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Purchasing_Suppliers_DeliveryCityID]
    ON [Purchasing].[Suppliers]([DeliveryCityID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Purchasing_Suppliers_DeliveryMethodID]
    ON [Purchasing].[Suppliers]([DeliveryMethodID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Purchasing_Suppliers_PostalCityID]
    ON [Purchasing].[Suppliers]([PostalCityID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Purchasing_Suppliers_PrimaryContactPersonID]
    ON [Purchasing].[Suppliers]([PrimaryContactPersonID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Purchasing_Suppliers_SupplierCategoryID]
    ON [Purchasing].[Suppliers]([SupplierCategoryID] ASC)
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'INDEX', @level2name = N'FK_Purchasing_Suppliers_AlternateContactPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'INDEX', @level2name = N'FK_Purchasing_Suppliers_DeliveryCityID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'INDEX', @level2name = N'FK_Purchasing_Suppliers_DeliveryMethodID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'INDEX', @level2name = N'FK_Purchasing_Suppliers_PostalCityID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'INDEX', @level2name = N'FK_Purchasing_Suppliers_PrimaryContactPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'INDEX', @level2name = N'FK_Purchasing_Suppliers_SupplierCategoryID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Main entity table for suppliers (organizations)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a supplier within the database', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'SupplierID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier''s full name (usually a trading name)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'SupplierName';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier''s category', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'SupplierCategoryID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Primary contact', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'PrimaryContactPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Alternate contact', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'AlternateContactPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Standard delivery method for stock items received from this supplier', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'DeliveryMethodID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ID of the delivery city for this address', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'DeliveryCityID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ID of the mailing city for this address', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'PostalCityID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier reference for our organization (might be our account number at the supplier)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'SupplierReference';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier''s bank account name (ie name on the account)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'BankAccountName';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier''s bank branch', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'BankAccountBranch';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier''s bank account code (usually a numeric reference for the bank branch)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'BankAccountCode';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier''s bank account number', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'BankAccountNumber';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier''s bank''s international code (such as a SWIFT code)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'BankInternationalCode';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Number of days for payment of an invoice (ie payment terms)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'PaymentDays';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Internal comments (not exposed outside organization)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'InternalComments';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Phone number', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'PhoneNumber';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Fax number  ', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'FaxNumber';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'URL for the website for this supplier', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'WebsiteURL';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'First delivery address line for the supplier', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'DeliveryAddressLine1';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Second delivery address line for the supplier', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'DeliveryAddressLine2';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Delivery postal code for the supplier', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'DeliveryPostalCode';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Geographic location for the supplier''s office/warehouse', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'DeliveryLocation';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'First postal address line for the supplier', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'PostalAddressLine1';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Second postal address line for the supplier', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'PostalAddressLine2';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Postal code for the supplier when sending by mail', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'Suppliers', @level2type = N'COLUMN', @level2name = N'PostalPostalCode';

