CREATE TABLE [Application].[People](
	[PersonID] [int] NOT NULL,
	[FullName] [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[PreferredName] [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[SearchName]  AS (concat([PreferredName],N' ',[FullName])) PERSISTED NOT NULL,
	[IsPermittedToLogon] [bit] NOT NULL,
	[LogonName] [nvarchar](50) COLLATE Latin1_General_100_CI_AS NULL,
	[IsExternalLogonProvider] [bit] NOT NULL,
	[HashedPassword] [varbinary](max) NULL,
	[IsSystemUser] [bit] NOT NULL,
	[IsEmployee] [bit] NOT NULL,
	[IsSalesperson] [bit] NOT NULL,
	[UserPreferences] [nvarchar](max) COLLATE Latin1_General_100_CI_AS NULL,
	[PhoneNumber] [nvarchar](20) COLLATE Latin1_General_100_CI_AS NULL,
	[FaxNumber] [nvarchar](20) COLLATE Latin1_General_100_CI_AS NULL,
	[EmailAddress] [nvarchar](256) COLLATE Latin1_General_100_CI_AS NULL,
	[Photo] [varbinary](max) NULL,
	[CustomFields] [nvarchar](max) COLLATE Latin1_General_100_CI_AS NULL,
	[OtherLanguages]  AS (json_query([CustomFields],N'$.OtherLanguages')),
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Application_People] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Application].[People_Archive] )
)
GO
ALTER TABLE [Application].[People]  WITH CHECK ADD  CONSTRAINT [FK_Application_People_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Application].[People] CHECK CONSTRAINT [FK_Application_People_Application_People]
GO
ALTER TABLE [Application].[People] ADD  CONSTRAINT [DF_Application_People_PersonID]  DEFAULT (NEXT VALUE FOR [Sequences].[PersonID]) FOR [PersonID]
GO
/****** Object:  Index [IX_Application_People_FullName]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [IX_Application_People_FullName] ON [Application].[People]
(
	[FullName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [IX_Application_People_IsEmployee]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [IX_Application_People_IsEmployee] ON [Application].[People]
(
	[IsEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [IX_Application_People_IsSalesperson]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [IX_Application_People_IsSalesperson] ON [Application].[People]
(
	[IsSalesperson] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [IX_Application_People_Perf_20160301_05]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [IX_Application_People_Perf_20160301_05] ON [Application].[People]
(
	[IsPermittedToLogon] ASC,
	[PersonID] ASC
)
INCLUDE([FullName],[EmailAddress]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a person within the database' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'PersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name for this person' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Name that this person prefers to be called' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'PreferredName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Name to build full text search on (computed column)' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'SearchName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is this person permitted to log on?' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'IsPermittedToLogon'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Person''s system logon name' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'LogonName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is logon token provided by an external system?' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'IsExternalLogonProvider'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Hash of password for users without external logon tokens' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'HashedPassword'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is the currently permitted to make online access?' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'IsSystemUser'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is this person an employee?' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'IsEmployee'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is this person a staff salesperson?' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'IsSalesperson'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'User preferences related to the website (holds JSON data)' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'UserPreferences'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Phone number' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'PhoneNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Fax number  ' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'FaxNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Email address for this person' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'EmailAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Photo of this person' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Custom fields for employees and salespeople' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'CustomFields'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Other languages spoken (computed column from custom fields)' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'COLUMN',@level2name=N'OtherLanguages'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Improves performance of name-related queries' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'INDEX',@level2name=N'IX_Application_People_FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Allows quickly locating employees' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'INDEX',@level2name=N'IX_Application_People_IsEmployee'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Allows quickly locating salespeople' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'INDEX',@level2name=N'IX_Application_People_IsSalesperson'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Improves performance of order picking and invoicing' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People', @level2type=N'INDEX',@level2name=N'IX_Application_People_Perf_20160301_05'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'People known to the application (staff, customer contacts, supplier contacts)' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'People'