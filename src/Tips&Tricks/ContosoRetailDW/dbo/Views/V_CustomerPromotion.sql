CREATE VIEW dbo.V_CustomerPromotion
AS
SELECT     dbo.DimCustomer.CustomerKey, DATEDIFF(year, dbo.DimCustomer.BirthDate, GETDATE()) AS Age, dbo.DimCustomer.MaritalStatus, dbo.DimCustomer.Gender, 
                      dbo.DimCustomer.YearlyIncome, dbo.DimCustomer.TotalChildren, dbo.DimCustomer.NumberChildrenAtHome, dbo.DimCustomer.Education, 
                      dbo.DimCustomer.HouseOwnerFlag, dbo.DimCustomer.NumberCarsOwned, dbo.DimPromotion.PromotionName, dbo.DimPromotion.PromotionType, 
                      dbo.FactOnlineSales.ProductKey, dbo.FactOnlineSales.PromotionKey
FROM         dbo.DimCustomer INNER JOIN
                      dbo.FactOnlineSales ON dbo.DimCustomer.CustomerKey = dbo.FactOnlineSales.CustomerKey INNER JOIN
                      dbo.DimPromotion ON dbo.FactOnlineSales.PromotionKey = dbo.DimPromotion.PromotionKey
WHERE     (dbo.DimCustomer.CustomerType = 'Person') AND (dbo.FactOnlineSales.ProductKey >= 1144) AND (dbo.FactOnlineSales.ProductKey <= 1246)

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[20] 2[28] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -384
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DimCustomer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 319
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "FactOnlineSales"
            Begin Extent = 
               Top = 6
               Left = 279
               Bottom = 311
               Right = 477
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "DimPromotion"
            Begin Extent = 
               Top = 6
               Left = 515
               Bottom = 250
               Right = 705
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2775
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_CustomerPromotion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'V_CustomerPromotion';

