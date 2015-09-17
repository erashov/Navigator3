


CREATE procedure [dbo].[report_ML_16_sum]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as


/*  количество МЛ за отчетный период,находящихся в "заморозке".  */
/*  сумма платежей */

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
            where ((Sdan_TS is not null) or (Sdan is not null))
              and ISNULL(List2Nav.Sdan_TS,/*DATEADD(hh,18,List2Nav.Sdan)*/List2Nav.Sdan) > CONVERT(DATETIME, @start_date, 104)
			  and ISNULL(List2Nav.Sdan_TS,/*DATEADD(hh,18,List2Nav.Sdan)*/List2Nav.Sdan) < CONVERT(DATETIME, @end_date, 104)
			  and List2Nav.SignD1 is not null
			  and List2Nav.SignD2 is not null
			  and DATEDIFF(mi,List2Nav.SignD1, List2Nav.SignD2) > 0
			  and List2Nav.numML < 1000000
			  and List2Nav.NumML Not Like '%-%'
			  and not ((List2Nav.Zakazhcik like 'ЗАО «АКАДО-Столица»')or(List2Nav.Zakazhcik like 'ЗАО «АКАДО - Столица»'))				 
			  and (not((List2Nav.Probl like '%отменяется МЛ%') OR (List2Nav.Probl like '%отменяеться МЛ%') OR (List2Nav.Probl like '%отмена МЛ%') OR (List2Nav.Probl like '%отмены МЛ%') OR (List2Nav.Probl like '%отмену МЛ%'))OR (List2Nav.Probl is null))
			  and (not((Osnova.Dop_A like '%отмена МЛ%') OR (Osnova.Dop_A like '%отмены МЛ%')) OR  (Osnova.Dop_A is null))
			  and not((Osnova.Zakazchik like '%тестовый клиент%') OR (Osnova.Zakazchik = 'тест')) 
)t1 left join #tmpServices t2 --swan.comflow.dbo.vNumML_TheServiceAttr t2
 on t1."Номер МЛ" = t2.NumML
)t3











