CREATE TABLE [Sales].[Customers_Archive] (
    [CustomerID]                 INT               NOT NULL,
    [CustomerName]               NVARCHAR (100)    NOT NULL,
    [BillToCustomerID]           INT               NOT NULL,
    [CustomerCategoryID]         INT               NOT NULL,
    [BuyingGroupID]              INT               NULL,
    [PrimaryContactPersonID]     INT               NOT NULL,
    [AlternateContactPersonID]   INT               NULL,
    [DeliveryMethodID]           INT               NOT NULL,
    [DeliveryCityID]             INT               NOT NULL,
    [PostalCityID]               INT               NOT NULL,
    [CreditLimit]                DECIMAL (18, 2)   NULL,
    [AccountOpenedDate]          DATE              NOT NULL,
    [StandardDiscountPercentage] DECIMAL (18, 3)   NOT NULL,
    [IsStatementSent]            BIT               NOT NULL,
    [IsOnCreditHold]             BIT               NOT NULL,
    [PaymentDays]                INT               NOT NULL,
    [PhoneNumber]                NVARCHAR (20)     NOT NULL,
    [FaxNumber]                  NVARCHAR (20)     NOT NULL,
    [DeliveryRun]                NVARCHAR (5)      NULL,
    [RunPosition]                NVARCHAR (5)      NULL,
    [WebsiteURL]                 NVARCHAR (256)    NOT NULL,
    [DeliveryAddressLine1]       NVARCHAR (60)     NOT NULL,
    [DeliveryAddressLine2]       NVARCHAR (60)     NULL,
    [DeliveryPostalCode]         NVARCHAR (10)     NOT NULL,
    [DeliveryLocation]           [sys].[geography] NULL,
    [PostalAddressLine1]         NVARCHAR (60)     NOT NULL,
    [PostalAddressLine2]         NVARCHAR (60)     NULL,
    [PostalPostalCode]           NVARCHAR (10)     NOT NULL,
    [LastEditedBy]               INT               NOT NULL,
    [ValidFrom]                  DATETIME2 (7)     NOT NULL,
    [ValidTo]                    DATETIME2 (7)     NOT NULL
) ON [USERDATA] TEXTIMAGE_ON [USERDATA];


GO
CREATE CLUSTERED INDEX [ix_Customers_Archive]
    ON [Sales].[Customers_Archive]([ValidTo] ASC, [ValidFrom] ASC)
    ON [USERDATA];

