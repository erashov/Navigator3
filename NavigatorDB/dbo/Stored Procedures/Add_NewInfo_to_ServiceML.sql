
CREATE procedure [dbo].[Add_NewInfo_to_ServiceML]
as
--вставка новых строк--------------------------------------------------------------------------------------------------
declare @numML int
DECLARE my_Cursor_num CURSOR FOR select NumML from Navigator_test.dbo.List2Nav where  NumML not in (select distinct NumML from serviceML) order by NumML asc
OPEN my_Cursor_num
FETCH NEXT FROM my_Cursor_num into @numML
WHILE @@FETCH_STATUS = 0 
begin
print 'NumML='+cast(@numML as varchar(32));
insert into ServiceML (ID, TheServiceId, NavigatorId, NumML, sCode, NumServ, SpecobA, SpecobB, NumChA, NumChB, sCode_aServ, ch_o, reg)
select top 100 ROW_NUMBER() over(ORDER BY t.NumML ASC) as id, 
 t.TheServiceId, t.NavigatorId, t.NumML, t.sCode, t.NumServ, 
       case 
            when lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))) like '% %' 
            then replace(replace(replace(lower(left(replace(ltrim(rtrim(isnull(t.specob, t.NumCh))), ',', ''), charindex (' ', replace(ltrim(rtrim(isnull(t.specob, t.NumCh))), ',', ' '))-1)),'x', ''), 'х', ''), 'u', '')  
			---
			when (isnull(t.specob, t.NumCh) like '%xu%' or isnull(t.specob, t.NumCh) like '%хu%') and charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))), 'х', 'x'))!=1
			then replace(replace(
			lower(left(ltrim(rtrim(isnull(t.specob, t.NumCh))), charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumCh)))))),'xu', ''), 'хu', '')
			--
			when (isnull(t.specob, t.NumCh) like '%ux%' or isnull(t.specob, t.NumCh) like '%uх%') and charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumCh))))!=1
			then replace(replace(
			lower(left(ltrim(rtrim(isnull(t.specob, t.NumCh))), charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))), 'х', 'x')))),'ux', ''), 'uх', '')
			--
			when isnull(t.specob, t.NumCh) like '%x%' and charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))), 'х', 'x'))!=1
			then replace(replace(lower(left (isnull(t.specob, t.NumCh), charindex ('x', isnull(t.specob, t.NumCh)))),'x', ''), 'х', '')
			--
			when isnull(t.specob, t.NumCh) like '%u%' and charindex ('u',lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))))!=1
			then lower(left (isnull(t.specob, t.NumCh), charindex ('u', isnull(t.specob, t.NumCh))))
			--
			when lower(isnull(t.specob, t.NumCh)) like '%,%'
			then lower(left(isnull(t.specob, t.NumCh), charindex (',', isnull(t.specob, t.NumCh))-1))
			else replace(replace(replace(cast (lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))) as  nvarchar (50)), 'x', ''), 'х', ''), 'u', '') end as SpecobA, 
       case 
            when lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))) like '% %' 
            then  replace(replace(ltrim(rtrim(lower(right(replace(isnull(t.specob, t.NumCh), ',', ' '), len(ltrim(rtrim(replace(isnull(t.specob, t.NumCh), ',', ' ')))) - charindex (' ', replace(replace(ltrim(rtrim(isnull(t.specob, t.NumCh))),'x', ''), 'х', '')))))),'x', ''), 'х', '')
			--
			when (isnull(t.specob, t.NumCh) like '%xu%' or isnull(t.specob, t.NumCh) like '%хu%') and charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))), 'х', 'x'))!=1 
			then replace(replace(ltrim(rtrim(lower(right(isnull(t.specob, t.NumCh), len(ltrim(rtrim(isnull(t.specob, t.NumCh))))- charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumCh)))))))),'xu', ''), 'хu', '')
            --
			when (isnull(t.specob, t.NumCh) like '%ux%' or isnull(t.specob, t.NumCh) like '%uх%') and charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))), 'х', 'x'))!=1 
			then replace(replace(ltrim(rtrim(lower(right(isnull(t.specob, t.NumCh), len(ltrim(rtrim(isnull(t.specob, t.NumCh))))- charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumCh)))))))),'xu', ''), 'хu', '')
            --
			when isnull(t.specob, t.NumCh) like '%x%' and charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))), 'х', 'x'))!=1
			then  replace(replace(ltrim(rtrim(lower(right(isnull(t.specob, t.NumCh), len(ltrim(rtrim(isnull(t.specob, t.NumCh))))- charindex ('x', ltrim(rtrim(isnull(t.specob, t.NumCh)))))))),'x', ''), 'х', '')
			--
			when isnull(t.specob, t.NumCh) like '%u%' and charindex ('u',lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))))!=1
			then  ltrim(rtrim(lower(right(isnull(t.specob, t.NumCh), len(ltrim(rtrim(isnull(t.specob, t.NumCh))))- charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumCh))))))))
			--
			when lower(isnull(t.specob, t.NumCh)) like '%,%'
            then lower(right(isnull(t.specob, t.NumCh), len(ltrim(rtrim(isnull(t.specob, t.NumCh)))) - charindex (',', ltrim(rtrim(isnull(t.specob, t.NumCh))))))
			else null end as SpecobB,
       case 
            when lower(ltrim(rtrim(isnull(t.specob, t.NumChAct)))) like '% %' 
            then lower(left(replace(ltrim(rtrim(isnull(t.specob, t.NumChAct))), ',', ''), charindex (' ', replace(ltrim(rtrim(isnull(t.specob, t.NumChAct))), ',', ' '))-1))
			--
            when (isnull(t.specob, t.NumChAct) like '%xu%' or isnull(t.specob, t.NumChAct) like '%хu%') and charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumChAct)))), 'х', 'x'))!=1
			then lower(left(ltrim(rtrim(isnull(t.specob, t.NumChAct))), charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumChAct))))))
			--
			when (isnull(t.specob, t.NumChAct) like '%ux%' or isnull(t.specob, t.NumChAct) like '%uх%') and charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumChAct))))!=1
			then lower(left(ltrim(rtrim(isnull(t.specob, t.NumChAct))), charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumChAct)))), 'х', 'x'))))
			--
			when isnull(t.specob, t.NumChAct) like '%x%' and charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumChAct)))), 'х', 'x'))!=1
			then lower(left(replace(isnull(t.specob, t.NumChAct), 'х', 'x'), charindex ('x', replace(isnull(t.specob, t.NumChAct), 'х', 'x'))))
            --
            when isnull(t.specob, t.NumChAct) like '%u%' and charindex ('u',lower(ltrim(rtrim(isnull(t.specob, t.NumChAct)))))!=1
			then lower(left(isnull(t.specob, t.NumChAct), charindex ('u', isnull(t.specob, t.NumChAct))))
            --
            when lower(isnull(t.specob, t.NumChAct)) like '%,%'
            then lower(left(isnull(t.specob, t.NumChAct), charindex (',', isnull(t.specob, t.NumChAct))-1))
			else cast (lower(isnull(t.specob, t.NumChAct)) as  nvarchar (50)) end as NumChA, 
       case 
            when lower(ltrim(rtrim(isnull(t.specob, t.NumChAct)))) like '% %' 
            then lower(right(replace(isnull(t.specob, t.NumChAct), ',', ' '), len(ltrim(rtrim(replace(isnull(t.specob, t.NumChAct), ',', ' ')))) - charindex (' ', replace(ltrim(rtrim(isnull(t.specob, t.NumChAct))), ',', ' '))))
			--
			when lower(isnull(t.specob, t.NumChAct)) like '%,%'
            then lower(right(isnull(t.specob, t.NumChAct), len(ltrim(rtrim(isnull(t.specob, t.NumChAct)))) - charindex (',', ltrim(rtrim(isnull(t.specob, t.NumChAct))))))
			--
			when (isnull(t.specob, t.NumChAct) like '%xu%' or isnull(t.specob, t.NumChAct) like '%хu%') and charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumChAct)))), 'х', 'x'))!=1
			then ltrim(rtrim(lower(right(isnull(t.specob, t.NumChAct), len(ltrim(rtrim(isnull(t.specob, t.NumChAct))))- charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumChAct))))))))
            --
            when (isnull(t.specob, t.NumChAct) like '%ux%' or isnull(t.specob, t.NumChAct) like '%uх%') and charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumChAct))))!=1
			then ltrim(rtrim(lower(right(isnull(t.specob, t.NumChAct), len(ltrim(rtrim(isnull(t.specob, t.NumChAct))))- charindex('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumChAct)))), 'х', 'x'))))))
            --
            when (lower(isnull(t.specob, t.NumChAct)) like '%x%' or  lower(isnull(t.specob, t.NumChAct)) like '%х%') and len(ltrim(rtrim(isnull(t.specob, t.NumChAct))))!=charindex ('x', replace(ltrim(rtrim(isnull(t.specob, t.NumChAct))), 'х', 'x')) and charindex ('x', replace(ltrim(rtrim(isnull(t.specob, t.NumChAct))), 'х', 'x'))!=1
            then lower(right(replace(isnull(t.specob, t.NumChAct), 'х', 'x'),  len(ltrim(rtrim(isnull(t.specob, t.NumChAct)))) - charindex ('x', replace(ltrim(rtrim(isnull(t.specob, t.NumChAct))), 'х', 'x')) ))
            --
			when (lower(isnull(t.specob, t.NumChAct)) like '%u%' or  lower(isnull(t.specob, t.NumChAct)) like '%u%') and len(ltrim(rtrim(isnull(t.specob, t.NumChAct))))!=charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumChAct)))) and charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumChAct))))!=1
            then lower(right(isnull(t.specob, t.NumChAct),  len(ltrim(rtrim(isnull(t.specob, t.NumChAct)))) - charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumChAct)))) ))
            --
			else null end as NumChB , 
            sCode_aServ,
            ch_o,
            reg	 			       

