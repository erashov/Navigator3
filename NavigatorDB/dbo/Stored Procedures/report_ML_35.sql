CREATE procedure [dbo].[report_ML_35]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as
/* МЛ по спецпроектам "Горзаказ 2009"*/
select 
	List2Nav.NumML as 'Номер МЛ',	
	List2Nav.Zakazhcik as 'Заказчик',
    CONVERT(nvarchar(25), List2Nav.D_USP, 104) as 'Дата закрытия УСП',
    --List2Nav.SpecProject,
	Osnova.Usluga as 'Услуга',
    List2Nav.Usluga as 'Тип услуги',
	Osnova.Pre_Usluga as 'Вид услуги'

from
   List2Nav LEFT JOIN Osnova
   ON List2Nav.NumML = Osnova.NumML
where 
      List2Nav.D_USP > CONVERT(DATETIME, @start_date, 104)
  and List2Nav.D_USP < CONVERT(DATETIME, @end_date, 104)
  and List2Nav.SpecProject Like 'Горзаказ2009'

order by List2Nav.NumML desc

