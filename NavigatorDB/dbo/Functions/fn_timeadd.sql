create function dbo.fn_timeadd -- функция выполняет приращение даты @d на интервал между датами @t1 и @t2
(
  @t1 datetime,
  @t2 datetime,
  @d  datetime
) 
RETURNS DATETIME
AS 
BEGIN 
RETURN
(
  DATEADD(mi,cast(dbo.fn_datediff(@t1, @t2, 'mi') as int),
                   DATEADD(hh,cast(dbo.fn_datediff(@t1, @t2, 'h') as int),
                           DATEADD(d,cast(dbo.fn_datediff(@t1, @t2, 'd') as int), 
							       DATEADD(m,cast(dbo.fn_datediff(@t1, @t2, 'm') as int),@d)
                                   ) 
                           )                    
                   )
)  
END
