CREATE TABLE [audit].[DimChannel] (
    [AuditId]            INT            IDENTITY (1, 1) NOT NULL,
    [AuditDate]          DATETIME       DEFAULT (getdate()) NULL,
    [ChannelKey]         INT            NOT NULL,
    [ChannelLabel]       NVARCHAR (100) NOT NULL,
    [ChannelName]        NVARCHAR (20)  NULL,
    [ChannelDescription] NVARCHAR (50)  NULL,
    [ETLLoadID]          INT            NULL,
    [LoadDate]           DATETIME       NULL,
    [UpdateDate]         DATETIME       NULL,
    CONSTRAINT [PK_DimChannel_Audit] PRIMARY KEY CLUSTERED ([AuditId] ASC)
);

