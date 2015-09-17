CREATE PROCEDURE dbo.ML_Scheme_Load @NumML int
AS

set nocount on 


SELECT Scheme
FROM dbo.ML_Schemes
WHERE NumML = @NumML