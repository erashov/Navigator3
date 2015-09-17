CREATE view [COMCOR\NSPolyakova].ml_frozen_report as
select row_number() over (order by (select 1)) as id, t2.* from
(select distinct m.numml, m.Zakazhcik, m.usluga, m.utverzh_b, m.signC3 as freezeReason, m.signD1 as freezeDate --, --m.freezereason
from
(
(
SELECT Numml,Zakazhcik,Usluga,Utverzh_b,signC3,signD1,--t.Pre_Usluga,
freezeReason, disconnect as pre_usluga
FROM dbo.ML_Frozen
)
union
(
select t.Numml,t.Zakazhcik, t.Usluga, t.Utverzh_B,t.signC3,t.signD1,--t.Pre_Usluga,
t.freezeReason, t.pre_usluga  from
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
                            charindex('***', y.signC3, 11)<charindex('<', y.signC3,                                     11)                        
                        then
                            substring(y.signC3, 0, charindex('***', y.signC3, 11))                        else
                            substring(y.signC3, 0, charindex('<', y.signC3, 11))
                        end
                    else
                        substring(y.signC3, 0, charindex('<', y.signC3, 11))
                    end
            end)) as freezeReason
from ML_Frozen_Past y join List2Nav l on l.NumML = y.NumML
join Osnova o on o.NumML = y.NumML
where y.signC3 not like '%Возврат%' and y.signC3 not like '%Вернуть%'
and y.signC3 like '<%'
)
union
(
select y.Numml, l.Zakazhcik, o.Usluga, o.Utverzh_B, --Zakazhcik,Usluga,Utverzh,
y.signC3, l.signD1,
case when o.Pre_Usluga='Прекращение услуги' then 1 else 0 end as pre_usluga, 
'<Заморозка> ' + ltrim(rtrim(case when charindex('=>', y.signC3, 11)=0 then y.signC3 else substring(y.signC3, (charindex('УСП', y.signC3, 1)), charindex('=>', y.signC3, 1)-(charindex('УСП', y.signC3, 1))) end)) as freezeReason
from ML_Frozen_Past y join List2Nav l on l.NumML = y.NumML
join Osnova o on o.NumML = y.NumML
where y.signC3 like '%УСП%' 
and not y.signC3 like '<Заморозка>%'
)
)t
))m)t2
--where m.freezereason like '<Заморозка> УШТУ. Перерыв связи' and m.pre_usluga = 1