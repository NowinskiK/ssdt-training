CREATE TABLE [Warehouse].[ColdRoomTemperatures] (
    [ColdRoomTemperatureID] BIGINT                                      IDENTITY (1, 1) NOT NULL,
    [ColdRoomSensorNumber]  INT                                         NOT NULL,
    [RecordedWhen]          DATETIME2 (7)                               NOT NULL,
    [Temperature]           DECIMAL (10, 2)                             NOT NULL,
    [ValidFrom]             DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]               DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_Warehouse_ColdRoomTemperatures] PRIMARY KEY CLUSTERED ([ColdRoomTemperatureID] ASC) ON [USERDATA],
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Warehouse].[ColdRoomTemperatures_Archive], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_Warehouse_ColdRoomTemperatures_ColdRoomSensorNumber]
    ON [Warehouse].[ColdRoomTemperatures]([ColdRoomSensorNumber] ASC)
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Regularly recorded temperatures of cold room chillers', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'ColdRoomTemperatures';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Instantaneous temperature readings for cold rooms (chillers)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'ColdRoomTemperatures', @level2type = N'COLUMN', @level2name = N'ColdRoomTemperatureID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Cold room sensor number', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'ColdRoomTemperatures', @level2type = N'COLUMN', @level2name = N'ColdRoomSensorNumber';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Time when this temperature recording was taken', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'ColdRoomTemperatures', @level2type = N'COLUMN', @level2name = N'RecordedWhen';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Temperature at the time of recording', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'ColdRoomTemperatures', @level2type = N'COLUMN', @level2name = N'Temperature';

