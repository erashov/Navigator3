CREATE FUNCTION dbo.NavigatorGetKontakt (@AddrId int)  
RETURNS varchar(8000) AS  
BEGIN 
    DECLARE @ret varchar(8000)
    SET @ret = ''

    SELECT @ret = @ret + 
	CASE WHEN ISNULL(P.[SurName], '')+ISNULL(P.[Name], '') <> '' AND @ret <> '' THEN '; ' ELSE '' END 
+ISNULL(P.[SurName], '')+' '
+ISNULL(P.[Name], '')+' '
+ISNULL(P.[Patronymic], '')+CASE WHEN ISNULL(P.PhoneCity, '') <> '' THEN ' тел.' ELSE '' END
+ISNULL(P.PhoneCity, '')+CASE WHEN ISNULL(P.PhoneLoc, '') <> '' THEN ', внутр.тел.' ELSE '' END
+ISNULL(P.PhoneLoc, '')+CASE WHEN ISNULL(P.PhoneMob, '') <> '' THEN ', моб.тел.' ELSE '' END
+ISNULL(P.PhoneMob, '')
    FROM SWAN.ComFlow.dbo.NxM_TheAddr2Person NxM
	INNER JOIN SWAN.ComFlow.dbo.Person P ON P.[Id] = NxM.PersonId
    WHERE (TheAddrId = @AddrId)

    RETURN NULLIF(RTRIM(LTRIM(@ret)), '')

END

