CREATE TABLE [Warehouse].[StockGroups] (
    [StockGroupID]   INT                                         CONSTRAINT [DF_Warehouse_StockGroups_StockGroupID] DEFAULT (NEXT VALUE FOR [Sequences].[StockGroupID]) NOT NULL,
    [StockGroupName] NVARCHAR (50)                               NOT NULL,
    [LastEditedBy]   INT                                         NOT NULL,
    [ValidFrom]      DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]        DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_Warehouse_StockGroups] PRIMARY KEY CLUSTERED ([StockGroupID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Warehouse_StockGroups_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [UQ_Warehouse_StockGroups_StockGroupName] UNIQUE NONCLUSTERED ([StockGroupName] ASC) ON [USERDATA],
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Warehouse].[StockGroups_Archive], DATA_CONSISTENCY_CHECK=ON));


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Groups for categorizing stock items (ie: novelties, toys, edible novelties, etc.)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockGroups';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a stock group within the database', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockGroups', @level2type = N'COLUMN', @level2name = N'StockGroupID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Full name of groups used to categorize stock items', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockGroups', @level2type = N'COLUMN', @level2name = N'StockGroupName';

