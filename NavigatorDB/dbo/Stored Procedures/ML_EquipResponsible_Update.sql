CREATE PROCEDURE dbo.ML_EquipResponsible_Update @NumML int,
                                                    @UnitId int,
                                                    @Responsible nvarchar(255),
                                                    @Kanal_priv  nvarchar(255),
                                                    @Data_poluch nvarchar (23),
                                                    @Data_vypoln nvarchar (23)
AS

set nocount on 

SELECT NumML FROM dbo.ML_EquipResponsible
WHERE NumML = @NumML
DECLARE @cnt int
SELECT @cnt = @@ROWCOUNT

IF 0=@cnt
BEGIN 
INSERT INTO dbo.ML_EquipResponsible
VALUES (@NumML,@UnitId,@Responsible,@Kanal_priv,@Data_poluch,@Data_vypoln)
END
ELSE
update dbo.ML_EquipResponsible
Set NumML = @NumML,
UnitId = @UnitId,
Responsible = @Responsible, 
Kanal_priv = @Kanal_priv, 
Data_poluch = @Data_poluch, 
Data_vypoln = @Data_vypoln
WHERE NumML = @NumML AND @UnitId = UnitId