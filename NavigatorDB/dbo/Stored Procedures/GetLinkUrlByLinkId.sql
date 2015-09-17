CREATE PROCEDURE GetLinkUrlByLinkId
	@link_id int
AS
select link_url
from LINKS_GLOBAL
where link_id = @link_id