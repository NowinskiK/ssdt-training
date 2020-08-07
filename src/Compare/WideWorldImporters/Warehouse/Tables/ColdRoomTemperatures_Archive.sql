CREATE TABLE [Warehouse].[ColdRoomTemperatures_Archive] (
    [ColdRoomTemperatureID] BIGINT          NOT NULL,
    [ColdRoomSensorNumber]  INT             NOT NULL,
    [RecordedWhen]          DATETIME2 (7)   NOT NULL,
    [Temperature]           DECIMAL (10, 2) NOT NULL,
    [ValidFrom]             DATETIME2 (7)   NOT NULL,
    [ValidTo]               DATETIME2 (7)   NOT NULL
) ON [USERDATA];


GO
CREATE CLUSTERED INDEX [ix_ColdRoomTemperatures_Archive]
    ON [Warehouse].[ColdRoomTemperatures_Archive]([ValidTo] ASC, [ValidFrom] ASC)
    ON [USERDATA];

