/****** Object:  Schema [Warehouse]    Script Date: 10/06/2020 18:14:16 ******/
CREATE SCHEMA [Warehouse] AUTHORIZATION [dbo]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Details of stock items, their holdings and transactions' , @level0type=N'SCHEMA',@level0name=N'Warehouse'