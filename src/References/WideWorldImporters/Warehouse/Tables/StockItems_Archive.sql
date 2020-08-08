CREATE TABLE [Warehouse].[StockItems_Archive] (
    [StockItemID]            INT             NOT NULL,
    [StockItemName]          NVARCHAR (100)  NOT NULL,
    [SupplierID]             INT             NOT NULL,
    [ColorID]                INT             NULL,
    [UnitPackageID]          INT             NOT NULL,
    [OuterPackageID]         INT             NOT NULL,
    [Brand]                  NVARCHAR (50)   NULL,
    [Size]                   NVARCHAR (20)   NULL,
    [LeadTimeDays]           INT             NOT NULL,
    [QuantityPerOuter]       INT             NOT NULL,
    [IsChillerStock]         BIT             NOT NULL,
    [Barcode]                NVARCHAR (50)   NULL,
    [TaxRate]                DECIMAL (18, 3) NOT NULL,
    [UnitPrice]              DECIMAL (18, 2) NOT NULL,
    [RecommendedRetailPrice] DECIMAL (18, 2) NULL,
    [TypicalWeightPerUnit]   DECIMAL (18, 3) NOT NULL,
    [MarketingComments]      NVARCHAR (MAX)  NULL,
    [InternalComments]       NVARCHAR (MAX)  NULL,
    [Photo]                  VARBINARY (MAX) NULL,
    [CustomFields]           NVARCHAR (MAX)  NULL,
    [Tags]                   NVARCHAR (MAX)  NULL,
    [SearchDetails]          NVARCHAR (MAX)  NOT NULL,
    [LastEditedBy]           INT             NOT NULL,
    [ValidFrom]              DATETIME2 (7)   NOT NULL,
    [ValidTo]                DATETIME2 (7)   NOT NULL
) ON [USERDATA] TEXTIMAGE_ON [USERDATA];


GO
CREATE CLUSTERED INDEX [ix_StockItems_Archive]
    ON [Warehouse].[StockItems_Archive]([ValidTo] ASC, [ValidFrom] ASC)
    ON [USERDATA];

