CREATE TABLE [Warehouse].[StockItemStockGroups] (
    [StockItemStockGroupID] INT           CONSTRAINT [DF_Warehouse_StockItemStockGroups_StockItemStockGroupID] DEFAULT (NEXT VALUE FOR [Sequences].[StockItemStockGroupID]) NOT NULL,
    [StockItemID]           INT           NOT NULL,
    [StockGroupID]          INT           NOT NULL,
    [LastEditedBy]          INT           NOT NULL,
    [LastEditedWhen]        DATETIME2 (7) CONSTRAINT [DF_Warehouse_StockItemStockGroups_LastEditedWhen] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_Warehouse_StockItemStockGroups] PRIMARY KEY CLUSTERED ([StockItemStockGroupID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Warehouse_StockItemStockGroups_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Warehouse_StockItemStockGroups_StockGroupID_Warehouse_StockGroups] FOREIGN KEY ([StockGroupID]) REFERENCES [Warehouse].[StockGroups] ([StockGroupID]),
    CONSTRAINT [FK_Warehouse_StockItemStockGroups_StockItemID_Warehouse_StockItems] FOREIGN KEY ([StockItemID]) REFERENCES [Warehouse].[StockItems] ([StockItemID]),
    CONSTRAINT [UQ_StockItemStockGroups_StockGroupID_Lookup] UNIQUE NONCLUSTERED ([StockGroupID] ASC, [StockItemID] ASC) ON [USERDATA],
    CONSTRAINT [UQ_StockItemStockGroups_StockItemID_Lookup] UNIQUE NONCLUSTERED ([StockItemID] ASC, [StockGroupID] ASC) ON [USERDATA]
) ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Which stock items are in which stock groups', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemStockGroups';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Internal reference for this linking row', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemStockGroups', @level2type = N'COLUMN', @level2name = N'StockItemStockGroupID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Stock item assigned to this stock group (FK indexed via unique constraint)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemStockGroups', @level2type = N'COLUMN', @level2name = N'StockItemID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'StockGroup assigned to this stock item (FK indexed via unique constraint)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemStockGroups', @level2type = N'COLUMN', @level2name = N'StockGroupID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Enforces uniqueness and indexes one side of the many to many relationship', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemStockGroups', @level2type = N'CONSTRAINT', @level2name = N'UQ_StockItemStockGroups_StockGroupID_Lookup';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Enforces uniqueness and indexes one side of the many to many relationship', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItemStockGroups', @level2type = N'CONSTRAINT', @level2name = N'UQ_StockItemStockGroups_StockItemID_Lookup';

