CREATE PROCEDURE dbo.ML_L3_UslBC_Update @NumML int,    
    @CodeBC      nvarchar(128),
    @NumUslQ nvarchar(255)

AS

set nocount on 

Update dbo.ML_Knots
Set CodeBC=@CodeBC,
    NumUslQ=@NumUslQ
WHERE NumML = @NumML