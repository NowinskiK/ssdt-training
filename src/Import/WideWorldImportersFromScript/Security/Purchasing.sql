/****** Object:  Schema [Purchasing]    Script Date: 10/06/2020 18:14:16 ******/
CREATE SCHEMA [Purchasing] AUTHORIZATION [dbo]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Details of suppliers and of purchasing of stock items' , @level0type=N'SCHEMA',@level0name=N'Purchasing'