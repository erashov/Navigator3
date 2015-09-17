create procedure report_ML_1
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as

	/* СК выполненные КомРег более 10 дней */
	SELECT
		List2Nav.Sdan,
		List2Nav.utverzh,
		List2Nav.NumML,
		List2Nav.Zakazhcik,
		List2Nav.Usluga,
		Osnova.Pre_Usluga,
		Osnova.Usluga
	FROM
		List2Nav LEFT JOIN Osnova
		ON List2Nav.NumML = Osnova.NumML
	WHERE
	(
		List2Nav.Sdan = CONVERT(DATETIME, @start_date, 102)
		/* and List2Nav.utverzh = CONVERT(DATETIME, '2007-02-13', 102) */
		and
		((List2Nav.NumML) Not Like '%-%'
		And (List2Nav.NumML)<1000000)
		AND (
			List2Nav.Zakazhcik Like '%КОМКОР%'
			And List2Nav.Zakazhcik Like '%регион%'
		)
		AND ((List2Nav.ProblML) Is Null)
	)
	ORDER BY List2Nav.utverzh