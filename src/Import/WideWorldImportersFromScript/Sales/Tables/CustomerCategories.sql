CREATE TABLE [Sales].[CustomerCategories](
	[CustomerCategoryID] [int] NOT NULL,
	[CustomerCategoryName] [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Sales_CustomerCategories] PRIMARY KEY CLUSTERED 
(
	[CustomerCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_Sales_CustomerCategories_CustomerCategoryName] UNIQUE NONCLUSTERED 
(
	[CustomerCategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Sales].[CustomerCategories_Archive] )
)
GO
ALTER TABLE [Sales].[CustomerCategories]  WITH CHECK ADD  CONSTRAINT [FK_Sales_CustomerCategories_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Sales].[CustomerCategories] CHECK CONSTRAINT [FK_Sales_CustomerCategories_Application_People]
GO
ALTER TABLE [Sales].[CustomerCategories] ADD  CONSTRAINT [DF_Sales_CustomerCategories_CustomerCategoryID]  DEFAULT (NEXT VALUE FOR [Sequences].[CustomerCategoryID]) FOR [CustomerCategoryID]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a customer category within the database' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerCategories', @level2type=N'COLUMN',@level2name=N'CustomerCategoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of the category that customers can be assigned to' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerCategories', @level2type=N'COLUMN',@level2name=N'CustomerCategoryName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Categories for customers (ie restaurants, cafes, supermarkets, etc.)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CustomerCategories'