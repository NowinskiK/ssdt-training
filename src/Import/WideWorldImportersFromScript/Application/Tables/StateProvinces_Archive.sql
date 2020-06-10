CREATE TABLE [Application].[StateProvinces_Archive](
	[StateProvinceID] [int] NOT NULL,
	[StateProvinceCode] [nvarchar](5) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[StateProvinceName] [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[CountryID] [int] NOT NULL,
	[SalesTerritory] [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[Border] [geography] NULL,
	[LatestRecordedPopulation] [bigint] NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
GO
/****** Object:  Index [ix_StateProvinces_Archive]    Script Date: 10/06/2020 18:14:16 ******/
CREATE CLUSTERED INDEX [ix_StateProvinces_Archive] ON [Application].[StateProvinces_Archive]
(
	[ValidTo] ASC,
	[ValidFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]