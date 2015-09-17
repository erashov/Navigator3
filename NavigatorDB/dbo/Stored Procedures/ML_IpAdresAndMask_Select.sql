CREATE PROCEDURE dbo.ML_IpAdresAndMask_Select @NumML int
 
AS

set nocount on 
Select IP_Adres1, IP_Adres2, Maska1,Maska2
From dbo.ML_Main
Where NumML = @NumML