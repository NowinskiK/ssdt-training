/****** Object:  Schema [Integration]    Script Date: 10/06/2020 18:14:16 ******/
CREATE SCHEMA [Integration] AUTHORIZATION [dbo]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Tables and procedures required for integration with the data warehouse' , @level0type=N'SCHEMA',@level0name=N'Integration'