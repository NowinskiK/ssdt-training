CREATE TABLE [Warehouse].[PackageTypes] (
    [PackageTypeID]   INT                                         CONSTRAINT [DF_Warehouse_PackageTypes_PackageTypeID] DEFAULT (NEXT VALUE FOR [Sequences].[PackageTypeID]) NOT NULL,
    [PackageTypeName] NVARCHAR (50)                               NOT NULL,
    [LastEditedBy]    INT                                         NOT NULL,
    [ValidFrom]       DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]         DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_Warehouse_PackageTypes] PRIMARY KEY CLUSTERED ([PackageTypeID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Warehouse_PackageTypes_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [UQ_Warehouse_PackageTypes_PackageTypeName] UNIQUE NONCLUSTERED ([PackageTypeName] ASC) ON [USERDATA],
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Warehouse].[PackageTypes_Archive], DATA_CONSISTENCY_CHECK=ON));


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Ways that stock items can be packaged (ie: each, box, carton, pallet, kg, etc.', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'PackageTypes';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a package type within the database', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'PackageTypes', @level2type = N'COLUMN', @level2name = N'PackageTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Full name of package types that stock items can be purchased in or sold in', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'PackageTypes', @level2type = N'COLUMN', @level2name = N'PackageTypeName';

