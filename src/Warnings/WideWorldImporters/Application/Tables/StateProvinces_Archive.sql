CREATE TABLE [Application].[StateProvinces_Archive] (
    [StateProvinceID]          INT               NOT NULL,
    [StateProvinceCode]        NVARCHAR (5)      NOT NULL,
    [StateProvinceName]        NVARCHAR (50)     NOT NULL,
    [CountryID]                INT               NOT NULL,
    [SalesTerritory]           NVARCHAR (50)     NOT NULL,
    [Border]                   [sys].[geography] NULL,
    [LatestRecordedPopulation] BIGINT            NULL,
    [LastEditedBy]             INT               NOT NULL,
    [ValidFrom]                DATETIME2 (7)     NOT NULL,
    [ValidTo]                  DATETIME2 (7)     NOT NULL
) ON [USERDATA] TEXTIMAGE_ON [USERDATA];


GO
CREATE CLUSTERED INDEX [ix_StateProvinces_Archive]
    ON [Application].[StateProvinces_Archive]([ValidTo] ASC, [ValidFrom] ASC)
    ON [USERDATA];

