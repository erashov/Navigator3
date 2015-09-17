CREATE VIEW Freeze_reasons
as
select freezeReason, disconnect, count(*) n, avg(datediff(minute, signD1, getdate()))/1440 as avg_frz_TIME
from
    ML_Frozen
group by disconnect, freezeReason