
CREATE PROCEDURE [dbo].[report_ML_82]
@start_date nvarchar(25),
@end_date nvarchar(25)

/*
среднее время по кол-ву выполеннных МЛ/ТЛ в ДЭЛС (УСП) (учесть  условие наличия заморозок МЛ 
если они попадают на период выполнения работ )
*/

as	
/* 
declare @start_date nvarchar(25);
declare @end_date nvarchar(25);

set @start_date = '11.03.2013'; 
set @end_date ='16.03.2013' ;
*/

select
dbo.get_time_from_min(sum(t1.wtime)/count(t1.wtime)) sr_time,
count(t1.wtime) cnt
from
(
 select
(    case when DATEDIFF(d, c,D_USP) = 0 
	      then DATEDIFF(mi, c,D_USP) 
	      else DATEDIFF(mi, c,D_USP) - ((DATEDIFF(d,c,D_USP)+1 - dbo.GetWorkingDays(c,D_USP))*1440) 
	 end) - sum_froze as wtime
from
(
  select 
	 ln.numml,
	 ln.AdresA Adres,
     ln.c, ln.D_USP,
     sum(dbo.CrossInterval(ln.c,ln.D_USP,ht.StartTime,case when ((ht.EndTime is null) and (ht.StartTime=ln.SignD1)) then ln.SignD2 else ht.EndTime end)) sum_froze
   from
    List2Nav ln left join ML_History ht on ln.numml=ht.NumML and ht.Step=8
   where 
     ln.numML < 1000000 
	 and ln.c > CONVERT(DATETIME,'01.01.2000', 104)
     and (ln.D_USP >= CONVERT(DATETIME,@start_date, 104))
     and(ln.D_USP <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104)))     
	 AND ln.ProblML Is Null
   group by ln.numml,ln.AdresA,ln.c, ln.D_USP
 union select   
	 ln.numml,
	 ln.AdresB Adres,
     ln.b, ln.D_USP1,
     sum(dbo.CrossInterval(ln.b,ln.D_USP1,ht.StartTime,case when ((ht.EndTime is null) and (ht.StartTime=ln.SignD1)) then ln.SignD2 else ht.EndTime end)) sum_froze
   from
    List2Nav ln left join ML_History ht on ln.numml=ht.NumML and ht.Step=8
   where 
     ln.numML < 1000000 
     and ln.c > CONVERT(DATETIME,'01.01.2000', 104)
     and (ln.D_USP1 >= CONVERT(DATETIME,@start_date, 104))
     and(ln.D_USP1 <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104)))     
	 AND ln.ProblML Is Null
   group by ln.numml,ln.AdresB,ln.b,ln.D_USP1

)tb_frozen
)t1 


