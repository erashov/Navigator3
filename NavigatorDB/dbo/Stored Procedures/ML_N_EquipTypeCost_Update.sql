CREATE PROCEDURE dbo.ML_N_EquipTypeCost_Update @Id int,
                                               @Cost decimal (12,3)

AS


Update ML_EquipType
Set Cost = @Cost
WHERE Id = @Id