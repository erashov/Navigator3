
CREATE PROCEDURE [dbo].[report_ML_55]

as

/* Возвраты МЛ на этапе исполнения*/

select 
        o.numml as 'Номер МЛ', 
        (case when 
            l.signD3 is null
        then 
            h.returnDate
        else
            l.signD3
        end) as 'Дата возврата',
        (case when 
            h.returnText is null
        then 
            l.ProblML
        else
            h.returnText
        end) as 'Причина возврата',
        o.usluga as 'Название услуги',
		o.pre_usluga as 'Статус услуги',
        o.zakazchik as 'Заказчик',
        o.Adres_A as 'Адрес А', 
        o.Adres_B as 'Адрес Б'
from 
        Osnova o
        left join list2nav l on l.NumML = o.NumML
        left join tablereturnhistory h
        on h.number = (select max(number) from tablereturnhistory
        where  tablereturnhistory.numberML = l.NumML)
where        
        (l.signD3 is not null and 
        CONVERT(DATETIME, 
            (case when 
                l.signD3 is null
            then 
                h.returnDate
            else
                l.signD3
            end), 104)> CONVERT(DATETIME, '31.12.2008', 104) or
        l.problml is not null) and
        l.numml is not null and
        CONVERT(DATETIME, 
            (case when 
                l.signD3 is null
            then 
                h.returnDate
            else
                l.signD3
            end), 104)> CONVERT(DATETIME, '31.12.2008', 104)
        
Order by o.NumML desc
