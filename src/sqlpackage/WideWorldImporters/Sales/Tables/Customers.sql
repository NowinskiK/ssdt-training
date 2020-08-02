CREATE TABLE [Sales].[Customers] (
    [CustomerID]                 INT                                         CONSTRAINT [DF_Sales_Customers_CustomerID] DEFAULT (NEXT VALUE FOR [Sequences].[CustomerID]) NOT NULL,
    [CustomerName]               NVARCHAR (100)                              NOT NULL,
    [BillToCustomerID]           INT                                         NOT NULL,
    [CustomerCategoryID]         INT                                         NOT NULL,
    [BuyingGroupID]              INT                                         NULL,
    [PrimaryContactPersonID]     INT                                         NOT NULL,
    [AlternateContactPersonID]   INT                                         NULL,
    [DeliveryMethodID]           INT                                         NOT NULL,
    [DeliveryCityID]             INT                                         NOT NULL,
    [PostalCityID]               INT                                         NOT NULL,
    [CreditLimit]                DECIMAL (18, 2)                             NULL,
    [AccountOpenedDate]          DATE                                        NOT NULL,
    [StandardDiscountPercentage] DECIMAL (18, 3)                             NOT NULL,
    [IsStatementSent]            BIT                                         NOT NULL,
    [IsOnCreditHold]             BIT                                         NOT NULL,
    [PaymentDays]                INT                                         NOT NULL,
    [PhoneNumber]                NVARCHAR (20)                               NOT NULL,
    [FaxNumber]                  NVARCHAR (20)                               NOT NULL,
    [DeliveryRun]                NVARCHAR (5)                                NULL,
    [RunPosition]                NVARCHAR (5)                                NULL,
    [WebsiteURL]                 NVARCHAR (256)                              NOT NULL,
    [DeliveryAddressLine1]       NVARCHAR (60)                               NOT NULL,
    [DeliveryAddressLine2]       NVARCHAR (60)                               NULL,
    [DeliveryPostalCode]         NVARCHAR (10)                               NOT NULL,
    [DeliveryLocation]           [sys].[geography]                           NULL,
    [PostalAddressLine1]         NVARCHAR (60)                               NOT NULL,
    [PostalAddressLine2]         NVARCHAR (60)                               NULL,
    [PostalPostalCode]           NVARCHAR (10)                               NOT NULL,
    [LastEditedBy]               INT                                         NOT NULL,
    [ValidFrom]                  DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                    DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_Sales_Customers] PRIMARY KEY CLUSTERED ([CustomerID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Sales_Customers_AlternateContactPersonID_Application_People] FOREIGN KEY ([AlternateContactPersonID]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Sales_Customers_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Sales_Customers_BillToCustomerID_Sales_Customers] FOREIGN KEY ([BillToCustomerID]) REFERENCES [Sales].[Customers] ([CustomerID]),
    CONSTRAINT [FK_Sales_Customers_BuyingGroupID_Sales_BuyingGroups] FOREIGN KEY ([BuyingGroupID]) REFERENCES [Sales].[BuyingGroups] ([BuyingGroupID]),
    CONSTRAINT [FK_Sales_Customers_CustomerCategoryID_Sales_CustomerCategories] FOREIGN KEY ([CustomerCategoryID]) REFERENCES [Sales].[CustomerCategories] ([CustomerCategoryID]),
    CONSTRAINT [FK_Sales_Customers_DeliveryCityID_Application_Cities] FOREIGN KEY ([DeliveryCityID]) REFERENCES [Application].[Cities] ([CityID]),
    CONSTRAINT [FK_Sales_Customers_DeliveryMethodID_Application_DeliveryMethods] FOREIGN KEY ([DeliveryMethodID]) REFERENCES [Application].[DeliveryMethods] ([DeliveryMethodID]),
    CONSTRAINT [FK_Sales_Customers_PostalCityID_Application_Cities] FOREIGN KEY ([PostalCityID]) REFERENCES [Application].[Cities] ([CityID]),
    CONSTRAINT [FK_Sales_Customers_PrimaryContactPersonID_Application_People] FOREIGN KEY ([PrimaryContactPersonID]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [UQ_Sales_Customers_CustomerName] UNIQUE NONCLUSTERED ([CustomerName] ASC) ON [USERDATA],
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Sales].[Customers_Archive], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [FK_Sales_Customers_AlternateContactPersonID]
    ON [Sales].[Customers]([AlternateContactPersonID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_Customers_BuyingGroupID]
    ON [Sales].[Customers]([BuyingGroupID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_Customers_CustomerCategoryID]
    ON [Sales].[Customers]([CustomerCategoryID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_Customers_DeliveryCityID]
    ON [Sales].[Customers]([DeliveryCityID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_Customers_DeliveryMethodID]
    ON [Sales].[Customers]([DeliveryMethodID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_Customers_PostalCityID]
    ON [Sales].[Customers]([PostalCityID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_Customers_PrimaryContactPersonID]
    ON [Sales].[Customers]([PrimaryContactPersonID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [IX_Sales_Customers_Perf_20160301_06]
    ON [Sales].[Customers]([IsOnCreditHold] ASC, [CustomerID] ASC, [BillToCustomerID] ASC)
    INCLUDE([PrimaryContactPersonID])
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'INDEX', @level2name = N'FK_Sales_Customers_AlternateContactPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'INDEX', @level2name = N'FK_Sales_Customers_BuyingGroupID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'INDEX', @level2name = N'FK_Sales_Customers_CustomerCategoryID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'INDEX', @level2name = N'FK_Sales_Customers_DeliveryCityID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'INDEX', @level2name = N'FK_Sales_Customers_DeliveryMethodID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'INDEX', @level2name = N'FK_Sales_Customers_PostalCityID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'INDEX', @level2name = N'FK_Sales_Customers_PrimaryContactPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Improves performance of order picking and invoicing', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'INDEX', @level2name = N'IX_Sales_Customers_Perf_20160301_06';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Main entity tables for customers (organizations or individuals)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a customer within the database', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'CustomerID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer''s full name (usually a trading name)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'CustomerName';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer that this is billed to (usually the same customer but can be another parent company)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'BillToCustomerID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer''s category', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'CustomerCategoryID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer''s buying group (optional)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'BuyingGroupID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Primary contact', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'PrimaryContactPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Alternate contact', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'AlternateContactPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Standard delivery method for stock items sent to this customer', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'DeliveryMethodID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ID of the delivery city for this address', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'DeliveryCityID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ID of the postal city for this address', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'PostalCityID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Credit limit for this customer (NULL if unlimited)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'CreditLimit';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Date this customer account was opened', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'AccountOpenedDate';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Standard discount offered to this customer', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'StandardDiscountPercentage';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Is a statement sent to this customer? (Or do they just pay on each invoice?)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'IsStatementSent';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Is this customer on credit hold? (Prevents further deliveries to this customer)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'IsOnCreditHold';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Number of days for payment of an invoice (ie payment terms)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'PaymentDays';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Phone number', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'PhoneNumber';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Fax number  ', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'FaxNumber';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Normal delivery run for this customer', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'DeliveryRun';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Normal position in the delivery run for this customer', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'RunPosition';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'URL for the website for this customer', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'WebsiteURL';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'First delivery address line for the customer', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'DeliveryAddressLine1';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Second delivery address line for the customer', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'DeliveryAddressLine2';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Delivery postal code for the customer', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'DeliveryPostalCode';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Geographic location for the customer''s office/warehouse', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'DeliveryLocation';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'First postal address line for the customer', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'PostalAddressLine1';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Second postal address line for the customer', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'PostalAddressLine2';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Postal code for the customer when sending by mail', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customers', @level2type = N'COLUMN', @level2name = N'PostalPostalCode';

