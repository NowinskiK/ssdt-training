CREATE SCHEMA [Purchasing]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Details of suppliers and of purchasing of stock items', @level0type = N'SCHEMA', @level0name = N'Purchasing';

