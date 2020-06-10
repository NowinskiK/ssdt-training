﻿CREATE TABLE [dbo].[FactResellerSalesXL_CCI] (
    [ProductKey]            INT           NOT NULL,
    [OrderDateKey]          INT           NOT NULL,
    [DueDateKey]            INT           NOT NULL,
    [ShipDateKey]           INT           NOT NULL,
    [ResellerKey]           INT           NOT NULL,
    [EmployeeKey]           INT           NOT NULL,
    [PromotionKey]          INT           NOT NULL,
    [CurrencyKey]           INT           NOT NULL,
    [SalesTerritoryKey]     INT           NOT NULL,
    [SalesOrderNumber]      NVARCHAR (20) NOT NULL,
    [SalesOrderLineNumber]  TINYINT       NOT NULL,
    [RevisionNumber]        TINYINT       NULL,
    [OrderQuantity]         SMALLINT      NULL,
    [UnitPrice]             MONEY         NULL,
    [ExtendedAmount]        MONEY         NULL,
    [UnitPriceDiscountPct]  FLOAT (53)    NULL,
    [DiscountAmount]        FLOAT (53)    NULL,
    [ProductStandardCost]   MONEY         NULL,
    [TotalProductCost]      MONEY         NULL,
    [SalesAmount]           MONEY         NULL,
    [TaxAmt]                MONEY         NULL,
    [Freight]               MONEY         NULL,
    [CarrierTrackingNumber] NVARCHAR (25) NULL,
    [CustomerPONumber]      NVARCHAR (25) NULL,
    [OrderDate]             DATETIME      NULL,
    [DueDate]               DATETIME      NULL,
    [ShipDate]              DATETIME      NULL,
    CONSTRAINT [PK_FactResellerSalesXL_CCI_SalesOrderNumber_SalesOrderLineNumber] PRIMARY KEY NONCLUSTERED ([SalesOrderNumber] ASC, [SalesOrderLineNumber] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_FactResellerSalesXL_CCI_DimCurrency] FOREIGN KEY ([CurrencyKey]) REFERENCES [dbo].[DimCurrency] ([CurrencyKey]),
    CONSTRAINT [FK_FactResellerSalesXL_CCI_DimDate] FOREIGN KEY ([OrderDateKey]) REFERENCES [dbo].[DimDate] ([DateKey]),
    CONSTRAINT [FK_FactResellerSalesXL_CCI_DimDate1] FOREIGN KEY ([DueDateKey]) REFERENCES [dbo].[DimDate] ([DateKey]),
    CONSTRAINT [FK_FactResellerSalesXL_CCI_DimDate2] FOREIGN KEY ([ShipDateKey]) REFERENCES [dbo].[DimDate] ([DateKey]),
    CONSTRAINT [FK_FactResellerSalesXL_CCI_DimEmployee] FOREIGN KEY ([EmployeeKey]) REFERENCES [dbo].[DimEmployee] ([EmployeeKey]),
    CONSTRAINT [FK_FactResellerSalesXL_CCI_DimProduct] FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[DimProduct] ([ProductKey]),
    CONSTRAINT [FK_FactResellerSalesXL_CCI_DimPromotion] FOREIGN KEY ([PromotionKey]) REFERENCES [dbo].[DimPromotion] ([PromotionKey]),
    CONSTRAINT [FK_FactResellerSalesXL_CCI_DimReseller] FOREIGN KEY ([ResellerKey]) REFERENCES [dbo].[DimReseller] ([ResellerKey]),
    CONSTRAINT [FK_FactResellerSalesXL_CCI_DimSalesTerritory] FOREIGN KEY ([SalesTerritoryKey]) REFERENCES [dbo].[DimSalesTerritory] ([SalesTerritoryKey])
);


GO
CREATE CLUSTERED COLUMNSTORE INDEX [IndFactResellerSalesXL_CCI]
    ON [dbo].[FactResellerSalesXL_CCI];

