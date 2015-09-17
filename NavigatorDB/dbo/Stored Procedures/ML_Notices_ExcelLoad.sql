CREATE PROCEDURE dbo.ML_Notices_ExcelLoad @NumML int
AS

set nocount on 


SELECT UzelOV, NumOV,AdresOV, ZakazchikOV,NumUsl,NumMLOV
FROM dbo.ML_Notices
WHERE NumML = @NumML
ORDER BY NumOV