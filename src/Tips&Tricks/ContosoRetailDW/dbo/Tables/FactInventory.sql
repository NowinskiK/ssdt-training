CREATE TABLE [dbo].[FactInventory] (
    [InventoryKey]        INT      IDENTITY (1, 1) NOT NULL,
    [DateKey]             DATETIME NOT NULL,
    [StoreKey]            INT      NOT NULL,
    [ProductKey]          INT      NOT NULL,
    [CurrencyKey]         INT      NOT NULL,
    [OnHandQuantity]      INT      NOT NULL,
    [OnOrderQuantity]     INT      NOT NULL,
    [SafetyStockQuantity] INT      NULL,
    [UnitCost]            MONEY    NOT NULL,
    [DaysInStock]         INT      NULL,
    [MinDayInStock]       INT      NULL,
    [MaxDayInStock]       INT      NULL,
    [Aging]               INT      NULL,
    [ETLLoadID]           INT      NULL,
    [LoadDate]            DATETIME NULL,
    [UpdateDate]          DATETIME NULL,
    CONSTRAINT [PK_FactInventory_InventoryKey] PRIMARY KEY CLUSTERED ([InventoryKey] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_FactInventory_DimCurrency] FOREIGN KEY ([CurrencyKey]) REFERENCES [dbo].[DimCurrency] ([CurrencyKey]),
    CONSTRAINT [FK_FactInventory_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([Datekey]),
    CONSTRAINT [FK_FactInventory_DimProduct] FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[DimProduct] ([ProductKey]),
    CONSTRAINT [FK_FactInventory_DimStore] FOREIGN KEY ([StoreKey]) REFERENCES [dbo].[DimStore] ([StoreKey])
);

