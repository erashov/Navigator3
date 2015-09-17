CREATE VIEW dbo.freeze_new
AS
select row_number() over(order by freezeReason) as id, freezeReason as reason, count(*) as cnt, avg(datediff(minute, signD1, getdate()))/1440 as time
from
(select l.NumML, l.signC3, l.signD1,
ltrim(rtrim(case when charindex('<', l.signC3, 11)=0 then l.signC3 else substring(l.signC3, 0, charindex('<', l.signC3, 11)) end)) as freezeReason
from List2Nav l
join Osnova o on o.NumML = l.NumML
where l.signC3 is not null
and l.signD1 is not null and l.signD2 is null
and l.signD1>convert(datetime, '01.01.2011', 104) and o.Pre_Usluga = 'Новая услуга' and sdan is  null
) t
group by freezeReason