CREATE FUNCTION [dbo].[AddWorkingDaysToDate]
(	
   @startDate SMALLDATETIME,  
    @DaysNumber INT  
)
RETURNS Varchar(10)
AS
BEGIN 

    
    DECLARE @range INT; 

    SET @range = dbo.GetWorkingDaysNotInclisive (@startDate, 
        DATEADD(day,@DaysNumber,@startDate))
    if @range <> @DaysNumber
        WHILE (dbo.GetWorkingDaysNotInclisive(@startDate, 
                DATEADD(day,@range,@startDate))<@DaysNumber)
            begin
                SET @range = @range + 1
            END 
   
    RETURN
    (
        --select DATEADD(day,@range,@startDate)
        select convert(varchar, DATEADD(day,@range,@startDate), 104)
     );
end