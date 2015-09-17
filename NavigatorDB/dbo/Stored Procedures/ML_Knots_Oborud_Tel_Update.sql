CREATE PROCEDURE dbo.ML_Knots_Oborud_Tel_Update @NumML int,  
                                                @Oborud_Tel   nvarchar(max) 

AS

set nocount on 

Update dbo.ML_Knots Set Oborud_Tel = @Oborud_Tel Where NumML = @NumML and Okonchanie = 'A'
