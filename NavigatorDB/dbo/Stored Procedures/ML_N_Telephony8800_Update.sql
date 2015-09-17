CREATE PROCEDURE dbo.ML_N_Telephony8800_Update @NumML int,    
    @Number         nvarchar(50),
    @PortNum        nvarchar(50),
    @Lock           nvarchar(25),
    @BanCallIn      nvarchar(50),
    @UnCallFeed     nvarchar(50),
    @UnCallFeedNum  nvarchar(50),
    @NumTech        nvarchar(max),
    @CodeNumTech    nvarchar(max),
    @Res8800        nvarchar(max),
    @Num8800        nvarchar(max),
    @Operator       nvarchar(255),
    @Note           nvarchar(max)
    
AS

set nocount on 

Update dbo.ML_N_Telephony
Set Number = @Number,
    PortNum = @PortNum,
    Lock = @Lock,
    BanCallIn = @BanCallIn,
    UnCallFeed = @UnCallFeed,
    UnCallFeedNum = @UnCallFeedNum,
    NumTech = @NumTech,
    CodeNumTech = @CodeNumTech,
    Res8800 = @Res8800,
    Num8800 = @Num8800,
    Operator = @Operator,
    Note = @Note
WHERE NumML = @NumML