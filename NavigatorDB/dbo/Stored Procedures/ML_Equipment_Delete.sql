CREATE PROCEDURE dbo.ML_Equipment_Delete @NumML int
AS

set nocount on 


Delete ML_Equipment
WHERE NumML = @NumML
