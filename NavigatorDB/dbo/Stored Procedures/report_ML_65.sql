
CREATE PROCEDURE [dbo].[report_ML_65]
@start_date nvarchar(25),
@end_date nvarchar(25)

as



/*  
информация по
общему кол-ву адресов выполненных (за один адрес принимаются все одинаковые адреса при условии совпадения даты постановки задания УСП)												
*/

/*
declare @start_date nvarchar(25);
declare @end_date nvarchar(25);

set @start_date = '01.03.2011'; 
set @end_date ='01.04.2011' ;
*/

select
t2.numml "№МЛ/ТЛ",
dbo.date(ln.utverzh) "дата утвержд. МЛ/ТЛ",
ln.zakazhcik "заказчик",
t2.Adres "адрес задания УСП",
ln.Usluga "услуга",
osn.Usluga "тип услуги",
osn.Pre_Usluga "вид услуги",
osn.Manager "менеджер",

case when t2.Adres = ln.AdresA 
     then dbo.date(ln.c)
     else case when t2.Adres = ln.AdresB 
               then dbo.date(ln.b)
               else null end
     end as "дата задания УСП",

case when t2.Adres = ln.AdresA 
     then dbo.date(ln.D_USP)
     else case when t2.Adres = ln.AdresB 
               then dbo.date(ln.D_USP1)
               else null end
     end as "дата отчета УСП",

case when t2.Adres = ln.AdresA 
     then dbo.get_time_from_min(dbo.CrossInterval(ln.c,ln.D_USP,ln.SignD1,ln.SignD2))
     else case when t2.Adres = ln.AdresB 
               then dbo.get_time_from_min(dbo.CrossInterval(ln.b,ln.D_USP1,ln.SignD1,ln.SignD2))
               else null end
     end as "кол-во дней заморозки в период работ УСП",
ltrim(rtrim(case when charindex('<', ln.signC3, 11)=0 then ln.signC3 
 else substring(ln.signC3, 0, charindex('<', ln.signC3, 11)) end)) "причина заморозки",


case when t2.Adres = ln.AdresA 
     then 
     dbo.get_time_from_min(( case when DATEDIFF(d, ln.c, ln.D_USP) = 0 
	      then DATEDIFF(mi, ln.c, ln.D_USP) 
	      else DATEDIFF(mi, ln.c,ln.D_USP) - ((DATEDIFF(d,ln.c,ln.D_USP)+1 - dbo.GetWorkingDays(ln.c,ln.D_USP))*1440) 
	   end) - dbo.CrossInterval(ln.c,ln.D_USP,ln.SignD1,ln.SignD2))

     else case when t2.Adres = ln.AdresB 
               then 
              dbo.get_time_from_min(( case when DATEDIFF(d, ln.b, ln.D_USP1) = 0 
	                 then DATEDIFF(mi, ln.b, ln.D_USP1) 
	                 else DATEDIFF(mi, ln.b,ln.D_USP1) - ((DATEDIFF(d,ln.b,ln.D_USP1)+1 - dbo.GetWorkingDays(ln.b,ln.D_USP1))*1440) 
	             end) - dbo.CrossInterval(ln.b,ln.D_USP1,ln.SignD1,ln.SignD2))
               else null end
     end as "кол-во дней в УСП (с вычетом заморозки если она была)"


from
(
 select
  max(t1.numml) numml,
  t1.Adres,
  t1.d
 from
 (
   select 
    max(numml) numml,
	AdresA Adres, 
    round(cast(D_USP as float), 0, 1) d
   from
    List2Nav
   where 
     List2Nav.numML < 1000000 --and numml > 0
     and(((List2Nav.D_USP >= CONVERT(DATETIME,@start_date, 104))
        and(List2Nav.D_USP <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104)))))
     AND List2Nav.ProblML Is Null
   group by AdresA, round(cast(D_USP as float), 0, 1)

 union select
    max(numml) numml, 
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
  group by t1.Adres, t1.d
)t2 left join List2Nav ln on t2.numml=ln.numml 
    left join Osnova osn on t2.numml=osn.numml

order by t2.numml desc



