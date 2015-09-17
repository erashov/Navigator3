
CREATE FUNCTION MakeAddress 
(
	@town			nvarchar (150),
	@Street			nvarchar (150),
	@Dom			nvarchar (150),
	@Str			nvarchar (150),
	@Kor			nvarchar (150),
	@flow			nvarchar (150),
	@romm			nvarchar (150)
)
RETURNS nvarchar(512)
AS
BEGIN
	
	DECLARE @Address nvarchar(512)

	SET @Address = ''

	IF @town IS NOT NULL AND @town <> ''
		SET @Address = @Address + 'г. ' + @town
	IF @Address <> ''
		SET @Address = @Address + ', '
	IF @Street IS NOT NULL AND @Street <> ''
		SET @Address = @Address + @Street
	IF @Dom IS NOT NULL AND @Dom <> ''
		SET @Address = @Address + ', д. ' + @Dom
	IF @Kor IS NOT NULL AND @Kor <> ''
		SET @Address = @Address + ', корп. ' + @Kor
	IF @Str IS NOT NULL AND @Str <> ''
		SET @Address = @Address + ', стр. ' + @Str
	IF @flow IS NOT NULL AND @flow <> ''
		SET @Address = @Address + ', этаж ' + @flow
	IF @romm IS NOT NULL AND @romm <> ''
		SET @Address = @Address + ', к. ' + @romm

	RETURN @Address

END
