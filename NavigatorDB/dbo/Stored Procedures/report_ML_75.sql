
CREATE PROCEDURE [dbo].[report_ML_75]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

select
t1.NumML "Номер_МЛ",
dbo.Date(t1.utverzh) "Дата утверждения",
dbo.Date(t1.Sdan_TS) "Дата сдачи ТС",
t1.Zakazhcik "Заказчик",
replace(t1.Usluga,'N',' N ') "Тип_услуги",
dbo.get_time_from_min(t1.all_time) "Время в работе (без учёта заморозок)",
cast(Round(t1.all_time/1440.0,2)as NUMERIC(15,2)) "Время в работе (без учёта заморозок) (д)",
cast(Round(t1.frozen/1440.0,2)as NUMERIC(15,2)) "Время заморозки (д)",
t1.D_USP, 
t1.D_USP1


from
(
SELECT 
l2n.NumML,
max(case when DATEDIFF(d, l2n.utverzh, l2n.Sdan_TS) = 0 
	   		                   then DATEDIFF(mi, l2n.utverzh, l2n.Sdan_TS) 
			                   else DATEDIFF(mi, l2n.utverzh, l2n.Sdan_TS) - ((DATEDIFF(d,l2n.utverzh, l2n.Sdan_TS)+1 - dbo.GetWorkingDays(l2n.utverzh, l2n.Sdan_TS))*1440) 
 end) all_time,

sum(case when (StartTime is not null) 
                     then case when DATEDIFF(d, StartTime, isnull(EndTime,l2n.Sdan_TS)) = 0 
	   		                   then DATEDIFF(mi, StartTime, isnull(EndTime,l2n.Sdan_TS)) 
			                   else DATEDIFF(mi,StartTime, isnull(EndTime,l2n.Sdan_TS)) - ((DATEDIFF(d,StartTime, isnull(EndTime,l2n.Sdan_TS))+1 - dbo.GetWorkingDays(StartTime, isnull(EndTime,l2n.Sdan_TS)))*1440) 
			              end
	                 else 0 
      end) as frozen,
max(l2n.utverzh)  utverzh, 
max(l2n.Sdan_TS)  Sdan_TS,
max(l2n.Zakazhcik)  Zakazhcik, 
max(l2n.Usluga) Usluga, 
max(l2n.D_USP) D_USP, 
max(l2n.D_USP1) D_USP1


FROM List2Nav l2n 
left join ML_HISTORY on l2n.numml=ML_HISTORY.numml 
                                       and ML_HISTORY.step=8 
                                       and StartTime > l2n.utverzh
WHERE 

 l2n.NumML < 1000000 
 and l2n.NumML >0
 and l2n.NR_Region = 0
AND (
l2n.Usluga Like 'e' or 
l2n.usluga like 'XE' or
l2n.usluga like 'S' or
l2n.usluga like 'XS' or
l2n.usluga like 'ФE' or
l2n.usluga like 'XФE' or
l2n.usluga like 'NФ' or
l2n.usluga like 'XNФ' or
l2n.usluga like 'UE' or
l2n.usluga like 'XUE' or
l2n.usluga like 'US' or
l2n.usluga like 'XUS' or
l2n.usluga like 'XNФ' or
l2n.usluga like 'UФE' or
l2n.usluga like 'XUФE' or
l2n.usluga like 'UNФ' or
l2n.usluga like 'XUNФ' or
l2n.usluga like 'OE' or
l2n.usluga like 'XOE' or
l2n.usluga like 'OS' or
l2n.usluga like 'OE' or
l2n.usluga like 'XOE' or
l2n.usluga like 'XOS' or
l2n.usluga like 'PE' or
l2n.usluga like 'XPE' or
l2n.usluga like 'IE' or
l2n.usluga like 'XIE' or
l2n.usluga like 'PS' or
l2n.usluga like 'XPS' or
l2n.usluga like 'IS' or
l2n.usluga like 'XIS' or
l2n.usluga like 'ФBF' or
l2n.usluga like 'XФBF' or 
l2n.usluga like 'АOФ' or
l2n.usluga like 'XАOФ' 
)

and ISNULL(l2n.Sdan_TS,l2n.Sdan) > CONVERT(DATETIME, @start_date, 104)
and ISNULL(l2n.Sdan_TS,l2n.Sdan) < CONVERT(DATETIME, @end_date, 104)
group BY l2n.NumML
)t1 --left join Osnova t2 on t1.numml = t2.numml
/*
where 
t1.numml  in (
--291513,
--291580
--296095

293671,
298025
)
*/
order by t1.usluga, t1.numml