CREATE PROCEDURE dbo.StoredProcedure2
@NumML int
AS
set nocount on 


SELECT NumML, CodeBC, NumUslQ
FROM dbo.ML_Knots
WHERE NumML = @NumML 
