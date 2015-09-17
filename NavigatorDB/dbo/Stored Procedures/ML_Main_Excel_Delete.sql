CREATE PROCEDURE dbo.ML_Main_Excel_Delete @NumML int

AS

set nocount on 

update ML_Main
set excel = NULL
where numml = @NumML