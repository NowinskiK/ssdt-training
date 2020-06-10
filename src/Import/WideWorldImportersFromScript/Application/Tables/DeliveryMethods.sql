CREATE TABLE [Application].[DeliveryMethods](
	[DeliveryMethodID] [int] NOT NULL,
	[DeliveryMethodName] [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Application_DeliveryMethods] PRIMARY KEY CLUSTERED 
(
	[DeliveryMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_Application_DeliveryMethods_DeliveryMethodName] UNIQUE NONCLUSTERED 
(
	[DeliveryMethodName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Application].[DeliveryMethods_Archive] )
)
GO
ALTER TABLE [Application].[DeliveryMethods]  WITH CHECK ADD  CONSTRAINT [FK_Application_DeliveryMethods_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Application].[DeliveryMethods] CHECK CONSTRAINT [FK_Application_DeliveryMethods_Application_People]
GO
ALTER TABLE [Application].[DeliveryMethods] ADD  CONSTRAINT [DF_Application_DeliveryMethods_DeliveryMethodID]  DEFAULT (NEXT VALUE FOR [Sequences].[DeliveryMethodID]) FOR [DeliveryMethodID]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a delivery method within the database' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'DeliveryMethods', @level2type=N'COLUMN',@level2name=N'DeliveryMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of methods that can be used for delivery of customer orders' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'DeliveryMethods', @level2type=N'COLUMN',@level2name=N'DeliveryMethodName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Ways that stock items can be delivered (ie: truck/van, post, pickup, courier, etc.' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'DeliveryMethods'