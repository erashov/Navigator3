

CREATE procedure [dbo].[report_ML_73]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as


select
t1.NumML "Номер_МЛ",
--case when (t1.all_time < t1.frozen)  then 0 else t1.all_time- t1.frozen end  as "Время работы",
cast(Round((case when (t1.all_time < t1.frozen)  then 0 else t1.all_time- t1.frozen end)/1440.0,2) as NUMERIC(15,2)) as "Время_работы",
cast(Round(t1.frozen/1440.0,2)as NUMERIC(15,2)) "Время заморозки (д)",
dbo.Date(t1.utverzh) "Дата утверждения",
dbo.Date(t1.Sdan_TS) "Дата сдачи ТС",
t1.Zakazhcik "Заказчик",
t1.AdresA "Адрес А",
t1.AdresB "Адрес B",
t2.Usluga  "Услуга",
t1.Usluga  "Тип_услуги",
t2.Pre_Usluga  "Вид_услуги",
t1.prim "Примечание",
t1.SpecProject "Спецпроект"
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
                     then case when DATEDIFF(d, StartTime, isnull(EndTime,l2n.Sdan_TS)) = 0 
	   		                   then DATEDIFF(mi, StartTime, isnull(EndTime,l2n.Sdan_TS)) 
			                   else DATEDIFF(mi,StartTime, isnull(EndTime,l2n.Sdan_TS)) - ((DATEDIFF(d,StartTime, isnull(EndTime,l2n.Sdan_TS))+1 - dbo.GetWorkingDays(StartTime, isnull(EndTime,l2n.Sdan_TS)))*1440) 
			              end
	                 else 0 
      end) as frozen,

max(l2n.Sdan_TS)  Sdan_TS,
max(l2n.Zakazhcik)  Zakazhcik, 
max(l2n.Usluga) Usluga, 
max(l2n.AdresA) AdresA, 
max(l2n.AdresB) AdresB,
max(l2n.prim) prim,
max(l2n.SpecProject) SpecProject


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
--and l2n.NR_Region =0     по запросу № S059678
and ISNULL(l2n.Sdan_TS,l2n.Sdan) > CONVERT(DATETIME, @start_date, 104)
and ISNULL(l2n.Sdan_TS,l2n.Sdan) <= DATEADD(mi,1439,CONVERT(DATETIME, @end_date, 104))

group BY l2n.NumML
)t0
)t1 left join Osnova t2 on t1.numml = t2.numml

order by t1.numml desc


