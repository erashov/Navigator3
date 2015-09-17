

/*   
	Выборка из таблицы osnova "по менеджеру"
*/

CREATE PROCEDURE [dbo].[osnovaSel]
	@Manager nvarchar(30) = NULL,
	@Zakazchik nvarchar(255) = NULL,
	@Adres nvarchar(255) = NULL,
	@NumML int = NULL,
	@Cipher varchar(32) = NULL,
	@rowguid uniqueidentifier = NULL,
	@Project_manager nvarchar(30) = NULL,
	@BridgeId int = NULL,
	@Oper varchar(255) = NULL,
	@usluga varchar(125) = null
AS
SET NOCOUNT ON
IF @Cipher IS NOT NULL
	SET NO_BROWSETABLE OFF
--  Если ни один из фильтров не указан, то сбросим последние 50 МЛ
IF (@Manager IS NULL) AND (@Zakazchik IS NULL) AND (@Adres IS NULL) AND (@NumML IS NULL) 
	AND (@Cipher IS NULL) AND (@rowguid IS NULL) AND (@BridgeId IS NULL) AND (@Oper is NULL)
	AND (@usluga IS NULL)
--	SELECT TOP 50 * FROM vMLs
SELECT     TOP 50 CAST(0 AS bit) AS CheckBox, osn.Dop_A, osn.NumML, osn.rowguid, osn.Klient, osn.Pre_Usluga, osn.Usluga, osn.Zakazchik, osn.Manager, osn.Telefon, 
                      osn.Osnovanie, osn.Kontakt_Ob, osn.Skorost, osn.Kol_vo_kan, osn.Srochnost, osn.Styk_A, osn.Styk_A1, osn.Status_StykA, osn.Line_PrivA, 
                      osn.Adres_A, osn.Kontakt_A, osn.Styk_B, osn.Styk_B1, osn.Status_StykB, osn.Line_PrivB, osn.Adres_B, osn.Kontakt_B, osn.Dop_B, 
                      osn.Nom_Kan, osn.Kodir_Usl, CONVERT(varchar(8), osn.Utverzh_B, 4) AS Bprn, osn.Utverzh_M, 
                      osn.Utverzh_B, osn.town1, osn.Street1, osn.Dom1, osn.Str1, osn.Kor1, osn.flow1, osn.romm1, osn.room_BC1,osn.town2, osn.Street2, osn.Dom2, osn.Str2, osn.Kor2, 
                      osn.flow2, osn.romm2,osn.room_BC2, osn.Otv_k_utv, osn.SignI3,osn.SignI2,osn.SignC2,
		l2n.Sdan, ISNULL(l2n.E, '') + ISNULL(' ' + l2n.S, '') + ISNULL(' ' + l2n.V, '') + ISNULL(' ' + l2n.T, '') 
                      + ISNULL(' ' + l2n.P, '') + ISNULL(' ' + l2n.I, '') + ISNULL(' ' + l2n.R, '') + ISNULL(' ' + l2n.SpecOb, '')+ISNULL(' ' + l2n.N, '') +ISNULL(' ' + l2n.Fe, '')+ISNULL(' ' + l2n.L, '')+ISNULL(' ' + l2n.Q, '')  AS Cipher, l2n.E, l2n.S, l2n.V, l2n.T, l2n.P, l2n.I, 
                      l2n.R, l2n.SpecOb,l2n.N,l2n.Fe,l2n.L, 0 AS TheServiceId,osn.ParamStyk1,osn.ParamStyk2,osn.QoS,osn.List2TS,osn.Project_manager,osn.SpecProject,osn.SignD2
					  --для перемычек ММТС
					  ,osn.[BridgeId]
					  ,osn.[Marking]	
					  ,osn.[BridgeId_B]
					  ,osn.[Marking_B]
					  ,j.OperatorA
					  ,j.OperatorB
FROM         dbo.Osnova (NOLOCK) osn
--	LEFT JOIN  SWAN.ComFlow.dbo.Navigator_test_numML NxM ON osn.NumML = NxM.NumML
	LEFT JOIN dbo.List2Nav (NOLOCK) l2n ON osn.NumML = l2n.NumML
	LEFT JOIN dbo.JointInfo as j ON osn.NumML = j.NumML
	ORDER BY osn.NumML DESC
