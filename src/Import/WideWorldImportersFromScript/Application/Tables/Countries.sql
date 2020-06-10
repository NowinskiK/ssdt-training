CREATE TABLE [Application].[Countries](
	[CountryID] [int] NOT NULL,
	[CountryName] [nvarchar](60) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[FormalName] [nvarchar](60) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[IsoAlpha3Code] [nvarchar](3) COLLATE Latin1_General_100_CI_AS NULL,
	[IsoNumericCode] [int] NULL,
	[CountryType] [nvarchar](20) COLLATE Latin1_General_100_CI_AS NULL,
	[LatestRecordedPopulation] [bigint] NULL,
	[Continent] [nvarchar](30) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[Region] [nvarchar](30) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[Subregion] [nvarchar](30) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[Border] [geography] NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Application_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_Application_Countries_CountryName] UNIQUE NONCLUSTERED 
(
	[CountryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_Application_Countries_FormalName] UNIQUE NONCLUSTERED 
(
	[FormalName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Application].[Countries_Archive] )
)
GO
ALTER TABLE [Application].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Application_Countries_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Application].[Countries] CHECK CONSTRAINT [FK_Application_Countries_Application_People]
GO
ALTER TABLE [Application].[Countries] ADD  CONSTRAINT [DF_Application_Countries_CountryID]  DEFAULT (NEXT VALUE FOR [Sequences].[CountryID]) FOR [CountryID]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a country within the database' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'CountryID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Name of the country' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'CountryName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full formal name of the country as agreed by United Nations' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'FormalName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'3 letter alphabetic code assigned to the country by ISO' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'IsoAlpha3Code'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric code assigned to the country by ISO' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'IsoNumericCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Type of country or administrative region' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'CountryType'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Latest available population for the country' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'LatestRecordedPopulation'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Name of the continent' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'Continent'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Name of the region' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'Region'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Name of the subregion' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'Subregion'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Geographic border of the country as described by the United Nations' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries', @level2type=N'COLUMN',@level2name=N'Border'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Countries that contain the states or provinces (including geographic boundaries)' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'Countries'