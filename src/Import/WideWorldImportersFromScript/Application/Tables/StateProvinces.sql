CREATE TABLE [Application].[StateProvinces](
	[StateProvinceID] [int] NOT NULL,
	[StateProvinceCode] [nvarchar](5) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[StateProvinceName] [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[CountryID] [int] NOT NULL,
	[SalesTerritory] [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[Border] [geography] NULL,
	[LatestRecordedPopulation] [bigint] NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Application_StateProvinces] PRIMARY KEY CLUSTERED 
(
	[StateProvinceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_Application_StateProvinces_StateProvinceName] UNIQUE NONCLUSTERED 
(
	[StateProvinceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Application].[StateProvinces_Archive] )
)
GO
ALTER TABLE [Application].[StateProvinces]  WITH CHECK ADD  CONSTRAINT [FK_Application_StateProvinces_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Application].[StateProvinces] CHECK CONSTRAINT [FK_Application_StateProvinces_Application_People]
GO
ALTER TABLE [Application].[StateProvinces]  WITH CHECK ADD  CONSTRAINT [FK_Application_StateProvinces_CountryID_Application_Countries] FOREIGN KEY([CountryID])
REFERENCES [Application].[Countries] ([CountryID])
GO

ALTER TABLE [Application].[StateProvinces] CHECK CONSTRAINT [FK_Application_StateProvinces_CountryID_Application_Countries]
GO
ALTER TABLE [Application].[StateProvinces] ADD  CONSTRAINT [DF_Application_StateProvinces_StateProvinceID]  DEFAULT (NEXT VALUE FOR [Sequences].[StateProvinceID]) FOR [StateProvinceID]
GO
/****** Object:  Index [FK_Application_StateProvinces_CountryID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Application_StateProvinces_CountryID] ON [Application].[StateProvinces]
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [IX_Application_StateProvinces_SalesTerritory]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [IX_Application_StateProvinces_SalesTerritory] ON [Application].[StateProvinces]
(
	[SalesTerritory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a state or province within the database' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'StateProvinces', @level2type=N'COLUMN',@level2name=N'StateProvinceID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Common code for this state or province (such as WA - Washington for the USA)' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'StateProvinces', @level2type=N'COLUMN',@level2name=N'StateProvinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Formal name of the state or province' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'StateProvinces', @level2type=N'COLUMN',@level2name=N'StateProvinceName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Country for this StateProvince' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'StateProvinces', @level2type=N'COLUMN',@level2name=N'CountryID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Sales territory for this StateProvince' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'StateProvinces', @level2type=N'COLUMN',@level2name=N'SalesTerritory'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Geographic boundary of the state or province' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'StateProvinces', @level2type=N'COLUMN',@level2name=N'Border'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Latest available population for the StateProvince' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'StateProvinces', @level2type=N'COLUMN',@level2name=N'LatestRecordedPopulation'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'StateProvinces', @level2type=N'INDEX',@level2name=N'FK_Application_StateProvinces_CountryID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Index used to quickly locate sales territories' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'StateProvinces', @level2type=N'INDEX',@level2name=N'IX_Application_StateProvinces_SalesTerritory'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'States or provinces that contain cities (including geographic location)' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'StateProvinces'