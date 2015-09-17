create procedure [dbo].[report_ML_2]
	@start_date nvarchar(25),
	@end_date  nvarchar(25)
as
	/* СК возврат */
	SELECT
		List2Nav.ProblML,
		List2Nav.NumML, 
		Osnova.Manager, 
		List2Nav.Zakazhcik, 
		List2Nav.Usluga, 
		SZ_History.Data_SZ, 
		SZ_History.NomSZ, 
		SZ_History.Text 
	FROM
		SZ_History LEFT JOIN (List2Nav LEFT JOIN Osnova ON List2Nav.NumML = Osnova.NumML) ON SZ_History.NumML = List2Nav.NumML 
	WHERE
		(((SZ_History.Text) Like '%приостан%' 
		OR (SZ_History.Text) Like '%отмен%' 
		OR (SZ_History.Text) Like '%возврат%') 
		AND (List2Nav.ProblML) Like '%05.2006%' 
		and Data_SZ = CONVERT(DATETIME, '2006-05-25', 102)
	);