CREATE TABLE [dbo].[DimOutage] (
    [OutageKey]                INT            IDENTITY (1, 1) NOT NULL,
    [OutageLabel]              NVARCHAR (100) NOT NULL,
    [OutageName]               NVARCHAR (50)  NOT NULL,
    [OutageDescription]        NVARCHAR (200) NOT NULL,
    [OutageType]               NVARCHAR (50)  NOT NULL,
    [OutageTypeDescription]    NVARCHAR (200) NOT NULL,
    [OutageSubType]            NVARCHAR (50)  NOT NULL,
    [OutageSubTypeDescription] NVARCHAR (200) NOT NULL,
    [ETLLoadID]                INT            NULL,
    [LoadDate]                 DATETIME       NULL,
    [UpdateDate]               DATETIME       NULL,
    CONSTRAINT [PK_DimOutage_OutageKey] PRIMARY KEY CLUSTERED ([OutageKey] ASC)
);

