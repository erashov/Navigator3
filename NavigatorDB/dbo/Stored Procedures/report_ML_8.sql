
create procedure [dbo].[report_ML_8]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

/* Количество МЛ ПРИМ-1 реализованных Техническими службами с начала отчетного периода */

select
  t1.NumML as 'Номер МЛ',
  t1.data as 'Дата реализации',
  t1.Zakazhcik as 'Заказчик',
  Osnova.Usluga as 'Услуга',
  t1.Usluga as 'Тип услуги'
from
(
 select  
   UltTaskSubcontrInfo.NumML ,
   CONVERT(nvarchar(25), Sdan, 104) as data,
   Zakazhcik,
   List2Nav.Usluga
 
 from UltTaskSubcontrInfo LEFT JOIN List2Nav 
      ON UltTaskSubcontrInfo.NumML = List2Nav.NumML
 where 
   Sdan > CONVERT(DATETIME, @start_date, 104)
   and Sdan < CONVERT(DATETIME, @end_date, 104)
)t1 LEFT JOIN Osnova
 ON t1.NumML = Osnova.NumML
order by t1.NumML DESC