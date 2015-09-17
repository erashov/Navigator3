CREATE PROCEDURE dbo.ML_L2_Knot_A @NumML int
AS

set nocount on 


SELECT NumML, Okonchanie, Abonent_Okonchanie, Uzel_priv, Transp_uzel, Marshrutizator, NumKanala, NumVlan
FROM dbo.ML_Knots
WHERE NumML = @NumML AND Okonchanie = 'A'