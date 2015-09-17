
CREATE PROCEDURE [dbo].[report_ML_54]

as

/* Возвраты МЛ на этапе обработки*/

select 
        o.numml as 'Номер МЛ', 
        h.returnDate as 'Дата возврата',
        o.signc2 as 'Причина возврата',
		o.usluga as 'Название услуги',
		o.pre_usluga as 'Статус услуги',
        o.zakazchik as 'Заказчик',
        o.Adres_A as 'Адрес А', 
        o.Adres_B as 'Адрес Б'
from 
        Osnova o
        left join list2nav l on l.NumML = o.NumML
        left join TableReturnHistory h
        on h.number = (select max(number) from TableReturnHistory
        where  TableReturnHistory.numberML = o.NumML)
where        
        o.signi2 is not null and
        l.numml is null and
        CONVERT(DATETIME, h.returnDate, 104)> CONVERT(DATETIME, '31.12.2008', 104)
     
        
Order by o.NumML desc
