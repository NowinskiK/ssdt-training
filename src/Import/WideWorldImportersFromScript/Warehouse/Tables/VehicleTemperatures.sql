CREATE TABLE [Warehouse].[VehicleTemperatures](
	[VehicleTemperatureID] [bigint] IDENTITY(1,1) NOT NULL,
	[VehicleRegistration] [nvarchar](20) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[ChillerSensorNumber] [int] NOT NULL,
	[RecordedWhen] [datetime2](7) NOT NULL,
	[Temperature] [decimal](10, 2) NOT NULL,
	[IsCompressed] [bit] NOT NULL,
	[FullSensorData] [nvarchar](1000) COLLATE Latin1_General_100_CI_AS NULL,
	[CompressedSensorData] [varbinary](max) NULL,
 CONSTRAINT [PK_Warehouse_VehicleTemperatures] PRIMARY KEY CLUSTERED 
(
	[VehicleTemperatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Instantaneous temperature readings for vehicle freezers and chillers' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'VehicleTemperatures', @level2type=N'COLUMN',@level2name=N'VehicleTemperatureID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Vehicle registration number' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'VehicleTemperatures', @level2type=N'COLUMN',@level2name=N'VehicleRegistration'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Cold room sensor number' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'VehicleTemperatures', @level2type=N'COLUMN',@level2name=N'ChillerSensorNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Time when this temperature recording was taken' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'VehicleTemperatures', @level2type=N'COLUMN',@level2name=N'RecordedWhen'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Temperature at the time of recording' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'VehicleTemperatures', @level2type=N'COLUMN',@level2name=N'Temperature'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is the sensor data compressed for archival storage?' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'VehicleTemperatures', @level2type=N'COLUMN',@level2name=N'IsCompressed'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full JSON data received from sensor' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'VehicleTemperatures', @level2type=N'COLUMN',@level2name=N'FullSensorData'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Compressed JSON data for archival purposes' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'VehicleTemperatures', @level2type=N'COLUMN',@level2name=N'CompressedSensorData'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Regularly recorded temperatures of vehicle chillers' , @level0type=N'SCHEMA',@level0name=N'Warehouse', @level1type=N'TABLE',@level1name=N'VehicleTemperatures'