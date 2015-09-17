CREATE PROCEDURE [dbo].[report_ML_3_spec]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

/* Количество МЛ реализованных Техническими службами с начала отчетного периода */
/* платежи из ComFlow */


select

 t7."Номер МЛ",
 t7."Дата реализации",
 t7."Причина заморозки",
 t7."Заказчик",
 t8.Usluga as 'Название услуги',
 t7."Тип услуги",
 t8.Pre_Usluga as 'Статус услуги',
 t7."Платёж"
from(

select
 t5."Номер МЛ",
 t5."Дата реализации",
 t5."Причина заморозки",
 t5."Заказчик",
 t5."Тип услуги",
 cast(Round(
 case when (t6.currencyMonthly = 2)
      then 0
      else t6.CostMonthlyReal
 end,2)as NUMERIC(15,2)) as "Платёж"
 
from(
	select
	  t3.NumML as 'Номер МЛ',
	  CONVERT(nvarchar(25),t3.endTimeTS,104) as 'Дата реализации',
	  t3.Zakazhcik as 'Заказчик',
	  t3.Usluga as 'Тип услуги',	  
	  t3.reason as "Причина заморозки"
	from
	(
		select
		  t1.NumML,
		  t1.Usluga,
		  t1.endTimeTS,
		  t1.Zakazhcik,
		  t1.reason
		from
		(
			  select 
				List2Nav.NumML,
				List2Nav.Usluga,
				--ISNULL(List2Nav.Sdan_TS,DATEADD(hh,18,List2Nav.Sdan)) as endTimeTS,
				ISNULL(List2Nav.Sdan_TS,List2Nav.Sdan) as endTimeTS,				
				List2Nav.Zakazhcik,
                rtrim(ltrim(List2Nav.SignC3)) reason
			  from
	            List2Nav
              where ((Sdan_TS is not null) or (Sdan is not null))
                and ISNULL(List2Nav.Sdan_TS,List2Nav.Sdan) >= CONVERT(DATETIME, @start_date, 104)
			    and ISNULL(List2Nav.Sdan_TS,List2Nav.Sdan) < CONVERT(DATETIME, @end_date, 104)
			    and List2Nav.numML < 1000000
			    and List2Nav.NumML Not Like '%-%'
			    and not ((List2Nav.Zakazhcik like 'ЗАО «АКАДО-Столица»')or(List2Nav.Zakazhcik like 'ЗАО «АКАДО - Столица»'))				 
			    and (not((List2Nav.Probl like '%отменяется МЛ%') OR (List2Nav.Probl like '%отменяеться МЛ%') OR (List2Nav.Probl like '%отмена МЛ%') OR (List2Nav.Probl like '%отмены МЛ%') OR (List2Nav.Probl like '%отмену МЛ%'))OR (List2Nav.Probl is null))
	    )t1 left join 
		(
			 select Osnova.NumML,Osnova.Dop_A 
			 from Osnova 
			 where ((Osnova.Dop_A like '%отмена МЛ%') OR (Osnova.Dop_A like '%отмены МЛ%'))	
				   OR((Osnova.Zakazchik like '%тестовый клиент%') OR (Osnova.Zakazchik = 'тест')) 							
		)t2
		 on t1.NumML = t2.NumML
	     where t2.NumML is null
	)t3 left join (
            select numml from Osnova
            where Osnova.Utverzh_B is null
    ) t4
	 on t3.NumML = t4.NumML
     where t4.numml is null
)t5 left join #tmpServices t6 --swan.comflow.dbo.vNumML_TheServiceAttr t6
 on t5."Номер МЛ" = t6.NumML
)t7 left join (select NumML, Pre_Usluga, Usluga from Osnova)t8 on t7."Номер МЛ" = t8.NumML

order by t7."Номер МЛ" desc