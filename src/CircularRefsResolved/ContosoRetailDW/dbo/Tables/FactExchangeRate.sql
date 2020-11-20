CREATE TABLE [dbo].[FactExchangeRate] (
    [ExchangeRateKey] INT        IDENTITY (1, 1) NOT NULL,
    [CurrencyKey]     INT        NOT NULL,
    [DateKey]         DATETIME   NOT NULL,
    [AverageRate]     FLOAT (53) NOT NULL,
    [EndOfDayRate]    FLOAT (53) NOT NULL,
    [ETLLoadID]       INT        NULL,
    [LoadDate]        DATETIME   NULL,
    [UpdateDate]      DATETIME   NULL,
    CONSTRAINT [PK_FactExchangeRate_ExchangeRateKey] PRIMARY KEY CLUSTERED ([ExchangeRateKey] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_FactExchangeRate_DimCurrency] FOREIGN KEY ([CurrencyKey]) REFERENCES [dbo].[DimCurrency] ([CurrencyKey]),
    CONSTRAINT [FK_FactExchangeRate_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([Datekey])
);

