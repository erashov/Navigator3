
/****** Object:  Stored Procedure dbo.delete_link_sp    Script Date: 1/12/2007 12:22:11 AM ******/
CREATE PROCEDURE delete_link_sp
@link_id int
AS
delete from 
	LINKS_GLOBAL
where
	link_id = @link_id
