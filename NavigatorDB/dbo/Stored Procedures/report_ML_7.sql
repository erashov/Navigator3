
CREATE procedure [dbo].[report_ML_7]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as
/*Средний срок организации по всем реализованным МЛ */
    select
        t1.NumML as 'Номер МЛ',
		(DATEDIFF(mi,case when ((t1.startTime > t1.endTime) or (t1.startTime is NULL)) then Osnova.Utverzh_B else t1.startTime end,DATEADD(hh,18,t1.endTime))-t1.pause)/1440 as 'Срок выполнения (дней)',
        t1.pause/1440 as 'Срок доработки (дней)',
        CONVERT(nvarchar(25),case when ((t1.startTime > t1.endTime) or (t1.startTime is NULL)) then Osnova.Utverzh_B else t1.startTime end, 104) as 'Дата утверждения',
        CONVERT(nvarchar(25),t1.endTime, 104) as 'Дата завершения'

		from
		(
			select 
			  List2Nav.NumML,
			  sum (case when dateConfirmML < returnDate then DATEDIFF(mi,dateConfirmML, returnDate) else 0 end) as pause,
	          min (dateConfirmML) as startTime,
              min (List2Nav.Sdan) as endTime
            from
	          List2Nav LEFT JOIN TableReturnHistory
	          ON List2Nav.NumML = TableReturnHistory.numberML 
            where 
			  List2Nav.Sdan > CONVERT(DATETIME, @start_date, 104)
			  and List2Nav.Sdan < CONVERT(DATETIME, @end_date, 104)
			  and List2Nav.numML < 1000000
			  and List2Nav.NumML Not Like '%-%'
			  and List2Nav.Zakazhcik Not Like 'ЗАО «АКАДО-Столица»'
			group by List2Nav.NumML
		 ) t1 LEFT JOIN Osnova
           ON t1.NumML = Osnova.NumML
order by t1.NumML desc