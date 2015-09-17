CREATE VIEW dbo.uslugi_old
AS
select row_number() over(order by l.signC3) as id, l.NumML as ml_num, l.zakazhcik,o.usluga, dbo.date(o.utverzh_b) as utver_date, l.signC3 as reason, dbo.date(l.signD1) as zamor_date
from List2Nav l
join Osnova o on o.NumML = l.NumML
where l.signC3 is not null
and l.signD1 is not null and l.signD2 is null
and l.signD1>convert(datetime, '01.01.2011', 104)  and o.Pre_Usluga = 'Прекращение услуги' and sdan is  null