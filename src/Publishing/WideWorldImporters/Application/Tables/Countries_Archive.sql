CREATE TABLE [Application].[Countries_Archive] (
    [CountryID]                INT               NOT NULL,
    [CountryName]              NVARCHAR (60)     NOT NULL,
    [FormalName]               NVARCHAR (60)     NOT NULL,
    [IsoAlpha3Code]            NVARCHAR (3)      NULL,
    [IsoNumericCode]           INT               NULL,
    [CountryType]              NVARCHAR (20)     NULL,
    [LatestRecordedPopulation] BIGINT            NULL,
    [Continent]                NVARCHAR (30)     NOT NULL,
    [Region]                   NVARCHAR (30)     NOT NULL,
    [Subregion]                NVARCHAR (30)     NOT NULL,
    [Border]                   [sys].[geography] NULL,
    [LastEditedBy]             INT               NOT NULL,
    [ValidFrom]                DATETIME2 (7)     NOT NULL,
    [ValidTo]                  DATETIME2 (7)     NOT NULL
) ON [USERDATA] TEXTIMAGE_ON [USERDATA];


GO
CREATE CLUSTERED INDEX [ix_Countries_Archive]
    ON [Application].[Countries_Archive]([ValidTo] ASC, [ValidFrom] ASC)
    ON [USERDATA];

