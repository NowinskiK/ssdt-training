CREATE EXTERNAL TABLE [Person].[AddressType] (
    [AddressTypeID] INT NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    [rowguid] UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate] DATETIME NOT NULL
)
WITH (
    DATA_SOURCE = [ExtAW2014DataSrc]
);

