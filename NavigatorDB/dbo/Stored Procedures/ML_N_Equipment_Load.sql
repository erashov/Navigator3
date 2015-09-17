CREATE PROCEDURE dbo.ML_N_Equipment_Load @NumML int
AS

set nocount on 


SELECT Equipment, SerialNum, Kol_vo, Cost
FROM dbo.ML_EquipType
WHERE NumML = @NumML