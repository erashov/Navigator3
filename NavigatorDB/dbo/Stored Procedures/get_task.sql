





CREATE PROCEDURE [dbo].[get_task](@NumML int, @Interface varchar(500), @GetUser varchar(100), @TaskId int)
as
SET NOCOUNT ON;
declare @IdInterfaceDepartment int;--varchar(50);
declare @adname_is varchar(32);
declare @idGplrDept int;
declare @idGomlDept int;

set @IdInterfaceDepartment=(select Id from Wfl_Depts where ((replace(@Interface,' ','') like  '%[_]'+Wfl_Depts.DeptInt+'%' or @Interface like '%[ ]'+Wfl_Depts.DeptInt+'%') and @Interface is not null) or (DeptInt is null and @Interface is null) or (DeptInt=@Interface))
set @idGomlDept = (select cast(Value as int) from Wfl_Settings where code = 'PrimaryRouteSheetProcessor')
set @idGplrDept = (select id from Wfl_Depts d where d.DeptName='ГПЛР')
set @adname_is=(
	select AdName 
	from [dbo].[Wfl_UsersInterfaceDepts] u
	where u.[DeptId]=@IdInterfaceDepartment and u.AdName like @GetUser)
PRINT '2='+cast(@IdInterfaceDepartment as varchar(10))
if  @adname_is is null
    begin
    exec add_user @GetUser, @Interface  
    end

BEGIN TRY
   BEGIN TRANSACTION 
   -- принято в работу
   update wfl_tasks set  GetTaskDate=Getdate(), GetTaskUser=@GetUser where Id=@TaskId and DepartmentIdTo=@IdInterfaceDepartment
   -- Для заданий выданных из ГОМЛ в ГПЛР при принятии в работу задания ОУ - родителем становится задание в ОУ
   declare @Dept int --varchar(50)
   declare @parentTaskId int
	  select @Dept=DepartmentIdFrom, @parentTaskId=ParentId from wfl_tasks where id=@TaskId
      print @Dept
      if (@Dept = @idGomlDept and @IdInterfaceDepartment != @idGplrDept)
          update wfl_tasks set ParentId=@TaskId--, DepartmentIdFrom =@IdInterfaceDepartment 
			  where ParentId=@parentTaskId  
				and DepartmentIdFrom = @idGomlDept and DepartmentIdTo=@idGplrDept
				and EndDate is null
   COMMIT

END TRY
BEGIN CATCH
  -- Determine if an error occurred.
  IF @@TRANCOUNT > 0
     ROLLBACK

  -- Return the error information.
  DECLARE @ErrorMessage nvarchar(4000),  @ErrorSeverity int;
  SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY();
  RAISERROR(@ErrorMessage, @ErrorSeverity, 1);

END CATCH;


