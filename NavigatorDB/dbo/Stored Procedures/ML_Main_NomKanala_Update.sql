CREATE PROCEDURE dbo.ML_Main_NomKanala_Update @NumML int,    
    @Nom_Kan         nvarchar(100)

AS

set nocount on 

Update dbo.ML_Main
Set Nom_kan=@Nom_kan
WHERE NumML = @NumML