CREATE PROCEDURE dbo.ML_T_KnotB_Update @NumML int,    
    @Uzel_priv      nvarchar(255),
    @Skorost_potoka nvarchar(100),
    @Uzel_naznach   nvarchar(255),
    @Styk_porta     nvarchar(255),
    @NumKanala      nvarchar(100),
    @Oborud_Tel     nvarchar(max),
    @Uzel_ATS       nvarchar(255), 
    @NumVlan       nvarchar(128)
AS

set nocount on 

Update dbo.ML_Knots
Set Uzel_priv=@Uzel_priv,
    Skorost_potoka=@Skorost_potoka,
    Uzel_naznach=@Uzel_naznach,
    Styk_porta=@Styk_porta,
    NumKanala=@NumKanala,
    Oborud_Tel = @Oborud_Tel,
    Uzel_ATS = @Uzel_ATS,
    NumVlan = @NumVlan
WHERE NumML = @NumML AND Okonchanie = 'B'