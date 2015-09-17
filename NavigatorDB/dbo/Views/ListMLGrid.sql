/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
CREATE VIEW dbo.ListMLGrid
AS
SELECT        l2n.NumML, l2n.utverzh, l2n.Otvetstv, l2n.Zakazhcik, l2n.AdresA, l2n.AdresB, l2n.Usluga, l2n.Skorost, l2n.Styk_A, l2n.Styk_B, l2n.PrivA, l2n.PrivB, l2n.UDA, l2n.UDB, 
                         l2n.SpecOb, ISNULL(l2n.E, ' ') + ISNULL(l2n.L, ' ') + ISNULL(l2n.S, ' ') + ISNULL(l2n.V, ' ') + ISNULL(l2n.T, ' ') + ISNULL(l2n.P, ' ') + ISNULL(l2n.I, ' ') + ISNULL(l2n.Q, ' ') 
                         + ISNULL(l2n.QC, ' ') + ISNULL(l2n.N, ' ') + ISNULL(l2n.fe, ' ') AS ESVTPIQQCNfe, l2n.E, l2n.L, l2n.S, l2n.V, l2n.T, l2n.P, l2n.I, l2n.Q, l2n.QC, l2n.N, l2n.fe, l2n.Probl, 
                         l2n.Prim, l2n.Operator, l2n.test_date_a, l2n.test_date_b, l2n.test_res_a, l2n.test_res_b, l2n.SpecProject, l2n.Sroch_SZ, l2n.Sroch_USHTU, l2n.taskFOConnection, 
                         l2n.Ivanov_Gulka, l2n.NMR, l2n.Sdan, l2n.Sdan_TS, l2n.ProblML, l2n.res1_d, l2n.Data_Sost_A, l2n.Data_Sost_B, l2n.Data_Vypt_A, l2n.Data_Vypt_B, l2n.DCSV, 
                         l2n.D_UVK, l2n.D_UIIAS_Sost, l2n.D_UIIAS, l2n.D_USHTU_TF_Sost, l2n.D_USHTU_TF, l2n.D_USHTU_Sost, l2n.D_USHTU, l2n.c, l2n.b, l2n.D_USP, l2n.D_USP1, 
                         l2n.signD3, l2n.HasTasks, glf.StartDate, glf.StopDate, dep.gplr_start, dep.gplr_end, dep.gplrIsCanceled, dep.gplr2_start, dep.gplr2_end, dep.gplr2IsCanceled, 
                         dep.dmv_start, dep.dmv_end, dep.dmvIsCanceled, dep.dmv2_start, dep.dmv2_end, dep.dmv2IsCanceled, dep.osp_start, dep.osp_end, dep.ospIsCanceled, 
                         dep.uiias_h_start, dep.uiias_h_end, dep.uiias_hIsCanceled, dep.oshugpu_start, dep.oshugpu_end, dep.oshugpuIsCanceled, dep.oshugpz_start, dep.oshugpz_end, 
                         dep.oshugpzIsCanceled, dep.to_start, dep.to_end, dep.toIsCanceled, dep.to2_start, dep.to2_end, dep.to2IsCanceled, dep.otse_start, dep.otse_end, 
                         dep.otseIsCanceled, dep.otse2_start, dep.otse2_end, dep.otse2IsCanceled, dep.otss_start, dep.otss_end, dep.otssIsCanceled, dep.otss2_start, dep.otss2_end, 
                         dep.otss2IsCanceled, dep.otu_start, dep.otu_end, dep.otuIsCanceled, dep.otvu_start, dep.otvu_end, dep.otvuIsCanceled, dep.oshugpz_ReportExist, 
                         dep.gplr_ReportExist, dep.otsod_ReportExist, dep.osp_ReportExist, dep.otse_ReportExist, dep.otss_ReportExist, dep.otvu_ReportExist, dep.otu_ReportExist, 
                         dep.to_ReportExist, dep.dmv_ReportExist, dep.ushugpu_ReportExist, jinf.ChNumA, jinf.ChNumB, jinf.AdressA, jinf.AdressB, unionML.goml, unionML.gpz, 
                         unionML.gplr, unionML.ocod, unionML.osp, unionML.otce, unionML.otcs, unionML.otvu, unionML.otu, unionML.otr, unionML._to, unionML.dmv, unionML.oshugpu, 
                         tw.USERs, tw.Login, tr.TaskReturns, tr.TaskCancels
FROM            dbo.List2Nav AS l2n LEFT OUTER JOIN
                         dbo.Wfl_TasksByDepartment AS dep ON l2n.NumML = dep.NumML LEFT OUTER JOIN
                         dbo.Wfl_GetLastFreezings AS glf ON glf.RSNumber = l2n.NumML LEFT OUTER JOIN
                         dbo.JoinInf AS jinf ON jinf.NumML = l2n.NumML LEFT OUTER JOIN
                         dbo.UnionMLforGrid AS unionML ON unionML.NumML = l2n.NumML LEFT OUTER JOIN
                         dbo.TaskInWork AS tw ON tw.NumML = l2n.NumML LEFT OUTER JOIN
                         dbo.Wfl_TaskReturns AS tr ON tr.NumML = l2n.NumML

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
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "l2n"
            Begin Extent = 
               Top = 182
               Left = 556
               Bottom = 311
               Right = 781
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "dep"
            Begin Extent = 
               Top = 10
               Left = 397
               Bottom = 139
               Right = 596
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "glf"
            Begin Extent = 
               Top = 2
               Left = 635
               Bottom = 131
               Right = 843
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "jinf"
            Begin Extent = 
               Top = 244
               Left = 825
               Bottom = 373
               Right = 999
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "unionML"
            Begin Extent = 
               Top = 0
               Left = 1006
               Bottom = 129
               Right = 1180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tw"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 267
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tr"
            Begin Extent = 
               Top = 247
               Left = 321
               Bottom = 359
               Right = 495
            End
            DisplayFlags = 280
            TopColu', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ListMLGrid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'mn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 1095
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ListMLGrid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ListMLGrid';

