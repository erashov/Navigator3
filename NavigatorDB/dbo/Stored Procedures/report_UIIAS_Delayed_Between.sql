CREATE PROCEDURE [dbo].[report_UIIAS_Delayed_Between]
	@start_date nvarchar(25),
	@end_date  nvarchar(25), 
    @pro nvarchar (28), 
    @DaysCount1 int,
    @DaysCount2 int
as

select 
    t1.NumML as "Номер МЛ",                    
    t1.all_time as "Время в работе",
    t1.Utverzh as "Дата утверждения",
	t1.Sdan_TS as "Дата сдачи ТС",
	t1.Zakazhcik as "Клиент",								   
	t1.Usluga as "Услуга",
    t1.AdresA as "Адрес A",
    t1.AdresB as "Адрес B",
    t1.Prim as "Примечание"
from
(
SELECT 
    l2n.NumML,
    max(case when DATEDIFF(d, l2n.utverzh, l2n.Sdan_TS) = 0 
	   		                   then DATEDIFF(mi, l2n.utverzh, l2n.Sdan_TS) 
			                   else DATEDIFF(mi, l2n.utverzh, l2n.Sdan_TS) - ((DATEDIFF(d       ,l2n.utverzh, l2n.Sdan_TS)+1 - dbo.GetWorkingDays(l2n.utverzh, l2n.Sdan_TS))*1440) 
        end) all_time,
    sum(case when (StartTime is not null) 
                     then case when DATEDIFF(d, StartTime, 
                        isnull(EndTime,l2n.Sdan_TS)) = 0 
	   		            then DATEDIFF(mi, StartTime, isnull(EndTime,l2n.Sdan_TS)) 
			            else DATEDIFF(mi,StartTime, isnull(EndTime,l2n.Sdan_TS)) - 
                            ((DATEDIFF(d,StartTime, isnull(EndTime,l2n.Sdan_TS))+1 - 
                            dbo.GetWorkingDays(StartTime, 
                            isnull(EndTime,l2n.Sdan_TS)))*1440) 
			            end
	                 else 0 
                    end) as frozen,
    max(l2n.utverzh)  utverzh, 
    max(l2n.Sdan_TS)  Sdan_TS,
    max(l2n.Zakazhcik)  Zakazhcik, 
    max(l2n.Usluga) Usluga, 
    max(l2n.AdresA) AdresA, 
    max(l2n.AdresB) AdresB,
    max(l2n.prim) prim


    FROM List2Nav l2n left join ML_HISTORY on l2n.numml=ML_HISTORY.numml 
                                       and ML_HISTORY.step=8 
                                       and StartTime > l2n.utverzh
    WHERE 
        l2n.NumML < 1000000 
        AND l2n.ProblML Is Null
        and (Prim like '%' + @pro + '%')
        and l2n.Sdan_TS >= CONVERT(DATETIME, @start_date, 104)
	    and l2n.Sdan_TS < DATEADD(mi,1439,CONVERT(DATETIME, @end_date, 104))

    group BY l2n.NumML
    )t1 left join Osnova t2 on t1.numml = t2.numml
    where  
        cast(Round((case when (t1.all_time < t1.frozen)  
            then 0 else t1.all_time- t1.frozen end)/1440.0,2) 
            as NUMERIC(15,2)) > @DaysCount1
        and cast(Round((case when (t1.all_time < t1.frozen)  then 0 
            else t1.all_time- t1.frozen end)/1440.0,2) as NUMERIC(15,2)) < @DaysCount2