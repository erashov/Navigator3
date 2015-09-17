CREATE FUNCTION [dbo].[StringToDate]
(
	@date nvarchar(max)
)
RETURNS datetime
AS
BEGIN
	DECLARE @dt datetime;
	if(isdate(@date)=1)
		if(len(@date)>8)
			set @dt = convert(datetime, @date, 104);
		else
			set @dt = convert(datetime, @date, 4);
	else
		set @dt = null;
	
	return @dt;
END