CREATE FUNCTION [dbo].[GetWorkingDaysNotInclisive]
(	
   @startDate SMALLDATETIME,  
    @endDate SMALLDATETIME  
)
RETURNS INT 
AS
BEGIN 
    DECLARE @range INT; 
    DECLARE @holydayscount INT;
    DECLARE @excludecount INT;

    SET @range = DATEDIFF(DAY, @startDate, @endDate); 
    SET @holydayscount = 
	(select count(*) from Holydays 
	where date_no_work >= @startDate and date_no_work <= @endDate 
	and not datename(weekday,date_no_work) in ('Saturday', 'Sunday'))
    SET @excludecount = 
	(select count(*) from Holydays 
	where date_work >= @startDate and date_work <= @endDate )
	
    RETURN  
    ( 
        SELECT  
            @range / 7 * 5 + @range % 7 -  
            (SELECT COUNT(*) FROM 
                ( 
                    SELECT 1 AS d 
                    UNION ALL SELECT 2  
                    UNION ALL SELECT 3  
                    UNION ALL SELECT 4  
                    UNION ALL SELECT 5  
                    UNION ALL SELECT 6  
                    UNION ALL SELECT 7 
                ) weekdays 
                WHERE d <= @range % 7  
                AND DATENAME(WEEKDAY, @endDate - d + 1)  
                IN ( 'Saturday', 'Sunday' ) 									
            ) - @holydayscount + @excludecount
    ); 
END  

