/*
	Назначение:
Возвращает маршрутники заданного диапазона. Используется на SWAN для TotalReport во избежание избежать distributed queries 

Note: 
	На вход нужно подавать УЖЕ округленные в известном смысле даты
*/
CREATE PROCEDURE [dbo].[MLForTotalReport]
	@DateStart datetime,
	@DateEnd datetime
AS
SET NOCOUNT ON

select distinct * from (
SELECT osn.NumML, osn.Utverzh_B, l2n.sdan, CAST (CASE WHEN l2n.equpments IS NOT NULL THEN 1 ELSE 0 END AS bit) as eq,
	RTRIM(SUBSTRING(Manager,1,CASE CHARINDEX(' ',Manager) WHEN 0 THEN LEN(Manager) ELSE CHARINDEX(' ',Manager) END)) AS Manager,
	NULL AS ManagerId, NULL AS TheServiceId
FROM osnova osn
	LEFT JOIN List2Nav l2n ON osn.NumML = l2n.NumML
WHERE (osn.Utverzh_B BETWEEN @DateStart AND @DateEnd)
UNION ALL 
SELECT osn.NumML, osn.Utverzh_B, l2n.sdan, CAST (CASE WHEN l2n.equpments IS NOT NULL THEN 1 ELSE 0 END AS bit),
	RTRIM(SUBSTRING(Manager,1,CASE CHARINDEX(' ',Manager) WHEN 0 THEN LEN(Manager) ELSE CHARINDEX(' ',Manager) END)) AS Manager,
	NULL AS ManagerId, NULL AS TheServiceId
FROM osnova osn
	LEFT JOIN List2Nav l2n ON osn.NumML = l2n.NumML
WHERE
	(l2n.sdan BETWEEN @DateStart AND @DateEnd))a