CREATE PROCEDURE dbo.ML_Ends_Delete @NumML int
AS

set nocount on 


Delete ML_Ends
WHERE NumML = @NumML
