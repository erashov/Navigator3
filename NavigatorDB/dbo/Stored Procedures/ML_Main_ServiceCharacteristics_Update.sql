CREATE PROCEDURE dbo.ML_Main_ServiceCharacteristics_Update @NumML int,
                                    @Kol_vo_kan nvarchar(50),
                                    @QoS nvarchar(25)
                                     
AS

set nocount on 
Update dbo.ML_Main
Set Kol_vo_kan = @Kol_vo_kan, QoS = @QoS Where NumML = @NumML