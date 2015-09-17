CREATE PROCEDURE dbo.ML_Knot_B @NumML int
AS

set nocount on 


SELECT NumML, Okonchanie, Uzel_priv, Skorost_potoka, Uzel_naznach, Styk_porta, NumVlan,NumKanala, Oborud_Tel, Uzel_ATS
FROM dbo.ML_Knots
WHERE NumML = @NumML AND Okonchanie = 'B'