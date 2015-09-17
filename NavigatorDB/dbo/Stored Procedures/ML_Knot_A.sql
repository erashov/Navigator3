CREATE PROCEDURE dbo.ML_Knot_A @NumML int
AS

set nocount on 


SELECT NumML, Okonchanie, Uzel_priv, Skorost_potoka, Uzel_naznach, Styk_porta, NumKanala, Oborud_Tel,Uzel_ATS, NumVlan
FROM dbo.ML_Knots
WHERE NumML = @NumML AND Okonchanie = 'A'