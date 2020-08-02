CREATE TYPE [Website].[SensorDataList] AS TABLE (
    [SensorDataListID]     INT             IDENTITY (1, 1) NOT NULL,
    [ColdRoomSensorNumber] INT             NOT NULL,
    [RecordedWhen]         DATETIME2 (7)   NOT NULL,
    [Temperature]          DECIMAL (18, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([SensorDataListID] ASC));

