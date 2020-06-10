CREATE TABLE [Warehouse].[ColdRoomTemperatures](
	[ColdRoomTemperatureID] [bigint] IDENTITY(1,1) NOT NULL,
	[ColdRoomSensorNumber] [int] NOT NULL,
	[RecordedWhen] [datetime2](7) NOT NULL,
	[Temperature] [decimal](10, 2) NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Warehouse_ColdRoomTemperatures] PRIMARY KEY CLUSTERED 
(
	[ColdRoomTemperatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Warehouse].[ColdRoomTemperatures_Archive] )
)
GO
/****** Object:  Index [IX_Warehouse_ColdRoomTemperatures_ColdRoomSensorNumber]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [IX_Warehouse_ColdRoomTemperatures_ColdRoomSensorNumber] ON [Warehouse].[ColdRoomTemperatures]
(
	[ColdRoomSensorNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Instantaneous temperature readings for cold rooms (chillers)' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'ColdRoomTemperatures', @level2type=N'COLUMN',@level2name=N'ColdRoomTemperatureID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Cold room sensor number' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'ColdRoomTemperatures', @level2type=N'COLUMN',@level2name=N'ColdRoomSensorNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Time when this temperature recording was taken' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'ColdRoomTemperatures', @level2type=N'COLUMN',@level2name=N'RecordedWhen'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Temperature at the time of recording' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'ColdRoomTemperatures', @level2type=N'COLUMN',@level2name=N'Temperature'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Regularly recorded temperatures of cold room chillers' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'ColdRoomTemperatures'