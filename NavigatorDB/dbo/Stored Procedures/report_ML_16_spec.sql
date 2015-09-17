



CREATE procedure [dbo].[report_ML_16_spec]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as


/*  перечень всех МЛ за отчетный период,находящихся в "заморозке".  */

select
 t1."Номер МЛ",
 t1."Статус услуги",
 t1."Срок заморозки",
 t1."Причина",
 t1."Менеджер",
 t1."Заказчик",
 t1."Адрес А",
 t1."Адрес В",
 t1."Название услуги", 
 cast(Round(
 case when (t2.currencyMonthly = 2)
      then 0
      else t2.CostMonthlyReal
 end,2)as NUMERIC(15,2)) as 'Платёж'
 
from
(
			select
			  List2Nav.NumML as "Номер МЛ",	
			  /*dbo.get_time_from_min*/CONVERT(decimal(12,2), (case when DATEDIFF(d, List2Nav.SignD1, List2Nav.SignD2) = 0 
							             then DATEDIFF(mi, List2Nav.SignD1, List2Nav.SignD2) 
							             else DATEDIFF(mi,List2Nav.SignD1, List2Nav.SignD2) - ((DATEDIFF(d, List2Nav.SignD1, List2Nav.SignD2)+1 - dbo.GetWorkingDays(List2Nav.SignD1, List2Nav.SignD2))*1440) 
									end)/1440.0) as "Срок заморозки",
			  rtrim(ltrim(List2Nav.SignC3)) as "Причина",
			  Osnova.Manager as "Менеджер",
			  ISNULL(dbo.Osnova.Zakazchik, dbo.List2Nav.Zakazhcik) AS "Заказчик",
			  ISNULL(dbo.Osnova.Adres_A, dbo.List2Nav.AdresA) AS "Адрес А",  
			  ISNULL(dbo.Osnova.Adres_B, dbo.List2Nav.AdresB) AS "Адрес В",
              Osnova.Usluga as "Название услуги",   
	          Osnova.Pre_Usluga as "Статус услуги"
            from
	          List2Nav left join Osnova
			  on List2Nav.NumML = Osnova.NumML
            where ((Sdan_TS is not null) or (Sdan is not null))
              and ISNULL(List2Nav.Sdan_TS,/*DATEADD(hh,18,List2Nav.Sdan)*/List2Nav.Sdan) >= CONVERT(DATETIME, @start_date, 104)
			  and ISNULL(List2Nav.Sdan_TS,/*DATEADD(hh,18,List2Nav.Sdan)*/List2Nav.Sdan) < CONVERT(DATETIME, @end_date, 104)
			  and List2Nav.SignD1 is not null
			  and List2Nav.SignD2 is not null
			  and DATEDIFF(mi,List2Nav.SignD1, List2Nav.SignD2) > 0
			  and List2Nav.numML < 1000000
			  and List2Nav.NumML Not Like '%-%'
			  and not ((List2Nav.Zakazhcik like 'ЗАО «АКАДО-Столица»')or(List2Nav.Zakazhcik like 'ЗАО «АКАДО - Столица»'))				 
			  and (not((List2Nav.Probl like '%отменяется МЛ%') OR (List2Nav.Probl like '%отменяеться МЛ%') OR (List2Nav.Probl like '%отмена МЛ%') OR (List2Nav.Probl like '%отмены МЛ%') OR (List2Nav.Probl like '%отмену МЛ%'))OR (List2Nav.Probl is null))
			  and (not((Osnova.Dop_A like '%отмена МЛ%') OR (Osnova.Dop_A like '%отмены МЛ%')) OR  (Osnova.Dop_A is null))
			  and not((Osnova.Zakazchik like '%тестовый клиент%') OR (Osnova.Zakazchik = 'тест')) 
)t1 left join #tmpServices t2 --swan.comflow.dbo.vNumML_TheServiceAttr t2
 on t1."Номер МЛ" = t2.NumML
 order by  t1."Номер МЛ" desc











