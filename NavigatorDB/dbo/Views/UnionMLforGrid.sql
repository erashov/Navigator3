CREATE VIEW dbo.UnionMLforGrid
AS
SELECT        com.NumML, MAX(CASE WHEN dep.Id = 1 THEN 'ГОМЛ*' END) AS goml, MAX(CASE WHEN com.DeptID = 1 THEN com.GroupID END) AS gomlGroup, 
                         MAX(CASE WHEN dep.Id = 2 THEN 'ГФЗ*' END) AS gpz, MAX(CASE WHEN com.DeptID = 2 THEN com.GroupID END) AS gpzGroup, 
                         MAX(CASE WHEN dep.Id = 3 THEN 'ГПЛР*' END) AS gplr, MAX(CASE WHEN com.DeptID = 3 THEN com.GroupID END) AS gplrGroup, 
                         MAX(CASE WHEN dep.Id = 4 THEN 'ОЦОД*' END) AS ocod, MAX(CASE WHEN com.DeptID = 4 THEN com.GroupID END) AS ocodGroup, 
                         MAX(CASE WHEN dep.Id = 5 THEN 'ОСП*' END) AS osp, MAX(CASE WHEN com.DeptID = 5 THEN com.GroupID END) AS ospGroup, 
                         MAX(CASE WHEN dep.Id = 6 THEN 'ОТС(Е)*' END) AS otce, MAX(CASE WHEN com.DeptID = 6 THEN com.GroupID END) AS otseGroup, 
                         MAX(CASE WHEN dep.Id = 7 THEN 'ОТС(S)*' END) AS otcs, MAX(CASE WHEN com.DeptID = 7 THEN com.GroupID END) AS otcsGroup, 
                         MAX(CASE WHEN dep.Id = 8 THEN 'ОТвУ*' END) AS otvu, MAX(CASE WHEN com.DeptID = 8 THEN com.GroupID END) AS otvuGroup, 
                         MAX(CASE WHEN dep.Id = 9 THEN 'ОТУ*' END) AS otu, MAX(CASE WHEN com.DeptID = 9 THEN com.GroupID END) AS otuGroup, 
                         MAX(CASE WHEN dep.Id = 10 THEN 'ОТР*' END) AS otr, MAX(CASE WHEN com.DeptID = 10 THEN com.GroupID END) AS otrGroup, 
                         MAX(CASE WHEN dep.Id = 11 THEN 'ТО*' END) AS _to, MAX(CASE WHEN com.DeptID = 11 THEN com.GroupID END) AS _toGroup, 
                         MAX(CASE WHEN dep.Id = 12 THEN 'ДМВ*' END) AS dmv, MAX(CASE WHEN com.DeptID = 12 THEN com.GroupID END) AS dmvGroup, 
                         MAX(CASE WHEN dep.Id = 13 THEN 'ОШУГПУ*' END) AS oshugpu, MAX(CASE WHEN com.DeptID = 13 THEN com.GroupID END) AS oshugpuGroup, 
                         MAX(CASE WHEN dep.Id <> 1 AND dep.Id <> 2 AND dep.Id <> 3 AND dep.Id <> 4 AND dep.Id <> 5 AND dep.Id <> 6 AND dep.Id <> 7 AND dep.Id <> 8 AND 
                         dep.Id <> 9 AND dep.Id <> 10 AND dep.Id <> 11 AND dep.Id <> 12 AND dep.Id <> 13 THEN 'НЕТ' END) AS new
FROM            dbo.CompatibilityML AS com INNER JOIN
                         dbo.Wfl_Depts AS dep ON com.DeptID = dep.Id
GROUP BY com.NumML

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
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "com"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dep"
            Begin Extent = 
               Top = 6
               Left = 266
               Bottom = 135
               Right = 528
            End
            DisplayFlags = 280
            TopColumn = 0
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
      Begin ColumnWidths = 12
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'UnionMLforGrid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'UnionMLforGrid';

