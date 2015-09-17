CREATE PROCEDURE dbo.ML_N_EquipResponsible_INSERT @NumML int,
                                                    @UnitId int,
                                                    @Responsible nvarchar(255),
                                                    @Kanal_priv  nvarchar(255),
                                                    @Data_poluch datetime,
                                                    @Data_vypoln datetime
AS

set nocount on 
DECLARE @cnt int
SELECT @cnt = @@ROWCOUNT

IF (SELECT NumML FROM dbo.ML_EquipResponsible) <>@NumML AND (SELECT UnitId FROM dbo.ML_EquipResponsible) <> @UnitId
BEGIN
INSERT INTO dbo.ML_EquipResponsible
VALUES (@NumML, @UnitId,@Responsible, @Kanal_priv, @Data_poluch, @Data_vypoln)

END