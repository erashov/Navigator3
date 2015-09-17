

CREATE procedure [dbo].[report_ML_6]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as
/*Перечень всех МЛ за отчетный период, возвращенных менеджерам на доработку.*/
  select 
	t3.numberML as 'Номер МЛ',
    t3.stDate as 'Начало доработки',
	t3.returnText as 'Причина',
	t3.manager as 'Менеджер',
	t3.Zakazchik as 'Заказчик',
	ISNULL(t3.Adres_A, List2Nav.AdresA) AS 'Адрес А',
	ISNULL(t3.Adres_B, List2Nav.AdresB) AS 'Адрес B'
  from
  (
	select
	  t2.numberML,
	  CONVERT(nvarchar(25), t2.stDate, 104) as stDate,
	  t2.returnText,
	  Osnova.manager,
	  Osnova.Adres_A,
	  Osnova.Adres_B,
	  Osnova.Zakazchik
	from
	(
	  select distinct
		t1.numberML,
		t1.stDate,
		TableReturnHistory.returnText
	  from
      (
		select 
		  numberML,
          max(returnDate) as stDate
		from
		  TableReturnHistory
	    where 
          returnDate > CONVERT(DATETIME, @start_date, 104)
          and returnDate < CONVERT(DATETIME, @end_date, 104)
        group by numberML
      )t1 LEFT JOIN TableReturnHistory
          ON ((t1.numberML = TableReturnHistory.numberML) and (TableReturnHistory.returnDate = t1.stDate))
  )t2 LEFT JOIN Osnova
      ON t2.numberML = Osnova.NumML
  where 
    Osnova.Zakazchik Not Like 'ЗАО «АКАДО-Столица»'
    and Osnova.Zakazchik Not Like 'ЗАО «АКАДО - Столица»'
    and (not((Osnova.Dop_A like '%отмена МЛ%') OR (Osnova.Dop_A like '%отмены МЛ%')) OR  (Osnova.Dop_A is null))
	and not((Osnova.Zakazchik like '%тестовый клиент%') OR (Osnova.Zakazchik = 'тест')) 				

  )t3 LEFT JOIN List2Nav
   ON t3.numberML = List2Nav.NumML
  where (not((List2Nav.Probl like '%отменяется МЛ%') OR (List2Nav.Probl like '%отменяеться МЛ%') OR (List2Nav.Probl like '%отмена МЛ%') OR (List2Nav.Probl like '%отмены МЛ%') OR (List2Nav.Probl like '%отмену МЛ%'))OR (List2Nav.Probl is null))

 order by t3.numberML desc









