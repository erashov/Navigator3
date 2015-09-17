CREATE PROCEDURE dbo.ML_EndsA_L3_Characteristics_Update @NumML int,
    @RouteType nvarchar(255), 
    @NetAdres nvarchar(100), 
    @NetMask nvarchar(100), 
    @GatewayAdres nvarchar(100), 
    @VPN   nvarchar(100),
    @ASNum   nvarchar(100), 
    @NatEquipment nvarchar(512),
    @IpType nvarchar(255)
    

AS

     
set nocount on 

Update dbo.ML_Ends Set RouteType = @RouteType,
NetAdres = @NetAdres,
NetMask = @NetMask,
GatewayAdres = @GatewayAdres,
VPN = @VPN,
ASNum = @ASNum,
NatEquipment = @NatEquipment,
IpType = @IpType
WHERE NumML = @NumML AND Okonchanie = 'A'