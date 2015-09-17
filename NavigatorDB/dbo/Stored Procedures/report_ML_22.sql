




CREATE procedure [dbo].[report_ML_22]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

/* Количество МЛ, направленных в работу с начала отчетного периода по спецпроектам */

select 
	'МЛ по спецпроекту ' + Osnova.Zakazchik as 'Zakazchik',
	count(1) as 'count'
from
	Osnova LEFT JOIN List2Nav
	ON Osnova.NumML = List2Nav.NumML
where 
  --Osnova.Utverzh_B > CONVERT(DATETIME, @start_date, 104)
  --and Osnova.Utverzh_B < CONVERT(DATETIME, @end_date, 104)

  List2Nav.Utverzh >= CONVERT(DATETIME, @start_date, 104)
  and List2Nav.Utverzh < CONVERT(DATETIME, @end_date, 104)

  and (not((Osnova.Dop_A like '%отмена МЛ%') OR (Osnova.Dop_A like '%отмены МЛ%')) OR  (Osnova.Dop_A is null))
  and not((Osnova.Zakazchik like '%тестовый клиент%') OR (Osnova.Zakazchik = 'тест')) 				
  and Osnova.numML < 1000000
  and Osnova.NumML Not Like '%-%'
  and List2Nav.SpecProject is not null
  and not ((List2Nav.Zakazhcik like 'ЗАО «АКАДО-Столица»')or(List2Nav.Zakazhcik like 'ЗАО «АКАДО - Столица»'))				 
  and (not((List2Nav.Probl like '%отменяется МЛ%') OR (List2Nav.Probl like '%отменяеться МЛ%') OR (List2Nav.Probl like '%отмена МЛ%') OR (List2Nav.Probl like '%отмены МЛ%') OR (List2Nav.Probl like '%отмену МЛ%'))OR (List2Nav.Probl is null))

group by Osnova.Zakazchik




