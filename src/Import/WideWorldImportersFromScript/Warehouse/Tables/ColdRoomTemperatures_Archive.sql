CREATE TABLE [Warehouse].[ColdRoomTemperatures_Archive](
	[ColdRoomTemperatureID] [bigint] NOT NULL,
	[ColdRoomSensorNumber] [int] NOT NULL,
	[RecordedWhen] [datetime2](7) NOT NULL,
	[Temperature] [decimal](10, 2) NOT NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL
) ON [USERDATA]
GO
/****** Object:  Index [ix_ColdRoomTemperatures_Archive]    Script Date: 10/06/2020 18:14:17 ******/
CREATE CLUSTERED INDEX [ix_ColdRoomTemperatures_Archive] ON [Warehouse].[ColdRoomTemperatures_Archive]
(
	[ValidTo] ASC,
	[ValidFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]