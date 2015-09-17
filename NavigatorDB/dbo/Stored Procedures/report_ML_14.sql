create procedure [dbo].[report_ML_14]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

/*Дата завершения и время доработки по реализованным МЛ Прим-1 */

 select  
   UltTaskSubcontrInfo.NumML as 'Номер МЛ' ,
   CONVERT(nvarchar(25), t1.endTime, 104) as 'Дата завершения',
   Round ((cast (t1.pause as float)/1440),5) as 'Доработка в Навигаторе',
   DATEADD(mi,-t1.pause,DATEADD(hh,18,t1.endTime)) as TIMEEND

from UltTaskSubcontrInfo JOIN 
(
            select 
			  List2Nav.NumML,
			  sum (case when dateConfirmML < returnDate then DATEDIFF(mi,dateConfirmML, returnDate) else 0 end) as pause,
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
order by UltTaskSubcontrInfo.NumML desc