CREATE TABLE [dbo].[DimGeography] (
    [GeographyKey]      INT              IDENTITY (1, 1) NOT NULL,
    [GeographyType]     NVARCHAR (50)    NOT NULL,
    [ContinentName]     NVARCHAR (50)    NOT NULL,
    [CityName]          NVARCHAR (100)   NULL,
    [StateProvinceName] NVARCHAR (100)   NULL,
    [RegionCountryName] NVARCHAR (100)   NULL,
    [Geometry]          [sys].[geometry] NULL,
    [ETLLoadID]         INT              NULL,
    [LoadDate]          DATETIME         NULL,
    [UpdateDate]        DATETIME         NULL,
    CONSTRAINT [PK_DimGeography_GeographyKey] PRIMARY KEY CLUSTERED ([GeographyKey] ASC)
);

