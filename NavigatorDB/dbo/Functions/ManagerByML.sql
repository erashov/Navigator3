CREATE FUNCTION dbo.ManagerByML (@NumML as int)  
returns varchar(256)  AS  

BEGIN 
DECLARE @Manager varchar(256)
set @Manager = (select manager
FROM 
Navigator_test.dbo.Osnova
where  NuMML = @NumML)
RETURN @Manager
END