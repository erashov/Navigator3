CREATE PROCEDURE dbo.ML_EquipmentConst_Update @NumML int,
    @Data_Organiz      nvarchar(23),
    @Otvetstv_Organiz  nvarchar(100),
    @Predst_Zakazchika nvarchar(100),
    @Inf_Data          nvarchar(23)
    
AS

set nocount on 

Update ML_Equipment
Set Data_Organiz = @Data_Organiz,
Otvetstv_Organiz = @Otvetstv_Organiz,
Predst_Zakazchika = @Predst_Zakazchika,
Inf_Data = @Inf_Data
WHERE NumML = @NumML