CREATE PROCEDURE dbo.ClientName_UpdateOsnova
    @NewClientName nvarchar(255), 
    @OldClientName nvarchar(255)


AS

set nocount on 

Update dbo.Osnova
Set Zakazchik = @NewClientName
WHERE Zakazchik = @OldClientName