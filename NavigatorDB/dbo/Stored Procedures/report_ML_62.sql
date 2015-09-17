
create PROCEDURE [dbo].[report_ML_62]
@start_date nvarchar(25),
@end_date nvarchar(25)

/*
кол-во адресов выполненных в срок ( разница между датой отчета УСП и 
датой постановки задания УСП меньше или равна 3 дня, учесть  условие наличия заморозки МЛ 
если она попадает на период выполнения работ и с учетом её вычета выполняется условие меньше или равно 3 дня.
*/

as	
 
select
t1.wtime
from
(
 select 
	 (case when DATEDIFF(d, c,D_USP) = 0 
	      then DATEDIFF(mi, c,D_USP) 
	      else DATEDIFF(mi, c,D_USP) - ((DATEDIFF(d,c,D_USP)+1 - dbo.GetWorkingDays(c,D_USP))*1440) 
	 end) - dbo.CrossInterval(c,D_USP,SignD1,SignD2) wtime

   from
    List2Nav
   where 
     List2Nav.numML < 1000000 --and numml > 0
     and (List2Nav.D_USP >= CONVERT(DATETIME,@start_date, 104))
     and(List2Nav.D_USP <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104)))     
	 AND List2Nav.ProblML Is Null

 union all select 
	 (case when DATEDIFF(d, b,D_USP1) = 0 
	      then DATEDIFF(mi, b,D_USP1) 
	      else DATEDIFF(mi, b,D_USP1) - ((DATEDIFF(d,b,D_USP1)+1 - dbo.GetWorkingDays(b,D_USP1))*1440) 
	 end) - dbo.CrossInterval(b,D_USP1,SignD1,SignD2) wtime

   from
    List2Nav
   where 
     List2Nav.numML < 1000000 --and numml > 0
     and (List2Nav.D_USP1 >= CONVERT(DATETIME,@start_date, 104))
     and(List2Nav.D_USP1 <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104)))      
	 AND List2Nav.ProblML Is Null

)t1
where  wtime <= 4320 --and wtime > 0 
order by wtime