from
(
select 
       s.Id as TheServiceId, 
       s.NavigatorId as NavigatorId, 
       nl.NumML as NumML, 
       lower(s.sCode) as sCode, 
isnull(replace(replace(replace(rtrim(ltrim(case 
				when lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' 
				then cast (isnull(lower(p), lower(i)) as varchar(50))
				when lower(nl.[Usluga]) not like '%b%' and lower(nl.[Usluga]) not like '%a%' and lower(nl.[Usluga]) not like '%p%' and 
				lower(nl.[Usluga]) not like '%i%' and lower(nl.[Usluga]) not like '%g%'  and lower(nl.[Usluga]) not like '%nф%' and lower(nl.[Usluga]) like '%e%' 
				then cast (lower(e) as varchar (50))
				when lower(nl.[Usluga]) not like '%b%' and lower(nl.[Usluga]) not like '%a%' and lower(nl.[Usluga]) not like '%p%'  and 
				lower(nl.[Usluga]) not like '%i%' and lower(nl.[Usluga]) not like '%g%'  and lower(nl.[Usluga]) not like '%nф%' and lower(nl.[Usluga]) like '%s%' 
				then cast (lower(s) as varchar (50))
				when lower(nl.[Usluga]) not like '%b%' and lower(nl.[Usluga]) not like '%a%' and lower(nl.[Usluga]) not like '%p%' and lower(nl.[Usluga]) not like '%g%' and 
				(lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(i) as varchar (50))
				when lower(nl.[Usluga]) like '%l%' 
				then cast (lower(l) as varchar (50))
				when lower(nl.[Usluga]) like '%v%' 
				then cast (lower(v) as varchar (50))
				when lower(nl.[Usluga]) like '%p%' 
				then cast (lower(p) as varchar (50))
				when lower(nl.[Usluga]) like '%t%' 
				then cast (lower(t) as varchar (50))                        
				when lower(nl.[Usluga]) like '%k%' 
				then cast (lower(specob) as varchar (50))
				when lower(nl.[Usluga]) like '%nф%' 
				then cast (lower(n) as varchar (50))
				when lower(nl.[Usluga]) like '%o%' 
				then cast (lower(t) as varchar (50))
				when lower(nl.[Usluga]) like '%s%' 
				then cast (lower(s) as varchar (50))
				when lower(nl.[Usluga]) like '%e%' 
				then cast (lower(e) as varchar (50))
				when lower(nl.[Usluga]) like '%z%' 
				then cast (lower(q) as varchar (50))
				else 'not' end)), 'x', ''), 'х', ''), 'u', ''), 'not') as NumServ,
				 
				isnull(replace(replace(replace(rtrim(ltrim(case 
				when lower(nl.[Usluga]) like '%v%' 
				then cast (lower(p) as varchar (50))
				when lower(nl.[Usluga]) like '%t%' 
				then cast (lower(t) as varchar (50))                        
				when lower(nl.[Usluga]) like '%k%' 
				then cast (lower(specob) as varchar (50))
				when lower(nl.[Usluga]) like '%s%' 
				then cast (lower(s) as varchar (50))
				when lower(nl.[Usluga]) like '%e%' 
				then cast (lower(e) as varchar (50))
				when isnull(fe, '')!='' and lower(nl.[Usluga]) like '%ф%'
				then cast (lower(fe) as varchar (50))
				when isnull(t, '')!='' and lower(nl.[Usluga]) like '%ф%' 
				then cast (lower(t) as varchar (50))
				when isnull(e, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(e) as varchar (50))
				when isnull(s, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(s) as varchar (50))
				when isnull(t, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(t) as varchar (50))
				when lower(nl.[Usluga]) like '%o%' 
				then cast (lower(t) as varchar (50))
				when isnull(e, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(e) as varchar(50))
				when isnull(s, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(s) as varchar(50))
				when isnull(t, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(t) as varchar(50))
				when isnull(specob, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(specob) as varchar(50))
				else '' end)), '.',' '), '-', ' '), '…', ' '),'') as NumChAct,
				
				isnull(replace(replace(replace(replace(replace(replace(rtrim(ltrim(case 
				when lower(nl.[Usluga]) like '%v%' 
				then cast (lower(p) as varchar (50))
				when lower(nl.[Usluga]) like '%t%' 
				then cast (lower(t) as varchar (50))                        
				when lower(nl.[Usluga]) like '%k%' 
				then cast (lower(specob) as varchar (50))
				when lower(nl.[Usluga]) like '%s%' 
				then cast (lower(s) as varchar (50))
				when lower(nl.[Usluga]) like '%e%' 
				then cast (lower(e) as varchar (50))
				when isnull(fe, '')!='' and lower(nl.[Usluga]) like '%ф%'
				then cast (lower(fe) as varchar (50))
				when isnull(t, '')!='' and lower(nl.[Usluga]) like '%ф%' 
				then cast (lower(t) as varchar (50))
				when isnull(e, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(e) as varchar (50))
				when isnull(s, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(s) as varchar (50))
				when isnull(t, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(t) as varchar (50))
				when lower(nl.[Usluga]) like '%o%' 
				then cast (lower(t) as varchar (50))
				when isnull(e, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(e) as varchar(50))
				when isnull(s, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(s) as varchar(50))
				when isnull(t, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(t) as varchar(50))
				when isnull(specob, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(specob) as varchar(50))
				else '' end)), 'x', ''), 'х', ''), 'u', ''), '.',' '), '-', ' '), '…', ' '), '') as NumCh,
				specob,
				sa.sCode as sCode_aServ,
				case when replace(replace(replace(rtrim(ltrim(t)), 'x', ''), 'u', ''),'х', '')	like '%o%'	
				     then
				     replace(replace(replace(rtrim(ltrim(t)), 'x', ''), 'u', ''),'х', '')
				     else
				     null
				     end
				as ch_o,
				case when replace(replace(replace(rtrim(ltrim(cr)), 'x', ''), 'u', ''),'х', '') like '%reg%' 
				     then
				          replace(replace(replace(rtrim(ltrim(cr)), 'x', ''), 'u', ''),'х', '')
				     else
				          null
				     end
			    as reg     
from Navigator_test.dbo.List2Nav nl
left join ComFlow.dbo.Navigator_test_numML n  on nl.NumML=n.NumML
left join ComFlow.dbo.TheService s on n.TheServiceId=s.Id
left join Comflow.dbo.aService sa on sa.Id=s.aServiceId
) t where NumML=@numML

