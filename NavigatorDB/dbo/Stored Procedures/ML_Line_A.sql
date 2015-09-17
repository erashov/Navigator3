CREATE PROCEDURE dbo.ML_Line_A @NumML int
AS

set nocount on 


SELECT NumML, Line_type, Adres_ULSS, Markirovka, Uzlovaya_stanc
FROM dbo.ML_Lines
WHERE NumML = @NumML AND Line_type = 'A'