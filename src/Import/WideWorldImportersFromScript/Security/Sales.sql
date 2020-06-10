/****** Object:  Schema [Sales]    Script Date: 10/06/2020 18:14:16 ******/
CREATE SCHEMA [Sales] AUTHORIZATION [dbo]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Details of customers, salespeople, and of sales of stock items' , @level0type=N'SCHEMA',@level0name=N'Sales'