--------------------Обновление Адресов--------------------------------------------------------------------------------
--------------------ML & TL from list2Nav
begin
update ServiceML  set AddressA=l.AdresA, AddressB=l.AdresB
from (select AdresA, AdresB, NumMl from list2Nav)l where l.NumML=ServiceMl.NumML and ServiceMl.NumML=@numML
end
---------------------TL from last ML
if @numML<0 or @numML>=1000000
begin
update ServiceML  set AddressA=l.AdresA, AddressB=l.AdresB
from (select top 1 l2n.AdresA, l2n.AdresB, l2n.NumML 
from ServiceML sml join List2Nav l2n on sml.NumML=l2n.NumML 
join Comflow.dbo.TheService ts on sml.TheServiceId=ts.Id where sml.id = (select id from ServiceML where NumML=@numML)
and (l2n.NumML>=0 and l2n.NumML<1000000) 
order by  TopML desc, isnull(sdan_ts,sdan) desc,  case when EnhTo is null then 1 else 0 end desc, EnhTo desc, l2n.numML desc)l
where l.AdresB is not null and ServiceMl.NumML=@numML
end


----------------------------------------------------------------------------------------------------------------------

FETCH NEXT FROM my_Cursor_num into @numML
end
CLOSE my_Cursor_num ;
DEALLOCATE my_Cursor_num;


