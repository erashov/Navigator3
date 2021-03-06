﻿


create procedure [dbo].[report_ML_over_6]

	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

/*		
		МЛ находящиеся в работе болле 6 рабочих дней без спецпроектов
        и утверждённые в указанный период                
*/

select

 t1."Дата утверждения руковод. Менеджера",
 t1."Дата утверждения в тех службах",
 t1."Дата сдачи услуги",
 t1."Номер МЛ",
 t1."Заказчик",
 t1."Менеджер",
 t1."Код услуги",
 t1."Статус услуги",
 t1."Название услуги",
 t1."Дата начала заморозки",
 t1."Дата окончания заморозки",
 t1."Причина заморозки",
 t1."поле фиксации передачи МЛ в тех службе",
 t1."срок реализации МЛ (в раб днях)",
 t1."срок заморозки (в раб днях)" 

from
(
          select
			  dbo.date(Osnova.Utverzh_B) as "Дата утверждения руковод. Менеджера",
			  dbo.date(List2Nav.Utverzh) as "Дата утверждения в тех службах",
			  dbo.date(List2Nav.Sdan_TS) as "Дата сдачи услуги",
			  List2Nav.NumML as "Номер МЛ",
			  List2Nav.Zakazhcik as "Заказчик",
			  List2Nav.Usluga as "Код услуги",
			  Osnova.Pre_Usluga as "Статус услуги",
			  Osnova.Usluga as "Название услуги",
              Osnova.Manager as "Менеджер",			  
			  dbo.date(List2Nav.SignD1) as "Дата начала заморозки",
			  dbo.date(List2Nav.SignD2) as "Дата окончания заморозки",
			  --List2Nav.Probl as "Проблема",
			  List2Nav.MestoNah as "поле фиксации передачи МЛ в тех службе",
			  
			  /*dbo.get_time_from_min*/cast(Round((
			  case when DATEDIFF(d, Osnova.Utverzh_B, getdate()) = 0
				   then DATEDIFF(mi,Osnova.Utverzh_B, getdate())
				   else DATEDIFF(mi, Osnova.Utverzh_B, getdate()) - ((DATEDIFF(d, Osnova.Utverzh_B, getdate())+1 - dbo.GetWorkingDays(Osnova.Utverzh_B, getdate()))*1440) 
			  end -
			  case when (List2Nav.SignD1 is not null) 
				   then case when DATEDIFF(d, List2Nav.SignD1, case when ((List2Nav.SignD2 is null) or (List2Nav.SignD2 > getdate())) then getdate() else List2Nav.SignD2 end) = 0 
							 then DATEDIFF(mi, List2Nav.SignD1, case when ((List2Nav.SignD2 is null) or (List2Nav.SignD2 > getdate())) then getdate() else List2Nav.SignD2 end) 
							 else DATEDIFF(mi, List2Nav.SignD1, case when ((List2Nav.SignD2 is null) or (List2Nav.SignD2 > getdate())) then getdate() else List2Nav.SignD2 end) 
							  - ((DATEDIFF(d, List2Nav.SignD1, case when ((List2Nav.SignD2 is null) or (List2Nav.SignD2 > getdate())) then getdate() else List2Nav.SignD2 end)+1 
							  - dbo.GetWorkingDays(List2Nav.SignD1, case when ((List2Nav.SignD2 is null) or (List2Nav.SignD2 > getdate())) then getdate() else List2Nav.SignD2 end))*1440) 
					    end
				   else 0 end)/1440.0,2)as NUMERIC(15,2)) as "срок реализации МЛ (в раб днях)",
			  /*dbo.get_time_from_min*/cast(Round((
			  case when (List2Nav.SignD1 is not null) 
				   then case when DATEDIFF(d, List2Nav.SignD1, case when ((List2Nav.SignD2 is null) or (List2Nav.SignD2 > getdate())) then getdate() else List2Nav.SignD2 end) = 0 
							 then DATEDIFF(mi, List2Nav.SignD1, case when ((List2Nav.SignD2 is null) or (List2Nav.SignD2 > getdate())) then getdate() else List2Nav.SignD2 end) 
							 else DATEDIFF(mi, List2Nav.SignD1, case when ((List2Nav.SignD2 is null) or (List2Nav.SignD2 > getdate())) then getdate() else List2Nav.SignD2 end) 
							  - ((DATEDIFF(d, List2Nav.SignD1, case when ((List2Nav.SignD2 is null) or (List2Nav.SignD2 > getdate())) then getdate() else List2Nav.SignD2 end)+1 
							  - dbo.GetWorkingDays(List2Nav.SignD1, case when ((List2Nav.SignD2 is null) or (List2Nav.SignD2 > getdate())) then getdate() else List2Nav.SignD2 end))*1440) 
					    end
				   else 0 
			  end)/1440.0,2)as NUMERIC(15,2)) as "срок заморозки (в раб днях)",
              rtrim(ltrim(List2Nav.SignC3)) as "Причина заморозки"
            from
	          List2Nav left join Osnova
			  on List2Nav.NumML = Osnova.NumML
            where List2Nav.Sdan is null 
			  and List2Nav.ProblML is null
			  and Osnova.Utverzh_B is not null				
			  and Osnova.Utverzh_B > CONVERT(DATETIME, @start_date, 104)
			  and Osnova.Utverzh_B < CONVERT(DATETIME, @end_date, 104)
			  and List2Nav.numML < 1000000
			  and List2Nav.NumML Not Like '%-%'
			  and not ((List2Nav.Zakazhcik like 'ЗАО «АКАДО-Столица»')or(List2Nav.Zakazhcik like 'ЗАО «АКАДО - Столица»'))				 
			  and List2Nav.SpecProject is null
			  and (not((List2Nav.Probl like '%отменяется МЛ%') OR (List2Nav.Probl like '%отменяеться МЛ%') OR (List2Nav.Probl like '%отмена МЛ%') OR (List2Nav.Probl like '%отмены МЛ%') OR (List2Nav.Probl like '%отмену МЛ%'))OR (List2Nav.Probl is null))
			  and (not((Osnova.Dop_A like '%отмена МЛ%') OR (Osnova.Dop_A like '%отмены МЛ%')) OR  (Osnova.Dop_A is null))

			  and  case when DATEDIFF(d, Osnova.Utverzh_B, getdate()) = 0
				   then DATEDIFF(mi,Osnova.Utverzh_B, getdate())
				   else DATEDIFF(mi, Osnova.Utverzh_B, getdate()) - ((DATEDIFF(d, Osnova.Utverzh_B, getdate())+1 - dbo.GetWorkingDays(Osnova.Utverzh_B, getdate()))*1440) 
				   end -
			       case when (List2Nav.SignD1 is not null) 
				   then case when DATEDIFF(d, List2Nav.SignD1, case when ((List2Nav.SignD2 is null) or (List2Nav.SignD2 > getdate())) then getdate() else List2Nav.SignD2 end) = 0 
							 then DATEDIFF(mi, List2Nav.SignD1, case when ((List2Nav.SignD2 is null) or (List2Nav.SignD2 > getdate())) then getdate() else List2Nav.SignD2 end) 
							 else DATEDIFF(mi, List2Nav.SignD1, case when ((List2Nav.SignD2 is null) or (List2Nav.SignD2 > getdate())) then getdate() else List2Nav.SignD2 end) 
							  - ((DATEDIFF(d, List2Nav.SignD1, case when ((List2Nav.SignD2 is null) or (List2Nav.SignD2 > getdate())) then getdate() else List2Nav.SignD2 end)+1 
							  - dbo.GetWorkingDays(List2Nav.SignD1, case when ((List2Nav.SignD2 is null) or (List2Nav.SignD2 > getdate())) then getdate() else List2Nav.SignD2 end))*1440) 
					    end
				   else 0 
				   end > 8640

)t1 
order by t1."Номер МЛ" desc 









