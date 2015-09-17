CREATE PROCEDURE dbo.ML_EquipProv @NumML int
AS

set nocount on 


SELECT Probl
from List2nav
WHERE NumML = @NumML