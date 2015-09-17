CREATE PROCEDURE [dbo].[report_ML_45]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

/* Количество срочных МЛ, выполненных позже срока */

select 
        l.numml as 'Номер МЛ', 
        utverzh_b as 'Дата утверждения МЛ',
        substring(sroch_sz, 1, charindex(' до',sroch_sz, 1)) as 'Номер СЗ',
        sz_date as 'Дата получения СЗ',
        ltrim(substring(sroch_sz,
            (case when 
                charindex(' до',sroch_sz, 1)>0 
            then 
                charindex(' до',sroch_sz, 1)+3 
            else 1 end ) , 
            len(sroch_sz))) as 'Контрольная дата',
        l.Sdan_TS as 'Фактическая дата сдачи',
        zakazhcik as 'Заказчик',
        l.Usluga as 'Услуга', 
        l.AdresA as 'Адрес А', 
        l.AdresB as 'Адрес Б',
        l.signD1 as 'Дата заморозки',
        l.signD2 as 'Дата разморозки',
        l.signC3 as 'Причина заморозки',
        h.Comment as 'Причина возврата',
        h.StartTime as 'Дата возврата',
        convert(text,h.Commentary) as 'Комментарий к возврату'

from 
        list2nav l
        join Osnova o on l.NumML = o.NumML
        left join ml_history h
        on h.ID = (select max(ID) from ML_History where ML_History.NumML = l.NumML
        AND ML_History.Step IN (9, 10))
where 
        sroch_sz is not null and 
        l.SZ_Date >= CONVERT(DATETIME, @start_date, 104)and 
        l.SZ_Date <= CONVERT(DATETIME, @end_date, 104) and
        l.Sdan_TS is not null and
        CONVERT(DATETIME,ltrim(rtrim(substring(sroch_sz,
            (case when 
                charindex(' до',sroch_sz, 1)>0 
            then 
                charindex(' до',sroch_sz, 1)+3 
            else 1 end ) , 
            len(sroch_sz)))),104) < 
        Convert(datetime,CONVERT(varchar(10), sdan_ts, 104),104)
        
Order by l.NumML desc