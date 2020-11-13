CREATE TABLE [dbo].[DimSalesTerritory] (
    [SalesTerritoryKey]     INT            IDENTITY (1, 1) NOT NULL,
    [GeographyKey]          INT            NOT NULL,
    [SalesTerritoryLabel]   NVARCHAR (100) NULL,
    [SalesTerritoryName]    NVARCHAR (50)  NOT NULL,
    [SalesTerritoryRegion]  NVARCHAR (50)  NOT NULL,
    [SalesTerritoryCountry] NVARCHAR (50)  NOT NULL,
    [SalesTerritoryGroup]   NVARCHAR (50)  NULL,
    [SalesTerritoryLevel]   NVARCHAR (10)  NULL,
    [SalesTerritoryManager] INT            NULL,
    [StartDate]             DATETIME       NULL,
    [EndDate]               DATETIME       NULL,
    [Status]                NVARCHAR (50)  NULL,
    [ETLLoadID]             INT            NULL,
    [LoadDate]              DATETIME       NULL,
    [UpdateDate]            DATETIME       NULL,
    CONSTRAINT [PK_DimSalesTerritory_SalesTerritoryKey] PRIMARY KEY CLUSTERED ([SalesTerritoryKey] ASC),
    CONSTRAINT [FK_DimSalesTerritory_DimGeography] FOREIGN KEY ([GeographyKey]) REFERENCES [dbo].[DimGeography] ([GeographyKey]),
    CONSTRAINT [AK_DimSalesTerritory_SalesTerritoryLabel] UNIQUE NONCLUSTERED ([SalesTerritoryLabel] ASC)
);

