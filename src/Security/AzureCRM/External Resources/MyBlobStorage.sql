CREATE EXTERNAL DATA SOURCE MyBlobStorage
WITH
(
    TYPE = BLOB_STORAGE,
    LOCATION = 'https://sqlplayer2019.blob.core.windows.net/csv' ,
	CREDENTIAL = SqlPlayer2019BlobStorageCredential
);
GO

-- Create an external data source with CREDENTIAL option.
--https://docs.microsoft.com/en-us/sql/relational-databases/import-export/examples-of-bulk-access-to-data-in-azure-blob-storage?view=sql-server-ver15
--Blob: wasb://YOURDefaultContainer@YOURStorageAccount.blob.core.windows.net/SomeDirectory/ASubDirectory/AFile.txt
