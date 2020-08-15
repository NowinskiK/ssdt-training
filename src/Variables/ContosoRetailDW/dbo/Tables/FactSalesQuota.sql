CREATE TABLE [dbo].[FactSalesQuota] (
    [SalesQuotaKey]      INT      IDENTITY (1, 1) NOT NULL,
    [ChannelKey]         INT      NOT NULL,
    [StoreKey]           INT      NOT NULL,
    [ProductKey]         INT      NOT NULL,
    [DateKey]            DATETIME NOT NULL,
    [CurrencyKey]        INT      NOT NULL,
    [ScenarioKey]        INT      NOT NULL,
    [SalesQuantityQuota] MONEY    NOT NULL,
    [SalesAmountQuota]   MONEY    NOT NULL,
    [GrossMarginQuota]   MONEY    NOT NULL,
    [ETLLoadID]          INT      NULL,
    [LoadDate]           DATETIME NULL,
    [UpdateDate]         DATETIME NULL,
    CONSTRAINT [PK_FactSalesQuota_SalesQuotaKey] PRIMARY KEY CLUSTERED ([SalesQuotaKey] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_FactSalesQuota_DimChannel] FOREIGN KEY ([ChannelKey]) REFERENCES [dbo].[DimChannel] ([ChannelKey]),
    CONSTRAINT [FK_FactSalesQuota_DimCurrency] FOREIGN KEY ([CurrencyKey]) REFERENCES [dbo].[DimCurrency] ([CurrencyKey]),
    CONSTRAINT [FK_FactSalesQuota_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([Datekey]),
    CONSTRAINT [FK_FactSalesQuota_DimProduct] FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[DimProduct] ([ProductKey]),
    CONSTRAINT [FK_FactSalesQuota_DimScenario] FOREIGN KEY ([ScenarioKey]) REFERENCES [dbo].[DimScenario] ([ScenarioKey]),
    CONSTRAINT [FK_FactSalesQuota_DimStore] FOREIGN KEY ([StoreKey]) REFERENCES [dbo].[DimStore] ([StoreKey])
);

