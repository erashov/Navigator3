
CREATE procedure [dbo].[report_ML_10]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as
/*Средний срок организации по всем реализованным МЛ ПРИМ-1*/

select
  T2.NumML as 'Номер МЛ',
  dbo.fn_datediff(CONVERT(DATETIME, '01.01.1900', 104), DATEADD(mi,(DATEDIFF(mi,case when T2.startTime = CONVERT(DATETIME, '1900-01-01', 102) then Osnova.Utverzh_B else T2.startTime end, DATEADD(hh,18,T2.endTime))-T2.pause),CONVERT(DATETIME, '01.01.1900', 104)), 'all') as 'Cроки организации услуг'
  --T2.startTime,
  --T2.endTime,
  --Osnova.Utverzh_B,
 --(DATEDIFF(mi,case when T2.startTime = CONVERT(DATETIME, '1900-01-01', 102) then Osnova.Utverzh_B else T2.startTime end, DATEADD(hh,18,T2.endTime))-T2.pause) as 'Срок выполнения в Навигаторе'

from
(
select  
   UltTaskSubcontrInfo.NumML,
   t1.startTime,
   t1.endTime,
   t1.pause as pause
   --Round ((cast (t1.pause as float)/1440),5) as pause

from UltTaskSubcontrInfo JOIN 
(
            select 
			  List2Nav.NumML,
			  sum (case when dateConfirmML < returnDate then DATEDIFF(mi,dateConfirmML, returnDate) else 0 end) as pause,
	          min (case when dateConfirmML is null then 0 else dateConfirmML end) as startTime,
              min (List2Nav.Sdan) as endTime           
            from
	          List2Nav LEFT JOIN TableReturnHistory
	          ON List2Nav.NumML = TableReturnHistory.numberML 
            where 
			  List2Nav.Sdan > CONVERT(DATETIME, @start_date, 104)
			  and List2Nav.Sdan < CONVERT(DATETIME, @end_date, 104)
			  and List2Nav.numML < 1000000
			  and List2Nav.NumML Not Like '%-%'
			group by List2Nav.NumML
)t1
ON UltTaskSubcontrInfo.NumML = t1.NumML 
)T2 left join Osnova
ON T2.NumML = Osnova.NumML
order by T2.NumML desc
