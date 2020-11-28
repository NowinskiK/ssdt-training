CREATE MASTER KEY 
GO

CREATE DATABASE SCOPED CREDENTIAL AW2014_Credential
WITH
  IDENTITY = 'extROUser' ,
  SECRET = 'ReeA1frejgiWeZjg' ;
GO


CREATE EXTERNAL DATA SOURCE MyElasticDBQueryDataSrc
WITH
  ( TYPE = RDBMS ,
    LOCATION = 'sqlplayer.database.windows.net' ,
    DATABASE_NAME = 'AdventureWorks2014' ,
    CREDENTIAL = AW2014_Credential
  ) ;


CREATE EXTERNAL TABLE [Person].[AddressType]
(
	[AddressTypeID] [int] NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
)
WITH ( DATA_SOURCE = MyElasticDBQueryDataSrc)

SELECT TOP 100 * from [Person].[AddressType]



DROP EXTERNAL DATA SOURCE MyElasticDBQueryDataSrc
DROP DATABASE SCOPED CREDENTIAL AW2014_Credential




