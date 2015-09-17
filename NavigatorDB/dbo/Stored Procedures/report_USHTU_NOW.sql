

CREATE PROCEDURE [dbo].[report_USHTU_NOW]	
as
select
--cast(Round(t1.all_time/1440.0,2)as NUMERIC(15,2))  wt,
t1.NumML "Номер_МЛ",
--case when (t1.all_time < t1.frozen)  then 0 else t1.all_time- t1.frozen end  as "Время работы",
--cast(Round((case when (t1.all_time < t1.frozen)  then 0 else t1.all_time- t1.frozen end)/1440.0,2) as NUMERIC(15,2)) as "Время_работы",
--replace(convert(varchar,cast(Round(t1.all_time/1440.0,2)as NUMERIC(15,2))),'.',',') "Время_работы (д)",
--replace(convert(varchar,cast(Round(t1.frozen/1440.0,2)as NUMERIC(15,2))),'.',',') "Время заморозки (д)",

case when (cast(Round(t1.all_time/1440.0,2)as NUMERIC(15,2)) <0 )
     then 0
     else cast(Round(t1.all_time/1440.0,2)as NUMERIC(15,2)) end "Время_работы",
cast(Round(t1.frozen/1440.0,2)as NUMERIC(15,2)) "Время_заморозки", 
dbo.Date(t1.utverzh) "Дата утверждения",
null "Дата сдачи ТС",
t1.Zakazhcik "Заказчик",
t1.AdresA "Адрес А",
t1.AdresB "Адрес B",
t2.Usluga  "Услуга",
t1.Usluga  "Тип_услуги",
t2.Pre_Usluga  "Вид_услуги",
t1.SpecProject "Выдан в УСП",
t1.prim "Отчёт УСП",
rtrim(t1.signC3) "Причина",
rtrim(t1.Commentary) "Комментарий"
from
(
select
t0.NumML,
t0.utverzh,
t0.Sdan_TS,
t0.Zakazhcik,
t0.AdresA,
t0.AdresB,
t0.Usluga,
t0.prim,
t0.SpecProject,
t0.frozen,
t0.Commentary,
t0.signC3,
case when DATEDIFF(d, t0.utverzh, t0.Sdan_TS) = 0 
	   		                   then DATEDIFF(mi, t0.utverzh, t0.Sdan_TS) 
			                   else DATEDIFF(mi, t0.utverzh, t0.Sdan_TS) - ((DATEDIFF(d,t0.utverzh, t0.Sdan_TS)+1 - dbo.GetWorkingDays(t0.utverzh, t0.Sdan_TS))*1440) 
     end all_time
from
(
SELECT 
l2n.NumML,
 
--листы, которые пришли в работу в ТС после 15:30 считать пришедшими в работу в 8:30 следующего рабочего дня
max(case when (l2n.utverzh >  DATEADD(mi,930,dateadd(dd,0, datediff(dd,0, l2n.utverzh))))
     then  DATEADD(mi,1950,dateadd(dd,0, datediff(dd,0, l2n.utverzh)))
     else  l2n.utverzh
end) utverzh,
--
sum(case when (StartTime is not null) 
                     then case when DATEDIFF(d, StartTime, isnull(EndTime,getdate())) = 0 
	   		                   then DATEDIFF(mi, StartTime, isnull(EndTime,getdate())) 
			                   else DATEDIFF(mi,StartTime, isnull(EndTime,getdate())) - ((DATEDIFF(d,StartTime, isnull(EndTime,getdate()))+1 - dbo.GetWorkingDays(StartTime, isnull(EndTime,getdate())))*1440) 
			              end
	                 else 0 
      end) as frozen,

getdate()  Sdan_TS,
max(l2n.Zakazhcik)  Zakazhcik, 
max(l2n.Usluga) Usluga, 
max(l2n.AdresA) AdresA, 
max(l2n.AdresB) AdresB,
max(Commentary) Commentary,
max(signC3) signC3,
max(l2n.d_usp) prim,
max(l2n.c) SpecProject


FROM List2Nav l2n left join ML_HISTORY on l2n.numml=ML_HISTORY.numml 
                                       and ML_HISTORY.step=8 
                                       and StartTime > l2n.utverzh
WHERE 

 l2n.NumML < 1000000 
AND ((l2n.Usluga) Like '%p%' 
 Or (l2n.Usluga) Like '%a%' 
 Or (l2n.Usluga) Like '%v%' 
 Or (l2n.Usluga) Like '%b%' 
 Or (l2n.Usluga) Like '%i%' 
 Or (l2n.Usluga) Like '%g%' 
 Or (l2n.Usluga) Like '%kw%')
AND l2n.ProblML Is Null
and l2n.NR_Region =0

and l2n.Sdan_TS is null 
and l2n.Sdan is null

and l2n.numml >0


group BY l2n.NumML
--order by l2n.numml desc

)t0
)t1 left join Osnova t2 on t1.numml = t2.numml
--where 
--cast(Round(t1.all_time/1440.0,2)as NUMERIC(15,2)) > 5
--and cast(Round(t1.all_time/1440.0,2)as NUMERIC(15,2)) < 10
--and 
--t1.frozen  > 0.0001
order by t1.numml desc




