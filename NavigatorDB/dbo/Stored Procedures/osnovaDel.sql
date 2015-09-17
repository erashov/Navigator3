/*
Назначение:
	Дать менеджерам возможность удаления еще не утвержденных МЛ
Вход:
Выход:
*/
CREATE PROCEDURE dbo.osnovaDel
	@NumML int
AS
SET NOCOUNT ON

IF (SELECT Utverzh_B FROM osnova WHERE NumML = @NumML) IS NULL
	DELETE FROM osnova
	WHERE NumML = @NumML