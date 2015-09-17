
CREATE FUNCTION [dbo].[Get_InfoMLForTask_from_Dev] (@ml int)
RETURNS TABLE
AS
RETURN 
( 
        select  theServiceId, case when  c.NumServ like '%i%' then c.NumServ else upper(c.NumServ) end NumServ, c.ServNameCmfl,
                c.NumML, isnull(isnull(kont_a.kontakt, o.Kontakt_A), Kontakt_l2n) as kontact_A,
                kont_a.Styk Styk_A,
                kont_a.Status_Styka Status_Styka_A,
                kont_a.Param_Styka Param_Styka_A,
                kont_a.Line_Priv Line_Priv_A,
                isnull(kont_b.kontakt, o.Kontakt_B) as kontact_B, 
                kont_b.Styk Styk_B,
                kont_b.Status_Styka Status_Styka_B,
                kont_b.Param_Styka Param_Styka_B,
                kont_b.Line_Priv Line_Priv_B,
                Zakazcik_l2n Zakazchik, 
                case when o.Usluga like '%шлейф%' and o.Usluga is not null then o.Usluga+'('+o.Pre_Usluga+')'
                else isnull(o.Pre_Usluga, usluga_l2n) end Pre_Usluga, 
                ch_addr_a Adres_A, ch_addr_b Adres_B,
                isnull(Kontakt_ob_cmfl, o.Kontakt_ob) as Kontakt_ob, 
                isnull(skorost_l2n, o.Skorost) skorost, mlm.QoS,
                isnull(c.ManagerId, o.Manager) ManagerId, isnull(c.Manager_Phone, o.Telefon) Manager_Phone, 
                isnull(c.Contract_Name, o.Osnovanie) Contract_Name
    from            
    (
    select distinct sml.Id id_group, sml.numML, sml.sCode, s.Id theServiceId, s.EnhTo, sml.TopML, sml.NavigatorId, sml.NumServ, NumChA, NumChB,
				nl.Dop_A, nl.Dop_B, nl.Probl, nl.Prim,
				case when v like '%VPN%' then cast (v as varchar(12)) else '' end  as VPN,
				adresa as ch_addr_a, 
				adresb as ch_addr_b,  
				nl.Skorost skorost_l2n,
				p,e, s, i, nl.t, v, specob, fe,
				sml.specobA, sml.specobB, convert(datetime, convert(varchar(10), isnull(nl.sdan_ts,nl.sdan), 101)) as sdan, 
				case when nl.sdan_ts is not null then CONVERT(varchar(10),nl.sdan_ts, 104)+' '+CONVERT(varchar(10),nl.sdan_ts, 108) else CONVERT(varchar(10), nl.sdan, 104)+' - СДАН' end as sdan_interface,
				nl.Zakazhcik Zakazcik_l2n,
				nl.Otvetstv Kontakt_l2n,
				utverzh utverzh_l2n,
				Usluga  usluga_l2n,
				case when isnull(nl.e, '')!='' then nl.e+', ' else isnull(nl.e, '') end + 
				case when isnull(nl.s, '')!='' then nl.s+', ' else isnull(nl.s, '')  end + 
				case when isnull(nl.v, '')!='' then nl.v+', ' else isnull(nl.v, '')  end + 
				case when isnull(nl.t, '')!='' then nl.t+', ' else isnull(nl.t, '')  end + 
				case when isnull(nl.p, '')!='' then nl.p+', ' else isnull(nl.p, '')  end + 
				case when isnull(nl.i, '')!='' then nl.i+', ' else isnull(nl.i, '')  end +   
				case when isnull(nl.r, '')!='' then nl.r+', ' else isnull(nl.r, '')  end +
				case when isnull(nl.fe, '')!='' then nl.fe+', ' else isnull(nl.fe, '')  end + 
				case when isnull(nl.q, '')!='' then nl.q+', ' else isnull(nl.q, '')  end + 
				case when isnull(nl.specOb, '')!='' then nl.specOb+', ' else isnull(nl.specOb, '') end+
				case when isnull(nl.NTelef, '')!='' then nl.NTelef+', ' else isnull(nl.NTelef, '') end+
				case when isnull(nl.CR, '')!='' then nl.CR+', ' else isnull(nl.CR, '') end
				  as AllComp ,  
				a.ShortName as status, --статус     
                case when s.EnhTo is null then 1 else 0 end as is_null, 
                CAST(pc.Surname+' '+substring(pc.Name,1,1)+'. '+substring(pc.Patronymic,1,1)+'.'  AS varchar(256)) As ManagerId, -- менеджер  
                pc.PhoneLoc As Manager_Phone,   
                case when contr1.NumberInt is not null then 'Договор №'+contr1.NumberInt+', Заказ №'+contr.NumberInt else 'Договор №'+contr.NumberInt end    AS Contract_Name, 
                cmp.ShortName AS Client_Name,
                 CAST(RTRIM(ISNULL(Repr.[SurName], '') + ' '
		         + ISNULL(Repr.[Name], '') + ' '
		         + ISNULL(Repr.[Patronymic], '') + CASE WHEN ISNULL(Repr.PhoneCity, '') <> '' THEN ' тел.' ELSE '' END
		         + ISNULL(Repr.PhoneCity, '')    + CASE WHEN ISNULL(Repr.PhoneLoc, '')  <> '' THEN ', внутр.тел.' ELSE '' END
	           	 + ISNULL(Repr.PhoneLoc, '')     + CASE WHEN ISNULL(Repr.PhoneMob, '')  <> '' THEN ', моб.тел.' ELSE '' END
		         + ISNULL(Repr.PhoneMob, ''))    AS nvarchar(254)) as Kontakt_ob_cmfl,
		         ji.AdressA as AdressSO_A, ji.AdressB as AdressSO_B, OperatorA as OperatorSO_A, OperatorB as OperatorSO_B,
                 ji.JointA,  ji.JointB, ji.jointStatusA, ji.jointStatusB, ji.ChNumA as ChNumSO_A, ji.ChNumB as ChNumSO_B,
                 ji.JointParamA, ji.JointParamB, ji.LineA as LineSO_A, ji.LineB as LineSO_B, ji.ChannelInfoA, ji.ChannelInfoB,
                 ji.DMVManagerA, ji.DMVManagerB,
                 SOCHSkorostA, SOChSkorostB,  SOChInterfaceA, SOChInterfaceB, EqiupmentA, EqiupmentB,
                 sa.Id Id_aServ, sa.Description as ServNameCmfl, sa.sCode as sCode_aServ                 
	from ComFlow.dbo.TheService s 
	right join Navigator_test_dev.dbo.ServiceML sml on sml.TheServiceId=s.Id
    left join ComFlow.dbo.Contract contr ON s.ContractId = contr.Id left join ComFlow.dbo.Contract contr1 on contr.ParentId=contr1.Id   -- Договор и заказ
    left join ComFlow.dbo.Person pc on pc.Id=contr.ManagerId  
    LEFT JOIN ComFlow.dbo.Company cmp ON contr.CompanyId = cmp.Id 
    left join ComFlow.dbo.Person pcmp on pcmp.Id=cmp.ManagerId 
    Left JOIN ComFlow.dbo.Request R ON s.RequestId = R.[Id]
	LEFT OUTER JOIN  ComFlow.dbo.Person Repr ON Repr.[Id] = R.ReprId
    LEFT JOIN Comflow.dbo.TheServiceInfo si  on si.Id=s.Id
    left join Comflow.dbo.aService sa on s.aServiceId=sa.Id
    left join Comflow.dbo.aStage a  on a.Id=si.aStageId
    left join Comflow.dbo.JointInfoView ji on sml.TheServiceId=ji.theserviceid
    right join Navigator_test_dev.dbo.List2Nav nl on nl.numml=sml.NumML 
    where nl.numml=@ml
    ) c
    Left join Navigator_test_dev.dbo.ServiceMLComment smlc on smlc.IDgroup=c.id_group
    left join Navigator_test_dev.dbo.Osnova o on c.numML=o.NumML
    Left join Navigator_test_dev.dbo.ML_main mlm on mlm.NumMl=c.numML
    left join Navigator_test_dev.dbo.ML_Ends kont_a on kont_a.numml=c.NumML and lower(kont_a.okonchanie)='a'
    left join Navigator_test_dev.dbo.ML_Ends kont_b on kont_b.numml=c.NumML and lower(kont_b.okonchanie)='b'
    left join Navigator_test_dev.dbo.ML_Lines line_a on line_a.numml=c.NumML and lower(line_a.line_type)='a'
    left join Navigator_test_dev.dbo.ML_Lines line_b on line_b.numml=c.NumML and lower(line_b.line_type)='b'
);

