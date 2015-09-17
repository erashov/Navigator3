CREATE PROCEDURE dbo.ML_N_Tel8800_Load @NumML int
AS

set nocount on 


SELECT NumML, Number, PortNum, Lock, BanCallIn, UnCallFeed, UnCallFeedNum, NumTech, CodeNumTech, Res8800, Num8800,operator,Note
FROM dbo.ML_N_Telephony
WHERE NumML = @NumML