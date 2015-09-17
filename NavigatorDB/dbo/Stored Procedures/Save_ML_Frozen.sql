CREATE PROCEDURE dbo.Save_ML_Frozen
AS
insert into ml_frozen_past(NumML, signC3, signD1, signD2)
(select NumML, signC3, signD1, null from ML_FROZEN)

