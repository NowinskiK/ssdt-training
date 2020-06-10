/****** Object:  Schema [PowerBI]    Script Date: 10/06/2020 18:14:16 ******/
CREATE SCHEMA [PowerBI] AUTHORIZATION [dbo]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Views and stored procedures that provide the only access for the Power BI dashboard system' , @level0type=N'SCHEMA',@level0name=N'PowerBI'