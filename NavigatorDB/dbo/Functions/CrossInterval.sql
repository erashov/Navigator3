
CREATE FUNCTION [dbo].[CrossInterval] (@x1 datetime, @x2 datetime, @y1 datetime, @y2 datetime)  
RETURNS INT  AS  
-- временные отрезки @x1 - @x2 и @y1 - @y2 пересекаются? найдём интервал пересечения в минутах с учётом рабочих дней
BEGIN 

DECLARE @StartTime datetime
DECLARE @EndTime datetime
 
/*
if (@x1 is null and @y1<=@x2) return 0
if (@y1 is null and @x1<=@y2) return 0
if (@x2 is null and @y2>=@x1) return 0
if (@y2 is null and @x2>=@y1) return 0
*/

if (@x1>=@y1 and @x1<=@y2) SET @StartTime = @x1
if (@x2>=@y1 and @x2<=@y2) SET @EndTime = @x2
if (@y1>=@x1 and @y1<=@x2) SET @StartTime = @y1
if (@y2>=@x1 and @y2<=@x2) SET @EndTime = @y2

return case when ((@StartTime is not null) and (@EndTime is not null)) 
                                          then case when DATEDIFF(d, @StartTime, @EndTime) = 0 
	   		                                        then DATEDIFF(mi, @StartTime, @EndTime) 
			                                        else DATEDIFF(mi,@StartTime, @EndTime) - ((DATEDIFF(d,@StartTime, @EndTime)+1 - dbo.GetWorkingDays(@StartTime, @EndTime))*1440) 
			                                   end
	                                      else 0 
	                                  end 
END

/*
if (@x1 is null and @y1<=@x2) return 1
if (@y1 is null and @x1<=@y2) return 1
if (@x2 is null and @y2>=@x1) return 1
if (@y2 is null and @x2>=@y1) return 1
if (@x1>=@y1 and @x1<=@y2) return 1
if (@x2>=@y1 and @x2<=@y2) return 1
if (@y1>=@x1 and @y1<=@x2) return 1
if (@y2>=@x1 and @y2<=@x2) return 1
*/