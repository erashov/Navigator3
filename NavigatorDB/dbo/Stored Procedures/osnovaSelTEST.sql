
/*   
	Выборка из таблицы osnova "по менеджеру"
*/

CREATE PROCEDURE [dbo].[osnovaSelTEST]
	@Manager nvarchar(30) = NULL,
	@Zakazchik nvarchar(255) = NULL,
	@Adres nvarchar(255) = NULL,
	@NumML int = NULL,
	@Cipher varchar(32) = NULL,
	@rowguid uniqueidentifier = NULL,
	@Project_manager nvarchar(30) = NULL
AS
SET NOCOUNT ON
--IF @Cipher IS NOT NULL
	SET NO_BROWSETABLE OFF
--	SELECT * FROM vMLs
	SELECT     
osn.NumML, osn.Kontakt_Ob
		,ISNULL(osn.[Marking], ' ') AS [Marking]	               
FROM         
	dbo.Osnova (NOLOCK) osn 
	LEFT JOIN dbo.List2Nav (NOLOCK) l2n ON osn.NumML = l2n.NumML
-- по-любому тут полный скан обеспечен
	WHERE (@NumML IS NULL OR osn.NumML = @NumML)
		AND (@Zakazchik IS NULL OR osn.Zakazchik LIKE '%'+@Zakazchik+'%')
		AND (@Manager IS NULL OR osn.Manager LIKE @Manager+'%' or osn.Project_Manager LIKE @Manager+'%')		
		--AND (@Project_manager IS NULL OR osn.Project_Manager LIKE @Project_Manager+'%')				
		AND (@Adres IS NULL OR osn.Adres_A LIKE '%'+@Adres+'%' OR osn.Adres_B LIKE '%'+@Adres+'%')
		AND (@Cipher IS NULL OR l2n.E LIKE '%'+@Cipher+'%' OR l2n.S LIKE '%'+@Cipher+'%' OR l2n.V LIKE '%'+@Cipher+'%' 
			OR l2n.T LIKE '%'+@Cipher+'%' OR l2n.P LIKE '%'+@Cipher+'%' OR l2n.I  LIKE '%'+@Cipher+'%' 
			OR l2n.R LIKE '%'+@Cipher+'%' OR l2n.SpecOb LIKE '%'+@Cipher+'%'OR l2n.cr LIKE '%'+@Cipher+'%'
			OR l2n.N LIKE '%'+@Cipher+'%'OR l2n.Fe LIKE '%'+@Cipher+'%'OR l2n.Q LIKE '%'+@Cipher+'%')
		AND (@rowguid IS NULL OR osn.rowguid = @rowguid) -- исключительно для Resync на клиенте
	ORDER BY osn.NumML DESC