---------------------Обновление Таскома -------------------------------------------------------------------------------
DECLARE @min_id int
DECLARE @max_id int
declare @i int
declare @c int
set @i=0
set @c=(select isnull(max(c), 0) from ( select count(*) c from List2Nav l2n join ServiceML sml on sml.NumML=l2n.NumML 
        where l2n.NumML>0 and l2n.NumML<1000000 and l2n.usluga is null and  l2n.NTelef like '%Таском%'
        group by AdresA, AdresB, Zakazhcik, NTelef, Skorost having count(*)>1 and min(id)!=max(id)) a )--
while @i<@c 
begin
PRINT 'PRINT '+cast(@i as  varchar(32))+'<'+cast(@c as  varchar(32))
DECLARE my_Cursor_27 CURSOR FOR  select  min(sml.id), max(sml.id) from List2Nav l2n
join ServiceML sml on sml.NumML=l2n.NumML where l2n.NumML>0 and l2n.NumML<1000000 and l2n.usluga is null and  l2n.NTelef like '%Таском%'
group by AdresA, AdresB, Zakazhcik, NTelef, Skorost having count(*)>1 and min(id)!=max(id) --and min(id)=95548
OPEN my_Cursor_27
FETCH NEXT FROM my_Cursor_27 into @min_id, @max_id
WHILE @@FETCH_STATUS = 0 
BEGIN ;
  PRINT 'update serviceML set id='+cast(@min_id as varchar(32))+' where id='+cast(@max_id as varchar(32))
  update serviceML set id=@min_id where id=@max_id
  FETCH NEXT FROM my_Cursor_27 into @min_id, @max_id
