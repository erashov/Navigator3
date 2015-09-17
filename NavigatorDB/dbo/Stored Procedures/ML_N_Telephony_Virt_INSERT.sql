CREATE PROCEDURE dbo.ML_N_Telephony_Virt_INSERT @NumML int,
                                    @DedNum nvarchar(max),
                                    @UnCallFeedNum nvarchar(50),
                                    @TimeNoResponse nvarchar(50),
                                    @CallIntercept nvarchar(255),
                                    @AntiAON nvarchar(255),
                                    @DeviationIncomInvisAON nvarchar(255),
                                    @BlockOutCallToPIN nvarchar(255),
                                    @NumCallForward nvarchar(255),
                                    @InteractVoiceMenu nvarchar(255),
                                    @FaxToEmail nvarchar(255),
                                    @VoiceMail nvarchar(255),
                                    @MusicOnHold nvarchar(255)
        
AS

set nocount on 
INSERT INTO ML_N_Telephony
([NumML],[DedNum],[UnCallFeedNum],[TimeNoResponse],[CallIntercept],[AntiAON],[DeviationIncomInvisAON],[BlockOutCallToPIN],[NumCallForward], [InteractVoiceMenu],[FaxToEmail],[VoiceMail], [MusicOnHold]) VALUES (@NumML,@DedNum,@UnCallFeedNum,@TimeNoResponse,@CallIntercept,@AntiAON,@DeviationIncomInvisAON,@BlockOutCallToPIN,@NumCallForward, @InteractVoiceMenu, @FaxToEmail, @VoiceMail, @MusicOnHold)