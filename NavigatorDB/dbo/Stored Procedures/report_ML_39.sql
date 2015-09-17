

create procedure [dbo].[report_ML_39]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

/* Количество МЛ, направленных в работу с начала отчетного периода и ежемесячный платёж */


select 
	t1.NumML as 'Номер МЛ',
	CONVERT(nvarchar(25), t1.Utverzh_B, 104) as 'Дата утверждения',
    case when (t3.CurrencyMonthly =1)
         then  t3.CostMonthlyReal 
         else 0 end as 'Платёж',
    t3.CurrencyMonthly,
	t2.Zakazhcik as 'Заказчик',
	t1.Usluga as 'Услуга',
    t2.Usluga as 'Тип услуги',
	t1.Pre_Usluga as 'Вид услуги',
	t1.Manager as 'Менеджер'
from
	Osnova t1 LEFT JOIN List2Nav t2
	ON t1.NumML = t2.NumML left join swan.comflow.dbo.vNumML_TheServiceAttr t3
    ON t2.NumML = t3.NumML
where 
  t1.Utverzh_B > CONVERT(DATETIME, '01.08.2009', 104)  
  and t1.Utverzh_B < CONVERT(DATETIME, '10.08.2009', 104)
  and (not((t1.Dop_A like '%отмена МЛ%') OR (t1.Dop_A like '%отмены МЛ%')) OR (t1.Dop_A is null))
  and not((t1.Zakazchik like '%тестовый клиент%') OR (t1.Zakazchik = 'тест')) 				
  and t1.numML < 1000000
  and t1.NumML Not Like '%-%'
  and t2.Zakazhcik Not Like 'ЗАО «АКАДО-Столица»'
  and (not((t2.Probl like '%отменяется МЛ%') OR (t2.Probl like '%отменяеться МЛ%') OR (t2.Probl like '%отмена МЛ%') OR (t2.Probl like '%отмены МЛ%') OR (t2.Probl like '%отмену МЛ%'))OR (t2.Probl is null))
order by t1.Numml desc








