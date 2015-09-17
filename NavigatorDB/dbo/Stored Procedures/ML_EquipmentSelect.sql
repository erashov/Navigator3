CREATE PROCEDURE dbo.ML_EquipmentSelect @NumML int,
                                        @UnitId int
                                        

AS

set nocount on 


SELECT Equipment, SerialNum, Kol_vo, Cost, Okonchanie
FROM dbo.ML_EquipType
WHERE NumML = @NumML and UnitId = @UnitId