
CREATE procedure [dbo].[report_ML_11]

as
/*Перечень всех МЛПрим-1 возвращенных менеджерам на доработку.*/
select
  t1.NumML as 'Номер МЛ',
--t1.stTime,
  Osnova.signC2 as 'Причина',
  dbo.fn_datediff(stTime,GETDATE(),'all') as 'Время от начала доработки'
from
(
  select  
    UltTaskSubcontrInfo.NumML, 
    max(dateConfirmML) as stTime 
  from UltTaskSubcontrInfo LEFT JOIN TableReturnHistory 
 	   ON UltTaskSubcontrInfo.NumML = TableReturnHistory.numberML 
  group by NumML
 )t1 LEFT JOIN Osnova
     ON t1.NumML = Osnova.NumML
  where  Osnova.signC2 is not null 
         and t1.stTime is not null
         and t1.stTime < CONVERT(DATETIME, '01.01.2020', 104)
  order by t1.NumML desc


