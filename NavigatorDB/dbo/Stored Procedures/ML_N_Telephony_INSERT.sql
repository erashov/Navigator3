CREATE PROCEDURE [dbo].[ML_N_Telephony_INSERT] @NumML int,
                                    @PortNum nvarchar(50),
                                    @ResNum nvarchar(50),
                                    @CodeT nvarchar(50),
                                    @DedNum nvarchar(max),
                                    @ListResNum nvarchar(max),
                                    @NumInSet nvarchar(max),
                                    @NumList nvarchar(max),
                                    @AONShar nvarchar(50),
                                    @NumLineE1 nvarchar(50),
                                    @AONTun nvarchar(50),
                                    @InNumAdd nvarchar(50),
                                    @ExtAccess nvarchar(50),
                                    @InAccess nvarchar(50),
                                    @BanCallIn nvarchar(50),
                                    @UnCallFeed nvarchar(50),
                                    @UnCallFeedNum nvarchar(50),
                                    @PersNumbering nvarchar(50),
                                    @StayLinkExt nvarchar(50),
                                    @StayLinkInt nvarchar(50),
                                    @Operator nvarchar(255),
                                    @WaitNum nvarchar(50),
                                    @TripleLink nvarchar(50),
                                    @TripelConfLink nvarchar(50),
									@SPD_PGI nvarchar(50) = NULL
        
AS

set nocount on 
INSERT INTO ML_N_Telephony
([NumML],[PortNum],[ResNum],[CodeT],[DedNum],[ListResNum],[NumInSet],[NumList],[AONShar],[NumLineE1],[AONTun],[InNumAdd],[ExtAccess],[InAccess],[BanCallIn],[UnCallFeed],[UnCallFeedNum],[PersNumbering],[StayLinkExt],[StayLinkInt],[Operator],[WaitNum],[TripleLink],[TripleConfLink],[SPD_PGI]) VALUES (@NumML,@PortNum,@ResNum,@CodeT,@DedNum,@ListResNum,@NumInSet,@NumList,@AONShar,@NumLineE1,@AONTun,@InNumAdd,@ExtAccess,@InAccess,@BanCallIn,@UnCallFeed,@UnCallFeedNum,@PersNumbering,@StayLinkExt,@StayLinkInt,@Operator,@WaitNum,@TripleLink,@TripelConfLink,@SPD_PGI)