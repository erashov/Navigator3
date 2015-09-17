CREATE PROCEDURE [dbo].[report_ML_76]
@start_date nvarchar(25),
@end_date nvarchar(25)


/*
кол-во адресов не выполненных в срок (разница между датой отчета УСП и 
датой постановки задания УСП больше чем 3 дня, но меньше, чем 5 дней, учесть  условие наличия заморозок МЛ 
если они попадают на период выполнения работ и с учетом их вычета выполняется условие больше чем 3 дня и меньше, чем 5 дней.
*/

as	
select *
into #all_addr1
from
(
select
 numml,
 Adres,
(    case when DATEDIFF(d, c,D_USP) = 0 
	      then DATEDIFF(mi, c,D_USP) 
	      else DATEDIFF(mi, c,D_USP) - ((DATEDIFF(d,c,D_USP)+1 - dbo.GetWorkingDays(c,D_USP))*1440) 
	 end) - sum_froze as wtime,
     round(cast(D_USP as float), 0, 1) d,
sum_froze
from
(
  select 
	 ln.numml,
	 ln.AdresA Adres,
     ln.c, ln.D_USP,
     sum(dbo.CrossInterval(ln.c,ln.D_USP,ht.StartTime,case when ((ht.EndTime is null) and (ht.StartTime=ln.SignD1)) then ln.SignD2 else ht.EndTime end)) sum_froze
   from
    List2Nav ln left join ML_History ht on ln.numml=ht.NumML and ht.Step=8
   where 
     ln.numML < 1000000 
     and (ln.D_USP >= CONVERT(DATETIME,@start_date, 104))
     and(ln.D_USP <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104)))     
	 AND ln.ProblML Is Null
   group by ln.numml,ln.AdresA,ln.c, ln.D_USP
 union select   
	 ln.numml,
	 ln.AdresB Adres,
     ln.b, ln.D_USP1,
     sum(dbo.CrossInterval(ln.b,ln.D_USP1,ht.StartTime,case when ((ht.EndTime is null) and (ht.StartTime=ln.SignD1)) then ln.SignD2 else ht.EndTime end)) sum_froze
   from
    List2Nav ln left join ML_History ht on ln.numml=ht.NumML and ht.Step=8
   where 
     ln.numML < 1000000 
     and (ln.D_USP1 >= CONVERT(DATETIME,@start_date, 104))
     and(ln.D_USP1 <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104)))     
	 AND ln.ProblML Is Null
   group by ln.numml,ln.AdresB,ln.b,ln.D_USP1

)tb_frozen
)t1  
where 
t1.wtime > 4320 and 
t1.wtime < 7200


select distinct
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

dbo.get_time_from_min(#all_addr1.sum_froze) "кол-во дней заморозки в период работ УСП",
ltrim(rtrim(case when charindex('<', ln.signC3, 11)=0 then ln.signC3 
 else substring(ln.signC3, 0, charindex('<', ln.signC3, 11)) end)) "причина заморозки",
 dbo.get_time_from_min(#all_addr1.wtime) "кол-во дней в УСП (с вычетом заморозки если она была)"

from
(
  select
   t2.numml numml,
   t2.Adres_main Adres
  from
  (
    select  * 
    from #all_addr1
    join 
    (
         select 
          wtime min_time,
          #all_addr1.Adres Adres_main
         from #all_addr1 
     )q1 on #all_addr1.Adres = q1.Adres_main 
         and #all_addr1.wtime = q1.min_time
  )t2
) tb_all

left join List2Nav ln on tb_all.numml=ln.numml 
    left join Osnova osn on tb_all.numml=osn.numml
    left join #all_addr1 on tb_all.numml=#all_addr1.numml and  tb_all.Adres=#all_addr1.Adres

order by tb_all.numml