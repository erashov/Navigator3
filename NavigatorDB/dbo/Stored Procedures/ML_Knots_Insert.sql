CREATE PROCEDURE dbo.ML_Knots_Insert @NumML int,  
    @Okonchanie   nvarchar(25) 

AS

set nocount on 

Insert Into dbo.ML_Knots ([NumML],[Okonchanie]) Values (@NumML,@Okonchanie)
