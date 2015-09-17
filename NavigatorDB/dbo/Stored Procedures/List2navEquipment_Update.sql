CREATE PROCEDURE dbo.List2navEquipment_Update @NumML int,
                                              @Equipment nvarchar(4000)
AS

set nocount on 

update dbo.List2Nav
set equpments = @Equipment
where numml = @NumML