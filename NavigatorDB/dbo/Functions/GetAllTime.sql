CREATE function [dbo].[GetAllTime] -- функция вычисляет время нахождения МЛ на всех этапах
(
   @d   datetime, -- дата начала отсчёта
   @t21 datetime, -- дата начала этапа
   @t22 datetime, -- дата завершения этапа
   @t41 datetime,
   @t42 datetime,
   @t51 datetime,
   @t52 datetime,
   @t61 datetime,
   @t62 datetime,
   @t71 datetime,
   @t72 datetime,
   @t81 datetime,
   @t82 datetime,
   @t91 datetime,
   @t92 datetime,
   @t101 datetime,
   @t102 datetime,
   @t111 datetime,
   @t112 datetime

)
RETURNS NVARCHAR(35)
AS 
BEGIN 
  DECLARE @summ datetime
  set @summ=@d
  
  if cast(@t22 as nvarchar(20)) != '' set @summ = dbo.fn_timeadd(@t21, @t22, @summ) 
  if cast(@t42 as nvarchar(20)) != '' set @summ = dbo.fn_timeadd(@t41, @t42, @summ)
  if cast(@t52 as nvarchar(20)) != '' set @summ = dbo.fn_timeadd(@t51, @t52, @summ) 
  if cast(@t62 as nvarchar(20)) != '' set @summ = dbo.fn_timeadd(@t61, @t62, @summ)
  if cast(@t72 as nvarchar(20)) != '' set @summ = dbo.fn_timeadd(@t71, @t72, @summ)
  if cast(@t92 as nvarchar(20)) != '' set @summ = dbo.fn_timeadd(@t91, @t92, @summ)
  if cast(@t102 as nvarchar(20)) != '' set @summ = dbo.fn_timeadd(@t101, @t102, @summ)
  if cast(@t112 as nvarchar(20)) != '' set @summ = dbo.fn_timeadd(@t111, @t112, @summ)

RETURN
(
  dbo.fn_datediff(@d, @summ, 'all')
)  
END


