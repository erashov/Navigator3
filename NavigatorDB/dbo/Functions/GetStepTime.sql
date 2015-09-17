create function dbo.GetStepTime (@st int)

returns @out table (
	     nml int,
	     time1 DATETIME,
         time2 DATETIME
) 
AS 
BEGIN
INSERT @out(nml,time1,time2)
SELECT     NumML, StartTime, EndTime
 FROM      dbo.ML_History 
 WHERE     (Step = @st)
 UNION
 SELECT     NumML, NULL, NULL
 FROM       dbo.ML_History AS t2
 WHERE      (Step = 1) AND (NOT EXISTS
                           (SELECT   NumML
                            FROM     dbo.ML_History AS t3
                            WHERE    (Step = @st) AND (t2.NumML = NumML)))
 Return
END

