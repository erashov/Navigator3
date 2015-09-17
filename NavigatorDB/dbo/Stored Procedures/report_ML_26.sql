


CREATE procedure [dbo].[report_ML_26]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

/* Количество МЛ, направленных в работу с начала отчетного периода с номерами заявок ЕТО*/
select 
	Osnova.NumML as 'Номер МЛ',
	case when Osnova.N_ETO_Sta <> 0 then Osnova.N_ETO_Sta else Null end as 'Номер заявки ЕТО',
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

order by Osnova.NumML desc









