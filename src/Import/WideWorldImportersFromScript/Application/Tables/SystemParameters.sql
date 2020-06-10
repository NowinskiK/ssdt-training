CREATE TABLE [Application].[SystemParameters](
	[SystemParameterID] [int] NOT NULL,
	[DeliveryAddressLine1] [nvarchar](60) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[DeliveryAddressLine2] [nvarchar](60) COLLATE Latin1_General_100_CI_AS NULL,
	[DeliveryCityID] [int] NOT NULL,
	[DeliveryPostalCode] [nvarchar](10) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[DeliveryLocation] [geography] NOT NULL,
	[PostalAddressLine1] [nvarchar](60) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[PostalAddressLine2] [nvarchar](60) COLLATE Latin1_General_100_CI_AS NULL,
	[PostalCityID] [int] NOT NULL,
	[PostalPostalCode] [nvarchar](10) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[ApplicationSettings] [nvarchar](max) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[LastEditedWhen] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Application_SystemParameters] PRIMARY KEY CLUSTERED 
(
	[SystemParameterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
GO
ALTER TABLE [Application].[SystemParameters]  WITH CHECK ADD  CONSTRAINT [FK_Application_SystemParameters_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Application].[SystemParameters] CHECK CONSTRAINT [FK_Application_SystemParameters_Application_People]
GO
ALTER TABLE [Application].[SystemParameters]  WITH CHECK ADD  CONSTRAINT [FK_Application_SystemParameters_DeliveryCityID_Application_Cities] FOREIGN KEY([DeliveryCityID])
REFERENCES [Application].[Cities] ([CityID])
GO

ALTER TABLE [Application].[SystemParameters] CHECK CONSTRAINT [FK_Application_SystemParameters_DeliveryCityID_Application_Cities]
GO
ALTER TABLE [Application].[SystemParameters]  WITH CHECK ADD  CONSTRAINT [FK_Application_SystemParameters_PostalCityID_Application_Cities] FOREIGN KEY([PostalCityID])
REFERENCES [Application].[Cities] ([CityID])
GO

ALTER TABLE [Application].[SystemParameters] CHECK CONSTRAINT [FK_Application_SystemParameters_PostalCityID_Application_Cities]
GO
ALTER TABLE [Application].[SystemParameters] ADD  CONSTRAINT [DF_Application_SystemParameters_SystemParameterID]  DEFAULT (NEXT VALUE FOR [Sequences].[SystemParameterID]) FOR [SystemParameterID]
GO
ALTER TABLE [Application].[SystemParameters] ADD  CONSTRAINT [DF_Application_SystemParameters_LastEditedWhen]  DEFAULT (sysdatetime()) FOR [LastEditedWhen]
GO
/****** Object:  Index [FK_Application_SystemParameters_DeliveryCityID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Application_SystemParameters_DeliveryCityID] ON [Application].[SystemParameters]
(
	[DeliveryCityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Application_SystemParameters_PostalCityID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Application_SystemParameters_PostalCityID] ON [Application].[SystemParameters]
(
	[PostalCityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for row holding system parameters' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'SystemParameters', @level2type=N'COLUMN',@level2name=N'SystemParameterID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'First address line for the company' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'SystemParameters', @level2type=N'COLUMN',@level2name=N'DeliveryAddressLine1'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Second address line for the company' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'SystemParameters', @level2type=N'COLUMN',@level2name=N'DeliveryAddressLine2'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID of the city for this address' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'SystemParameters', @level2type=N'COLUMN',@level2name=N'DeliveryCityID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Postal code for the company' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'SystemParameters', @level2type=N'COLUMN',@level2name=N'DeliveryPostalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Geographic location for the company office' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'SystemParameters', @level2type=N'COLUMN',@level2name=N'DeliveryLocation'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'First postal address line for the company' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'SystemParameters', @level2type=N'COLUMN',@level2name=N'PostalAddressLine1'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Second postaladdress line for the company' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'SystemParameters', @level2type=N'COLUMN',@level2name=N'PostalAddressLine2'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID of the city for this postaladdress' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'SystemParameters', @level2type=N'COLUMN',@level2name=N'PostalCityID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Postal code for the company when sending via mail' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'SystemParameters', @level2type=N'COLUMN',@level2name=N'PostalPostalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'JSON-structured application settings' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'SystemParameters', @level2type=N'COLUMN',@level2name=N'ApplicationSettings'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'SystemParameters', @level2type=N'INDEX',@level2name=N'FK_Application_SystemParameters_DeliveryCityID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'SystemParameters', @level2type=N'INDEX',@level2name=N'FK_Application_SystemParameters_PostalCityID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Any configurable parameters for the whole system' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'SystemParameters'