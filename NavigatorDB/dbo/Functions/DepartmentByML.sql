--Для ComFlow. Возвращает название подразделения, где в настоящий момент находится МЛ

CREATE FUNCTION dbo.DepartmentByML (@NumML as int)  
returns varchar(256)  AS  

BEGIN 
DECLARE @Dep varchar(256)
select @Dep = 
case when  (NRUSP=1 and  D_USP is null) or  (NRUSP1=1 and D_USP1 is null) then '(УСП) ' 
when  (G_A=1 and Data_Vypt_A is null) or  (G_B=1 and Data_Vypt_B is null) then '(УЛКС) ' 
when  NR_UIIAS=1 and D_UIIAS is null then '(УИИАС) ' 
when NR_USHTU=1 and D_USHTU is null then '(УШТУ) '
when  NR_USHTU=1 and D_USHTU is null then '(КОМКОР-РЕГИОН) ' else ISNULL('('+MESTONAH+') ','') end 
FROM 
Navigator_test.dbo.List2Nav
where  NuMML = @NumML
RETURN @Dep
END
