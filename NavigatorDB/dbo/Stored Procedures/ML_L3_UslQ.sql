CREATE PROCEDURE dbo.ML_L3_UslQ
@NumML int
AS
set nocount on 


SELECT NumML, CodeBC, NumUslQ
FROM dbo.ML_Knots
WHERE NumML = @NumML 
