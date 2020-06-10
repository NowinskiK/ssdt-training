/****** Object:  Schema [Application]    Script Date: 10/06/2020 18:14:16 ******/
CREATE SCHEMA [Application] AUTHORIZATION [dbo]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Tables common across the application. Used for categorization and lookup lists, system parameters and people (users and contacts)' , @level0type=N'SCHEMA',@level0name=N'Application'