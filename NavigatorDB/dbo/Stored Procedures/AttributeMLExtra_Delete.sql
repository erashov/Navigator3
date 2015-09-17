CREATE PROCEDURE dbo.AttributeMLExtra_Delete @NumML int

AS

set nocount on 

delete AttributeMLExtra
where numml = @NumML