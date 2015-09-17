CREATE FUNCTION [dbo].[StringToDate_old]
(
	@date nvarchar(max)
)
RETURNS datetime
AS
BEGIN
	DECLARE @dt datetime;
	if(isdate(@date)=1)
		set @dt = convert(datetime, @date, 4);
	else
		set @dt = null;
	
	return @dt;
END