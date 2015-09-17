CREATE VIEW dbo.Wfl_TasksByDepartment
AS
SELECT        x.NumML, MAX((CASE WHEN [DepartmentIdTo] = 3 AND TaskType = 1 THEN [StartDate] ELSE NULL END)) AS gplr_start, MAX((CASE WHEN [DepartmentIdTo] = 3 AND 
                         TaskType = 1 THEN [EndDate] ELSE NULL END)) AS gplr_end, MAX((CASE WHEN [DepartmentIdTo] = 3 AND TaskType = 1 THEN IsCanceled ELSE NULL END)) 
                         AS gplrIsCanceled, MAX((CASE WHEN [DepartmentIdTo] = 3 AND TaskType = 2 THEN [StartDate] ELSE NULL END)) AS gplr2_start, 
                         MAX((CASE WHEN [DepartmentIdTo] = 3 AND TaskType = 2 THEN [EndDate] ELSE NULL END)) AS gplr2_end, MAX((CASE WHEN [DepartmentIdTo] = 3 AND 
                         TaskType = 2 THEN IsCanceled ELSE NULL END)) AS gplr2IsCanceled, MAX((CASE WHEN [DepartmentIdTo] = 12 AND TaskType = 1 THEN [StartDate] ELSE NULL 
                         END)) AS dmv_start, MAX((CASE WHEN [DepartmentIdTo] = 12 AND TaskType = 1 THEN [EndDate] ELSE NULL END)) AS dmv_end, 
                         MAX((CASE WHEN [DepartmentIdTo] = 12 AND TaskType = 1 THEN IsCanceled ELSE NULL END)) AS dmvIsCanceled, MAX((CASE WHEN [DepartmentIdTo] = 12 AND 
                         TaskType = 2 THEN [StartDate] ELSE NULL END)) AS dmv2_start, MAX((CASE WHEN [DepartmentIdTo] = 12 AND TaskType = 2 THEN [EndDate] ELSE NULL END)) 
                         AS dmv2_end, MAX((CASE WHEN [DepartmentIdTo] = 12 AND TaskType = 2 THEN IsCanceled ELSE NULL END)) AS dmv2IsCanceled, 
                         MAX((CASE WHEN [DepartmentIdTo] = 5 THEN [StartDate] ELSE NULL END)) AS osp_start, MAX((CASE WHEN [DepartmentIdTo] = 5 THEN [EndDate] ELSE NULL END)) 
                         AS osp_end, MAX((CASE WHEN [DepartmentIdTo] = 5 THEN IsCanceled ELSE NULL END)) AS ospIsCanceled, 
                         MAX((CASE WHEN [DepartmentIdTo] = 4 THEN [StartDate] ELSE NULL END)) AS uiias_h_start, MAX((CASE WHEN [DepartmentIdTo] = 4 THEN [EndDate] ELSE NULL 
                         END)) AS uiias_h_end, MAX((CASE WHEN [DepartmentIdTo] = 4 THEN IsCanceled ELSE NULL END)) AS uiias_hIsCanceled, 
                         MAX((CASE WHEN [DepartmentIdTo] = 13 THEN [StartDate] ELSE NULL END)) AS oshugpu_start, MAX((CASE WHEN [DepartmentIdTo] = 13 THEN [EndDate] ELSE NULL
                          END)) AS oshugpu_end, MAX((CASE WHEN [DepartmentIdTo] = 13 THEN IsCanceled ELSE NULL END)) AS oshugpuIsCanceled, 
                         MAX((CASE WHEN [DepartmentIdTo] = 2 THEN x.[StartDate] ELSE NULL END)) AS oshugpz_start, MAX((CASE WHEN [DepartmentIdTo] = 2 THEN [EndDate] ELSE NULL
                          END)) AS oshugpz_end, MAX((CASE WHEN [DepartmentIdTo] = 2 THEN IsCanceled ELSE NULL END)) AS oshugpzIsCanceled, 
                         MAX((CASE WHEN [DepartmentIdTo] = 11 AND TaskType = 1 THEN [StartDate] ELSE NULL END)) AS to_start, MAX((CASE WHEN [DepartmentIdTo] = 11 AND 
                         TaskType = 1 THEN [EndDate] ELSE NULL END)) AS to_end, MAX((CASE WHEN [DepartmentIdTo] = 11 AND TaskType = 1 THEN IsCanceled ELSE NULL END)) 
                         AS toIsCanceled, MAX((CASE WHEN [DepartmentIdTo] = 11 AND TaskType = 2 THEN [StartDate] ELSE NULL END)) AS to2_start, 
                         MAX((CASE WHEN [DepartmentIdTo] = 11 AND TaskType = 2 THEN [EndDate] ELSE NULL END)) AS to2_end, MAX((CASE WHEN [DepartmentIdTo] = 11 AND 
                         TaskType = 2 THEN IsCanceled ELSE NULL END)) AS to2IsCanceled, MAX((CASE WHEN [DepartmentIdTo] = 6 AND TaskType = 1 THEN [StartDate] ELSE NULL END)) 
                         AS otse_start, MAX((CASE WHEN [DepartmentIdTo] = 6 AND TaskType = 1 THEN [EndDate] ELSE NULL END)) AS otse_end, 
                         MAX((CASE WHEN [DepartmentIdTo] = 6 AND TaskType = 1 THEN IsCanceled ELSE NULL END)) AS otseIsCanceled, MAX((CASE WHEN [DepartmentIdTo] = 6 AND 
                         TaskType = 2 THEN [StartDate] ELSE NULL END)) AS otse2_start, MAX((CASE WHEN [DepartmentIdTo] = 6 AND TaskType = 2 THEN [EndDate] ELSE NULL END)) 
                         AS otse2_end, MAX((CASE WHEN [DepartmentIdTo] = 6 AND TaskType = 2 THEN IsCanceled ELSE NULL END)) AS otse2IsCanceled, 
                         MAX((CASE WHEN [DepartmentIdTo] = 7 AND TaskType = 1 THEN [StartDate] ELSE NULL END)) AS otss_start, MAX((CASE WHEN [DepartmentIdTo] = 7 AND 
                         TaskType = 1 THEN [EndDate] ELSE NULL END)) AS otss_end, MAX((CASE WHEN [DepartmentIdTo] = 7 AND TaskType = 1 THEN IsCanceled ELSE NULL END)) 
                         AS otssIsCanceled, MAX((CASE WHEN [DepartmentIdTo] = 7 AND TaskType = 2 THEN [StartDate] ELSE NULL END)) AS otss2_start, 
                         MAX((CASE WHEN [DepartmentIdTo] = 7 AND TaskType = 2 THEN [EndDate] ELSE NULL END)) AS otss2_end, MAX((CASE WHEN [DepartmentIdTo] = 7 AND 
                         TaskType = 2 THEN IsCanceled ELSE NULL END)) AS otss2IsCanceled, MAX((CASE WHEN [DepartmentIdTo] = 9 THEN [StartDate] ELSE NULL END)) AS otu_start, 
                         MAX((CASE WHEN [DepartmentIdTo] = 9 THEN [EndDate] ELSE NULL END)) AS otu_end, MAX((CASE WHEN [DepartmentIdTo] = 9 THEN IsCanceled ELSE NULL END)) 
                         AS otuIsCanceled, MAX((CASE WHEN [DepartmentIdTo] = 8 THEN [StartDate] ELSE NULL END)) AS otvu_start, 
                         MAX((CASE WHEN [DepartmentIdTo] = 8 THEN [EndDate] ELSE NULL END)) AS otvu_end, MAX((CASE WHEN [DepartmentIdTo] = 8 THEN IsCanceled ELSE NULL 
                         END)) AS otvuIsCanceled, MAX((CASE WHEN r.DepartmentIdFrom = 2 THEN 1 ELSE 0 END)) AS oshugpz_ReportExist, 
                         MAX((CASE WHEN r.DepartmentIdFrom = 3 THEN 1 ELSE 0 END)) AS gplr_ReportExist, MAX((CASE WHEN r.DepartmentIdFrom = 4 THEN 1 ELSE 0 END)) 
                         AS otsod_ReportExist, MAX((CASE WHEN r.DepartmentIdFrom = 5 THEN 1 ELSE 0 END)) AS osp_ReportExist, 
                         MAX((CASE WHEN r.DepartmentIdFrom = 6 THEN 1 ELSE 0 END)) AS otse_ReportExist, MAX((CASE WHEN r.DepartmentIdFrom = 7 THEN 1 ELSE 0 END)) 
                         AS otss_ReportExist, MAX((CASE WHEN r.DepartmentIdFrom = 8 THEN 1 ELSE 0 END)) AS otvu_ReportExist, 
                         MAX((CASE WHEN r.DepartmentIdFrom = 9 THEN 1 ELSE 0 END)) AS otu_ReportExist, MAX((CASE WHEN r.DepartmentIdFrom = 11 THEN 1 ELSE 0 END)) 
                         AS to_ReportExist, MAX((CASE WHEN r.DepartmentIdFrom = 12 THEN 1 ELSE 0 END)) AS dmv_ReportExist, 
                         MAX((CASE WHEN r.DepartmentIdFrom = 13 THEN 1 ELSE 0 END)) AS ushugpu_ReportExist
