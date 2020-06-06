CREATE TABLE [dbo].[CustomerPerson]
(
	[Id] INT NOT NULL,
	[FirstName] varchar(100) not null,
	[LastName] varchar(100) not null, 
	[MobilePhone] varchar(100) not null, 
    CONSTRAINT [PK_Customer] PRIMARY KEY ([Id])
)


GO

CREATE NONCLUSTERED INDEX [IX_CustomerPerson_FirstName] ON [dbo].[CustomerPerson] ([FirstName])
GO
