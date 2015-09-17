CREATE PROCEDURE dbo.ML_Equipment_ExcelLoad @NumML int,
@UnitId int, 
@Okonchanie nvarchar(25)

AS

set nocount on 


SELECT Equipment, SerialNum, Kol_vo, Cost, Designation
FROM dbo.ML_EquipType
WHERE NumML = @NumML AND UnitId = @UnitId AND Okonchanie = @Okonchanie