CREATE PROCEDURE dbo.ML_Main_PortMMTSNum_Update @NumML int
                                                                        
AS

set nocount on 
Update dbo.ML_Main
Set PortMMTSNum = (select PortMMTSNum from list2nav where numml =  @NumML)
Where NumML = @NumML