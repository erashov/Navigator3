CREATE PROCEDURE add_new_search_sp
	@search_text varchar(4000),
	@AD_user_name varchar(254),
	@user_ip varchar(50),
	@project varchar(4000),
	@search_url varchar(4000)
AS
insert into SEARCH_STATS
(
	search_text, 
	AD_user_name, 
	user_ip, 
	project,
	search_url
)
values
(
	@search_text, 
	@AD_user_name, 
	@user_ip, 
	@project,
	@search_url
)
