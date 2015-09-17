

CREATE procedure [dbo].[report_ML_6_sum]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as
/* Количество всех МЛ за отчетный период, возвращенных менеджерам на доработку.*/
/* сумма платежей */

select
count(1),
cast(Round(sum(t6."Платёж"),2)as NUMERIC(15,2)) as summa
from
( 
select
 t4."Номер МЛ",
 case when (t5.currencyMonthly = 2)
      then 0
      else t5.CostMonthlyReal
 end as 'Платёж' 
 from
 (
  select 
	t3.numberML as 'Номер МЛ'
  from
  (
	select
	  t2.numberML
	from
	(
	  select distinct
		t1.numberML,
		t1.stDate,
		TableReturnHistory.returnText
	  from
      (
		select 
		  numberML,
          max(returnDate) as stDate
		from
		  TableReturnHistory
	    where 
          returnDate > CONVERT(DATETIME, @start_date, 104)
          and returnDate < CONVERT(DATETIME, @end_date, 104)
        group by numberML
      )t1 LEFT JOIN TableReturnHistory
          ON ((t1.numberML = TableReturnHistory.numberML) and (TableReturnHistory.returnDate = t1.stDate))
  )t2 LEFT JOIN Osnova
      ON t2.numberML = Osnova.NumML
  where 
    Osnova.Zakazchik Not Like 'ЗАО «АКАДО-Столица»'
    and Osnova.Zakazchik Not Like 'ЗАО «АКАДО - Столица»'
    and (not((Osnova.Dop_A like '%отмена МЛ%') OR (Osnova.Dop_A like '%отмены МЛ%')) OR  (Osnova.Dop_A is null))
	and not((Osnova.Zakazchik like '%тестовый клиент%') OR (Osnova.Zakazchik = 'тест')) 				

  )t3 LEFT JOIN List2Nav
   ON t3.numberML = List2Nav.NumML
  where (not((List2Nav.Probl like '%отменяется МЛ%') OR (List2Nav.Probl like '%отменяеться МЛ%') OR (List2Nav.Probl like '%отмена МЛ%') OR (List2Nav.Probl like '%отмены МЛ%') OR (List2Nav.Probl like '%отмену МЛ%'))OR (List2Nav.Probl is null))
 )t4 left join #tmpServices t5  --swan.comflow.dbo.vNumML_TheServiceAttr t2
 on t4."Номер МЛ" = t5.NumML
)t6












