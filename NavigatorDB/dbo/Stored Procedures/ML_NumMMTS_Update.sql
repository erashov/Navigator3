CREATE PROCEDURE dbo.ML_NumMMTS_Update @NumML int,    
                                   @PortMMTSNum nvarchar(32)
AS

set nocount on 

Update dbo.ML_Main
Set PortMMTSNum = @PortMMTSNum
WHERE NumML = @NumML