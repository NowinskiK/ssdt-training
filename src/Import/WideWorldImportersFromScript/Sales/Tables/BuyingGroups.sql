CREATE TABLE [Sales].[BuyingGroups](
	[BuyingGroupID] [int] NOT NULL,
	[BuyingGroupName] [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Sales_BuyingGroups] PRIMARY KEY CLUSTERED 
(
	[BuyingGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_Sales_BuyingGroups_BuyingGroupName] UNIQUE NONCLUSTERED 
(
	[BuyingGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Sales].[BuyingGroups_Archive] )
)
GO
ALTER TABLE [Sales].[BuyingGroups]  WITH CHECK ADD  CONSTRAINT [FK_Sales_BuyingGroups_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Sales].[BuyingGroups] CHECK CONSTRAINT [FK_Sales_BuyingGroups_Application_People]
GO
ALTER TABLE [Sales].[BuyingGroups] ADD  CONSTRAINT [DF_Sales_BuyingGroups_BuyingGroupID]  DEFAULT (NEXT VALUE FOR [Sequences].[BuyingGroupID]) FOR [BuyingGroupID]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a buying group within the database' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'BuyingGroups', @level2type=N'COLUMN',@level2name=N'BuyingGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of a buying group that customers can be members of' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'BuyingGroups', @level2type=N'COLUMN',@level2name=N'BuyingGroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Customer organizations can be part of groups that exert greater buying power' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'BuyingGroups'