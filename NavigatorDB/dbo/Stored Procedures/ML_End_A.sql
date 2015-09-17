CREATE PROCEDURE dbo.ML_End_A @NumML int
AS

set nocount on 


SELECT NumML, Okonchanie, Styk, Styk1, Line_priv, Status_Styka, Param_Styka, Adres, Kontakt,Dop, ML_Dostupa, VPN, NetAdres,NetMask,GatewayAdres,ASNum,RouteType, NatEquipment, IpType
FROM dbo.ML_Ends
WHERE NumML = @NumML AND Okonchanie = 'A'