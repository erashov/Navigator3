
CREATE PROCEDURE [dbo].[SEARCH_LINKS_GLOBAL_sp]
	@text_to_search varchar(254)
AS
SELECT
	* 
FROM
	LINKS_GLOBAL 
WHERE
	UPPER(link_title) LIKE '%' + UPPER(@text_to_search) + '%' 
	OR UPPER(link_desc) LIKE '%' + UPPER(@text_to_search) + '%'
	OR UPPER(link_url) LIKE '%' + UPPER(@text_to_search) + '%'
	OR UPPER(link_project) LIKE '%' + UPPER(@text_to_search) + '%'
	OR UPPER(link_comment) LIKE '%' + UPPER(@text_to_search) + '%'
ORDER BY 
	link_id
