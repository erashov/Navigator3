CREATE PROCEDURE dbo.ML_L3_EndsA_C_Update @NumML int,    
    @NumC          nvarchar(255),
    @CameraModel   nvarchar(100)

AS

set nocount on 

Update dbo.ML_Ends
Set 
    NumC=@NumC,
    CameraModel = @CameraModel
WHERE NumML = @NumML AND Okonchanie = 'A'