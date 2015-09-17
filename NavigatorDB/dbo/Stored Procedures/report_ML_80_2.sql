

CREATE procedure [dbo].[report_ML_80_2]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as


/*
		выполненные задания в ДЭЛС (УСП)  за период
*/

/*
declare @start_date nvarchar(25);
declare @end_date nvarchar(25);

set @start_date = '22.04.2013'; 
set @end_date ='25.04.2013' ;
*/

			 select 

			  t1.numml "№МЛ/ТЛ",
			  dbo.date(t1.utverzh) "дата утвержд. МЛ/ТЛ",
			  t1.zakazhcik "заказчик",		  
			  case when t1.c is not null
				   then t1.AdresA
				   else t1.AdresB
			  end as "адрес задания ДЭЛС",

			  case when t1.c is not null
				   then dbo.date(t1.c)
				   else dbo.date(t1.b)
			  end as "дата задания ДЭЛС",

			  case when t1.d_usp is not null
				   then dbo.date(t1.d_usp)
				   else dbo.date(t1.d_usp1)
			  end as "дата выполнения ДЭЛС",

			  t1.Usluga "услуга",
			  Osnova.Usluga "тип услуги",
			  Osnova.Pre_Usluga "вид услуги",
			  Osnova.Manager "менеджер"
				 
		     from	          
					(
					 select
							ln.numml,
							ln.utverzh,
							ln.Usluga,
							ln.zakazhcik,		  
							ln.c,
							ln.d_usp,
							ln.b,
							ln.d_usp1,
							ln.AdresA,
							ln.AdresB
					 from
								  List2Nav ln          
					 where 
						 ln.numML < 1000000 
                         and ln.c > CONVERT(DATETIME,'01.01.2000', 104)
						 and (ln.D_USP >= CONVERT(DATETIME,@start_date, 104))
						 and (ln.D_USP <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104)))         
						 AND ln.ProblML Is Null
					union all
						select
								ln.numml,
								ln.utverzh,
								ln.Usluga,
								ln.zakazhcik,		  
								ln.c,
								ln.d_usp,
								ln.b,
								ln.d_usp1,
								ln.AdresA,
								ln.AdresB
						 from
									  List2Nav ln          
					 where 
						 ln.numML < 1000000 
                         and ln.c > CONVERT(DATETIME,'01.01.2000', 104)
						 and (ln.D_USP1 >= CONVERT(DATETIME,@start_date, 104))
						 and (ln.D_USP1 <= DATEADD(mi,1439,CONVERT(DATETIME,@end_date, 104)))         
						 AND ln.ProblML Is Null
					)t1 left join Osnova
					  on t1.NumML = Osnova.NumML  

	order by t1.numml desc







