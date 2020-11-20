CREATE TABLE [dbo].[Channel] (
    [ChannelId]   INT            IDENTITY (1, 1) NOT NULL,
    [Label]       NVARCHAR (100) NOT NULL,
    [Name]        NVARCHAR (20)  NULL,
    [Description] VARCHAR (50)   NULL,
    CONSTRAINT [PK_Channel] PRIMARY KEY CLUSTERED ([ChannelId] ASC)
);

