CREATE PROCEDURE dbo.ML_Main_Delete @NumML int
AS

set nocount on 


Delete ML_Main
WHERE NumML = @NumML
