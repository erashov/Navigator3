CREATE PROCEDURE dbo.ML_Notices_INSERT @NumML int,
    @NumMLOV     nvarchar(50),
    @UzelOV      nvarchar(50),
    @NumOV       nvarchar(50),
    @AdresOV     nvarchar(255),
    @ZakazchikOV nvarchar(255),
    @NumUsl      nvarchar(100)
AS

set nocount on 
INSERT INTO dbo.ML_Notices
VALUES (@NumML, @NumMLOV,@UzelOV, @NumOV, @AdresOV, @ZakazchikOV,@NumUsl)