CREATE PROCEDURE AddMLOsnovaExt
	@NumML int, 
	@ContactName nvarchar(255),
	@ContactEMail nvarchar(255),
	@ContactPhone nvarchar(255)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO OsnovaExt (NumML, ContactName, ContactEMail, ContactPhone)
	VALUES
	(@NumML, @ContactName, @ContactEMail, @ContactPhone);
END
