CREATE PROCEDURE dbo.ML_Editing_INSERT @NumML int,
                                       @IsEditing int,
                                       @UserName nvarchar(255)
                                                    
                                                  
AS

set nocount on 
INSERT INTO dbo.ML_Editing
([Numml],[IsEditing],[UserName]) VALUES (@Numml, @IsEditing,@UserName)