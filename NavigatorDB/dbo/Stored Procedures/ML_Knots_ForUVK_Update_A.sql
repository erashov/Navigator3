CREATE PROCEDURE dbo.ML_Knots_ForUVK_Update_A @NumML int,    
    @Uzel_priv          nvarchar(255),
    @Uzel_naznach       nvarchar(255)


AS

set nocount on 

Update dbo.ML_Knots
Set Uzel_priv = @Uzel_priv, Uzel_naznach = @Uzel_naznach
WHERE NumML = @NumML AND Okonchanie = 'A'