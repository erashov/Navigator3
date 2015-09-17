CREATE PROCEDURE dbo.ML_EndsA_C_Characteristics_Update @NumML int,
    @RouteType nvarchar(255), 
    @NetAdres nvarchar(100), 
    @NetMask nvarchar(100), 
    @GatewayAdres nvarchar(100), 
    @NumC   nvarchar(100),
    @CameraModel   nvarchar(100)
    

AS

     
set nocount on 

Update dbo.ML_Ends Set RouteType = @RouteType,
NetAdres = @NetAdres,
NetMask = @NetMask,
GatewayAdres = @GatewayAdres,
NumC = @NumC,
CameraModel = @CameraModel
WHERE NumML = @NumML AND Okonchanie = 'A'