create FUNCTION [dbo].[CrossIntervalDate] (@x1 datetime, @x2 datetime, @y1 datetime, @y2 datetime)  
RETURNS INT  AS  
-- временные отрезки @x1 - @x2 и @y1 - @y2 пересекаются? найдём интервал пересечения в минутах
BEGIN 

DECLARE @StartTime datetime
DECLARE @EndTime datetime
 
if (@x1>=@y1 and @x1<=@y2) SET @StartTime = @x1
if (@x2>=@y1 and @x2<=@y2) SET @EndTime = @x2
if (@y1>=@x1 and @y1<=@x2) SET @StartTime = @y1
if (@y2>=@x1 and @y2<=@x2) SET @EndTime = @y2

return case when ((@StartTime is not null) and (@EndTime is not null))                                          
                                          then DATEDIFF(mi, @StartTime, @EndTime) 
	                                      else 0 
	                                  end 
END