FROM            (SELECT        maxIds.NumML, maxIds.DepartmentIdTo, maxIds.maxId, maxIds.TaskType, t2.StartDate, t2.EndDate, (CASE WHEN t2.CancelDate IS NULL 
                                                    THEN '' ELSE ' отм.' END) AS IsCanceled
                          FROM            (SELECT        NumML, DepartmentIdTo, MAX(Id) AS maxId, ISNULL(TaskType, 1) AS TaskType
                                                    FROM            dbo.Wfl_Tasks AS t1
                                                    GROUP BY NumML, DepartmentIdTo, ISNULL(TaskType, 1)) AS maxIds INNER JOIN
                                                    dbo.Wfl_Tasks AS t2 ON maxIds.maxId = t2.Id) AS x LEFT OUTER JOIN
                             (SELECT DISTINCT NumML, DepartmentIdFrom
                               FROM            dbo.Wfl_Tasks AS ReportTasks
                               WHERE        (MainTaskForStep IS NULL) AND (EndDate IS NOT NULL) AND (TaskResult = 1)) AS r ON x.NumML = r.NumML
GROUP BY x.NumML

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[36] 2[20] 3) )"
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
         Configuration = "(V (2) )"
      End
      ActivePaneConfig = 14
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "x"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 268
               Bottom = 101
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
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
      PaneHidden = 
      Begin ColumnWidths = 12
         Column = 5655
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Wfl_TasksByDepartment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Wfl_TasksByDepartment';

