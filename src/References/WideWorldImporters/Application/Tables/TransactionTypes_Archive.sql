CREATE TABLE [Application].[TransactionTypes_Archive] (
    [TransactionTypeID]   INT           NOT NULL,
    [TransactionTypeName] NVARCHAR (50) NOT NULL,
    [LastEditedBy]        INT           NOT NULL,
    [ValidFrom]           DATETIME2 (7) NOT NULL,
    [ValidTo]             DATETIME2 (7) NOT NULL
) ON [USERDATA];


GO
CREATE CLUSTERED INDEX [ix_TransactionTypes_Archive]
    ON [Application].[TransactionTypes_Archive]([ValidTo] ASC, [ValidFrom] ASC)
    ON [USERDATA];

