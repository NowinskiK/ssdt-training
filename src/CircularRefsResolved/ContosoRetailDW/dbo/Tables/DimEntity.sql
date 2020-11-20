CREATE TABLE [dbo].[DimEntity] (
    [EntityKey]         INT            IDENTITY (1, 1) NOT NULL,
    [EntityLabel]       NVARCHAR (100) NULL,
    [ParentEntityKey]   INT            NULL,
    [ParentEntityLabel] NVARCHAR (100) NULL,
    [EntityName]        NVARCHAR (50)  NULL,
    [EntityDescription] NVARCHAR (100) NULL,
    [EntityType]        NVARCHAR (100) NULL,
    [StartDate]         DATETIME       NULL,
    [EndDate]           DATETIME       NULL,
    [Status]            NVARCHAR (50)  CONSTRAINT [DF_DimEntity_Status] DEFAULT (N'Current') NULL,
    [ETLLoadID]         INT            NULL,
    [LoadDate]          DATETIME       NULL,
    [UpdateDate]        DATETIME       NULL,
    CONSTRAINT [PK_DimEntity_EntityKey] PRIMARY KEY CLUSTERED ([EntityKey] ASC) WITH (DATA_COMPRESSION = PAGE)
);

