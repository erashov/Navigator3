CREATE PROCEDURE dbo.ML_EndsA_VPN_Update @NumML int,  
    @VPN   nvarchar(100)

AS

set nocount on 

Update dbo.ML_Ends Set VPN = @VPN WHERE NumML = @NumML AND Okonchanie = 'A'