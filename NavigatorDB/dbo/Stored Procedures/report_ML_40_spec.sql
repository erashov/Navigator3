
CREATE procedure [dbo].[report_ML_40_spec]
	@start_date nvarchar(25),
	@end_date  nvarchar(25),
    @zakazchik nvarchar(512)
as

/* МЛ, направленные в работу с начала отчетного периода по спецпроекту */
/* ежемесячный платёж из ComFlow */

select
 t1."Номер МЛ",
 t1."Дата утверждения",
 t1."Заказчик",
 t1."Услуга",
 t1."Тип услуги",
 t1."Вид услуги",
 t1."Менеджер",
 case when (t2.currencyMonthly = 2)
      then 0
      else t2.CostMonthlyReal
 end as 'Платёж'
 
from
(select 
	Osnova.NumML as 'Номер МЛ',
	CONVERT(nvarchar(25), Osnova.Utverzh_B, 104) as 'Дата утверждения',
	List2Nav.Zakazhcik as 'Заказчик',
	Osnova.Usluga as 'Услуга',
    List2Nav.Usluga as 'Тип услуги',
	Osnova.Pre_Usluga as 'Вид услуги',
	Osnova.Manager as 'Менеджер'
  from
	Osnova LEFT JOIN List2Nav
	ON Osnova.NumML = List2Nav.NumML
  where 
   Osnova.Utverzh_B > CONVERT(DATETIME, @start_date, 104)
   and Osnova.Utverzh_B < CONVERT(DATETIME, @end_date, 104)
   and (not((Osnova.Dop_A like '%отмена МЛ%') OR (Osnova.Dop_A like '%отмены МЛ%')) OR  (Osnova.Dop_A is null))
   and not((Osnova.Zakazchik like '%тестовый клиент%') OR (Osnova.Zakazchik = 'тест')) 				
   and Osnova.numML < 1000000
   and Osnova.NumML Not Like '%-%'
   and List2Nav.Zakazhcik Not Like 'ЗАО «АКАДО-Столица»'
   and (not((List2Nav.Probl like '%отменяется МЛ%') OR (List2Nav.Probl like '%отменяеться МЛ%') OR (List2Nav.Probl like '%отмена МЛ%') OR (List2Nav.Probl like '%отмены МЛ%') OR (List2Nav.Probl like '%отмену МЛ%'))OR (List2Nav.Probl is null))
   and List2Nav.SpecProject is not null
   and List2Nav.Zakazhcik = @zakazchik
 )t1 left join #tmpServices t2 --swan.comflow.dbo.vNumML_TheServiceAttr t2
 on t1."Номер МЛ" = t2.NumML
 order by  t1."Номер МЛ" desc












