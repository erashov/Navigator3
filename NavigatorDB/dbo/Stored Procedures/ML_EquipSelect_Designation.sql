CREATE PROCEDURE dbo.ML_EquipSelect_Designation @Equipment nvarchar(500)
AS

set nocount on 


SELECT Designation
FROM dbo.ML_Equipment_Directory
WHERE Equipment = @Equipment AND UnitId = 3