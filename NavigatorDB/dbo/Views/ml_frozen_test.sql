CREATE view dbo.ml_frozen_test as
select row_number() over (order by (select 1)) as id, t2.*,
case when n in (1, 3) then 1 else 0 end as today,
case when n in (2, 3) then 1 else 0 end as yesterday,
(select signD2 from List2Nav ll where ll.NumML = t2.NumML) as unfrozeDate
from
(
select m.numml, m.Zakazhcik, m.usluga, m.utverzh_b, m.signC3 as freezeReason, freezeReason as freezeReason_short, m.signD1 as freezeDate,
pre_usluga as disconnect, sum(n) as n
from
(
(
SELECT Numml,Zakazhcik,Usluga,Utverzh_b,signC3,signD1,--t.Pre_Usluga,
freezeReason, disconnect as pre_usluga, 1 as n
FROM dbo.ML_Frozen
)
union
(
select t.Numml,t.Zakazhcik, t.Usluga, t.Utverzh_B,t.signC3,t.signD1,
t.freezeReason, t.pre_usluga, 2 as n  from
(
(
select y.Numml, l.Zakazhcik, o.Usluga, o.Utverzh_B, y.signC3, l.signD1,
case when o.Pre_Usluga='Прекращение услуги' then 1 else 0 end as pre_usluga, 
ltrim(rtrim(
            case 
                when charindex('<', y.signC3, 11)=0 then 
                    case 
                        when charindex('***', y.signC3, 11)<>0 then
                           substring(y.signC3, 0, charindex('***', y.signC3, 11)) 
                    else
                        y.signC3
                    end
            else
                case
                    when charindex('***', y.signC3, 11)<>0 then
                        case 
                        when 
                            charindex('***', y.signC3, 11)<charindex('<', y.signC3, 11)                        
                        then
                            substring(y.signC3, 0, charindex('***', y.signC3, 11))
						else
                            substring(y.signC3, 0, charindex('<', y.signC3, 11))
                        end
                    else
                        substring(y.signC3, 0, charindex('<', y.signC3, 11))
                    end
            end)) as freezeReason
from (select * from ml_frozen_past where snapshot_date = cast(round(cast(getdate() as float), 0, 1) - 1 as datetime)) y join List2Nav l on l.NumML = y.NumML
join Osnova o on o.NumML = y.NumML
where y.signC3 not like '%Возврат%' and y.signC3 not like '%Вернуть%'
and y.signC3 like '<%'
)
union
(
select y.Numml, l.Zakazhcik, o.Usluga, o.Utverzh_B,
y.signC3, l.signD1,
case when o.Pre_Usluga='Прекращение услуги' then 1 else 0 end as pre_usluga, 
'<Заморозка> ' + ltrim(rtrim(case when charindex('=>', y.signC3, 11)=0 then y.signC3 else substring(y.signC3, (charindex('УСП', y.signC3, 1)), charindex('=>', y.signC3, 1)-(charindex('УСП', y.signC3, 1))) end)) as freezeReason
from (select * from ml_frozen_past where snapshot_date = cast(round(cast(getdate() as float), 0, 1) - 1 as datetime)) y join List2Nav l on l.NumML = y.NumML
join Osnova o on o.NumML = y.NumML
where y.signC3 like '%УСП%' 
and not y.signC3 like '<Заморозка>%'
)
)t
))m
group by m.numml, m.Zakazhcik, m.usluga, m.utverzh_b, m.signC3, m.freezeReason, m.signD1, pre_usluga
)t2
