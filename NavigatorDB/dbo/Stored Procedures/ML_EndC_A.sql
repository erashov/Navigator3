CREATE PROCEDURE dbo.ML_EndC_A @NumML int
AS

set nocount on 


SELECT NumML, Okonchanie, Styk, Styk1, Line_priv, Status_Styka, Param_Styka, Adres, Kontakt,Dop, ML_Dostupa, NumC, NetAdres,NetMask,GatewayAdres,CameraModel,RouteType
FROM dbo.ML_Ends
WHERE NumML = @NumML AND Okonchanie = 'A'