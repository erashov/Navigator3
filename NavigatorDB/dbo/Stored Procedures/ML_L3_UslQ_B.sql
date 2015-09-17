CREATE PROCEDURE dbo.ML_L3_UslQ_B @NumML int,
	@Oconchanie nvarchar(2)

AS

set nocount on 


SELECT NumML, CodeBC, NumUslQ
FROM dbo.ML_Knots
WHERE NumML = @NumML AND Okonchanie = @Oconchanie