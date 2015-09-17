
CREATE PROCEDURE [dbo].[return_task](@NumML int, @Interface varchar(500), @ReturnUser varchar(100),
                                 @ReturnReason int, @ReturnComment varchar(4000), @TaskId int)
as
SET NOCOUNT ON;
declare @IdInterfaceDepartment int;
declare @adname_is varchar(32);
declare @Task_child_id int;
set @IdInterfaceDepartment=(select Id from Wfl_Depts where ((replace(@Interface,' ','') like  '%[_]'+Wfl_Depts.DeptInt+'%' or @Interface like  '%[ ]'+Wfl_Depts.DeptInt+'%') and @Interface is not null) or (DeptInt is null and @Interface is null))
set @adname_is=(
	select AdName 
	from [dbo].[Wfl_UsersInterfaceDepts] u
	where u.[DeptId]=@IdInterfaceDepartment and u.AdName like @ReturnUser)

--PRINT '2='+cast(@IdInterfaceDepartment as varchar(2))
--if  @adname_is is null
   -- begin
   -- exec add_user @ReturnUser, @Interface  
   -- end

BEGIN TRY
	declare Cur_tasks CURSOR SCROLL FOR  select Id from [get_childTask](@TaskId)
	BEGIN TRANSACTION 
		-- возвращено из выдавшго подразделения (ГОМЛ)
		-- курсор для определения подзадач
		OPEN Cur_tasks
		FETCH NEXT FROM Cur_tasks into @Task_child_id
		if @@CURSOR_ROWS=0
		begin
			-- возвращено исполнителем
			print '-- возвращено исполнителем'
			update wfl_tasks set  EndDate=Getdate(), UserDo=@ReturnUser, TaskResult=0, ReturnDate=Getdate(), ReturnUser=@ReturnUser, ReturnReasonId=@ReturnReason, ReturnComment=@ReturnComment 
				where Id=@TaskId and DepartmentIdTo=@IdInterfaceDepartment and ReturnDate is null
			if @@ROWCOUNT>0 
			begin
				print 'exec [dbo].[ReturnTaskSupport] '+cast(@TaskId as varchar(50))+', '+@Interface+', '+@ReturnUser+', '+cast(@ReturnReason as varchar(10))+', '+@ReturnComment
				exec [dbo].[ReturnTaskSupport] @TaskId, @Interface, @ReturnUser, @ReturnReason, @ReturnComment
			end
		end
		else
		begin
			-- возвращено из ГОМЛ
			print '-- возвращено из ГОМЛ'
			update wfl_tasks set  ReturnDate=Getdate(), ReturnUser=@ReturnUser, ReturnReasonId=@ReturnReason, ReturnComment=@ReturnComment 
				where Id=@TaskId and DepartmentIdTo=@IdInterfaceDepartment and ReturnDate is null
		end 
		--CLOSE Cur_tasks;
   
		--OPEN Cur_tasks
		FETCH FIRST FROM Cur_tasks into @Task_child_id     
		WHILE @@FETCH_STATUS = 0 
		BEGIN
			print '-- update where taskId='+cast(@Task_child_id as varchar(50))
			update wfl_tasks set  CancelDate=Getdate(), CancelUser=@ReturnUser, CancelReason='возврат основного задания' where Id=@Task_child_id
			update wfl_tasks set  EndDate=Getdate(), Report='Отменено инициатором', TaskResult=0, UserDo=@ReturnUser where Id=@Task_child_id and GetTaskUser is null and GetTaskDate is null
			FETCH NEXT FROM Cur_tasks into @Task_child_id
		end
		CLOSE Cur_tasks;
		DEALLOCATE Cur_tasks;
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


