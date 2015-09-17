create PROCEDURE [dbo].[reports_eto_2_1]
	@start_date nvarchar(25),
	@end_date nvarchar(25)
	AS
select count(*)
from
	Osnova
where 
	((Dop_A LIKE N'% ЕТО%') OR (Dop_B LIKE N'% ЕТО%')) 
	AND (Utverzh_M > CONVERT(DATETIME, @start_date, 102))
	AND (Utverzh_M < CONVERT(DATETIME, @end_date, 102))
