CREATE TABLE [Purchasing].[SupplierCategories](
	[SupplierCategoryID] [int] NOT NULL,
	[SupplierCategoryName] [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Purchasing_SupplierCategories] PRIMARY KEY CLUSTERED 
(
	[SupplierCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_Purchasing_SupplierCategories_SupplierCategoryName] UNIQUE NONCLUSTERED 
(
	[SupplierCategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Purchasing].[SupplierCategories_Archive] )
)
GO
ALTER TABLE [Purchasing].[SupplierCategories]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_SupplierCategories_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Purchasing].[SupplierCategories] CHECK CONSTRAINT [FK_Purchasing_SupplierCategories_Application_People]
GO
ALTER TABLE [Purchasing].[SupplierCategories] ADD  CONSTRAINT [DF_Purchasing_SupplierCategories_SupplierCategoryID]  DEFAULT (NEXT VALUE FOR [Sequences].[SupplierCategoryID]) FOR [SupplierCategoryID]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a supplier category within the database' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierCategories', @level2type=N'COLUMN',@level2name=N'SupplierCategoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of the category that suppliers can be assigned to' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierCategories', @level2type=N'COLUMN',@level2name=N'SupplierCategoryName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Categories for suppliers (ie novelties, toys, clothing, packaging, etc.)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'SupplierCategories'