CREATE procedure [dbo].[report_ML_59_sum]
	@start_date  nvarchar(25),
	@end_date  nvarchar(25)
as

/*		Сумма платежа по
		МЛ находящимся в работе болле 6 рабочих дней без спецпроектов
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
            where List2Nav.Sdan is null 
			  and List2Nav.ProblML is null
			  and Osnova.Utverzh_B is not null				
			  and Osnova.Utverzh_B <= CONVERT(DATETIME, @end_date, 104)
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

)t1 left join #tmpServices t2
 on t1."Номер МЛ" = t2.NumML
)t3

