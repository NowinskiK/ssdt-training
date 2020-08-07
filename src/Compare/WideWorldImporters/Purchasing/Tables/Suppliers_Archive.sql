CREATE TABLE [Purchasing].[Suppliers_Archive] (
    [SupplierID]               INT                                                NOT NULL,
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
    [ValidFrom]                DATETIME2 (7)                                      NOT NULL,
    [ValidTo]                  DATETIME2 (7)                                      NOT NULL
) ON [USERDATA] TEXTIMAGE_ON [USERDATA];


GO
CREATE CLUSTERED INDEX [ix_Suppliers_Archive]
    ON [Purchasing].[Suppliers_Archive]([ValidTo] ASC, [ValidFrom] ASC)
    ON [USERDATA];

