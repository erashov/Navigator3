CREATE PROCEDURE dbo.ML_Main_MSO_Characteristics_Update @NumML int,
                                    @SignalFormat nvarchar(50),
                                    @NumberRetrans int
                                                                        
AS

set nocount on 
Update dbo.ML_Main
Set SignalFormat = @SignalFormat,NumberRetrans = @NumberRetrans  Where NumML = @NumML