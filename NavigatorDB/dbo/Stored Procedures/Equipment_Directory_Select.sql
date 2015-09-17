CREATE PROCEDURE dbo.Equipment_Directory_Select @Equipment nvarchar (500),@UnitId int
AS

set nocount on 
SELECT UnitId,SerialNum,CostOne
From dbo.ML_Equipment_Directory
WHERE Equipment = @Equipment AND UnitId = @UnitId