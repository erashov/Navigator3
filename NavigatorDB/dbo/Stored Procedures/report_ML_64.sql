
create PROCEDURE [dbo].[report_ML_64]
@start_date nvarchar(25),
@end_date nvarchar(25)


/*  
общее кол-во адресов выполненных (за один адрес принимаются все одинаковые адреса при условии совпадения даты постановки задания УСП)												
*/

as

select
count(t1.Adres)
from
(
   select 
	AdresA Adres, round(cast(D_USP as float), 0, 1) d
   from
    List2Nav
   where 
     List2Nav.numML < 1000000 --and numml > 0
     and(((List2Nav.D_USP >= CONVERT(DATETIME,@start_date, 104))
        and(List2Nav.D_USP <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104)))))
     AND List2Nav.ProblML Is Null
   group by AdresA, round(cast(D_USP as float), 0, 1)

union select 
	AdresB Adres, round(cast(D_USP1 as float), 0, 1) d
   from
    List2Nav
   where 
     List2Nav.numML < 1000000 --and numml > 0
     and ((List2Nav.D_USP1 >= CONVERT(DATETIME,@start_date, 104))
       and(List2Nav.D_USP1 <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104))))
     AND List2Nav.ProblML Is Null
   group by AdresB, round(cast(D_USP1 as float), 0, 1)
)t1


