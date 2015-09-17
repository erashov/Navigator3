CREATE PROCEDURE dbo.ML_N_Telephony_8800_INSERT @NumML int,
                                    @Operator nvarchar(255),
                                    @BanCallIn nvarchar(50),
                                    @UnCallFeed nvarchar(50),
                                    @UnCallFeedNum nvarchar(50),
                                    @NumTech nvarchar(max),
                                    @CodeNumTech nvarchar(max),
                                    @Res8800 nvarchar(max),
                                    @Num8800 nvarchar(max)
              
        
AS

set nocount on 
INSERT INTO ML_N_Telephony
([NumML],[Operator],[BanCallIn],[UnCallFeed],[UnCallFeedNum],[NumTech],[CodeNumTech],[Res8800],[Num8800]) VALUES (@NumML,@Operator,@BanCallIn,@UnCallFeed,@UnCallFeedNum,@NumTech,@CodeNumTech,@Res8800,@Num8800)