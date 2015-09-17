
CREATE VIEW [dbo].[Serv4Ultimus_New]
AS
SELECT     dbo.List2Nav.NumML, CASE ISNULL(I, '') WHEN '' THEN '' ELSE I + ' ' END + CASE ISNULL(E, '') WHEN '' THEN '' ELSE E + ' ' END + CASE ISNULL(S, '') 
                      WHEN '' THEN '' ELSE S + ' ' END + CASE ISNULL(T, '') WHEN '' THEN '' ELSE T + ' ' END + CASE ISNULL(P, '') WHEN '' THEN '' ELSE P + ' ' END + CASE ISNULL(V, '') 
                      WHEN '' THEN '' ELSE V + ' ' END + CASE ISNULL(R, '') WHEN '' THEN '' ELSE R + ' ' END + CASE ISNULL(Q, '') 
                      WHEN '' THEN '' ELSE Q + ' ' END + CASE ISNULL(SpecOb, '') WHEN '' THEN '' ELSE SpecOb + ' ' END + CASE ISNULL(NDogov, '') 
                      WHEN '' THEN '' ELSE NDogov + ' ' END + CASE ISNULL(NTelef, '') WHEN '' THEN '' ELSE NTelef + ' ' END AS serv, dbo.List2Nav.Zakazhcik AS Client, 
                      dbo.Osnova.Usluga, dbo.List2Nav.AdresA AS Adres_A, dbo.List2Nav.AdresB AS Adres_B, dbo.Osnova.Kontakt_A, dbo.Osnova.Kontakt_B, 
                      dbo.Osnova.Osnovanie AS Dogovor, dbo.List2Nav.Usluga AS Type, ISNULL(dbo.List2Nav.AdresA, '') + CHAR(13) + ISNULL(dbo.List2Nav.AdresB, '') AS Addresses, 
                      dbo.List2Nav.Sdan, dbo.List2Nav.Probl, dbo.List2Nav.Prim, dbo.Osnova.Manager, dbo.Osnova.Telefon, dbo.Osnova.Skorost, 
                      LTRIM(RTRIM(LTRIM(RTRIM(ISNULL(dbo.Osnova.Dop_A, ''))) + ' ' + LTRIM(RTRIM(ISNULL(dbo.Osnova.Dop_B, ''))))) AS Dop, dbo.Osnova.SpecProject, 
                      dbo.List2Nav.SONum, dbo.List2Nav.CR AS NUM_REG, dbo.Osnova.call_back, dbo.Osnova.room_BC1, dbo.Osnova.room_BC2, dbo.List2Nav.Sdan_ts as Sdan_ts
FROM         dbo.List2Nav LEFT OUTER JOIN
                      dbo.Osnova ON dbo.List2Nav.NumML = dbo.Osnova.NumML

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[27] 4[10] 2[14] 3) )"
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
         Begin Table = "List2Nav"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 240
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Osnova"
            Begin Extent = 
               Top = 6
               Left = 278
               Bottom = 114
               Right = 440
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Serv4Ultimus_New';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Serv4Ultimus_New';

