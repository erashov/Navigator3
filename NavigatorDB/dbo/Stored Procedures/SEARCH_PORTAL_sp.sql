CREATE PROCEDURE [dbo].[SEARCH_PORTAL_sp]
	@text_to_search varchar(254)
AS
SELECT
	* 
FROM
	LINKS_GLOBAL 
WHERE
	(
		UPPER(link_title) LIKE '%' + UPPER(@text_to_search) + '%' 
		OR UPPER(link_desc) LIKE '%' + UPPER(@text_to_search) + '%'
		OR UPPER(link_url) LIKE '%' + UPPER(@text_to_search) + '%'
		OR UPPER(link_project) LIKE '%' + UPPER(@text_to_search) + '%'
		OR UPPER(link_comment) LIKE '%' + UPPER(@text_to_search) + '%'
	)

	and
	(
		UPPER(link_project) LIKE '%КОРПОРАТ%'
		OR UPPER(link_comment) LIKE '%КОРПОРАТ%'
		OR UPPER(link_title) LIKE '%КОРПОРАТ%'
	)
	and UPPER(link_project) NOT LIKE '%МОИ ССЫЛКИ%'
	and is_active = 1
ORDER BY 
	link_id
