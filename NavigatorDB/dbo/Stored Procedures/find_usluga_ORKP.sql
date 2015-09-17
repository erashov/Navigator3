CREATE PROCEDURE [dbo].[find_usluga_ORKP] @SR nvarchar(25)

as 

    /* Проверка, есть ли уже такая услуга*/
    
    select l.numml, S, o.pre_usluga
    from list2nav l inner join osnova o on l.numml = o.numml
    where s = @SR