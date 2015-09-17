CREATE PROCEDURE dbo.ML_Knots_ForUVK_Update_B @NumML int,    
    @Uzel_priv          nvarchar(255),
    @NumKanala          nvarchar(100)


AS

set nocount on 

Update dbo.ML_Knots
Set Uzel_priv = @Uzel_priv, NumKanala = @NumKanala
WHERE NumML = @NumML AND Okonchanie = 'B'