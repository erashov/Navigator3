
create PROCEDURE [dbo].[report_ML_67_bak]
@start_date nvarchar(25),
@end_date nvarchar(25)


/*
кол-во адресов не выполненных в срок ( разница между датой отчета УСП и 
датой постановки задания УСП больше чем 3 дня, учесть  условие наличия заморозки МЛ 
если она попадает на период выполнения работ и с учетом её вычета выполняется условие больше чем 3 дня.
*/

as	


/*
declare @start_date nvarchar(25);
declare @end_date nvarchar(25);


set @start_date = '01.03.2011'; 
set @end_date ='01.04.2011' ;

drop table #all_addr

*/

select *
into #all_addr
from
(
 select 
	 numml,
     AdresA Adres,
	 (case when DATEDIFF(d, c,D_USP) = 0 
	      then DATEDIFF(mi, c,D_USP) 
	      else DATEDIFF(mi, c,D_USP) - ((DATEDIFF(d,c,D_USP)+1 - dbo.GetWorkingDays(c,D_USP))*1440) 
	 end) - dbo.CrossInterval(c,D_USP,SignD1,SignD2) wtime,
     round(cast(D_USP as float), 0, 1) d

   from
    List2Nav
   where 
     List2Nav.numML < 1000000 --and numml > 0
     and (List2Nav.D_USP >= CONVERT(DATETIME,@start_date, 104))
     and(List2Nav.D_USP <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104)))     
	 AND List2Nav.ProblML Is Null

 union all select
    numml, 
    AdresB Adres,
	 (case when DATEDIFF(d, b,D_USP1) = 0 
	      then DATEDIFF(mi, b,D_USP1) 
	      else DATEDIFF(mi, b,D_USP1) - ((DATEDIFF(d,b,D_USP1)+1 - dbo.GetWorkingDays(b,D_USP1))*1440) 
	 end) - dbo.CrossInterval(b,D_USP1,SignD1,SignD2) wtime,
     round(cast(D_USP1 as float), 0, 1) d

   from
    List2Nav
   where 
     List2Nav.numML < 1000000 --and numml > 0
     and (List2Nav.D_USP1 >= CONVERT(DATETIME,@start_date, 104))
     and(List2Nav.D_USP1 <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104)))      
	 AND List2Nav.ProblML Is Null

)t1 
where  
t1.wtime > 4320 
--order by t1.numml desc



select
tb_all.numml "№МЛ/ТЛ",
dbo.date(ln.utverzh) "дата утвержд. МЛ/ТЛ",
ln.zakazhcik "заказчик",
tb_all.Adres "адрес задания УСП",
ln.Usluga "услуга",
osn.Usluga "тип услуги",
osn.Pre_Usluga "вид услуги",
osn.Manager "менеджер",
case when tb_all.Adres = ln.AdresA 
     then dbo.date(ln.c)
     else case when tb_all.Adres = ln.AdresB 
               then dbo.date(ln.b)
               else null end
     end as "дата задания УСП",

case when tb_all.Adres = ln.AdresA 
     then dbo.date(ln.D_USP)
     else case when tb_all.Adres = ln.AdresB 
               then dbo.date(ln.D_USP1)
               else null end
     end as "дата отчета УСП",

case when tb_all.Adres = ln.AdresA 
     then dbo.get_time_from_min(dbo.CrossInterval(ln.c,ln.D_USP,ln.SignD1,ln.SignD2))
     else case when tb_all.Adres = ln.AdresB 
               then dbo.get_time_from_min(dbo.CrossInterval(ln.b,ln.D_USP1,ln.SignD1,ln.SignD2))
               else null end
     end as "кол-во дней заморозки в период работ УСП",

ltrim(rtrim(case when charindex('<', ln.signC3, 11)=0 then ln.signC3 
 else substring(ln.signC3, 0, charindex('<', ln.signC3, 11)) end)) "причина заморозки",
 dbo.get_time_from_min(#all_addr.wtime) "кол-во дней в УСП (с вычетом заморозки если она была)"

from
(
select
max(t2.numml) numml,
t2.Adres_main Adres
from
(
select  * from #all_addr
 join (
select 
 min(wtime) min_time,
 #all_addr.Adres Adres_main
from #all_addr 
group by Adres,d
)q1 on #all_addr.Adres = q1.Adres_main 
and #all_addr.wtime = q1.min_time
)t2
group by t2.Adres_main, t2.wtime, t2.d
) tb_all

left join List2Nav ln on tb_all.numml=ln.numml 
    left join Osnova osn on tb_all.numml=osn.numml
    left join #all_addr on tb_all.numml=#all_addr.numml and  tb_all.Adres=#all_addr.Adres

order by tb_all.numml






