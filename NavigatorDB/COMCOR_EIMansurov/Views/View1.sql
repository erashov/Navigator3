CREATE VIEW [COMCOR\EIMansurov].View1
AS
SELECT     TOP (100) PERCENT dbo.List2Nav.IDO, dbo.List2Nav.NumML, dbo.List2Nav.Zakazhcik, dbo.List2Nav.Usluga, dbo.List2Nav.AdresA, dbo.List2Nav.PrivA, 
                      dbo.List2Nav.AdresB, dbo.List2Nav.PrivB, dbo.List2Nav.Otvetstv, dbo.List2Nav.USP, dbo.List2Nav.E, dbo.List2Nav.S, dbo.List2Nav.V, dbo.List2Nav.T, 
                      dbo.List2Nav.P, dbo.List2Nav.I, dbo.List2Nav.R, dbo.List2Nav.SpecOb, dbo.List2Nav.Sdan, dbo.List2Nav.Probl, dbo.List2Nav.D_USP, dbo.List2Nav.D_E, 
                      dbo.List2Nav.D_S, dbo.List2Nav.D_V, dbo.List2Nav.D_T, dbo.List2Nav.D_P, dbo.List2Nav.D_I, dbo.List2Nav.D_R, dbo.List2Nav.utverzh, dbo.List2Nav.D_SpecOb, 
                      dbo.List2Nav.Srochnost, dbo.List2Nav.Prim, dbo.List2Nav.DUP, dbo.List2Nav.UDB, dbo.List2Nav.UDA, dbo.List2Nav.NRUSP, dbo.List2Nav.D_USP1, 
                      dbo.List2Nav.NRUSP1, dbo.List2Nav.MestoNah, dbo.List2Nav.ProblML, dbo.List2Nav.b, dbo.List2Nav.c, dbo.List2Nav.Probl_Data, dbo.List2Nav.NRUPK, 
                      dbo.List2Nav.NRUPK1, dbo.List2Nav.D_UPK, dbo.List2Nav.D_UPK1, dbo.List2Nav.data_UPK, dbo.List2Nav.data_UPK1, dbo.List2Nav.G_A, dbo.List2Nav.G_B, 
                      dbo.List2Nav.Data_Vypt_A, dbo.List2Nav.Data_Vypt_B, dbo.List2Nav.taskFOConnection, dbo.List2Nav.signD1, dbo.List2Nav.signD2, dbo.List2Nav.signD3, 
                      dbo.List2Nav.signC2, dbo.List2Nav.signC3, dbo.List2Nav.Q, dbo.List2Nav.D_Q, dbo.List2Nav.Sdan_TS, dbo.List2Nav.signB1, dbo.List2Nav.signB3, 
                      dbo.List2Nav.D_UIIAS, dbo.List2Nav.D_UIIAS_Sost, dbo.List2Nav.NR_USHTU, dbo.List2Nav.D_USHTU, dbo.List2Nav.D_USHTU_Sost, dbo.List2Nav.NR_USHTU_TF, 
                      dbo.List2Nav.D_USHTU_TF, dbo.List2Nav.D_USHTU_TF_Sost, dbo.List2Nav.SpecProject, dbo.List2Nav.OSS, dbo.List2Nav.CMT_USHTU_TF, 
                      dbo.List2Nav.NR_Region, dbo.List2Nav.D_Region, dbo.List2Nav.D_Region_Sost, dbo.List2Nav.CR, dbo.List2Nav.D_CR, dbo.List2Nav.Sroch_USHTU, 
                      dbo.List2Nav.Data_Sost_A, dbo.List2Nav.Data_Sost_B, dbo.List2Nav.Skorost, dbo.List2Nav.Styk_A, dbo.List2Nav.Styk_B, dbo.List2Nav.Line_PrivA, 
                      dbo.List2Nav.Dop_A, dbo.List2Nav.Dop_B, dbo.List2Nav.Sroch_SZ, dbo.List2Nav.DCSV, dbo.List2Nav.D_UVK, dbo.List2Nav.Klient
FROM         dbo.List2Nav LEFT OUTER JOIN
                      dbo.JointInfo ON dbo.List2Nav.NumML = dbo.JointInfo.NumML
WHERE     (dbo.List2Nav.NumML < 999999) AND (dbo.List2Nav.Usluga NOT LIKE '%SR%') AND (dbo.List2Nav.ProblML IS NULL) OR
                      (dbo.List2Nav.NumML < 999999) AND (dbo.List2Nav.Usluga IS NULL) AND (dbo.List2Nav.ProblML IS NULL)
ORDER BY dbo.List2Nav.NumML DESC

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[19] 4[28] 2[38] 3) )"
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
         Begin Table = "List2Nav (dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 240
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "JointInfo (dbo)"
            Begin Extent = 
               Top = 6
               Left = 278
               Bottom = 114
               Right = 429
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
      Begin ColumnWidths = 98
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
     ', @level0type = N'SCHEMA', @level0name = N'COMCOR\EIMansurov', @level1type = N'VIEW', @level1name = N'View1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'    Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
', @level0type = N'SCHEMA', @level0name = N'COMCOR\EIMansurov', @level1type = N'VIEW', @level1name = N'View1';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'COMCOR\EIMansurov', @level1type = N'VIEW', @level1name = N'View1';

