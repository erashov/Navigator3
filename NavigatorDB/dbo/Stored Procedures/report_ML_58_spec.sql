
CREATE PROCEDURE [dbo].[report_ML_58_spec]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as


/*  перечень всех МЛ за отчетный период,находящихся в "заморозке".  */
select
 t1."Номер МЛ",
 t1."Причина",
 t1.Usluga as 'Название услуги',
 t1.Pre_usluga as 'Статус услуги',
 t1."Менеджер",
 t1."Заказчик",
 t1."Адрес А",
 t1."Адрес В",
 t1."Дата заморозки",
 t1."Срок заморозки",
 t1."Cтаус МЛ",
 cast(Round(
 case when (t2.currencyMonthly = 2)
      then 0
      else t2.CostMonthlyReal
 end,2)as NUMERIC(15,2)) as 'Платёж'
 
from
(

			select
			  List2Nav.NumML as "Номер МЛ",	
              case when(List2Nav.ProblML is null) then 'МЛ в Техслужбе' else 'МЛ возвращен менеджеру' end as "Cтаус МЛ",
			  rtrim(ltrim(List2Nav.SignC3)) as "Причина",
			  Osnova.Manager as "Менеджер",
			  Osnova.Usluga,
			  Osnova.Pre_usluga,
			  ISNULL(dbo.Osnova.Zakazchik, dbo.List2Nav.Zakazhcik) AS "Заказчик",
			  ISNULL(dbo.Osnova.Adres_A, dbo.List2Nav.AdresA) AS "Адрес А",  
			  ISNULL(dbo.Osnova.Adres_B, dbo.List2Nav.AdresB) AS "Адрес В",
              List2Nav.signD1 as "Дата заморозки",
              cast(Round(DATEDIFF(mi, List2Nav.SignD1, getdate())/1440.0,2)as NUMERIC(15,2))
              /*dbo.get_time_from_min(DATEDIFF(mi, List2Nav.SignD1, getdate()))*/ as "Срок заморозки"
            from
	          List2Nav left join Osnova
			  on List2Nav.NumML = Osnova.NumML
            where List2Nav.signD1 is not null
              and List2Nav.signD2 is null
			  and List2Nav.Sdan is null 
              --and List2Nav.signD1 >= CONVERT(DATETIME, @start_date, 104)
			  and List2Nav.signD1 <= CONVERT(DATETIME, @end_date, 104)
			  and List2Nav.numML < 1000000
			  and List2Nav.NumML Not Like '%-%'
			  and not ((List2Nav.Zakazhcik like 'ЗАО «АКАДО-Столица»')or(List2Nav.Zakazhcik like 'ЗАО «АКАДО - Столица»'))				 
			  and (not((List2Nav.Probl like '%отменяется МЛ%') OR (List2Nav.Probl like '%отменяеться МЛ%') OR (List2Nav.Probl like '%отмена МЛ%') OR (List2Nav.Probl like '%отмены МЛ%') OR (List2Nav.Probl like '%отмену МЛ%'))OR (List2Nav.Probl is null))
			  and (not((Osnova.Dop_A like '%отмена МЛ%') OR (Osnova.Dop_A like '%отмены МЛ%')) OR  (Osnova.Dop_A is null))
			  and not((Osnova.Zakazchik like '%тестовый клиент%') OR (Osnova.Zakazchik = 'тест')) 
)t1 left join #tmpServices t2 --swan.comflow.dbo.vNumML_TheServiceAttr t2
 on t1."Номер МЛ" = t2.NumML
 order by  t1."Номер МЛ" desc
