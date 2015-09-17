
/****** Object:  Stored Procedure dbo.add_new_link_sp    Script Date: 1/12/2007 12:22:11 AM ******/
CREATE PROCEDURE [dbo].[ADD_NEW_LINK_sp]
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
insert into LINKS_GLOBAL 
(
	link_title, 
	link_desc, 
	link_url, 
	link_count_usings,
	link_parent_id,

	link_level,
	link_comment,
	link_project,
	is_active
)
values 
(
	@link_title, 
	@link_desc, 
	@link_url, 
	@link_count_usings,
	@link_parent_id,

	@link_level,
	@link_comment,
	@link_project,
	@is_active
)
