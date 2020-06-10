/****** Object:  UserDefinedTableType [Website].[SensorDataList]    Script Date: 10/06/2020 18:14:16 ******/
CREATE TYPE [Website].[SensorDataList] AS TABLE(
	[SensorDataListID] [int] IDENTITY(1,1) NOT NULL,
	[ColdRoomSensorNumber] [int] NOT NULL,
	[RecordedWhen] [datetime2](7) NOT NULL,
	[Temperature] [decimal](18, 2) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[SensorDataListID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)