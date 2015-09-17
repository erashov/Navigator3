CREATE PROCEDURE [COMCOR\OSFrantseva].CloseTaskById 
	@taskId int, 
	@interface varchar(500), 
	@userName varchar(100),
	@report varchar(4000)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @rsNumber int
	set @rsNumber = (select t.NumML from Wfl_Tasks t where Id=@taskId)
	exec close_task @rsNumber, @interface, @userName, @report, @taskId
END
