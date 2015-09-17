CREATE VIEW dbo.view_Navigator_search
AS
SELECT     ISNULL(dbo.List2Nav.NumML, dbo.Osnova.NumML) AS NumML, ISNULL(dbo.Osnova.Zakazchik, dbo.List2Nav.Zakazhcik) AS Zakazchik, 
                      ISNULL(dbo.Osnova.Adres_A, dbo.List2Nav.AdresA) AS Adres_A, ISNULL(dbo.Osnova.Adres_B, dbo.List2Nav.AdresB) AS Adres_B, 
                      ISNULL(dbo.Osnova.Usluga, dbo.List2Nav.Usluga) AS Usluga, dbo.Osnova.Pre_Usluga, dbo.Osnova.Nom_Kan, dbo.List2Nav.utverzh, 
                      dbo.List2Nav.Sdan_TS, REPLACE(REPLACE(ISNULL(' ' + dbo.List2Nav.E, '') + + ISNULL(' ' + dbo.List2Nav.S, '') + + ISNULL(' ' + dbo.List2Nav.V, '') 
                      + + ISNULL(' ' + dbo.List2Nav.T, '') + + ISNULL(' ' + dbo.List2Nav.P, '') + + ISNULL(' ' + dbo.List2Nav.I, '') + + ISNULL(' ' + dbo.List2Nav.R, '') 
                      + + ISNULL(' ' + dbo.List2Nav.Q, '') + + ISNULL(' ' + dbo.List2Nav.SpecOb, ''), ',', ' '), ';', ' ') AS Channels, dbo.Osnova.Manager, dbo.Osnova.Telefon, 
                      dbo.Osnova.Osnovanie, dbo.Osnova.Skorost, dbo.List2Nav.project_manager
FROM         dbo.Osnova FULL OUTER JOIN
                      dbo.List2Nav ON dbo.Osnova.NumML = dbo.List2Nav.NumML
WHERE     (dbo.List2Nav.NumML < 1000000)

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[33] 4[19] 2[25] 3) )"
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
         Begin Table = "Osnova (dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 200
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "List2Nav (dbo)"
            Begin Extent = 
               Top = 6
               Left = 238
               Bottom = 114
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 104
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
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
         Column = 2220
         Alias = 900
         Table = 1725
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'view_Navigator_search';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'view_Navigator_search';

