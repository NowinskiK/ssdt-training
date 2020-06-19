CREATE SCHEMA [Sales]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Details of customers, salespeople, and of sales of stock items', @level0type = N'SCHEMA', @level0name = N'Sales';

