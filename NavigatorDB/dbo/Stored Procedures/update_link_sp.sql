
/****** Object:  Stored Procedure dbo.update_link_sp    Script Date: 1/12/2007 12:22:11 AM ******/
CREATE PROCEDURE [dbo].[update_link_sp] 
	@link_id int,
	@link_title varchar(MAX),
	@link_desc varchar(MAX),
	@link_url varchar(MAX),
	@link_count_usings int,
	@link_parent_id int,

	@link_level int,
	@link_comment varchar(MAX),
	@link_project varchar(MAX),
	@is_active int
AS
update
	LINKS_GLOBAL
set
	link_title =  @link_title,
	link_desc = @link_desc,
	link_url = @link_url,
	link_count_usings = @link_count_usings,
	link_parent_id = @link_parent_id,

	date_last_updated = getdate(),

	link_level = @link_level,
	link_comment = @link_comment,
	link_project = @link_project,
	is_active = @is_active
where
	link_id = @link_id
