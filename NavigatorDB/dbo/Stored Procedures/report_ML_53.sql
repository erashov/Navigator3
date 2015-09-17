
CREATE PROCEDURE [dbo].[report_ML_53]
@start_date nvarchar(25),
@end_date nvarchar(25)

as

/* Cрок выполнения прошел*/

/*
declare @start_date nvarchar(25);
declare @end_date nvarchar(25);

set @start_date = '25.04.2011'; 
set @end_date ='27.04.2011' ;
*/

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
        case when 
            (l.IDO is null or l.IDO = '') 
            and (l.UDA is Null and l.UDB is null) 
            and (l.PrivA is null and l.privb is null)
        then 'УЛКС'
        when 
            (l.IDO is null or l.ido = '') and
            ((l.G_A is not null and l.G_A <> 0) 
                or (l.G_B is not null and l.g_B <> 0)) and
            l.taskFOConnection is null
        then 'УЛКС'
        when 
            ((l.NRUSP is not null and l.NRUSP <> 0) 
                or (l.NRUSP1 is not null and l.NRUSP1 <> 0)) and
            (l.D_USP is null and l.D_USP1 is null)
        then  'УСП' 
        else          
            'Ответственное управление'
        end as 'Управление',
        l.signD1 as 'Дата заморозки',
        l.signD2 as 'Дата разморозки',
        l.signC3 as 'Причина заморозки',
        h.Comment as 'Причина возврата',
        h.StartTime as 'Дата возврата',
        CONVERT(text, h.Commentary) as 'Комментарий к возврату'
from 
        list2nav l
        join Osnova o on l.NumML = o.NumML
        left join ml_history h
        on h.ID = (select max(ID) from ML_History where ML_History.NumML = l.NumML
        AND ML_History.Step IN (9, 10))
where        
        sroch_sz is not null and
        sdan_ts is null and
        l.problml is null and        
        l.SZ_Date >= CONVERT(DATETIME, @start_date, 104)and 
        l.SZ_Date <= CONVERT(DATETIME, @end_date, 104) and

/*
        CONVERT(DATETIME,ltrim(rtrim(substring(sroch_sz,
            (case when 
                charindex(' до',sroch_sz, 1)>0 
            then 
                charindex(' до',sroch_sz, 1)+3 
            else 1 end ) , 
            len(sroch_sz)))),104) < 
*/
        CONVERT(DATETIME,right(rtrim(sroch_sz),10),104) <
        Convert(datetime,CONVERT(varchar(10), getdate(), 104),104)
      
        
Order by l.NumML desc