﻿

CREATE procedure [dbo].[report_ML_57_sum]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

/*		Сумма платежа по
		МЛ находящимся в работе  без спецпроектов
        и утверждённым до указанной даты       
*/


select
count(1),
cast(Round(sum(t3."Платёж"),2)as NUMERIC(15,2)) as summa
from
( 
select
 t1."Номер МЛ",
 cast(Round(
 case when (t2.currencyMonthly = 2)
      then 0
      else t2.CostMonthlyReal
 end,2)as NUMERIC(15,2)) as 'Платёж'
 
from
(
          select
			  List2Nav.NumML as "Номер МЛ"
            from
	          List2Nav left join Osnova
			  on List2Nav.NumML = Osnova.NumML
            where 
              List2Nav.Sdan is null 
			  and List2Nav.ProblML is null
              and List2Nav.Utverzh <= CONVERT(DATETIME, @end_date, 104)
			  and Osnova.Utverzh_B is not null							 
			  and List2Nav.numML < 1000000
			  and List2Nav.NumML Not Like '%-%'
			  and not ((List2Nav.Zakazhcik like 'ЗАО «АКАДО-Столица»')or(List2Nav.Zakazhcik like 'ЗАО «АКАДО - Столица»'))				 
			  and List2Nav.SpecProject is null
			  and (not((List2Nav.Probl like '%отменяется МЛ%') OR (List2Nav.Probl like '%отменяеться МЛ%') OR (List2Nav.Probl like '%отмена МЛ%') OR (List2Nav.Probl like '%отмены МЛ%') OR (List2Nav.Probl like '%отмену МЛ%'))OR (List2Nav.Probl is null))
			  and (not((Osnova.Dop_A like '%отмена МЛ%') OR (Osnova.Dop_A like '%отмены МЛ%')) OR  (Osnova.Dop_A is null))
			
)t1 left join #tmpServices t2
 on t1."Номер МЛ" = t2.NumML
)t3









