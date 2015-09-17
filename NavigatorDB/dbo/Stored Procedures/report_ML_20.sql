
CREATE procedure [dbo].[report_ML_20]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

/* Средний срок (в рабочих днях) организации по всем реализованным МЛ, за вычетом времени, 
   когда МЛ, возвращенные менеджерам на доработку, находились в приостановке, 
   за исключением МЛ направленных  для организации услуг в интересах "Акадо-столица" и
   без спецпоректов.
*/

 select 
	dbo.get_time_from_min(sum(case when t5.workTime > 0 then t5.workTime else 0 end)/count(case when t5.workTime > 0 then t5.workTime else null end)) as 'Средний срок',
    count(t5.NumMl) as 'Кол-во МЛ'

  from   
  (
    select
        t4.NumML,
		case when ((t4.startTime > t4.endTimeTS) or (t4.startTime is NULL)) 
		     then (case when ((DATEDIFF(d,t4.Utverzh, t4.endTimeTS) = 0) OR (DATEDIFF(mi,t4.Utverzh, t4.endTimeTS) - ((DATEDIFF(d,t4.Utverzh ,t4.endTimeTS)+1 - dbo.GetWorkingDays(t4.Utverzh,t4.endTimeTS))*1440) < 0))
						then DATEDIFF(mi,t4.Utverzh, t4.endTimeTS) - t4.frozen 
		                else DATEDIFF(mi,t4.Utverzh, t4.endTimeTS) - ((DATEDIFF(d,t4.Utverzh ,t4.endTimeTS)+1 - dbo.GetWorkingDays(t4.Utverzh,t4.endTimeTS))*1440) - t4.frozen 
                   end )                     
		     else (case when ((DATEDIFF(d,t4.startTime, t4.endTimeTS) = 0) OR (DATEDIFF(mi,t4.startTime, t4.endTimeTS) - ((DATEDIFF(d,t4.startTime ,t4.endTimeTS)+1 - dbo.GetWorkingDays(t4.startTime,t4.endTimeTS))*1440) -
							          (DATEDIFF(mi,t4.startTime, t4.Utverzh)-((DATEDIFF(d,t4.startTime ,t4.Utverzh)+1 - dbo.GetWorkingDays(t4.startTime,t4.Utverzh))*1440)-t4.pause) < 0))
						then DATEDIFF(mi,t4.startTime, t4.endTimeTS) - (DATEDIFF(mi,t4.startTime, t4.Utverzh) - t4.pause) - t4.frozen
						else DATEDIFF(mi,t4.startTime, t4.endTimeTS) - ((DATEDIFF(d,t4.startTime ,t4.endTimeTS)+1 - dbo.GetWorkingDays(t4.startTime,t4.endTimeTS))*1440) - t4.frozen -
						              case when (DATEDIFF(mi,t4.startTime, t4.Utverzh)-((DATEDIFF(d,t4.startTime ,t4.Utverzh)+1 - dbo.GetWorkingDays(t4.startTime,t4.Utverzh))*1440)-t4.pause) > 0
								           then (DATEDIFF(mi,t4.startTime, t4.Utverzh)-((DATEDIFF(d,t4.startTime ,t4.Utverzh)+1 - dbo.GetWorkingDays(t4.startTime,t4.Utverzh))*1440)-t4.pause)
								           else 0 
									  end
				   end )
			 end as workTime
		
      from
        (
		  select
		    t3.NumML,
			sum(case when dateConfirmML < returnDate 
					 then (case when DATEDIFF(d,dateConfirmML, returnDate) = 0 
								then DATEDIFF(mi,dateConfirmML, returnDate) 
								else DATEDIFF(mi,dateConfirmML, returnDate) - ((DATEDIFF(d,dateConfirmML, returnDate)+1 - dbo.GetWorkingDays(dateConfirmML,returnDate))*1440) 
						   end) 
                     else 0 
				end) as pause,
			min(t3.frozen) as frozen,
			min(dateConfirmML) as startTime,
			min(t3.endTimeTS) as endTimeTS,
		    min(t3.Utverzh) as Utverzh
  		  from
		  (
		    select 
			  t1.NumML,
			  t1.endTimeTS,
			  t1.frozen,
			  t1.Utverzh
			from
			(
			  select 
				List2Nav.NumML,				
				ISNULL(List2Nav.Sdan_TS,/*DATEADD(hh,18,List2Nav.Sdan)*/List2Nav.Sdan) as endTimeTS,
				List2Nav.Utverzh,
				case when ((SignD1 is not null) and (SignD2 is not null)) 
					 then case when DATEDIFF(d, SignD1, SignD2) = 0 
							   then DATEDIFF(mi, SignD1, SignD2) 
							   else DATEDIFF(mi,SignD1, SignD2) - ((DATEDIFF(d,SignD1, SignD2)+1 - dbo.GetWorkingDays(SignD1, SignD2))*1440) 
							   end
					 else 0 
					 end as frozen
			  from
	            List2Nav
              where ((Sdan_TS is not null) or (Sdan is not null))
                and ISNULL(List2Nav.Sdan_TS,/*DATEADD(hh,18,List2Nav.Sdan)*/List2Nav.Sdan) >= CONVERT(DATETIME, @start_date, 104)
			    and ISNULL(List2Nav.Sdan_TS,/*DATEADD(hh,18,List2Nav.Sdan)*/List2Nav.Sdan) < CONVERT(DATETIME, @end_date, 104)
			    and List2Nav.numML < 1000000
			    and List2Nav.NumML Not Like '%-%'
				and not ((List2Nav.Zakazhcik like 'ЗАО «АКАДО-Столица»')or(List2Nav.Zakazhcik like 'ЗАО «АКАДО - Столица»'))				 
				and (not((List2Nav.Probl like '%отменяется МЛ%') OR (List2Nav.Probl like '%отменяеться МЛ%') OR (List2Nav.Probl like '%отмена МЛ%') OR (List2Nav.Probl like '%отмены МЛ%') OR (List2Nav.Probl like '%отмену МЛ%'))OR (List2Nav.Probl is null))
				and List2Nav.SpecProject is null
                and List2Nav.NR_Region <>1  
		  )t1 left join 
		  (
			 select Osnova.NumML,Osnova.Dop_A 
			 from Osnova 
			 where ((Osnova.Dop_A like '%отмена МЛ%') OR (Osnova.Dop_A like '%отмены МЛ%'))
				   OR((Osnova.Zakazchik like '%тестовый клиент%') OR (Osnova.Zakazchik = 'тест')) 								
		  )t2
		   on t1.NumML = t2.NumML
	       where t2.NumML is null
		  )t3 LEFT JOIN TableReturnHistory
	       ON t3.NumML = TableReturnHistory.numberML
		   group by t3.NumML
		)t4 
         --LEFT JOIN Osnova
         --ON t4.NumML = Osnova.NumML
  )t5

 











