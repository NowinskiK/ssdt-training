CREATE TABLE [dbo].[DimCurrency] (
    [CurrencyKey]         INT           IDENTITY (1, 1) NOT NULL,
    [CurrencyLabel]       NVARCHAR (10) NOT NULL,
    [CurrencyName]        NVARCHAR (20) NOT NULL,
    [CurrencyDescription] NVARCHAR (50) NOT NULL,
    [ETLLoadID]           INT           NULL,
    [LoadDate]            DATETIME      NULL,
    [UpdateDate]          DATETIME      NULL,
    CONSTRAINT [PK_DimCurrency_CurrencyKey] PRIMARY KEY CLUSTERED ([CurrencyKey] ASC),
    CONSTRAINT [AK_DimCurrency_CurrencyLabel] UNIQUE NONCLUSTERED ([CurrencyLabel] ASC)
);

