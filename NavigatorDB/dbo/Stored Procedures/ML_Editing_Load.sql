CREATE PROCEDURE dbo.ML_Editing_Load @NumML int
AS

set nocount on 
SELECT IsEditing,UserName 
FROM dbo.ML_Editing
WHERE NumML = @NumML