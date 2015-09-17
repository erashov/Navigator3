CREATE PROCEDURE dbo.ML_Main_T_ChanalType_Update @NumML int,
                                    @Chanal_Type nvarchar(25)
                                                                        
AS

set nocount on 
Update dbo.ML_Main
Set Chanal_Type = @Chanal_Type Where NumML = @NumML