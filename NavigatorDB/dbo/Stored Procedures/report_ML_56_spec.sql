CREATE PROCEDURE [dbo].[report_ML_56_spec]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as


/*  перечень всех МЛ за отчетный период,находящихся в "заморозке".  */

			select
			  List2Nav.NumML as "Номер МЛ",	
			  rtrim(ltrim(List2Nav.SignC3)) as "Причина",
			  Osnova.Usluga as "Название услуги",
			  Osnova.Pre_Usluga as "Статус услуги",
			  Osnova.Manager as "Менеджер",
			  ISNULL(dbo.Osnova.Zakazchik, dbo.List2Nav.Zakazhcik) AS "Заказчик",
			  ISNULL(dbo.Osnova.Adres_A, dbo.List2Nav.AdresA) AS "Адрес А",  
			  ISNULL(dbo.Osnova.Adres_B, dbo.List2Nav.AdresB) AS "Адрес В",
              List2Nav.signD1 as "Дата заморозки",
              cast(Round(DATEDIFF(mi, List2Nav.SignD1, getdate())/1440.0,2)as NUMERIC(15,2))
              /*dbo.get_time_from_min(DATEDIFF(mi, List2Nav.SignD1, getdate()))*/ as "Срок заморозки",
              case when(List2Nav.ProblML is null) then 'МЛ в Техслужбе' else 'МЛ возвращен менеджеру' end as "Cтаус МЛ"
            from
	          List2Nav left join Osnova
			  on List2Nav.NumML = Osnova.NumML
            where List2Nav.signD1 is not null
              and List2Nav.signD2 is null
              and List2Nav.Sdan is null 
              and List2Nav.signD1 >= CONVERT(DATETIME, @start_date, 104)
			  and List2Nav.signD1 <= CONVERT(DATETIME, @end_date, 104)
			  and List2Nav.numML < 1000000
			  and List2Nav.NumML Not Like '%-%'
			  and not ((List2Nav.Zakazhcik like 'ЗАО «АКАДО-Столица»')or(List2Nav.Zakazhcik like 'ЗАО «АКАДО - Столица»'))				 
			  and (not((List2Nav.Probl like '%отменяется МЛ%') OR (List2Nav.Probl like '%отменяеться МЛ%') OR (List2Nav.Probl like '%отмена МЛ%') OR (List2Nav.Probl like '%отмены МЛ%') OR (List2Nav.Probl like '%отмену МЛ%'))OR (List2Nav.Probl is null))
			  and (not((Osnova.Dop_A like '%отмена МЛ%') OR (Osnova.Dop_A like '%отмены МЛ%')) OR  (Osnova.Dop_A is null))
			  and not((Osnova.Zakazchik like '%тестовый клиент%') OR (Osnova.Zakazchik = 'тест')) 
 order by  List2Nav.NumML desc