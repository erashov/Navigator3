
CREATE PROCEDURE test2

AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @project_manager NVARCHAR(30)
	SET @project_manager = (select NumML from Osnova where NumML = 99957)

	SELECT @project_manager
END
