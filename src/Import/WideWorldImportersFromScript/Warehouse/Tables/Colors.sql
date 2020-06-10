CREATE TABLE [Warehouse].[Colors](
	[ColorID] [int] NOT NULL,
	[ColorName] [nvarchar](20) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Warehouse_Colors] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_Warehouse_Colors_ColorName] UNIQUE NONCLUSTERED 
(
	[ColorName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Warehouse].[Colors_Archive] )
)
GO
ALTER TABLE [Warehouse].[Colors]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_Colors_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Warehouse].[Colors] CHECK CONSTRAINT [FK_Warehouse_Colors_Application_People]
GO
ALTER TABLE [Warehouse].[Colors] ADD  CONSTRAINT [DF_Warehouse_Colors_ColorID]  DEFAULT (NEXT VALUE FOR [Sequences].[ColorID]) FOR [ColorID]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a color within the database' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'Colors', @level2type=N'COLUMN',@level2name=N'ColorID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of a color that can be used to describe stock items' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'Colors', @level2type=N'COLUMN',@level2name=N'ColorName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Stock items can (optionally) have colors' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'Colors'