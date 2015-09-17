CREATE PROCEDURE dbo.ML_Lines_Insert @NumML int,  
    @Line_type   nvarchar(25) 

AS

set nocount on 

Insert Into dbo.ML_Lines ([NumML],[Line_type]) Values (@NumML,@Line_type)
