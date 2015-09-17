CREATE PROCEDURE dbo.ML_Main_DataUtvUpdate @NumML int,
                                           @Data_utv nvarchar (50)
 
AS

set nocount on 
Update dbo.ML_Main
Set Data_utv = @Data_utv
Where NumML = @NumML