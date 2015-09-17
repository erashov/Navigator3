
CREATE procedure [dbo].[report_ML_23]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

/* Количество МЛ реализованных Техническими службами по спецпроектам */
		select
		  'МЛ по спецпроекту ' + t1.Zakazhcik as 'Zakazchik',
		  count(1) as 'count'
		from
		(
			  select 
				List2Nav.NumML,
				List2Nav.Usluga,
				--ISNULL(List2Nav.Sdan_TS,DATEADD(hh,18,List2Nav.Sdan)) as endTimeTS,
				ISNULL(List2Nav.Sdan_TS,List2Nav.Sdan) as endTimeTS,
				List2Nav.Zakazhcik
			  from
	            List2Nav
              where ((Sdan_TS is not null) or (Sdan is not null))
                and ISNULL(List2Nav.Sdan_TS,List2Nav.Sdan) >= CONVERT(DATETIME, @start_date, 104)
			    and ISNULL(List2Nav.Sdan_TS,List2Nav.Sdan) < CONVERT(DATETIME, @end_date, 104)
			    and List2Nav.numML < 1000000
			    and List2Nav.NumML Not Like '%-%'
			    and List2Nav.Zakazhcik Not Like 'ЗАО «АКАДО-Столица»'
				and (not((List2Nav.Probl like '%отменяется МЛ%') OR (List2Nav.Probl like '%отменяеться МЛ%') OR (List2Nav.Probl like '%отмена МЛ%') OR (List2Nav.Probl like '%отмены МЛ%') OR (List2Nav.Probl like '%отмену МЛ%'))OR (List2Nav.Probl is null))
				and List2Nav.SpecProject is not null
	    )t1 left join 
		(
			 select Osnova.NumML,Osnova.Dop_A 
			 from Osnova 
			 where ((Osnova.Dop_A like '%отмена МЛ%') OR (Osnova.Dop_A like '%отмены МЛ%'))	
				   OR((Osnova.Zakazchik like '%тестовый клиент%') OR (Osnova.Zakazchik = 'тест')) 							
		)t2
		 on t1.NumML = t2.NumML
	     where t2.NumML is null
		 group by t1.Zakazhcik






