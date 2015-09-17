CREATE PROCEDURE [dbo].[report_ML_3_sum]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

/* Количество МЛ реализованных Техническими службами с начала отчетного периода */
/* платежи из ComFlow */

select
count(1),
cast(Round(sum(isnull(t7."Платёж",0)),2)as NUMERIC(15,2)) as summa
from
(
select
 t5."Номер МЛ",
 cast(Round(
 case when (t6.currencyMonthly = 2)
      then 0
      else t6.CostMonthlyReal
 end,2)as NUMERIC(15,2)) as 'Платёж'

from(
	select
	  t4.NumML as 'Номер МЛ'
	from
	(
		select
		  t1.NumML
		from
		(
			  select 
				List2Nav.NumML
			  from
	            List2Nav
              where ((Sdan_TS is not null) or (Sdan is not null))
--              and ISNULL(List2Nav.Sdan_TS,DATEADD(hh,18,List2Nav.Sdan)) > CONVERT(DATETIME, @start_date, 104)
--			    and ISNULL(List2Nav.Sdan_TS,DATEADD(hh,18,List2Nav.Sdan)) < CONVERT(DATETIME, @end_date, 104)
                and ISNULL(List2Nav.Sdan_TS,List2Nav.Sdan) >= CONVERT(DATETIME, @start_date, 104)
  			    and ISNULL(List2Nav.Sdan_TS,List2Nav.Sdan) < CONVERT(DATETIME, @end_date, 104)
			    and List2Nav.numML < 1000000
			    and List2Nav.NumML Not Like '%-%'
			    and not ((List2Nav.Zakazhcik like 'ЗАО «АКАДО-Столица»')or(List2Nav.Zakazhcik like 'ЗАО «АКАДО - Столица»'))				 
			    and (not((List2Nav.Probl like '%отменяется МЛ%') OR (List2Nav.Probl like '%отменяеться МЛ%') OR (List2Nav.Probl like '%отмена МЛ%') OR (List2Nav.Probl like '%отмены МЛ%') OR (List2Nav.Probl like '%отмену МЛ%'))OR (List2Nav.Probl is null))
	    )t1 left join 
		(
			 select Osnova.NumML,Osnova.Dop_A 
			 from Osnova 
			 where ((Osnova.Dop_A like '%отмена МЛ%') OR (Osnova.Dop_A like '%отмены МЛ%'))	
				   OR((Osnova.Zakazchik like '%тестовый клиент%') OR (Osnova.Zakazchik = 'тест')) 							
		)t2
		 on t1.NumML = t2.NumML
	     where t2.NumML is null
	)t3 left join (
            select numml from Osnova
            where Osnova.Utverzh_B is null
    ) t4
	 on t3.NumML = t4.NumML
     where t4.numml is null
)t5 left join #tmpServices t6 --swan.comflow.dbo.vNumML_TheServiceAttr t6
 on t5."Номер МЛ" = t6.NumML
)t7