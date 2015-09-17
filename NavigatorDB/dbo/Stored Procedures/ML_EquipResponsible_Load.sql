CREATE PROCEDURE dbo.ML_EquipResponsible_Load @NumML int,
@UnitId int
AS

set nocount off 
DECLARE @cnt int
SELECT Responsible, Kanal_priv, Data_poluch, Data_vypoln 
FROM dbo.ML_EquipResponsible
WHERE NumML = @NumML AND @UnitId = UnitId
SELECT @cnt = @@ROWCOUNT
If 0 = @cnt
 BEGIN
  INSERT INTO dbo.ML_EquipResponsible 
  VALUES (@NumML,@UnitId,'','','','')
  End