CREATE TABLE [Application].[Countries_Archive](
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
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
GO
/****** Object:  Index [ix_Countries_Archive]    Script Date: 10/06/2020 18:14:16 ******/
CREATE CLUSTERED INDEX [ix_Countries_Archive] ON [Application].[Countries_Archive]
(
	[ValidTo] ASC,
	[ValidFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]