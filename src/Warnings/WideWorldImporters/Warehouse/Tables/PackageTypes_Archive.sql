CREATE TABLE [Warehouse].[PackageTypes_Archive] (
    [PackageTypeID]   INT           NOT NULL,
    [PackageTypeName] NVARCHAR (50) NOT NULL,
    [LastEditedBy]    INT           NOT NULL,
    [ValidFrom]       DATETIME2 (7) NOT NULL,
    [ValidTo]         DATETIME2 (7) NOT NULL
) ON [USERDATA];


GO
CREATE CLUSTERED INDEX [ix_PackageTypes_Archive]
    ON [Warehouse].[PackageTypes_Archive]([ValidTo] ASC, [ValidFrom] ASC)
    ON [USERDATA];