ELSE
--	SELECT * FROM vMLs
	SELECT     
		CAST(0 AS bit) AS CheckBox, osn.Dop_A, osn.NumML, osn.rowguid, osn.Klient, osn.Pre_Usluga, 
		osn.Usluga, osn.Zakazchik, osn.Manager, osn.Telefon, 
        osn.Osnovanie, osn.Kontakt_Ob, osn.Skorost, osn.Kol_vo_kan, osn.Srochnost, 
		osn.Styk_A, osn.Styk_A1, osn.Status_StykA, osn.Line_PrivA, 
		osn.Adres_A, osn.Kontakt_A, osn.Styk_B, osn.Styk_B1, osn.Status_StykB, osn.Line_PrivB, 
		osn.Adres_B, osn.Kontakt_B, osn.Dop_B, osn.Nom_Kan, osn.Kodir_Usl, 
		CONVERT(varchar(8), osn.Utverzh_B, 4) AS Bprn, osn.Utverzh_M, 
		osn.Utverzh_B, osn.town1, osn.Street1, osn.Dom1, osn.Str1, osn.Kor1, osn.flow1, osn.romm1, osn.room_BC1,
		osn.town2, osn.Street2, osn.Dom2, osn.Str2, osn.Kor2, 
		osn.flow2, osn.romm2,osn.room_BC2, osn.Otv_k_utv, osn.SignI3,osn.SignI2,osn.SignC2, l2n.Sdan, 
		ISNULL(l2n.E, '') + ISNULL(' ' + l2n.S, '') + ISNULL(' ' + l2n.V, '') + ISNULL(' ' + l2n.T, '') 
			+ ISNULL(' ' + l2n.P, '') + ISNULL(' ' + l2n.I, '') + ISNULL(' ' + l2n.R, '') 
			+ ISNULL(' ' + l2n.SpecOb, '') + ISNULL(' ' + l2n.N, '') + ISNULL(' ' + l2n.Fe, '')
			+ ISNULL(' ' + l2n.L, '') + ISNULL(' ' + l2n.cr, '') + ISNULL(' ' + l2n.Q, '')  AS Cipher, 
		l2n.E, l2n.S, l2n.V, l2n.T, l2n.P, l2n.I, l2n.R, l2n.SpecOb,l2n.N,l2n.Fe,l2n.L, 0 AS TheServiceId,
		osn.ParamStyk1,osn.ParamStyk2,osn.QoS,osn.List2TS,osn.Project_Manager,osn.SpecProject,osn.SignD2
		--для перемычек ММТС
		,osn.[BridgeId]
		,osn.[Marking]
		,osn.[BridgeId_B]
		,osn.[Marking_B]	
		,j.OperatorA
		,j.OperatorB               
FROM         
	dbo.Osnova (NOLOCK) osn 
	LEFT JOIN dbo.List2Nav (NOLOCK) l2n ON osn.NumML = l2n.NumML
	LEFT JOIN dbo.JointInfo as j ON osn.NumML = j.NumML
-- по-любому тут полный скан обеспечен
/*
	WHERE (@NumML IS NULL OR NumML = @NumML)
		AND (@Zakazchik IS NULL OR Zakazchik LIKE '%'+@Zakazchik+'%')
		AND (@Manager IS NULL OR Manager LIKE @Manager+'%')		
		AND (@Adres IS NULL OR Adres_A LIKE '%'+@Adres+'%' OR Adres_B LIKE '%'+@Adres+'%')
		AND (@Cipher IS NULL OR E = @Cipher OR S = @Cipher OR V = @Cipher OR T = @Cipher OR P = @Cipher OR I = @Cipher OR R = @Cipher OR SpecOb = @Cipher)
		AND (@rowguid IS NULL OR rowguid = @rowguid) -- исключительно для Resync на клиенте
	ORDER BY NumML DESC
*/
	WHERE (@NumML IS NULL OR osn.NumML = @NumML)
		AND (@Zakazchik IS NULL OR osn.Zakazchik LIKE '%'+@Zakazchik+'%')
		AND (@Manager IS NULL OR osn.Manager LIKE @Manager+'%' or osn.Project_Manager LIKE @Manager+'%')		
		--AND (@Project_manager IS NULL OR osn.Project_Manager LIKE @Project_Manager+'%')				
		AND (@Adres IS NULL OR osn.Adres_A LIKE '%'+@Adres+'%' OR osn.Adres_B LIKE '%'+@Adres+'%')
		AND (@Cipher IS NULL OR l2n.E LIKE '%'+@Cipher+'%' OR l2n.S LIKE '%'+@Cipher+'%' OR l2n.V LIKE '%'+@Cipher+'%' 
			OR l2n.T LIKE '%'+@Cipher+'%' OR l2n.P LIKE '%'+@Cipher+'%' OR l2n.I  LIKE '%'+@Cipher+'%' 
			OR l2n.R LIKE '%'+@Cipher+'%' OR l2n.SpecOb LIKE '%'+@Cipher+'%'OR l2n.cr LIKE '%'+@Cipher+'%'
			OR l2n.N LIKE '%'+@Cipher+'%'OR l2n.Fe LIKE '%'+@Cipher+'%'OR l2n.Q LIKE '%'+@Cipher+'%')
		AND (@BridgeId IS NULL OR osn.BridgeId = @BridgeId OR osn.BridgeId_B = @BridgeId)
		AND (@rowguid IS NULL OR osn.rowguid = @rowguid) -- исключительно для Resync на клиенте
		AND (@Oper IS NULL OR j.OperatorA LIKE '%'+@Oper+'%' OR j.OperatorB LIKE '%'+@Oper+'%')
		AND (@usluga IS NULL OR osn.usluga LIKE '%'+@usluga+'%')
	ORDER BY osn.NumML DESC







