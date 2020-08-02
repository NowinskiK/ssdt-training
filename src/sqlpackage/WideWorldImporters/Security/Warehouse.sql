CREATE SCHEMA [Warehouse]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Details of stock items, their holdings and transactions', @level0type = N'SCHEMA', @level0name = N'Warehouse';

