
create function [dbo].[get_time_from_min] (@count int) -- восстанавливает кол-во ддней, часов, минут из количества минут
RETURNS NVARCHAR(35)
AS 
BEGIN 
RETURN
(
    cast(@count/1440 as varchar)+' дн  '+ 
    cast((@count-(@count/1440)*1440)/60 as varchar)+' ч '+
    cast(((@count-(@count/1440)*1440) - ((@count-(@count/1440)*1440)/60)*60) as varchar) + ' мин' 
)  
END



