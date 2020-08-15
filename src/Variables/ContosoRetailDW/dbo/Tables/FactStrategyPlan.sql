CREATE TABLE [dbo].[FactStrategyPlan] (
    [StrategyPlanKey]    INT      IDENTITY (1, 1) NOT NULL,
    [Datekey]            DATETIME NOT NULL,
    [EntityKey]          INT      NOT NULL,
    [ScenarioKey]        INT      NOT NULL,
    [AccountKey]         INT      NOT NULL,
    [CurrencyKey]        INT      NOT NULL,
    [ProductCategoryKey] INT      NULL,
    [Amount]             MONEY    NOT NULL,
    [ETLLoadID]          INT      NULL,
    [LoadDate]           DATETIME NULL,
    [UpdateDate]         DATETIME NULL,
    CONSTRAINT [PK_FactStrategyPlan_StrategyPlanKey] PRIMARY KEY CLUSTERED ([StrategyPlanKey] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_FactStrategyPlan_DimAccount] FOREIGN KEY ([AccountKey]) REFERENCES [dbo].[DimAccount] ([AccountKey]),
    CONSTRAINT [FK_FactStrategyPlan_DimCurrency] FOREIGN KEY ([CurrencyKey]) REFERENCES [dbo].[DimCurrency] ([CurrencyKey]),
    CONSTRAINT [FK_FactStrategyPlan_DimDate] FOREIGN KEY ([Datekey]) REFERENCES [dbo].[DimDate] ([Datekey]),
    CONSTRAINT [FK_FactStrategyPlan_DimEntity] FOREIGN KEY ([EntityKey]) REFERENCES [dbo].[DimEntity] ([EntityKey]),
    CONSTRAINT [FK_FactStrategyPlan_DimProductCategory] FOREIGN KEY ([ProductCategoryKey]) REFERENCES [dbo].[DimProductCategory] ([ProductCategoryKey]),
    CONSTRAINT [FK_FactStrategyPlan_DimScenario] FOREIGN KEY ([ScenarioKey]) REFERENCES [dbo].[DimScenario] ([ScenarioKey])
);

