--Create a master key in database. You only need to create a master key once per database.
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '!MyC0mpl3xP@ssw0rd!';
GO

-- Create a database scoped credential with Azure storage account key as the secret.
CREATE DATABASE SCOPED CREDENTIAL SqlPlayer2019BlobStorageCredential
WITH 
    IDENTITY = 'sqlplayer2019', 
    SECRET = '*******************';
GO


-- Create an external data source with CREDENTIAL option.
--https://docs.microsoft.com/en-us/sql/t-sql/statements/create-external-data-source-transact-sql?view=sql-server-ver15&tabs=dedicated
--Blob: wasb://YOURDefaultContainer@YOURStorageAccount.blob.core.windows.net/SomeDirectory/ASubDirectory/AFile.txt
CREATE EXTERNAL DATA SOURCE MyBlobStorage
WITH
(
    TYPE = Hadoop,
    LOCATION = 'wasb://csv@sqlplayer2019.blob.core.windows.net' ,
	CREDENTIAL = SqlPlayer2019BlobStorageCredential
);
GO

