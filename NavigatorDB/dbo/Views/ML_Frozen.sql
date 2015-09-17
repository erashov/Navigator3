CREATE VIEW dbo.ML_Frozen as
(select l.NumML,l.zakazhcik,o.usluga, o.utverzh_b, l.signC3, l.signD1, 
case when o.Pre_Usluga = 'Прекращение услуги' then 1 else 0 end as disconnect,
ltrim(rtrim(
            case 
                when charindex('<', l.signC3, 11)=0 then 
                    case 
                        when charindex('***', l.signC3, 11)<>0 then
                           substring(l.signC3, 0, charindex('***', l.signC3, 11)) 
                    else
                        l.signC3
                    end
            else
                case
                    when charindex('***', l.signC3, 11)<>0 then
                        case 
                        when 
                            charindex('***', l.signC3, 11)<charindex('<', l.signC3,                                     11)                        
                        then
                            substring(l.signC3, 0, charindex('***', l.signC3, 11))                        else
                            substring(l.signC3, 0, charindex('<', l.signC3, 11))
                        end
                    else
                        substring(l.signC3, 0, charindex('<', l.signC3, 11))
                    end
            end)) as freezeReason
from List2Nav l
join Osnova o on o.NumML = l.NumML
where l.signC3 is not null
and l.signD1 is not null and (l.signD2 is null or l.signD2>getdate())
and sdan is  null
and l.signC3 not like '%Возврат%' and l.signC3 not like '%Вернуть%'
and l.signC3 like '<%'
)
union
(
select l.NumML,l.zakazhcik,o.usluga,o.utverzh_b, l.signC3, l.signD1, 
case when o.Pre_Usluga = 'Прекращение услуги' then 1 else 0 end as disconnect,
'<Заморозка> ' + ltrim(rtrim
                        (
                        case when charindex('=>', l.signC3, 11)=0 then l.signC3 
                        else substring(l.signC3, (charindex('УСП', l.signC3, 1)), charindex('=>', l.signC3, 1)-(charindex('УСП', l.signC3, 1)))
                        end)) as freezeReason
from List2Nav l
join Osnova o on o.NumML = l.NumML
where l.signC3 is not null
and l.signD1 is not null and (l.signD2 is null or l.signD2>getdate())
and sdan is  null
and l.signC3 like '%УСП%' 
and not l.signC3 like '<Заморозка>%'
)