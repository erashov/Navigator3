
CREATE PROCEDURE [dbo].[report_ML_63]
@start_date nvarchar(25),
@end_date nvarchar(25)


/*  
общее кол-во адресов поступивших (за один адрес принимаются все одинаковые адреса при условии совпадения даты постановки задания УСП)												
*/

as

select
count(t1.Adres)
from
(
   select 
	AdresA Adres, round(cast(c as float), 0, 1) d
   from
    List2Nav
   where 
     List2Nav.numML < 1000000 --and numml > 0
     and(((List2Nav.c >= CONVERT(DATETIME,@start_date, 104))
        and(List2Nav.c <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104)))))
     AND List2Nav.ProblML Is Null
   group by AdresA, round(cast(c as float), 0, 1)

union select 
	AdresB Adres, round(cast(b as float), 0, 1) d
   from
    List2Nav
   where 
     List2Nav.numML < 1000000 --and numml > 0
     and ((List2Nav.b >= CONVERT(DATETIME,@start_date, 104))
       and(List2Nav.b <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104))))
     AND List2Nav.ProblML Is Null
   group by AdresB, round(cast(b as float), 0, 1)
)t1