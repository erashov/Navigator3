CREATE PROCEDURE dbo.ClientName_UpdateList2nav
    @NewClientName nvarchar(255), 
    @OldClientName nvarchar(255)


AS

set nocount on 

Update dbo.List2Nav
Set Zakazhcik = @NewClientName
WHERE Zakazhcik = @OldClientName