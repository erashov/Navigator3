CREATE PROCEDURE dbo.ML_L3_UslBC_B_Update @NumML int,    
    @CodeBC      nvarchar(128),
    @NumUslQ nvarchar(255),
	@Oconchanie nvarchar(2)
AS

set nocount on 

Update dbo.ML_Knots
Set CodeBC=@CodeBC,
    NumUslQ=@NumUslQ
WHERE NumML = @NumML  AND Okonchanie = @Oconchanie
	RETURN
