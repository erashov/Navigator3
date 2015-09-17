create procedure [dbo].[report_ML_43]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

/* Количество срочных МЛ, выполненных за отчетный период */


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
            len(sroch_sz))) as 'Контрольная дата выполнения МЛ',
            zakazhcik as 'Заказчик',
        l.Usluga as 'Услуга', 
        l.AdresA as 'Адрес А', 
        l.AdresB as 'Адрес Б'
from 
        list2nav l left join osnova o 
        on l.NumML = o.NumML
where 
        sroch_sz is not null and 
        l.SZ_Date >= CONVERT(DATETIME, @start_date, 104)and 
        l.SZ_Date <= CONVERT(DATETIME, @end_date, 104) and
        l.Sdan_TS is not null
Order by l.NumML desc
