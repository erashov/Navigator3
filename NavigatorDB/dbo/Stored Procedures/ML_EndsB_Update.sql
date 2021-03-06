﻿CREATE PROCEDURE dbo.ML_EndsB_Update @NumML int,    
    @Styk         nvarchar(100),
    @Styk1        nvarchar(100),
    @Line_Priv    nvarchar(100),
    @Status_Styka nvarchar(100),
    @Param_Styka  nvarchar(50),
    @Adres        nvarchar(255),
    @Kontakt      nvarchar(255),
    @Dop          nvarchar(255),
    @ML_Dostupa   nvarchar(100)

AS

set nocount on 

Update dbo.ML_Ends
Set Styk=@Styk,
    Styk1=@Styk1,
    Line_Priv=@Line_Priv,
    Status_Styka=@Status_Styka,
    Param_Styka=@Param_Styka,
    Adres=@Adres,
    Kontakt=@Kontakt,
    Dop=@Dop,
    ML_Dostupa=@ML_Dostupa
WHERE NumML = @NumML AND Okonchanie = 'B'