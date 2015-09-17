CREATE PROCEDURE dbo.ML_L3_Knot_B @NumML int
AS

set nocount on 


SELECT NumML, Okonchanie, Abonent_Okonchanie, Uzel_priv, Transp_uzel, Marshrutizator, NumKanala, NumVlan
FROM dbo.ML_Knots
WHERE NumML = @NumML AND Okonchanie = 'B'