CREATE TABLE [Application].[Cities](
	[CityID] [int] NOT NULL,
	[CityName] [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[StateProvinceID] [int] NOT NULL,
	[Location] [geography] NULL,
	[LatestRecordedPopulation] [bigint] NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Application_Cities] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Application].[Cities_Archive] )
)
GO
ALTER TABLE [Application].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Application_Cities_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Application].[Cities] CHECK CONSTRAINT [FK_Application_Cities_Application_People]
GO
ALTER TABLE [Application].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Application_Cities_StateProvinceID_Application_StateProvinces] FOREIGN KEY([StateProvinceID])
REFERENCES [Application].[StateProvinces] ([StateProvinceID])
GO

ALTER TABLE [Application].[Cities] CHECK CONSTRAINT [FK_Application_Cities_StateProvinceID_Application_StateProvinces]
GO
ALTER TABLE [Application].[Cities] ADD  CONSTRAINT [DF_Application_Cities_CityID]  DEFAULT (NEXT VALUE FOR [Sequences].[CityID]) FOR [CityID]
GO
/****** Object:  Index [FK_Application_Cities_StateProvinceID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Application_Cities_StateProvinceID] ON [Application].[Cities]
(
	[StateProvinceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a city within the database' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Cities', @level2type=N'COLUMN',@level2name=N'CityID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Formal name of the city' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Cities', @level2type=N'COLUMN',@level2name=N'CityName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'State or province for this city' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Cities', @level2type=N'COLUMN',@level2name=N'StateProvinceID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Geographic location of the city' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Cities', @level2type=N'COLUMN',@level2name=N'Location'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Latest available population for the City' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Cities', @level2type=N'COLUMN',@level2name=N'LatestRecordedPopulation'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Cities', @level2type=N'INDEX',@level2name=N'FK_Application_Cities_StateProvinceID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Cities that are part of any address (including geographic location)' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Cities'