END ;
CLOSE my_Cursor_27 ;
DEALLOCATE my_Cursor_27;
set @i=@i+1
end


----------------------Обновление названия услуги и каналов------------------------------------------------------------------
update ServiceML set SpecobA=a.SpecobA, SpecobB=a.SpecobB, NumChA=a.NumChA, NumChB=a.NumChB, ch_o=a.ch_o, reg=a.reg, 
NumServ=a.NumServ
from 
(
select t1.*
from 
(
select  ROW_NUMBER() over(ORDER BY t.NumML ASC) as id, 
 t.TheServiceId, t.NavigatorId, t.NumML, t.sCode, t.NumServ, 
       case 
            when lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))) like '% %' 
            then replace(replace(replace(lower(left(replace(ltrim(rtrim(isnull(t.specob, t.NumCh))), ',', ''), charindex (' ', replace(ltrim(rtrim(isnull(t.specob, t.NumCh))), ',', ' '))-1)),'x', ''), 'х', ''), 'u', '')  
			---
			when (isnull(t.specob, t.NumCh) like '%xu%' or isnull(t.specob, t.NumCh) like '%хu%') and charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))), 'х', 'x'))!=1
			then replace(replace(
			lower(left(ltrim(rtrim(isnull(t.specob, t.NumCh))), charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumCh)))))),'xu', ''), 'хu', '')
			--
			when (isnull(t.specob, t.NumCh) like '%ux%' or isnull(t.specob, t.NumCh) like '%uх%') and charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumCh))))!=1
			then replace(replace(
			lower(left(ltrim(rtrim(isnull(t.specob, t.NumCh))), charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))), 'х', 'x')))),'ux', ''), 'uх', '')
			--
			when isnull(t.specob, t.NumCh) like '%x%' and charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))), 'х', 'x'))!=1
			then replace(replace(lower(left (isnull(t.specob, t.NumCh), charindex ('x', isnull(t.specob, t.NumCh)))),'x', ''), 'х', '')
			--
			when isnull(t.specob, t.NumCh) like '%u%' and charindex ('u',lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))))!=1
			then lower(left (isnull(t.specob, t.NumCh), charindex ('u', isnull(t.specob, t.NumCh))))
			--
			when lower(isnull(t.specob, t.NumCh)) like '%,%'
			then lower(left(isnull(t.specob, t.NumCh), charindex (',', isnull(t.specob, t.NumCh))-1))
			else replace(replace(replace(cast (lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))) as  nvarchar (50)), 'x', ''), 'х', ''), 'u', '') end as SpecobA, 
       case 
            when lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))) like '% %' 
            then  replace(replace(ltrim(rtrim(lower(right(replace(isnull(t.specob, t.NumCh), ',', ' '), len(ltrim(rtrim(replace(isnull(t.specob, t.NumCh), ',', ' ')))) - charindex (' ', replace(replace(ltrim(rtrim(isnull(t.specob, t.NumCh))),'x', ''), 'х', '')))))),'x', ''), 'х', '')
			--
			when (isnull(t.specob, t.NumCh) like '%xu%' or isnull(t.specob, t.NumCh) like '%хu%') and charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))), 'х', 'x'))!=1 
			then replace(replace(ltrim(rtrim(lower(right(isnull(t.specob, t.NumCh), len(ltrim(rtrim(isnull(t.specob, t.NumCh))))- charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumCh)))))))),'xu', ''), 'хu', '')
            --
			when (isnull(t.specob, t.NumCh) like '%ux%' or isnull(t.specob, t.NumCh) like '%uх%') and charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))), 'х', 'x'))!=1 
			then replace(replace(ltrim(rtrim(lower(right(isnull(t.specob, t.NumCh), len(ltrim(rtrim(isnull(t.specob, t.NumCh))))- charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumCh)))))))),'xu', ''), 'хu', '')
            --
			when isnull(t.specob, t.NumCh) like '%x%' and charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))), 'х', 'x'))!=1
			then  replace(replace(ltrim(rtrim(lower(right(isnull(t.specob, t.NumCh), len(ltrim(rtrim(isnull(t.specob, t.NumCh))))- charindex ('x', ltrim(rtrim(isnull(t.specob, t.NumCh)))))))),'x', ''), 'х', '')
			--
			when isnull(t.specob, t.NumCh) like '%u%' and charindex ('u',lower(ltrim(rtrim(isnull(t.specob, t.NumCh)))))!=1
			then  ltrim(rtrim(lower(right(isnull(t.specob, t.NumCh), len(ltrim(rtrim(isnull(t.specob, t.NumCh))))- charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumCh))))))))
			--
			when lower(isnull(t.specob, t.NumCh)) like '%,%'
            then lower(right(isnull(t.specob, t.NumCh), len(ltrim(rtrim(isnull(t.specob, t.NumCh)))) - charindex (',', ltrim(rtrim(isnull(t.specob, t.NumCh))))))
			else null end as SpecobB,
       case 
            when lower(ltrim(rtrim(isnull(t.specob, t.NumChAct)))) like '% %' 
            then lower(left(replace(ltrim(rtrim(isnull(t.specob, t.NumChAct))), ',', ''), charindex (' ', replace(ltrim(rtrim(isnull(t.specob, t.NumChAct))), ',', ' '))-1))
			--
            when (isnull(t.specob, t.NumChAct) like '%xu%' or isnull(t.specob, t.NumChAct) like '%хu%') and charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumChAct)))), 'х', 'x'))!=1
			then lower(left(ltrim(rtrim(isnull(t.specob, t.NumChAct))), charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumChAct))))))
			--
			when (isnull(t.specob, t.NumChAct) like '%ux%' or isnull(t.specob, t.NumChAct) like '%uх%') and charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumChAct))))!=1
			then lower(left(ltrim(rtrim(isnull(t.specob, t.NumChAct))), charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumChAct)))), 'х', 'x'))))
			--
			when isnull(t.specob, t.NumChAct) like '%x%' and charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumChAct)))), 'х', 'x'))!=1
			then lower(left(replace(isnull(t.specob, t.NumChAct), 'х', 'x'), charindex ('x', replace(isnull(t.specob, t.NumChAct), 'х', 'x'))))
            --
            when isnull(t.specob, t.NumChAct) like '%u%' and charindex ('u',lower(ltrim(rtrim(isnull(t.specob, t.NumChAct)))))!=1
			then lower(left(isnull(t.specob, t.NumChAct), charindex ('u', isnull(t.specob, t.NumChAct))))
            --
            when lower(isnull(t.specob, t.NumChAct)) like '%,%'
            then lower(left(isnull(t.specob, t.NumChAct), charindex (',', isnull(t.specob, t.NumChAct))-1))
			else cast (lower(isnull(t.specob, t.NumChAct)) as  nvarchar (50)) end as NumChA, 
       case 
            when lower(ltrim(rtrim(isnull(t.specob, t.NumChAct)))) like '% %' 
            then lower(right(replace(isnull(t.specob, t.NumChAct), ',', ' '), len(ltrim(rtrim(replace(isnull(t.specob, t.NumChAct), ',', ' ')))) - charindex (' ', replace(ltrim(rtrim(isnull(t.specob, t.NumChAct))), ',', ' '))))
			--
			when lower(isnull(t.specob, t.NumChAct)) like '%,%'
            then lower(right(isnull(t.specob, t.NumChAct), len(ltrim(rtrim(isnull(t.specob, t.NumChAct)))) - charindex (',', ltrim(rtrim(isnull(t.specob, t.NumChAct))))))
			--
			when (isnull(t.specob, t.NumChAct) like '%xu%' or isnull(t.specob, t.NumChAct) like '%хu%') and charindex ('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumChAct)))), 'х', 'x'))!=1
			then ltrim(rtrim(lower(right(isnull(t.specob, t.NumChAct), len(ltrim(rtrim(isnull(t.specob, t.NumChAct))))- charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumChAct))))))))
            --
            when (isnull(t.specob, t.NumChAct) like '%ux%' or isnull(t.specob, t.NumChAct) like '%uх%') and charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumChAct))))!=1
			then ltrim(rtrim(lower(right(isnull(t.specob, t.NumChAct), len(ltrim(rtrim(isnull(t.specob, t.NumChAct))))- charindex('x',replace(lower(ltrim(rtrim(isnull(t.specob, t.NumChAct)))), 'х', 'x'))))))
            --
            when (lower(isnull(t.specob, t.NumChAct)) like '%x%' or  lower(isnull(t.specob, t.NumChAct)) like '%х%') and len(ltrim(rtrim(isnull(t.specob, t.NumChAct))))!=charindex ('x', replace(ltrim(rtrim(isnull(t.specob, t.NumChAct))), 'х', 'x')) and charindex ('x', replace(ltrim(rtrim(isnull(t.specob, t.NumChAct))), 'х', 'x'))!=1
            then lower(right(replace(isnull(t.specob, t.NumChAct), 'х', 'x'),  len(ltrim(rtrim(isnull(t.specob, t.NumChAct)))) - charindex ('x', replace(ltrim(rtrim(isnull(t.specob, t.NumChAct))), 'х', 'x')) ))
            --
			when (lower(isnull(t.specob, t.NumChAct)) like '%u%' or  lower(isnull(t.specob, t.NumChAct)) like '%u%') and len(ltrim(rtrim(isnull(t.specob, t.NumChAct))))!=charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumChAct)))) and charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumChAct))))!=1
            then lower(right(isnull(t.specob, t.NumChAct),  len(ltrim(rtrim(isnull(t.specob, t.NumChAct)))) - charindex ('u', ltrim(rtrim(isnull(t.specob, t.NumChAct)))) ))
            --
			else null end as NumChB,
			ch_o,
			reg  
