CREATE TABLE [dbo].[DimScenario] (
    [ScenarioKey]         INT            IDENTITY (1, 1) NOT NULL,
    [ScenarioLabel]       NVARCHAR (100) NOT NULL,
    [ScenarioName]        NVARCHAR (20)  NULL,
    [ScenarioDescription] NVARCHAR (50)  NULL,
    [ETLLoadID]           INT            NULL,
    [LoadDate]            DATETIME       NULL,
    [UpdateDate]          DATETIME       NULL,
    CONSTRAINT [PK_DimScenario] PRIMARY KEY CLUSTERED ([ScenarioKey] ASC)
);

