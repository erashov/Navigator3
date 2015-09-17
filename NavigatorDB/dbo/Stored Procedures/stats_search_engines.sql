
CREATE procedure stats_search_engines
as
	select 
		distinct project as "Название поисковика", count(*) as "Число запросов" 
	from 
		search_stats
	where 
		AD_user_name NOT LIKE '%AValishin%'
	group by project
	order by 2 desc

