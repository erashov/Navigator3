
CREATE procedure [dbo].[report_ML_74]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

/* Общее количество поступивших МЛ УШТУ (P, B, G, A, I, KW, V) */

select
t1.NumML "Номер_МЛ",
dbo.Date(t1.utverzh) "Дата утверждения",
t1.Zakazhcik "Заказчик",
t1.AdresA "Адрес А",
t1.AdresB "Адрес B",
t2.Usluga  "Услуга",
t1.Usluga  "Тип_услуги",
t2.Pre_Usluga  "Вид_услуги",
t1.prim "Примечание",
t1.SpecProject "Спецпроект" 

from
(
SELECT 
l2n.NumML,
l2n.utverzh,
l2n.Sdan_TS,
l2n.Zakazhcik, 
l2n.Usluga, 
l2n.AdresA, 
l2n.AdresB,
l2n.prim ,
l2n.SpecProject

FROM List2Nav l2n 
WHERE 

 l2n.NumML < 1000000 
AND ((l2n.Usluga) Like '%p%' 
 Or (l2n.Usluga) Like '%a%' 
 Or (l2n.Usluga) Like '%v%' 
 Or (l2n.Usluga) Like '%b%' 
 Or (l2n.Usluga) Like '%i%' 
 Or (l2n.Usluga) Like '%g%' 
 Or (l2n.Usluga) Like '%kw%')
AND l2n.ProblML Is Null
--and l2n.NR_Region =0  по запросу № S059678
and l2n.utverzh > CONVERT(DATETIME, @start_date, 104)
and l2n.utverzh <= DATEADD(mi,1439,CONVERT(DATETIME, @end_date, 104))


)t1 left join Osnova t2 on t1.numml = t2.numml

order by t1.numml desc
