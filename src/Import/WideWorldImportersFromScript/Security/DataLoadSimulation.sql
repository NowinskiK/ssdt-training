/****** Object:  Schema [DataLoadSimulation]    Script Date: 10/06/2020 18:14:16 ******/
CREATE SCHEMA [DataLoadSimulation] AUTHORIZATION [dbo]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Tables and procedures used only during simulated data loading operations' , @level0type=N'SCHEMA',@level0name=N'DataLoadSimulation'