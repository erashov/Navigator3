CREATE PROCEDURE dbo.ML_Lines_Delete @NumML int
AS

set nocount on 


Delete ML_Lines
WHERE NumML = @NumML