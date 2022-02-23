CREATE TABLE [dbo].[PostTypes] (
    [Id]   INT           NOT NULL,
    [Type] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_PostTypes__Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);

