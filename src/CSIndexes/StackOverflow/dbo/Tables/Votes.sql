CREATE TABLE [dbo].[Votes] (
    [Id]           INT      NOT NULL,
    [PostId]       INT      NOT NULL,
    [UserId]       INT      NULL,
    [BountyAmount] INT      NULL,
    [VoteTypeId]   INT      NOT NULL,
    [CreationDate] DATETIME NOT NULL,
    CONSTRAINT [PK_Votes__Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);

