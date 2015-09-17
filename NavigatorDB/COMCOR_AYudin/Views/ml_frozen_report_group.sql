--select datediff(day, '01.01.2011',  getdate())
create view [COMCOR\AYudin].ml_frozen_report_group
as
select freezeReason_short,
count(today) as today_num,
avg(case when today=0 then null else datediff(day, freezeDate, ISNULL(unfrozeDate, getdate())) end) as avg_frz_today,
count(yesterday) as yesterday_num,
avg(case when yesterday=0 then null else datediff(day, freezeDate, ISNULL(unfrozeDate, getdate())) end) as avg_frz_yesterday
from ml_frozen_report
group by freezeReason_short