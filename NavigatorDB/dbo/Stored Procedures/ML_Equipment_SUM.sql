CREATE PROCEDURE dbo.ML_Equipment_SUM @NumML int

AS

set nocount on 
DECLARE @summ float
SELECT @summ = SUM (Cost) 
FROM dbo.ML_EquipType
WHERE NumML = @NumML
Update ML_Equipment
Set Summa = @summ
WHERE NumML = @NumML