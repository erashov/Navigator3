

CREATE procedure [dbo].[report_ML_13]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as
/*сроки организации по всем реализованным МЛ*/
/*устарела и не используется!!!*/

      select
        t1.NumML as 'Номер МЛ',
        CONVERT(nvarchar(25),
        case when ((t1.startTime > t1.endTime) or (t1.startTime is NULL))
			 then Osnova.Utverzh_B
			 else t1.startTime 
             end, 104) as 'Дата утверждения',
        CONVERT(nvarchar(25),t1.endTime,104) as 'Дата завершения',
        dbo.get_time_from_min(
        case when ((t1.startTime > t1.endTime) or (t1.startTime is NULL)) 
             then (case when DATEDIFF(d,Osnova.Utverzh_B, t1.endTime) = 0 
					    then DATEDIFF(mi,Osnova.Utverzh_B, t1.endTime) - t1.frozen 
                        else DATEDIFF(mi,Osnova.Utverzh_B, t1.endTime) - ((DATEDIFF(d,Osnova.Utverzh_B ,t1.endTime)+1 - dbo.GetWorkingDays(Osnova.Utverzh_B,t1.endTime))*1440) - t1.frozen end )                     
             else (case when DATEDIFF(d,t1.startTime, t1.endTime) = 0 
				        then DATEDIFF(mi,t1.startTime, t1.endTime) - (DATEDIFF(mi,t1.startTime, Osnova.Utverzh_B) - t1.pause) - t1.frozen
                        else DATEDIFF(mi,t1.startTime, t1.endTime) - ((DATEDIFF(d,t1.startTime ,t1.endTime)+1 - dbo.GetWorkingDays(t1.startTime,t1.endTime))*1440) - t1.frozen -
						    case when (DATEDIFF(mi,t1.startTime, Osnova.Utverzh_B)-((DATEDIFF(d,t1.startTime ,Osnova.Utverzh_B)+1 - dbo.GetWorkingDays(t1.startTime,Osnova.Utverzh_B))*1440)-t1.pause) > 0
								 then (DATEDIFF(mi,t1.startTime, Osnova.Utverzh_B)-((DATEDIFF(d,t1.startTime ,Osnova.Utverzh_B)+1 - dbo.GetWorkingDays(t1.startTime,Osnova.Utverzh_B))*1440)-t1.pause)
								 else 0 end
						end )
		     end  ) as 'Срок выполнения',
       case when ((t1.startTime > Osnova.Utverzh_B) or (t1.startTime is NULL))
			then dbo.get_time_from_min(t1.pause)
			else dbo.get_time_from_min(DATEDIFF(mi,t1.startTime, Osnova.Utverzh_B)-((DATEDIFF(d,t1.startTime ,Osnova.Utverzh_B)+1 - dbo.GetWorkingDays(t1.startTime,Osnova.Utverzh_B))*1440)- t1.pause)
			end  as 'Срок доработки',
		dbo.get_time_from_min(t1.frozen) as 'Срок заморозки',
		Osnova.Zakazchik as 'Заказчик',
        Osnova.Usluga as 'Услуга',
        t1.tip_usluga as 'Тип услуги',
	    Osnova.Pre_Usluga as 'Вид услуги',
		Osnova.Manager as 'Менеджер'
		
		from
		(
			select 
			  List2Nav.NumML,
			  sum(
                  case when dateConfirmML < returnDate then
                      (case when DATEDIFF(d,dateConfirmML, returnDate) = 0 then 
					  		     DATEDIFF(mi,dateConfirmML, returnDate) 
                            else DATEDIFF(mi,dateConfirmML, returnDate) - ((DATEDIFF(d,dateConfirmML, returnDate)+1 - dbo.GetWorkingDays(dateConfirmML,returnDate))*1440) end) 
                       else 0 end
                  ) as pause,
			  min(case when ((SignD1 is not null) and (SignD2 is not null)) 
					   then case when DATEDIFF(d, SignD1, SignD2) = 0 
							then DATEDIFF(mi, SignD1, SignD2) 
							else DATEDIFF(mi,SignD1, SignD2) - ((DATEDIFF(d,SignD1, SignD2)+1 - dbo.GetWorkingDays(SignD1, SignD2))*1440) end
                       else 0 end
                  ) as frozen,
	          min(dateConfirmML) as startTime,
              min(DATEADD(hh,18,List2Nav.Sdan)) as endTime,
              min(List2Nav.Usluga) as tip_usluga
            from
	          List2Nav LEFT JOIN TableReturnHistory
	          ON List2Nav.NumML = TableReturnHistory.numberML 
            where 
			  List2Nav.Sdan > CONVERT(DATETIME, @start_date, 104)
			  and List2Nav.Sdan < CONVERT(DATETIME, @end_date , 104)
			  and List2Nav.numML < 1000000
			  and List2Nav.NumML Not Like '%-%'
			  and List2Nav.Zakazhcik Not Like 'ЗАО «АКАДО-Столица»'
			group by List2Nav.NumML
		 ) t1 LEFT JOIN Osnova
           ON t1.NumML = Osnova.NumML
		   order by t1.NumML desc



