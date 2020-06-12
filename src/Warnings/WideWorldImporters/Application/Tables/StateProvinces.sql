CREATE TABLE [Application].[StateProvinces] (
    [StateProvinceID]          INT                                         CONSTRAINT [DF_Application_StateProvinces_StateProvinceID] DEFAULT (NEXT VALUE FOR [Sequences].[StateProvinceID]) NOT NULL,
    [StateProvinceCode]        NVARCHAR (5)                                NOT NULL,
    [StateProvinceName]        NVARCHAR (50)                               NOT NULL,
    [CountryID]                INT                                         NOT NULL,
    [SalesTerritory]           NVARCHAR (50)                               NOT NULL,
    [Border]                   [sys].[geography]                           NULL,
    [LatestRecordedPopulation] BIGINT                                      NULL,
    [LastEditedBy]             INT                                         NOT NULL,
    [ValidFrom]                DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                  DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_Application_StateProvinces] PRIMARY KEY CLUSTERED ([StateProvinceID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Application_StateProvinces_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Application_StateProvinces_CountryID_Application_Countries] FOREIGN KEY ([CountryID]) REFERENCES [Application].[Countries] ([CountryID]),
    CONSTRAINT [UQ_Application_StateProvinces_StateProvinceName] UNIQUE NONCLUSTERED ([StateProvinceName] ASC) ON [USERDATA],
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Application].[StateProvinces_Archive], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [FK_Application_StateProvinces_CountryID]
    ON [Application].[StateProvinces]([CountryID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [IX_Application_StateProvinces_SalesTerritory]
    ON [Application].[StateProvinces]([SalesTerritory] ASC)
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'StateProvinces', @level2type = N'INDEX', @level2name = N'FK_Application_StateProvinces_CountryID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Index used to quickly locate sales territories', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'StateProvinces', @level2type = N'INDEX', @level2name = N'IX_Application_StateProvinces_SalesTerritory';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'States or provinces that contain cities (including geographic location)', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'StateProvinces';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a state or province within the database', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'StateProvinces', @level2type = N'COLUMN', @level2name = N'StateProvinceID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Common code for this state or province (such as WA - Washington for the USA)', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'StateProvinces', @level2type = N'COLUMN', @level2name = N'StateProvinceCode';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Formal name of the state or province', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'StateProvinces', @level2type = N'COLUMN', @level2name = N'StateProvinceName';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Country for this StateProvince', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'StateProvinces', @level2type = N'COLUMN', @level2name = N'CountryID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Sales territory for this StateProvince', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'StateProvinces', @level2type = N'COLUMN', @level2name = N'SalesTerritory';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Geographic boundary of the state or province', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'StateProvinces', @level2type = N'COLUMN', @level2name = N'Border';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Latest available population for the StateProvince', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'StateProvinces', @level2type = N'COLUMN', @level2name = N'LatestRecordedPopulation';

