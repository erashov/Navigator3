





CREATE procedure [dbo].[report_ML_16]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

/*  перечень всех МЛ за отчетный период,находящихся в "заморозке".  */

			select
			  List2Nav.NumML as "Номер МЛ",	
			  dbo.get_time_from_min(case when DATEDIFF(d, List2Nav.SignD1, List2Nav.SignD2) = 0 
							             then DATEDIFF(mi, List2Nav.SignD1, List2Nav.SignD2) 
							             else DATEDIFF(mi,List2Nav.SignD1, List2Nav.SignD2) - ((DATEDIFF(d, List2Nav.SignD1, List2Nav.SignD2)+1 - dbo.GetWorkingDays(List2Nav.SignD1, List2Nav.SignD2))*1440) 
									end) as "Срок заморозки",
			  rtrim(ltrim(List2Nav.SignC3)) as "Причина",
			  Osnova.Manager as "Менеджер",
			  ISNULL(dbo.Osnova.Zakazchik, dbo.List2Nav.Zakazhcik) AS "Заказчик",
			  ISNULL(dbo.Osnova.Adres_A, dbo.List2Nav.AdresA) AS "Адрес А",  
			  ISNULL(dbo.Osnova.Adres_B, dbo.List2Nav.AdresB) AS "Адрес В"
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

			order by List2Nav.NumML desc 










