CREATE TABLE [Warehouse].[Colors_Archive] (
    [ColorID]      INT           NOT NULL,
    [ColorName]    NVARCHAR (20) NOT NULL,
    [LastEditedBy] INT           NOT NULL,
    [ValidFrom]    DATETIME2 (7) NOT NULL,
    [ValidTo]      DATETIME2 (7) NOT NULL
) ON [USERDATA];


GO
CREATE CLUSTERED INDEX [ix_Colors_Archive]
    ON [Warehouse].[Colors_Archive]([ValidTo] ASC, [ValidFrom] ASC)
    ON [USERDATA];

