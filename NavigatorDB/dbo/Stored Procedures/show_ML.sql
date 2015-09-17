CREATE procedure [dbo].[show_ML]
	@NumML int
as
	select * from Osnova where NumML = @NumML