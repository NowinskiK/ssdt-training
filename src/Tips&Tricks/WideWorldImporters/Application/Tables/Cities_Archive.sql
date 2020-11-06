CREATE TABLE [Application].[Cities_Archive] (
    [CityID]                   INT               NOT NULL,
    [CityName]                 NVARCHAR (50)     NOT NULL,
    [StateProvinceID]          INT               NOT NULL,
    [Location]                 [sys].[geography] NULL,
    [LatestRecordedPopulation] BIGINT            NULL,
    [LastEditedBy]             INT               NOT NULL,
    [ValidFrom]                DATETIME2 (7)     NOT NULL,
    [ValidTo]                  DATETIME2 (7)     NOT NULL
) ON [USERDATA] TEXTIMAGE_ON [USERDATA];


GO
CREATE CLUSTERED INDEX [ix_Cities_Archive]
    ON [Application].[Cities_Archive]([ValidTo] ASC, [ValidFrom] ASC)
    ON [USERDATA];

