CREATE PROCEDURE dbo.ML_EquipResponsible_ForUVK_Update @NumML int,    
    @Kanal_priv          nvarchar(255),
    @Data_vypoln         nvarchar(100)


AS

set nocount on 

Update dbo.ML_EquipResponsible
Set Kanal_priv = @Kanal_priv, Data_vypoln = @Data_vypoln
WHERE NumML = @NumML AND UnitId = 1