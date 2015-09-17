CREATE PROCEDURE dbo.ML_Editing_Update @NumML int,
                                       @IsEditing int
    

AS
set nocount on 

Update dbo.ML_Editing Set IsEditing = @IsEditing,
UserName = (select suser_sname())
WHERE NumML = @NumML