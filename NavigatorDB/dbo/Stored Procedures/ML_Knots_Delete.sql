CREATE PROCEDURE dbo.ML_Knots_Delete @NumML int
AS

set nocount on 


Delete ML_Knots
WHERE NumML = @NumML