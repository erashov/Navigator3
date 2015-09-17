CREATE PROCEDURE [dbo].[ML_Ends_Insert] @NumML int,  
    @Okonchanie   nvarchar(25), 
    @Styk         nvarchar(100),
    @Styk1        nvarchar(100),
    @Line_Priv    nvarchar(100),
    @Status_Styka nvarchar(100),
    @Param_Styka  nvarchar(50),
    @Adres        nvarchar(255),
    @Kontakt      nvarchar(255),
    @Dop          nvarchar(1024)

AS

set nocount on 

Insert Into dbo.ML_Ends ([NumML],[Okonchanie],[Styk],[Styk1],[Line_Priv],[Status_Styka],[Param_Styka],[Adres],[Kontakt],[Dop]) Values (@NumML,@Okonchanie,@Styk,@Styk1,@Line_Priv,@Status_Styka,@Param_Styka,@Adres,@Kontakt,@Dop)
