CREATE PROCEDURE dbo.ML_EquipResponsible_Delete @NumML int
AS

set nocount on 


Delete ML_EquipResponsible
WHERE NumML = @NumML