﻿
create procedure [dbo].[report_ML_69_sum]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

/* Количество МЛ, направленных в работу с начала отчетного периода в Комкор-Регион без спецпроекта */
/* ежемесячный платёж из ComFlow */
/* сумма платежей */
select
count(1),
cast(Round(sum(t3."Платёж"),2)as NUMERIC(15,2)) as summa
from
(
select
 t1."Номер МЛ",
 case when (t2.currencyMonthly = 2)
      then 0
      else t2.CostMonthlyReal
 end as 'Платёж' 
from
(select 
	Osnova.NumML as 'Номер МЛ'
  from
	Osnova LEFT JOIN List2Nav
	ON Osnova.NumML = List2Nav.NumML
  where 
--   Osnova.Utverzh_B > CONVERT(DATETIME, @start_date, 104)
--   and Osnova.Utverzh_B < CONVERT(DATETIME, @end_date, 104)

  List2Nav.Utverzh >= CONVERT(DATETIME, @start_date, 104)
  and List2Nav.Utverzh < CONVERT(DATETIME, @end_date, 104)

   and (not((Osnova.Dop_A like '%отмена МЛ%') OR (Osnova.Dop_A like '%отмены МЛ%')) OR  (Osnova.Dop_A is null))
   and not((Osnova.Zakazchik like '%тестовый клиент%') OR (Osnova.Zakazchik = 'тест')) 				
   and Osnova.numML < 1000000
   and Osnova.NumML Not Like '%-%'
   and not ((List2Nav.Zakazhcik like 'ЗАО «АКАДО-Столица»')or(List2Nav.Zakazhcik like 'ЗАО «АКАДО - Столица»'))				 
   and (not((List2Nav.Probl like '%отменяется МЛ%') OR (List2Nav.Probl like '%отменяеться МЛ%') OR (List2Nav.Probl like '%отмена МЛ%') OR (List2Nav.Probl like '%отмены МЛ%') OR (List2Nav.Probl like '%отмену МЛ%'))OR (List2Nav.Probl is null))
   and List2Nav.SpecProject is null
   and List2Nav.NR_Region =1  
 )t1 left join #tmpServices t2 --swan.comflow.dbo.vNumML_TheServiceAttr t2
 on t1."Номер МЛ" = t2.NumML
)t3













