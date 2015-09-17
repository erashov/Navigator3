CREATE VIEW dbo.MainTabView
AS
SELECT        (CASE WHEN len(mt.D_puska) = 8 AND ISDATE('20' + SUBSTRING(mt.D_puska, 7, 2) + '-' + SUBSTRING(mt.D_puska, 4, 2) + '-' + SUBSTRING(mt.D_puska, 1, 2) 
                         + ' 00:00:00.000') = 1 AND mt.D_puska IS NOT NULL THEN CONVERT(datetime, '20' + SUBSTRING(mt.D_puska, 7, 2) + '-' + SUBSTRING(mt.D_puska, 4, 2) 
                         + '-' + SUBSTRING(mt.D_puska, 1, 2) + ' 00:00:00.000') ELSE NULL END) AS D_puskView, mt.NomerKanala, mt.NoKanE, mt.NoKanS, mt.NoKanF, mt.NoKanY, 
                         mt.NoKanT, mt.NoKanK, mt.NoKanN, mt.NoKanL, mt.NoKanFe, mt.NoKanR
FROM            dbo.Main_Table AS mt RIGHT OUTER JOIN
                         dbo.Main_Table AS mt2 ON mt2.NomerKanala = mt.NomerKanala

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "mt"
            Begin Extent = 
               Top = 59
               Left = 208
               Bottom = 269
               Right = 387
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "mt2"
            Begin Extent = 
               Top = 6
               Left = 425
               Bottom = 135
               Right = 604
            End
            DisplayFlags = 280
            TopColumn = 57
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
         Column = 1440
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'MainTabView';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'MainTabView';

