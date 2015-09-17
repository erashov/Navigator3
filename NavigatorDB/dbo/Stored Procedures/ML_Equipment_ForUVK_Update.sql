CREATE PROCEDURE dbo.ML_Equipment_ForUVK_Update @NumML int,    
    @Inf_Data        nvarchar(25)


AS

set nocount on 

Update dbo.ML_Equipment
Set Inf_Data = @Inf_Data
WHERE NumML = @NumML