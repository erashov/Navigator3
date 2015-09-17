CREATE PROCEDURE dbo.ML_Main_EqNum_Update @NumML int,
                                    @EqNum nvarchar(50)
                                                                        
AS

set nocount on 
Update dbo.ML_Main
Set EqNum = @EqNum Where NumML = @NumML