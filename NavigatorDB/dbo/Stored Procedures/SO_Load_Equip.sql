CREATE PROCEDURE [dbo].[SO_Load_Equip] 	@NumML int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * 
	FROM so_equipment 
	WHERE numml = @NumML

END
