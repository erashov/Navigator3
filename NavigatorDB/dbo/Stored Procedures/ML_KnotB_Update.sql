CREATE PROCEDURE dbo.ML_KnotB_Update @NumML int,    
    @Uzel_priv      nvarchar(255),
    @Skorost_potoka nvarchar(100),
    @Uzel_naznach   nvarchar(255),
    @Styk_porta     nvarchar(255),
    @NumVlan      nvarchar(128),
    @NumKanala      nvarchar(100)

AS

set nocount on 

Update dbo.ML_Knots
Set Uzel_priv=@Uzel_priv,
    Skorost_potoka=@Skorost_potoka,
    Uzel_naznach=@Uzel_naznach,
    Styk_porta=@Styk_porta,
    NumVlan=@NumVlan,
    NumKanala=@NumKanala
WHERE NumML = @NumML AND Okonchanie = 'B'