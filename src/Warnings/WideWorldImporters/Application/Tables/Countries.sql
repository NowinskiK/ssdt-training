CREATE TABLE [Application].[Countries] (
    [CountryID]                INT                                         CONSTRAINT [DF_Application_Countries_CountryID] DEFAULT (NEXT VALUE FOR [Sequences].[CountryID]) NOT NULL,
    [CountryName]              NVARCHAR (60)                               NOT NULL,
    [FormalName]               NVARCHAR (60)                               NOT NULL,
    [IsoAlpha3Code]            NVARCHAR (3)                                NULL,
    [IsoNumericCode]           INT                                         NULL,
    [CountryType]              NVARCHAR (20)                               NULL,
    [LatestRecordedPopulation] BIGINT                                      NULL,
    [Continent]                NVARCHAR (30)                               NOT NULL,
    [Region]                   NVARCHAR (30)                               NOT NULL,
    [Subregion]                NVARCHAR (30)                               NOT NULL,
    [Border]                   [sys].[geography]                           NULL,
    [LastEditedBy]             INT                                         NOT NULL,
    [ValidFrom]                DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                  DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_Application_Countries] PRIMARY KEY CLUSTERED ([CountryID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Application_Countries_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [UQ_Application_Countries_CountryName] UNIQUE NONCLUSTERED ([CountryName] ASC) ON [USERDATA],
    CONSTRAINT [UQ_Application_Countries_FormalName] UNIQUE NONCLUSTERED ([FormalName] ASC) ON [USERDATA],
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Application].[Countries_Archive], DATA_CONSISTENCY_CHECK=ON));


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Countries that contain the states or provinces (including geographic boundaries)', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'Countries';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a country within the database', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'Countries', @level2type = N'COLUMN', @level2name = N'CountryID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Name of the country', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'Countries', @level2type = N'COLUMN', @level2name = N'CountryName';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Full formal name of the country as agreed by United Nations', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'Countries', @level2type = N'COLUMN', @level2name = N'FormalName';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = '3 letter alphabetic code assigned to the country by ISO', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'Countries', @level2type = N'COLUMN', @level2name = N'IsoAlpha3Code';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric code assigned to the country by ISO', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'Countries', @level2type = N'COLUMN', @level2name = N'IsoNumericCode';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Type of country or administrative region', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'Countries', @level2type = N'COLUMN', @level2name = N'CountryType';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Latest available population for the country', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'Countries', @level2type = N'COLUMN', @level2name = N'LatestRecordedPopulation';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Name of the continent', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'Countries', @level2type = N'COLUMN', @level2name = N'Continent';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Name of the region', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'Countries', @level2type = N'COLUMN', @level2name = N'Region';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Name of the subregion', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'Countries', @level2type = N'COLUMN', @level2name = N'Subregion';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Geographic border of the country as described by the United Nations', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'Countries', @level2type = N'COLUMN', @level2name = N'Border';

