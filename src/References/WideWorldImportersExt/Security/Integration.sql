CREATE SCHEMA [Integration]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Tables and procedures required for integration with the data warehouse', @level0type = N'SCHEMA', @level0name = N'Integration';

