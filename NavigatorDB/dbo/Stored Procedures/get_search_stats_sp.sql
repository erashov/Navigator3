
CREATE procedure [dbo].[get_search_stats_sp]
as
SELECT
	* 
FROM
	search_stats 
WHERE
	AD_user_name NOT LIKE '%AValishin%'
ORDER BY
	query_id desc
