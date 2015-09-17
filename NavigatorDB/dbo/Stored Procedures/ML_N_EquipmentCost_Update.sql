CREATE PROCEDURE dbo.ML_N_EquipmentCost_Update @NumML int
                                               

AS

Select * From ML_EquipType where NumML = @NumML
Declare @cnt int
SELECT @cnt = @@ROWCOUNT
SELECT @cnt
DECLARE @i int
SELECT @i = 0
WHILE @i < @cnt begin
Update ML_EquipType
Set Cost = CostOne*Kol_vo
WHERE NumMl = @NumML
SELECT @i=@i+1
end