from
(
select 
       s.Id as TheServiceId, 
       s.NavigatorId as NavigatorId, 
       nl.NumML as NumML, 
       lower(s.sCode) as sCode, 
       isnull(replace(replace(replace(rtrim(ltrim(case 
				when lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' 
				then cast (isnull(lower(p), lower(i)) as varchar(50))
				when lower(nl.[Usluga]) not like '%b%' and lower(nl.[Usluga]) not like '%a%' and lower(nl.[Usluga]) not like '%p%' and 
				lower(nl.[Usluga]) not like '%i%' and lower(nl.[Usluga]) not like '%g%'  and lower(nl.[Usluga]) not like '%nф%' and lower(nl.[Usluga]) like '%e%' 
				then cast (lower(e) as varchar (50))
				when lower(nl.[Usluga]) not like '%b%' and lower(nl.[Usluga]) not like '%a%' and lower(nl.[Usluga]) not like '%p%'  and 
				lower(nl.[Usluga]) not like '%i%' and lower(nl.[Usluga]) not like '%g%'  and lower(nl.[Usluga]) not like '%nф%' and lower(nl.[Usluga]) like '%s%' 
				then cast (lower(s) as varchar (50))
				when lower(nl.[Usluga]) not like '%b%' and lower(nl.[Usluga]) not like '%a%' and lower(nl.[Usluga]) not like '%p%' and lower(nl.[Usluga]) not like '%g%' and 
				(lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(i) as varchar (50))
				when lower(nl.[Usluga]) like '%l%' 
				then cast (lower(l) as varchar (50))
				when lower(nl.[Usluga]) like '%v%' 
				then cast (lower(v) as varchar (50))
				when lower(nl.[Usluga]) like '%p%' 
				then cast (lower(p) as varchar (50))
				when lower(nl.[Usluga]) like '%t%' 
				then cast (lower(t) as varchar (50))                        
				when lower(nl.[Usluga]) like '%k%' 
				then cast (lower(specob) as varchar (50))
				when lower(nl.[Usluga]) like '%nф%' 
				then cast (lower(n) as varchar (50))
				when lower(nl.[Usluga]) like '%o%' 
				then cast (lower(t) as varchar (50))
				when lower(nl.[Usluga]) like '%s%' 
				then cast (lower(s) as varchar (50))
				when lower(nl.[Usluga]) like '%e%' 
				then cast (lower(e) as varchar (50))
				when lower(nl.[Usluga]) like '%z%' 
				then cast (lower(q) as varchar (50))
				else 'not' end)), 'x', ''), 'х', ''), 'u', ''), 'not') as NumServ,
				 
				isnull(replace(replace(replace(rtrim(ltrim(case 
				when lower(nl.[Usluga]) like '%v%' 
				then cast (lower(p) as varchar (50))
				when lower(nl.[Usluga]) like '%t%' 
				then cast (lower(t) as varchar (50))                        
				when lower(nl.[Usluga]) like '%k%' 
				then cast (lower(specob) as varchar (50))
				when lower(nl.[Usluga]) like '%s%' 
				then cast (lower(s) as varchar (50))
				when lower(nl.[Usluga]) like '%e%' 
				then cast (lower(e) as varchar (50))
				when isnull(fe, '')!='' and lower(nl.[Usluga]) like '%ф%'
				then cast (lower(fe) as varchar (50))
				when isnull(t, '')!='' and lower(nl.[Usluga]) like '%ф%' 
				then cast (lower(t) as varchar (50))
				when isnull(e, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(e) as varchar (50))
				when isnull(s, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(s) as varchar (50))
				when isnull(t, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(t) as varchar (50))
				when lower(nl.[Usluga]) like '%o%' 
				then cast (lower(t) as varchar (50))
				when isnull(e, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(e) as varchar(50))
				when isnull(s, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(s) as varchar(50))
				when isnull(t, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(t) as varchar(50))
				when isnull(specob, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(specob) as varchar(50))
				else '' end)), '.',' '), '-', ' '), '…', ' '),'') as NumChAct,
				
				isnull(replace(replace(replace(replace(replace(replace(rtrim(ltrim(case 
				when lower(nl.[Usluga]) like '%v%' 
				then cast (lower(p) as varchar (50))
				when lower(nl.[Usluga]) like '%t%' 
				then cast (lower(t) as varchar (50))                        
				when lower(nl.[Usluga]) like '%k%' 
				then cast (lower(specob) as varchar (50))
				when lower(nl.[Usluga]) like '%s%' 
				then cast (lower(s) as varchar (50))
				when lower(nl.[Usluga]) like '%e%' 
				then cast (lower(e) as varchar (50))
				when isnull(fe, '')!='' and lower(nl.[Usluga]) like '%ф%'
				then cast (lower(fe) as varchar (50))
				when isnull(t, '')!='' and lower(nl.[Usluga]) like '%ф%' 
				then cast (lower(t) as varchar (50))
				when isnull(e, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(e) as varchar (50))
				when isnull(s, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(s) as varchar (50))
				when isnull(t, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(t) as varchar (50))
				when lower(nl.[Usluga]) like '%o%' 
				then cast (lower(t) as varchar (50))
				when isnull(e, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(e) as varchar(50))
				when isnull(s, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(s) as varchar(50))
				when isnull(t, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(t) as varchar(50))
				when isnull(specob, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(specob) as varchar(50))
				else '' end)), 'x', ''), 'х', ''), 'u', ''), '.',' '), '-', ' '), '…', ' '), '') as NumCh,
				specob,
				case when replace(replace(replace(rtrim(ltrim(t)), 'x', ''), 'u', ''),'х', '')	like '%o%'	
				     then
				     replace(replace(replace(rtrim(ltrim(t)), 'x', ''), 'u', ''),'х', '')
				     else
				     null
				     end
				as ch_o,
				case when replace(replace(replace(rtrim(ltrim(cr)), 'x', ''), 'u', ''),'х', '') like '%reg%' 
				     then
				          replace(replace(replace(rtrim(ltrim(cr)), 'x', ''), 'u', ''),'х', '')
				     else
				          null
				     end
			    as reg		
from Navigator_test.dbo.List2Nav nl
left join ComFlow.dbo.Navigator_test_numML n  on nl.NumML=n.NumML
left join ComFlow.dbo.TheService s on n.TheServiceId=s.Id
) t 
)t1 join ServiceML s on t1.NumML=s.NumML
--join List2Nav ln on ln.NumML= t1.NumML
where s.NumServ!=t1.NumServ
or (s.SpecobA!=t1.SpecobA  or s.SpecobB!=t1.SpecobB  or s.NumChA!=t1.NumChA or s.NumChB!=t1.NumChB or isnull(s.ch_o, '')!=isnull(t1.ch_o, '') or isnull(s.reg, '')!=isnull(t1.reg, '')) --and t1.NumServ like 's%'
) a where a.NumML=ServiceML.NumML

----------------------             обновление типа услуг       -----------------------------------------------------------------
update ServiceML set sCode_aServ=a_sCode
from
(
select sm.*, sa.sCode a_sCode from ServiceML sm
join Comflow.dbo.TheService ts on ts.id=sm.TheServiceId
join Comflow.dbo.aService sa on ts.aServiceId=sa.id
where sCode_aServ is null) a
where a.TheServiceId=ServiceML.TheServiceId and a.NumMl=ServiceML.NumML


--------------------------------------------------------------------------------------------------------------------------------









