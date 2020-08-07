CREATE SCHEMA [DataLoadSimulation]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Tables and procedures used only during simulated data loading operations', @level0type = N'SCHEMA', @level0name = N'DataLoadSimulation';

