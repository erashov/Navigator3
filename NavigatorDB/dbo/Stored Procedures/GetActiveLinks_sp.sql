-- select * from LINKS_GLOBAL


/* Вывести активные ссылки */
create procedure GetActiveLinks_sp
as
	select
		* 
	from
		LINKS_GLOBAL
	where
		is_active = 1
		

