CREATE PROCEDURE dbo.ML_LinesA_Update @NumML int,    
    @Adres_ULSS     nvarchar(255),
    @Markirovka     nvarchar(100),
    @Uzlovaya_stanc nvarchar(255)

AS

set nocount on 

Update dbo.ML_Lines
Set Adres_ULSS=@Adres_ULSS,
    Markirovka=@Markirovka,
    Uzlovaya_stanc=@Uzlovaya_stanc
WHERE NumML = @NumML AND Line_type = 'A'