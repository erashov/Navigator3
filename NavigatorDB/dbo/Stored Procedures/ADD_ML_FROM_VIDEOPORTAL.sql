-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ADD_ML_FROM_VIDEOPORTAL]
(
	-- Add the parameters for the stored procedure here
	@AddrA varchar(MAX),
	@AddrB varchar(MAX),
	@CamNum int,
	@P_NUMML INT OUTPUT
)
AS
BEGIN
	
	Insert Into dbo.Osnova([Zakazchik], [Adres_A], [Adres_B], [Dop_A]) values('Видеонаблюдение', @AddrA, @AddrB, @CamNum);

	select @p_numml=max(NumML) from dbo.Osnova where Adres_A = @AddrA and [Zakazchik]='Видеонаблюдение' and Adres_B = @AddrB;

	if(@p_numml is not null) 
	BEGIN
		insert into dbo.List2Nav([NumML], [utverzh], [Usluga], [Zakazhcik], [NR_USHTU], [AdresA], [AdresB], [Dop_A])
			select NumML, getdate(), 'BF', [Zakazchik], 1, Adres_A, Adres_B, ('№ камеры: '+Dop_A) from dbo.Osnova where numml=@p_numml;

		delete from dbo.Osnova where NumMl = @p_numml;
	END;

END
