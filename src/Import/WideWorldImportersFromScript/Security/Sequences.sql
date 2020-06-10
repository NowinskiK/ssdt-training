/****** Object:  Schema [Sequences]    Script Date: 10/06/2020 18:14:16 ******/
CREATE SCHEMA [Sequences] AUTHORIZATION [dbo]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Holds sequences used by all tables in the application' , @level0type=N'SCHEMA',@level0name=N'Sequences'