CREATE PROCEDURE dbo.ML_Sdan @NumML int
AS

set nocount on 


SELECT NumML, Sdan
from List2nav
WHERE NumML = @NumML