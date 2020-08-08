CREATE TABLE [Application].[People] (
    [PersonID]                INT                                         CONSTRAINT [DF_Application_People_PersonID] DEFAULT (NEXT VALUE FOR [Sequences].[PersonID]) NOT NULL,
    [FullName]                NVARCHAR (50)                               NOT NULL,
    [PreferredName]           NVARCHAR (50)                               NOT NULL,
    [SearchName]              AS                                          (concat([PreferredName],N' ',[FullName])) PERSISTED NOT NULL,
    [IsPermittedToLogon]      BIT                                         NOT NULL,
    [LogonName]               NVARCHAR (50)                               NULL,
    [IsExternalLogonProvider] BIT                                         NOT NULL,
    [HashedPassword]          VARBINARY (MAX)                             NULL,
    [IsSystemUser]            BIT                                         NOT NULL,
    [IsEmployee]              BIT                                         NOT NULL,
    [IsSalesperson]           BIT                                         NOT NULL,
    [UserPreferences]         NVARCHAR (MAX)                              NULL,
    [PhoneNumber]             NVARCHAR (20)                               NULL,
    [FaxNumber]               NVARCHAR (20)                               NULL,
    [EmailAddress]            NVARCHAR (256)                              NULL,
    [Photo]                   VARBINARY (MAX)                             NULL,
    [CustomFields]            NVARCHAR (MAX)                              NULL,
    [OtherLanguages]          AS                                          (json_query([CustomFields],N'$.OtherLanguages')),
    [LastEditedBy]            INT                                         NOT NULL,
    [ValidFrom]               DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                 DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    [Twitter]                 VARCHAR (128)                               NULL,
    CONSTRAINT [PK_Application_People] PRIMARY KEY CLUSTERED ([PersonID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Application_People_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Application].[People_Archive], DATA_CONSISTENCY_CHECK=ON));




GO
CREATE NONCLUSTERED INDEX [IX_Application_People_FullName]
    ON [Application].[People]([FullName] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [IX_Application_People_IsEmployee]
    ON [Application].[People]([IsEmployee] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [IX_Application_People_IsSalesperson]
    ON [Application].[People]([IsSalesperson] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [IX_Application_People_Perf_20160301_05]
    ON [Application].[People]([IsPermittedToLogon] ASC, [PersonID] ASC)
    INCLUDE([FullName], [EmailAddress])
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Improves performance of name-related queries', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'INDEX', @level2name = N'IX_Application_People_FullName';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Allows quickly locating employees', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'INDEX', @level2name = N'IX_Application_People_IsEmployee';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Allows quickly locating salespeople', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'INDEX', @level2name = N'IX_Application_People_IsSalesperson';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Improves performance of order picking and invoicing', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'INDEX', @level2name = N'IX_Application_People_Perf_20160301_05';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'People known to the application (staff, customer contacts, supplier contacts)', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a person within the database', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'COLUMN', @level2name = N'PersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Full name for this person', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'COLUMN', @level2name = N'FullName';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Name that this person prefers to be called', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'COLUMN', @level2name = N'PreferredName';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Name to build full text search on (computed column)', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'COLUMN', @level2name = N'SearchName';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Is this person permitted to log on?', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'COLUMN', @level2name = N'IsPermittedToLogon';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Person''s system logon name', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'COLUMN', @level2name = N'LogonName';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Is logon token provided by an external system?', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'COLUMN', @level2name = N'IsExternalLogonProvider';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Hash of password for users without external logon tokens', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'COLUMN', @level2name = N'HashedPassword';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Is the currently permitted to make online access?', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'COLUMN', @level2name = N'IsSystemUser';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Is this person an employee?', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'COLUMN', @level2name = N'IsEmployee';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Is this person a staff salesperson?', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'COLUMN', @level2name = N'IsSalesperson';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'User preferences related to the website (holds JSON data)', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'COLUMN', @level2name = N'UserPreferences';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Phone number', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'COLUMN', @level2name = N'PhoneNumber';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Fax number  ', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'COLUMN', @level2name = N'FaxNumber';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Email address for this person', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'COLUMN', @level2name = N'EmailAddress';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Photo of this person', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'COLUMN', @level2name = N'Photo';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Custom fields for employees and salespeople', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'COLUMN', @level2name = N'CustomFields';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Other languages spoken (computed column from custom fields)', @level0type = N'SCHEMA', @level0name = N'Application', @level1type = N'TABLE', @level1name = N'People', @level2type = N'COLUMN', @level2name = N'OtherLanguages';

