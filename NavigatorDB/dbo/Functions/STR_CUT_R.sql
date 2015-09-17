-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION dbo.STR_CUT_R 
(
	@source	nvarchar(2048),
	@expr	nvarchar(2048)
)
RETURNS nvarchar(2048)
AS
BEGIN
	DECLARE @pos int
	DECLARE @str nvarchar(2048)

	select @pos = PATINDEX('%'+@expr+'%', @source)

	IF @pos = 0
		select @str = @source
	ELSE
		select @str = SUBSTRING(@source, 0, @pos)

	return @str

END
