CREATE TABLE [Warehouse].[StockItemStockGroups](
	[StockItemStockGroupID] [int] NOT NULL,
	[StockItemID] [int] NOT NULL,
	[StockGroupID] [int] NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[LastEditedWhen] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Warehouse_StockItemStockGroups] PRIMARY KEY CLUSTERED 
(
	[StockItemStockGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_StockItemStockGroups_StockGroupID_Lookup] UNIQUE NONCLUSTERED 
(
	[StockGroupID] ASC,
	[StockItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_StockItemStockGroups_StockItemID_Lookup] UNIQUE NONCLUSTERED 
(
	[StockItemID] ASC,
	[StockGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
) ON [USERDATA]
GO
ALTER TABLE [Warehouse].[StockItemStockGroups]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_StockItemStockGroups_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Warehouse].[StockItemStockGroups] CHECK CONSTRAINT [FK_Warehouse_StockItemStockGroups_Application_People]
GO
ALTER TABLE [Warehouse].[StockItemStockGroups]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_StockItemStockGroups_StockGroupID_Warehouse_StockGroups] FOREIGN KEY([StockGroupID])
REFERENCES [Warehouse].[StockGroups] ([StockGroupID])
GO

ALTER TABLE [Warehouse].[StockItemStockGroups] CHECK CONSTRAINT [FK_Warehouse_StockItemStockGroups_StockGroupID_Warehouse_StockGroups]
GO
ALTER TABLE [Warehouse].[StockItemStockGroups]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_StockItemStockGroups_StockItemID_Warehouse_StockItems] FOREIGN KEY([StockItemID])
REFERENCES [Warehouse].[StockItems] ([StockItemID])
GO

ALTER TABLE [Warehouse].[StockItemStockGroups] CHECK CONSTRAINT [FK_Warehouse_StockItemStockGroups_StockItemID_Warehouse_StockItems]
GO
ALTER TABLE [Warehouse].[StockItemStockGroups] ADD  CONSTRAINT [DF_Warehouse_StockItemStockGroups_StockItemStockGroupID]  DEFAULT (NEXT VALUE FOR [Sequences].[StockItemStockGroupID]) FOR [StockItemStockGroupID]
GO
ALTER TABLE [Warehouse].[StockItemStockGroups] ADD  CONSTRAINT [DF_Warehouse_StockItemStockGroups_LastEditedWhen]  DEFAULT (sysdatetime()) FOR [LastEditedWhen]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Internal reference for this linking row' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItemStockGroups', @level2type=N'COLUMN',@level2name=N'StockItemStockGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Stock item assigned to this stock group (FK indexed via unique constraint)' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItemStockGroups', @level2type=N'COLUMN',@level2name=N'StockItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'StockGroup assigned to this stock item (FK indexed via unique constraint)' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItemStockGroups', @level2type=N'COLUMN',@level2name=N'StockGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Enforces uniqueness and indexes one side of the many to many relationship' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItemStockGroups', @level2type=N'CONSTRAINT',@level2name=N'UQ_StockItemStockGroups_StockGroupID_Lookup'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Enforces uniqueness and indexes one side of the many to many relationship' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItemStockGroups', @level2type=N'CONSTRAINT',@level2name=N'UQ_StockItemStockGroups_StockItemID_Lookup'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Which stock items are in which stock groups' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockItemStockGroups'