CREATE TABLE [dbo].[PostLinks] (
    [Id]            INT      NOT NULL,
    [CreationDate]  DATETIME NOT NULL,
    [PostId]        INT      NOT NULL,
    [RelatedPostId] INT      NOT NULL,
    [LinkTypeId]    INT      NOT NULL,
    CONSTRAINT [PK_PostLinks__Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);

