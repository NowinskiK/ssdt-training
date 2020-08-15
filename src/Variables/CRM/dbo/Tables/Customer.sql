CREATE TABLE [dbo].[Customer] (
    [CustomerId]       INT           IDENTITY (1, 1) NOT NULL,
    [RegionCode]       CHAR (5)      NULL,
    [Title]            VARCHAR (10)  NULL,
    [SSN]              VARCHAR (20)  NULL,
    [Login]            VARCHAR (128) NULL,
    [CountryCode]      VARCHAR (5)   NULL,
    [FirstName]        VARCHAR (100) NULL,
    [Surname]          VARCHAR (100) NULL,
    [isActive]         BIT           NULL,
    [InactiveDate]     DATETIME      NULL,
    [CreatedOn]        DATETIME      NULL,
    [CreatedBy]        VARCHAR (50)  NULL,
    [UpdatedOn]        DATETIME      NULL,
    [UpdatedBy]        VARCHAR (50)  NULL,
    [CustomerTypeCode] VARCHAR (5)   NULL,
    [Twitter]          VARCHAR (100) NULL,
    CONSTRAINT [PK_Customer_CustomerId] PRIMARY KEY CLUSTERED ([CustomerId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_SSN]
    ON [dbo].[Customer]([SSN] ASC) WITH (FILLFACTOR = 90);

