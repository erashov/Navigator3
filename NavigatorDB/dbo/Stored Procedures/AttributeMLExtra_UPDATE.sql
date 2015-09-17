
CREATE  PROCEDURE [dbo].[AttributeMLExtra_UPDATE] @NumML int
AS
SET NOCOUNT ON
SET XACT_ABORT ON

if EXISTS (select NUMML from AttributeMLExtra where NUMML=@NumML)
BEGIN
	BEGIN TRAN
	delete from AttributeMLExtra
	where NumML =@NumML

	insert into AttributeMLExtra (AttrFullName,attrName,AttrValue,numML)
	exec comflow.dbo.ListAttributeByML  @NumML

	COMMIT TRAN
END

