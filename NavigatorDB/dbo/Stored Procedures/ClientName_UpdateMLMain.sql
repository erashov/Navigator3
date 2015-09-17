CREATE PROCEDURE dbo.ClientName_UpdateMLMain
    @NewClientName nvarchar(255), 
    @OldClientName nvarchar(255)


AS

set nocount on 

Update dbo.ML_Main
Set Zakazchik = @NewClientName
WHERE Zakazchik = @OldClientName