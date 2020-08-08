CREATE TABLE [Application].[People_Archive] (
    [PersonID]                INT             NOT NULL,
    [FullName]                NVARCHAR (50)   NOT NULL,
    [PreferredName]           NVARCHAR (50)   NOT NULL,
    [SearchName]              NVARCHAR (101)  NOT NULL,
    [IsPermittedToLogon]      BIT             NOT NULL,
    [LogonName]               NVARCHAR (50)   NULL,
    [IsExternalLogonProvider] BIT             NOT NULL,
    [HashedPassword]          VARBINARY (MAX) NULL,
    [IsSystemUser]            BIT             NOT NULL,
    [IsEmployee]              BIT             NOT NULL,
    [IsSalesperson]           BIT             NOT NULL,
    [UserPreferences]         NVARCHAR (MAX)  NULL,
    [PhoneNumber]             NVARCHAR (20)   NULL,
    [FaxNumber]               NVARCHAR (20)   NULL,
    [EmailAddress]            NVARCHAR (256)  NULL,
    [Photo]                   VARBINARY (MAX) NULL,
    [CustomFields]            NVARCHAR (MAX)  NULL,
    [OtherLanguages]          NVARCHAR (MAX)  NULL,
    [LastEditedBy]            INT             NOT NULL,
    [ValidFrom]               DATETIME2 (7)   NOT NULL,
    [ValidTo]                 DATETIME2 (7)   NOT NULL,
    [Twitter]                 VARCHAR (128)   NULL
) ON [USERDATA] TEXTIMAGE_ON [USERDATA];




GO
CREATE CLUSTERED INDEX [ix_People_Archive]
    ON [Application].[People_Archive]([ValidTo] ASC, [ValidFrom] ASC)
    ON [USERDATA];

