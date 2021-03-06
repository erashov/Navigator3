﻿
CREATE PROCEDURE [dbo].[report_ML_61]
@start_date nvarchar(25),
@end_date nvarchar(25)

as

/*  
 - общее кол-во выполненных заданий в УСП за заданный период
 - кол-во заданий по МЛ													
 - кол-во заданий по ТЛ													
*/

declare @ML int;
declare @TL int;

/*
declare @start_date nvarchar(25);
declare @end_date nvarchar(25);

set @start_date = '01.03.2011'; 
set @end_date ='01.04.2011' ;
*/

set @ML = (
   select 
	count(t1.NumML) cnt
   from 
(
   select
    numml
   from
    List2Nav
   where 
     List2Nav.numML < 1000000 and numml > 0
     and((List2Nav.D_USP >= CONVERT(DATETIME,@start_date, 104))and(List2Nav.D_USP <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104))))
    AND List2Nav.ProblML Is Null
  union all select
    numml
   from
    List2Nav
   where 
     List2Nav.numML < 1000000 and numml > 0
     and((List2Nav.D_USP1 >= CONVERT(DATETIME,@start_date, 104))and(List2Nav.D_USP1 <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104))))
    AND List2Nav.ProblML Is Null
)t1 )

set @TL = (
   select 
	count(t2.NumML) cnt
   from 
(
   select
    numml
   from
    List2Nav
   where 
     numml < 0
     and((List2Nav.D_USP >= CONVERT(DATETIME,@start_date, 104))and(List2Nav.D_USP <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104))))
    AND List2Nav.ProblML Is Null
  union all select
    numml
   from
    List2Nav
   where 
     numml < 0
     and((List2Nav.D_USP1 >= CONVERT(DATETIME,@start_date, 104))and(List2Nav.D_USP1 <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104))))
    AND List2Nav.ProblML Is Null
)t2 )


select @ML ML, @TL TL, @ML+@TL SUMMA
      


