CREATE PROCEDURE dbo.ML_L3_KnotB_Update @NumML int,    
    @NumVlan      nvarchar(128)

AS

set nocount on 

Update dbo.ML_Knots
Set NumVlan=@NumVlan
WHERE NumML = @NumML AND Okonchanie = 'B'