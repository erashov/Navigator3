CREATE PROCEDURE dbo.ML_Telephony_Delete @NumML int
AS

set nocount on 


Delete ML_N_Telephony
WHERE NumML = @NumML