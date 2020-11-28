-- Create a database scoped credential with Azure storage account key as the secret.
CREATE DATABASE SCOPED CREDENTIAL SqlPlayer2019BlobStorageCredential
WITH 
    IDENTITY = 'SHARED ACCESS SIGNATURE', 
    -- Remove ? from the beginning of the SAS token
    SECRET = '$(BlobSAS)' ;
GO


