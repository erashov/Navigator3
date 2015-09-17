CREATE PROCEDURE dbo.EquipType_Insert  @NumML int,
    @UnitId     int,
    @Okonchanie nvarchar(25),
    @Equipment  nvarchar(255),
    @SerialNum  nvarchar(255),
    @Kol_vo     int,
    @Cost       decimal (12,3),
    @CostOne decimal (12,3),
    @Designation nvarchar(500)
AS
set nocount on 
INSERT INTO dbo.ML_EquipType
       VALUES (@NumML,@UnitId,@Okonchanie,@Equipment,@SerialNum,@Kol_vo,@Cost,@CostOne,         @Designation)