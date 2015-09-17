CREATE PROCEDURE dbo.ML_End_B @NumML int
AS

set nocount on 


SELECT NumML, Okonchanie, Styk, Styk1, Line_priv, Status_Styka, Param_Styka, Adres, Kontakt,Dop
FROM dbo.ML_Ends
WHERE NumML = @NumML AND Okonchanie = 'B'

--EXEC dbo.ML_N_End_A 132618