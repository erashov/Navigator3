

CREATE PROCEDURE [dbo].[osnovaUpd]
	@NumML int,@Dop_A varchar(1024)
AS
SET NOCOUNT ON

UPDATE Osnova
set Dop_a=left(IsNull(dop_a,'')+IsNull(' '+@Dop_A,''),255) where NumML=@NumML and utverzh_b is null

