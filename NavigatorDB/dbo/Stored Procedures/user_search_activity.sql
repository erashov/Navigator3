CREATE procedure user_search_activity
AS
	select 
		AD_user_name as "&nbsp;Пользователь&nbsp;", count(*) "&nbsp;Количество поисков&nbsp;"
	from 
		search_stats
	group by 
		AD_user_name
	order by 
		2 desc, 1
