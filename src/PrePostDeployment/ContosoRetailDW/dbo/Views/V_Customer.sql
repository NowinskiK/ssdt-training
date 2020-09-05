CREATE VIEW dbo.V_Customer
AS
SELECT     C.CustomerKey, DATEDIFF(year, C.BirthDate, GETDATE()) AS Age, C.MaritalStatus, C.Gender, C.YearlyIncome, C.TotalChildren, C.NumberChildrenAtHome, C.Education, 
                      C.HouseOwnerFlag, C.NumberCarsOwned, S.Consumption
FROM         dbo.DimCustomer AS C INNER JOIN
                          (SELECT     CustomerKey, SUM(SalesAmount) AS Consumption
                            FROM          dbo.FactOnlineSales
                            GROUP BY CustomerKey) AS S ON C.CustomerKey = S.CustomerKey
WHERE     (C.CustomerType = 'Person')

GO
