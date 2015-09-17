CREATE FUNCTION [dbo].[GetEquipmentByNumML] (@NumML int)  
returns varchar(2048) AS
BEGIN

DECLARE @ch VARCHAR(2048)
SELECT @ch = ISNULL(@ch, '') + Equipment + ' Окончание: ' + Okonchanie + ' ' + +CHAR(13)+CHAR(10)FROM ML_EquipType
WHERE NumML = @NumML
order by Okonchanie

return ISNULL(@ch, '')
END