CREATE PROCEDURE dbo.ML_N_Virt_Update @NumML int,    
    @DedNum nvarchar(max),
    @UnCallFeedNum nvarchar(50),
    @TimeNoResponse nvarchar(255),
    @CallIntercept nvarchar(255),
    @AntiAON nvarchar(255),
    @DeviationIncomInvisAON nvarchar(255),
    @BlockOutCallToPIN nvarchar(255),
    @NumCallForward nvarchar(255),
    @InteractVoiceMenu nvarchar(255),
    @FaxToEmail nvarchar(255),
    @VoiceMail nvarchar(255),
    @MusicOnHold nvarchar(255),
    @Note nvarchar(max)
    
AS

set nocount on 

Update dbo.ML_N_Telephony
Set DedNum = @DedNum,
    UnCallFeedNum = @UnCallFeedNum,
    TimeNoResponse = @TimeNoResponse,
    CallIntercept = @CallIntercept,
    AntiAON = @AntiAON,
    DeviationIncomInvisAON = @DeviationIncomInvisAON,
    BlockOutCallToPIN = @BlockOutCallToPIN,
    NumCallForward = @NumCallForward,
    InteractVoiceMenu = @InteractVoiceMenu,
    FaxToEmail = @FaxToEmail,
    VoiceMail = @VoiceMail,
    MusicOnHold = @MusicOnHold,
    Note = @Note
WHERE NumML = @NumML