CREATE   PROCEDURE [dbo].[ML_N_Tel_Load] @NumML int
AS

set nocount on 


SELECT NumML, Number, PortNum, Lock, ExtAccess, InAccess, BanCallIn, UnCallFeed, ResNum, CodeT, DedNum, ListResNum, NumInSet, NumList, AONShar, UnCallFeedNum, PersNumbering, StayLinkExt, StayLinkInt, Operator, NumLineE1, AONTun, InNumAdd, WaitNum, TripleLink, TripleConfLink, Note, SPD_PGI
FROM dbo.ML_N_Telephony
WHERE NumML = @NumML