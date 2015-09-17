CREATE PROCEDURE [dbo].[report_ML_51] @start_date nvarchar(25), 
                                      @end_date nvarchar(25)
as

/* Выезды УСП по срочным МЛ, ускоренным раннее указанного срока*/

        
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
        zakazhcik as 'Заказчик',
        l.Usluga as 'Услуга', 
        l.AdresA as 'Адрес А', 
        l.AdresB as 'Адрес Б',
        (case when
            l.D_USP is not null
        then
            l.D_USP
        else
            l.D_USP1
        end) as 'Дата УСП',
        l.signD1 as 'Дата заморозки', 
        l.signD2 as 'Дата разморозки',
        l.signC3 as 'Причина заморозки',
        CONVERT(text, h.Commentary) as 'Комментарий к заморозке'
        

from 
        list2nav l
        join Osnova o on l.NumML = o.NumML
        left join ml_history h
        on h.ID = (select max(ID) from ML_History where ML_History.NumML = l.NumML
        AND ML_History.Step IN (8))
where        
        (sroch_sz is not null and
        l.SZ_Date < CONVERT(DATETIME, @start_date, 104) and 
        --l.SZ_Date >= CONVERT(DATETIME, @end_date, 104) and
        (l.data_sost_a is not null or l.data_sost_b is not null) and
        (l.c is not null or l.b is not null) and
        (l.D_USP is not null or l.D_USP1 is not null) and
        (
            l.D_USP >= CONVERT(DATETIME, @start_date, 104) and 
            l.D_USP <= CONVERT(DATETIME, @end_date, 104) or
            l.D_USP1 >= CONVERT(DATETIME, @start_date, 104) and 
            l.D_USP1 <= CONVERT(DATETIME, @end_date, 104)
        )
        ) or
        (sroch_sz is not null and
        l.SZ_Date <= CONVERT(DATETIME, @start_date, 104)and 
        --l.SZ_Date >= CONVERT(DATETIME, @end_date, 104) and
        (l.data_sost_a is null and l.data_sost_b is null) and
        (l.D_USP is not null or l.D_USP1 is not null) and
        (
            l.D_USP >= CONVERT(DATETIME, @start_date, 104) and 
            l.D_USP <= CONVERT(DATETIME, @end_date, 104) or
            l.D_USP1 >= CONVERT(DATETIME, @start_date, 104) and 
            l.D_USP1 <= CONVERT(DATETIME, @end_date, 104)
        )and
        l.signC3 is not null and
        l.signC3 like '%Перерыв связи%'
        )
        
Order by l.NumML desc