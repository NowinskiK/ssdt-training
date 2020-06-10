CREATE TABLE [Warehouse].[StockGroups](
	[StockGroupID] [int] NOT NULL,
	[StockGroupName] [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Warehouse_StockGroups] PRIMARY KEY CLUSTERED 
(
	[StockGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_Warehouse_StockGroups_StockGroupName] UNIQUE NONCLUSTERED 
(
	[StockGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Warehouse].[StockGroups_Archive] )
)
GO
ALTER TABLE [Warehouse].[StockGroups]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_StockGroups_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Warehouse].[StockGroups] CHECK CONSTRAINT [FK_Warehouse_StockGroups_Application_People]
GO
ALTER TABLE [Warehouse].[StockGroups] ADD  CONSTRAINT [DF_Warehouse_StockGroups_StockGroupID]  DEFAULT (NEXT VALUE FOR [Sequences].[StockGroupID]) FOR [StockGroupID]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a stock group within the database' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockGroups', @level2type=N'COLUMN',@level2name=N'StockGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of groups used to categorize stock items' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockGroups', @level2type=N'COLUMN',@level2name=N'StockGroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Groups for categorizing stock items (ie: novelties, toys, edible novelties, etc.)' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'StockGroups'