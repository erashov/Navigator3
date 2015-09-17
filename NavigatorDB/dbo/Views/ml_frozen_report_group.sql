CREATE view dbo.ml_frozen_report_group as
select row_number() over (order by (select 1)) as id, freezeReason_short, disconnect,
sum(today) as today_num,
avg(case when today=0 then null else datediff(day, freezeDate, ISNULL(unfrozeDate, getdate())) end) as avg_frz_today,
sum(yesterday) as yesterday_num,
avg(case when yesterday=0 then null else datediff(day, freezeDate, ISNULL(unfrozeDate, getdate())) end) as avg_frz_yesterday
from ml_frozen_report
group by freezeReason_short, disconnect