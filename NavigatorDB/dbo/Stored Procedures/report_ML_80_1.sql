

CREATE procedure [dbo].[report_ML_80_1]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

/*
		МЛ направленные в работу ДЭЛС (УСП)  
*/
          select 

          List2Nav.numml "№МЛ/ТЛ",
		  dbo.date(List2Nav.utverzh) "дата утвержд. МЛ/ТЛ",
		  List2Nav.zakazhcik "заказчик",		  
		  case when List2Nav.c is not null
			   then List2Nav.AdresA
			   else List2Nav.AdresB
		  end as "адрес задания ДЭЛС",

		  case when List2Nav.c is not null
		       then dbo.date(List2Nav.c)
			   else dbo.date(List2Nav.b)
		  end as "дата задания ДЭЛС",

		  List2Nav.Usluga "услуга",
		  Osnova.Usluga "тип услуги",
		  Osnova.Pre_Usluga "вид_услуги",
          Osnova.Manager "менеджер"

			 

            from
	          List2Nav left join Osnova
			  on List2Nav.NumML = Osnova.NumML
            where 

(((List2Nav.NumML)<1000000) 
/*
AND ((List2Nav.Usluga) Not Like '%v%' 
And (List2Nav.Usluga) Not Like '%l%' 
And (List2Nav.Usluga) Not Like '%k%' 
And (List2Nav.Usluga) Not Like '%SR%') 
*/
AND ((List2Nav.ProblML) Is Null))

and
(
   ((List2Nav.c >= CONVERT(DATETIME,@start_date, 104))and(List2Nav.c <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104))))
     or
   ((List2Nav.b >= CONVERT(DATETIME,@start_date, 104))and(List2Nav.b <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104))))
)


order by List2Nav.numml desc








