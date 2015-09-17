CREATE PROCEDURE dbo.ML_EquipmentConst_Load @NumML int
AS

set nocount on 
DECLARE @cnt int
SELECT Data_organiz, Otvetstv_Organiz, Predst_zakazchika, Inf_Data, Summa 
FROM dbo.ML_Equipment
WHERE NumML = @NumML