

CREATE procedure [dbo].[report_ML_28]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as
/* Количество МЛ реализованных Техническими службами с начала отчетного периода по спецпроектов */

	select
	  t3.NumML as 'Номер МЛ',
	  CONVERT(nvarchar(25),t3.endTimeTS,104) as 'Дата реализации',
	  t3.Zakazhcik as 'Заказчик',
	  Osnova.Usluga as 'Услуга',
	  t3.Usluga as 'Тип услуги',
	  Osnova.Pre_Usluga as 'Вид услуги'

	from
	(
		select
		  t1.NumML,
		  t1.Usluga,
		  t1.endTimeTS,
		  t1.Zakazhcik
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
			    and not ((List2Nav.Zakazhcik like 'ЗАО «АКАДО-Столица»')or(List2Nav.Zakazhcik like 'ЗАО «АКАДО - Столица»'))				 
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
	)t3 left join Osnova
	 on t3.NumML = Osnova.NumML
     order by t3.NumML desc













