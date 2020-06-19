CREATE TABLE [Warehouse].[StockGroups_Archive] (
    [StockGroupID]   INT           NOT NULL,
    [StockGroupName] NVARCHAR (50) NOT NULL,
    [LastEditedBy]   INT           NOT NULL,
    [ValidFrom]      DATETIME2 (7) NOT NULL,
    [ValidTo]        DATETIME2 (7) NOT NULL
) ON [USERDATA];


GO
CREATE CLUSTERED INDEX [ix_StockGroups_Archive]
    ON [Warehouse].[StockGroups_Archive]([ValidTo] ASC, [ValidFrom] ASC)
    ON [USERDATA];

