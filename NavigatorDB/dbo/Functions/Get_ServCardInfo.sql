
CREATE FUNCTION [dbo].[Get_ServCardInfo] (@ml int)
RETURNS TABLE
AS
RETURN 
(
    select  case when c.NumServ like '%i%' then c.NumServ else upper(c.NumServ) end NumServ, c.is_null, c.EnhTo, c.NumML, c.Id_group, 
                isnull(kont_a.kontakt, Kontakt_l2n) as kontact_A,
                kont_b.kontakt as kontact_B, 
                line_a.markirovka as mark_A,
                line_b.markirovka as mark_B,
                isnull(o.Zakazchik, Zakazcik_l2n) Zakazchik, 
                case when o.Usluga like '%шлейф%' and o.Usluga is not null then o.Usluga+'('+o.Pre_Usluga+')'
                else isnull(o.Pre_Usluga, usluga_l2n) end Pre_Usluga, isnull(o.Adres_A, ch_addr_a) Adres_A, 
                isnull(o.Adres_B, ch_addr_b) Adres_B, o.Kontakt_ob, isnull(o.Utverzh_B, utverzh_l2n) Utverzh_B, o.skorost,
                c.ManagerId, c.Manager_Phone, c.Contract_Name, c.status, c.specobA, c.specobB,
                upper(c.NumChA) NumChA, upper(c.NumChB) NumChB, upper(c.VPN) VPN, c.sdan,
                mt.NomerKanala as NomerKanala_1, mt.AdresA as AdresA_1, mt.AdresB as AdresB_1, mt.PrivA as PrivA_1 , mt.PrivB as PrivB_1, 
                mt.PortVlan as PortVlan_1, mt.Vlan as Vlan_1, mt.res1 as res1_1, mt.res2 as res2_1, mt.prim as prim_1,
                mt.Astahov1 as Astahov1_1, mt.Astahov2 as Astahov2_1, mt.skorost skorost_mt_1, mt.Zakazchik Zakazchik_mt_1,
                mt_B.NomerKanala as NomerKanala_2, mt_B.AdresA as AdresA_2, mt_B.AdresB as AdresB_2, mt_B.PrivA as PrivA_2 , mt_B.PrivB as PrivB_2, 
                mt_B.PortVlan as PortVlan_2, mt_B.Vlan as Vlan_2, mt_B.res1 as res1_2, mt_B.res2 as res2_2, mt_B.prim as prim_2,
                mt_B.Astahov1 as Astahov1_2, mt_B.Astahov2 as Astahov2_2, mt_B.skorost skorost_mt_2, mt_B.Zakazchik Zakazchik_mt_2,
                ji.AdressA as AdressSO_A, ji.AdressB as AdressSO_B, OperatorA as OperatorSO_A, OperatorB as OperatorSO_B,
                ji.JointA,  ji.JointB, ji.jointStatusA, ji.jointStatusB, ji.ChNumA as ChNumSO_A, ji.ChNumB as ChNumSO_B,
                ji.JointParamA, ji.JointParamB, ji.LineA as LineSO_A, ji.LineB as LineSO_B, ji.ChannelInfoA, ji.ChannelInfoB,
                jpa.PersonShortName+' '+jpa.PhoneCity+(case when jpa.PhoneMob is not null and jpa.PhoneMob!='' then ' моб.'+jpa.PhoneMob
                else '' end) as KontaktSO_A,
                jpb.PersonShortName+' '+jpb.PhoneCity+(case when jpb.PhoneMob is not null and jpb.PhoneMob!='' then ' моб.'+jpb.PhoneMob
                else '' end) as KontaktSO_B,
                ji.DMVManagerA, ji.DMVManagerB
    from            
    (select distinct sml.Id id_group, sml.numML, sml.sCode, s.EnhTo, sml.NavigatorId, sml.NumServ, NumChA, NumChB,
				case when v like '%VPN%' then cast (v as varchar(12)) else '' end  as VPN,
				adresa as ch_addr_a, 
				adresb as ch_addr_b,  
				p,e, s, i, t, v, specob, fe,
				sml.specobA, sml.specobB, nl.sdan,
				nl.Zakazhcik Zakazcik_l2n,
				nl.Otvetstv Kontakt_l2n,
				utverzh utverzh_l2n,
				Usluga  usluga_l2n,
				a.ShortName as status, --статус     
                case when s.EnhTo is null then 1 else 0 end as is_null, 
                CAST(pc.Surname+' '+substring(pc.Name,1,1)+'. '+substring(pc.Patronymic,1,1)+'.'  AS varchar(256)) As ManagerId, -- менеджер  
                pc.PhoneLoc As Manager_Phone,   
                case when contr1.NumberInt is not null then 'Договор №'+contr1.NumberInt+', Заказ №'+contr.NumberInt else 'Договор №'+contr.NumberInt end    AS Contract_Name, 
                cmp.ShortName AS Client_Name                
	from ComFlow.dbo.TheService s 
	right join Navigator_test.dbo.ServiceML sml on sml.TheServiceId=s.Id
    left join ComFlow.dbo.Contract contr ON s.ContractId = contr.Id left join ComFlow.dbo.Contract contr1 on contr.ParentId=contr1.Id   -- Договор и заказ
    left join ComFlow.dbo.Person pc on pc.Id=contr.ManagerId  
    LEFT JOIN ComFlow.dbo.Company cmp ON contr.CompanyId = cmp.Id 
    left join ComFlow.dbo.Person pcmp on pcmp.Id=cmp.ManagerId  
    LEFT JOIN Comflow.dbo.TheServiceInfo si  on si.Id=s.Id
    left join Comflow.dbo.aStage a  on a.Id=si.aStageId
    right join Navigator_test.dbo.List2Nav nl on nl.numml=sml.NumML 
    where sml.id in (select ID from Navigator_test.dbo.ServiceML where NumML=@ml)
    ) c
    left join Navigator_test.dbo.JointInfo ji on c.numML=ji.NumML
    left join Comflow.dbo.Joint2PersonView jpA on ji.JointIdA=jpa.jointId
    left join Comflow.dbo.Joint2PersonView jpB on ji.JointIdB=jpb.jointId
    left join Navigator_test.dbo.Osnova o on c.numML=o.NumML
    left join Navigator_test.dbo.main_table mt on ((c.specoba=lower(mt.nomerkanala)  or c.numServ=lower(mt.nomerkanala)) and mt.nomerkanala!='' )
    left join Navigator_test.dbo.main_table mt_B on (c.specobb=lower(mt_B.nomerkanala) and mt_B.nomerkanala!='' )
    left join Navigator_test.dbo.ML_Ends kont_a on kont_a.numml=o.NumML and lower(kont_a.okonchanie)='a'
    left join Navigator_test.dbo.ML_Ends kont_b on kont_b.numml=o.NumML and lower(kont_b.okonchanie)='b'
    left join Navigator_test.dbo.ML_Lines line_a on line_a.numml=o.NumML and lower(line_a.line_type)='a'
    left join Navigator_test.dbo.ML_Lines line_b on line_b.numml=o.NumML and lower(line_b.line_type)='b'
);

