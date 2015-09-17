


CREATE view [dbo].[Wfl_CompatibilityML] as
SELECT DISTINCT t1.NumML, 
       ( SELECT DeptName + ', '
           FROM (SELECT        dbo.CompatibilityML.DeptID, dbo.Wfl_Depts.DeptName, dbo.CompatibilityML.GroupID, dbo.CompatibilityML.NumML, dbo.CompatibilityML.CreateDate, 
                         dbo.CompatibilityML.UserCreate
FROM            dbo.CompatibilityML INNER JOIN
                         dbo.Wfl_Depts ON dbo.CompatibilityML.DeptID = dbo.Wfl_Depts.Id) t2
          WHERE t2.NumMl = t1.NumML
          ORDER BY DeptName
            FOR XML PATH('') ) AS Name
      FROM (SELECT        dbo.CompatibilityML.DeptID, dbo.Wfl_Depts.DeptName, dbo.CompatibilityML.GroupID, dbo.CompatibilityML.NumML, dbo.CompatibilityML.CreateDate, 
                         dbo.CompatibilityML.UserCreate
FROM            dbo.CompatibilityML INNER JOIN
                         dbo.Wfl_Depts ON dbo.CompatibilityML.DeptID = dbo.Wfl_Depts.Id) t1
      GROUP BY DeptName,t1.NumML ;


