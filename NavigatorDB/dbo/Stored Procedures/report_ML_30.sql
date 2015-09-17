

CREATE procedure [dbo].[report_ML_30]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

/*сроки организации по всем реализованным МЛ ( до Sdan_TS) для спецпроектов*/

      select
        t4.NumML as 'Номер МЛ',
        CONVERT(nvarchar(25), case when ((t4.startTime > t4.endTimeTS) or (t4.startTime is NULL))
			                       then Osnova.Utverzh_B
			                       else t4.startTime 
                              end, 104) as 'Дата утверждения',
        CONVERT(nvarchar(25),t4.endTimeTS,104) as 'Дата завершения',
       dbo.get_time_from_min(
				  case when ((t4.startTime > t4.endTimeTS) or (t4.startTime is NULL)) 
		               then (case when ((DATEDIFF(d,Osnova.Utverzh_B, t4.endTimeTS) = 0) OR (DATEDIFF(mi,Osnova.Utverzh_B, t4.endTimeTS) - ((DATEDIFF(d,Osnova.Utverzh_B ,t4.endTimeTS)+1 - dbo.GetWorkingDays(Osnova.Utverzh_B,t4.endTimeTS))*1440) < 0))
						          then DATEDIFF(mi,Osnova.Utverzh_B, t4.endTimeTS) - t4.frozen 
		                          else DATEDIFF(mi,Osnova.Utverzh_B, t4.endTimeTS) - ((DATEDIFF(d,Osnova.Utverzh_B ,t4.endTimeTS)+1 - dbo.GetWorkingDays(Osnova.Utverzh_B,t4.endTimeTS))*1440) - t4.frozen end )                     
		               else (case when ((DATEDIFF(d,t4.startTime, t4.endTimeTS) = 0) OR (DATEDIFF(mi,t4.startTime, t4.endTimeTS) - ((DATEDIFF(d,t4.startTime ,t4.endTimeTS)+1 - dbo.GetWorkingDays(t4.startTime,t4.endTimeTS))*1440) -
							          (DATEDIFF(mi,t4.startTime, Osnova.Utverzh_B)-((DATEDIFF(d,t4.startTime ,Osnova.Utverzh_B)+1 - dbo.GetWorkingDays(t4.startTime,Osnova.Utverzh_B))*1440)-t4.pause) < 0))
								  then DATEDIFF(mi,t4.startTime, t4.endTimeTS) - (DATEDIFF(mi,t4.startTime, Osnova.Utverzh_B) - t4.pause) - t4.frozen
								  else DATEDIFF(mi,t4.startTime, t4.endTimeTS) - ((DATEDIFF(d,t4.startTime ,t4.endTimeTS)+1 - dbo.GetWorkingDays(t4.startTime,t4.endTimeTS))*1440) - t4.frozen -
						               case when (DATEDIFF(mi,t4.startTime, Osnova.Utverzh_B)-((DATEDIFF(d,t4.startTime ,Osnova.Utverzh_B)+1 - dbo.GetWorkingDays(t4.startTime,Osnova.Utverzh_B))*1440)-t4.pause) > 0
								            then (DATEDIFF(mi,t4.startTime, Osnova.Utverzh_B)-((DATEDIFF(d,t4.startTime ,Osnova.Utverzh_B)+1 - dbo.GetWorkingDays(t4.startTime,Osnova.Utverzh_B))*1440)-t4.pause)
								            else 0 end							          
							      end )
					   end ) as 'Срок выполнения',
		case when ((t4.startTime > Osnova.Utverzh_B) or (t4.startTime is NULL))
			then  dbo.get_time_from_min(t4.pause) 
			else case when DATEDIFF(mi,t4.startTime, Osnova.Utverzh_B)-((DATEDIFF(d,t4.startTime ,Osnova.Utverzh_B)+1 - dbo.GetWorkingDays(t4.startTime,Osnova.Utverzh_B))*1440)- t4.pause > 0
					  then dbo.get_time_from_min(DATEDIFF(mi,t4.startTime, Osnova.Utverzh_B)-((DATEDIFF(d,t4.startTime ,Osnova.Utverzh_B)+1 - dbo.GetWorkingDays(t4.startTime,Osnova.Utverzh_B))*1440)- t4.pause)
					  else dbo.get_time_from_min(0)
				 end
			end  as 'Срок доработки',
		dbo.get_time_from_min(t4.frozen) as 'Срок заморозки',
		Osnova.Zakazchik as 'Заказчик',
        Osnova.Usluga as 'Услуга',
        t4.tip_usluga as 'Тип услуги',
	    Osnova.Pre_Usluga as 'Вид услуги',
		Osnova.Manager as 'Менеджер'
		
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
			min(t3.tip_usluga) as tip_usluga
  		  from
		  (
		    select 
			  t1.NumML,
			  t1.endTimeTS,
			  t1.frozen,
			  t1.tip_usluga
			from
			(
			  select 
				List2Nav.NumML,
				List2Nav.Usluga as tip_usluga,
				ISNULL(List2Nav.Sdan_TS,DATEADD(hh,18,List2Nav.Sdan)) as endTimeTS,
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
                and ISNULL(List2Nav.Sdan_TS,DATEADD(hh,18,List2Nav.Sdan)) > CONVERT(DATETIME, @start_date, 104)
			    and ISNULL(List2Nav.Sdan_TS,DATEADD(hh,18,List2Nav.Sdan)) < CONVERT(DATETIME, @end_date, 104)
			    and List2Nav.numML < 1000000
			    and List2Nav.NumML Not Like '%-%'
				and not ((List2Nav.Zakazhcik like 'ЗАО «АКАДО-Столица»')or(List2Nav.Zakazhcik like 'ЗАО «АКАДО - Столица»'))				 
				and (not((List2Nav.Probl like '%отменяется МЛ%') OR (List2Nav.Probl like '%отменяеться МЛ%') OR (List2Nav.Probl like '%отмена МЛ%') OR (List2Nav.Probl like '%отмены МЛ%') OR (List2Nav.Probl like '%отмену МЛ%'))OR (List2Nav.Probl is null))
				and List2Nav.SpecProject is not null
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
		)t4 LEFT JOIN Osnova
         ON t4.NumML = Osnova.NumML
		 order by t4.NumML desc







