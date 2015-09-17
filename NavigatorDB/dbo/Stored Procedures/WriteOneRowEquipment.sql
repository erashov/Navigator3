CREATE PROCEDURE dbo.WriteOneRowEquipment @NumML int
AS

set nocount on 

select [dbo].[GetEquipmentByNumML] (@NumML) as equipment