CREATE PROCEDURE dbo.ML_L2_KnotB_Update @NumML int,    
    @Abonent_Okonchanie      nvarchar(255),
    @Uzel_priv nvarchar(100),
    @Transp_uzel   nvarchar(255),
    @Marshrutizator     nvarchar(255),
    @NumKanala      nvarchar(100)

AS

set nocount on 

Update dbo.ML_Knots
Set Abonent_Okonchanie=@Abonent_Okonchanie,
    Uzel_priv=@Uzel_priv,
    Transp_uzel=@Transp_uzel,
    Marshrutizator = @Marshrutizator,
    NumKanala=@NumKanala
WHERE NumML = @NumML AND Okonchanie = 'B'