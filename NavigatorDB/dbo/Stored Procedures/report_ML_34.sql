


CREATE procedure [dbo].[report_ML_34]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

select 
	Osnova.NumML as "Номер МЛ",
	Osnova.Manager as "Менеджер",
	Osnova.Zakazchik as "Заказчик",
	CONVERT(nvarchar(25), Osnova.Utverzh_B, 104) as "Дата утверждения",
    /*dbo.get_time_from_min*/cast(Round((case when DATEDIFF(d, Osnova.Utverzh_B, getdate()) = 0 
				               then DATEDIFF(mi, Osnova.Utverzh_B, getdate()) 
							   else DATEDIFF(mi,Osnova.Utverzh_B, getdate()) - ((DATEDIFF(d, Osnova.Utverzh_B, getdate())+1 - dbo.GetWorkingDays(Osnova.Utverzh_B, getdate()))*1440) 
						   end)/1440.0,2)as NUMERIC(15,2)) as "Срок обработки",
    dbo.date(List2Nav.SignD1)as "Начало заморозки", 
    dbo.date(List2Nav.SignD2) as "Окончание заморозки",
    /*dbo.get_time_from_min*/cast(Round((case when DATEDIFF(d, List2Nav.SignD1, ISNULL(List2Nav.SignD2,getdate())) = 0 
							   then DATEDIFF(mi, List2Nav.SignD1, ISNULL(List2Nav.SignD2,getdate())) 
							   else DATEDIFF(mi,List2Nav.SignD1, ISNULL(List2Nav.SignD2,getdate())) - ((DATEDIFF(d, List2Nav.SignD1, ISNULL(List2Nav.SignD2,getdate()))+1 - dbo.GetWorkingDays(List2Nav.SignD1, ISNULL(List2Nav.SignD2,getdate())))*1440) 
						  end)/1440.0,2)as NUMERIC(15,2)) as "Срок заморозки",
	rtrim(ltrim(List2Nav.SignC3)) as "Причина заморозки" 
from
	Osnova LEFT JOIN List2Nav
	ON Osnova.NumML = List2Nav.NumML
where 
  Osnova.Utverzh_B > CONVERT(DATETIME, @start_date, 104)
  and Osnova.Utverzh_B < CONVERT(DATETIME, @end_date, 104)
  and ((List2Nav.Sdan_TS is null) and (List2Nav.Sdan is null))
  and (not((Osnova.Dop_A like '%отмена МЛ%') OR (Osnova.Dop_A like '%отмены МЛ%')) OR  (Osnova.Dop_A is null))
  and not((Osnova.Zakazchik like '%тестовый клиент%') OR (Osnova.Zakazchik = 'тест')) 				
  and Osnova.numML < 1000000
  and Osnova.NumML Not Like '%-%'
  and not ((List2Nav.Zakazhcik like 'ЗАО «АКАДО-Столица»')or(List2Nav.Zakazhcik like 'ЗАО «АКАДО - Столица»'))				 
  and (not((List2Nav.Probl like '%отменяется МЛ%') OR (List2Nav.Probl like '%отменяеться МЛ%') OR (List2Nav.Probl like '%отмена МЛ%') OR (List2Nav.Probl like '%отмены МЛ%') OR (List2Nav.Probl like '%отмену МЛ%'))OR (List2Nav.Probl is null))

order by Osnova.NumML desc










