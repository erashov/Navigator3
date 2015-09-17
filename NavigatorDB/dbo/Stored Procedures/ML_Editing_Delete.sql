CREATE PROCEDURE dbo.ML_Editing_Delete @NumML int
AS

set nocount on 


Delete ML_Editing
WHERE NumML = @NumML