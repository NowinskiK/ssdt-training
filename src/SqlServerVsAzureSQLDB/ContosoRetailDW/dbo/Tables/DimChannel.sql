CREATE TABLE [dbo].[DimChannel] (
    [ChannelKey]         INT            IDENTITY (1, 1) NOT NULL,
    [ChannelLabel]       NVARCHAR (100) NOT NULL,
    [ChannelName]        NVARCHAR (20)  NULL,
    [ChannelDescription] NVARCHAR (50)  NULL,
    [ETLLoadID]          INT            NULL,
    [LoadDate]           DATETIME       NULL,
    [UpdateDate]         DATETIME       NULL,
    CONSTRAINT [PK_DimChannel_ChannelKey] PRIMARY KEY CLUSTERED ([ChannelKey] ASC) WITH (DATA_COMPRESSION = PAGE)
);

