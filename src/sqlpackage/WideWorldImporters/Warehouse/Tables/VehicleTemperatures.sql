CREATE TABLE [Warehouse].[VehicleTemperatures] (
    [VehicleTemperatureID] BIGINT          IDENTITY (1, 1) NOT NULL,
    [VehicleRegistration]  NVARCHAR (20)   NOT NULL,
    [ChillerSensorNumber]  INT             NOT NULL,
    [RecordedWhen]         DATETIME2 (7)   NOT NULL,
    [Temperature]          DECIMAL (10, 2) NOT NULL,
    [IsCompressed]         BIT             NOT NULL,
    [FullSensorData]       NVARCHAR (1000) NULL,
    [CompressedSensorData] VARBINARY (MAX) NULL,
    CONSTRAINT [PK_Warehouse_VehicleTemperatures] PRIMARY KEY CLUSTERED ([VehicleTemperatureID] ASC) ON [USERDATA]
) ON [USERDATA] TEXTIMAGE_ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Regularly recorded temperatures of vehicle chillers', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'VehicleTemperatures';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Instantaneous temperature readings for vehicle freezers and chillers', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'VehicleTemperatures', @level2type = N'COLUMN', @level2name = N'VehicleTemperatureID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Vehicle registration number', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'VehicleTemperatures', @level2type = N'COLUMN', @level2name = N'VehicleRegistration';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Cold room sensor number', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'VehicleTemperatures', @level2type = N'COLUMN', @level2name = N'ChillerSensorNumber';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Time when this temperature recording was taken', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'VehicleTemperatures', @level2type = N'COLUMN', @level2name = N'RecordedWhen';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Temperature at the time of recording', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'VehicleTemperatures', @level2type = N'COLUMN', @level2name = N'Temperature';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Is the sensor data compressed for archival storage?', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'VehicleTemperatures', @level2type = N'COLUMN', @level2name = N'IsCompressed';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Full JSON data received from sensor', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'VehicleTemperatures', @level2type = N'COLUMN', @level2name = N'FullSensorData';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Compressed JSON data for archival purposes', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'VehicleTemperatures', @level2type = N'COLUMN', @level2name = N'CompressedSensorData';

