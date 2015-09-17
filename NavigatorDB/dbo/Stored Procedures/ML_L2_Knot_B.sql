CREATE PROCEDURE dbo.ML_L2_Knot_B @NumML int
AS

set nocount on 


SELECT NumML, Okonchanie, Abonent_Okonchanie, Uzel_priv, Transp_uzel, Marshrutizator, NumKanala
FROM dbo.ML_Knots
WHERE NumML = @NumML AND Okonchanie = 'B'