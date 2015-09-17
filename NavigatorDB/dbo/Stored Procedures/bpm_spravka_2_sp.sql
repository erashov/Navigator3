CREATE procedure dbo.bpm_spravka_2_sp
as
	/* Телефоны менеджеров УРК */
	SELECT
		distinct Manager as 'Менеджер', Telefon as 'Телефон менеджера' 
	FROM
		Osnova 
	WHERE
		Telefon IS NOT NULL 
		AND Manager IS NOT NULL 
		AND Manager <> '' 
		AND Manager <> 'manager' 
	ORDER BY
		Manager
