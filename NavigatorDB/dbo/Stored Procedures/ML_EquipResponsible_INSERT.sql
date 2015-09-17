CREATE PROCEDURE dbo.ML_EquipResponsible_INSERT @NumML int,
                                    @UnitId int
                                        
AS

set nocount on 
INSERT INTO ML_EquipResponsible
([NumML],[UnitId]) VALUES (@NumML,@UnitId)