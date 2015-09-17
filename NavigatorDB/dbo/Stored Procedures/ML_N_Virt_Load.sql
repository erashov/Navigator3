CREATE   PROCEDURE dbo.ML_N_Virt_Load @NumML int
AS

set nocount on 


SELECT DedNum,
UnCallFeedNum,
TimeNoResponse,
CallIntercept,
AntiAON,
DeviationIncomInvisAON,
BlockOutCallToPIN,
NumCallForward,
InteractVoiceMenu,
FaxToEmail,
VoiceMail,
MusicOnHold,
Note
FROM dbo.ML_N_Telephony
WHERE NumML = @NumML