-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CommitML]
  @NumML int,
  @Utverzh_M datetime,
  @PersonPos nvarchar(256) = NULL,
  @Utverzh_B datetime = NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF (@Utverzh_B IS NULL)
	--утверждает не старший менеджер
	BEGIN
		UPDATE Osnova
		SET
			Utverzh_M = @Utverzh_M
		WHERE NumML = @NumML
	END
	ELSE
	BEGIN
		UPDATE Osnova
		SET
			Otv_k_utv = @PersonPos,
			Utverzh_M = ISNULL(Utverzh_M, @Utverzh_M), 
			List2TS = @Utverzh_M,
			Utverzh_B = @Utverzh_B,
			signI2 = NULL
		WHERE NumML = @NumML
	END
END

GO
GRANT ALTER
    ON OBJECT::[dbo].[CommitML] TO [ManItEx]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CommitML] TO [ManItEx]
    AS [dbo];

