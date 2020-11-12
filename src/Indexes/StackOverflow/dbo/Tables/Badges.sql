CREATE TABLE [dbo].[Badges] (
    [Id]     INT           NOT NULL,
    [Name]   NVARCHAR (40) NOT NULL,
    [UserId] INT           NOT NULL,
    [Date]   DATETIME      NOT NULL,
    CONSTRAINT [PK_Badges__Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);

