
CREATE PROCEDURE [dbo].[close_task](@NumML int, @Interface varchar(500), @CloseUser varchar(100),
                                 @Report varchar(4000), @TaskId int)
as
SET NOCOUNT ON;
declare @t_id int;
declare @c_id int;
declare @DeptFrom int;
declare @adname_is varchar(32);
declare @close_date datetime
set @close_date=Getdate();
set @DeptFrom=(select Id from Wfl_Depts where ((replace(@Interface,' ','') like  '%[_]'+Wfl_Depts.DeptInt+'%' or @Interface like  '%[ ]'+Wfl_Depts.DeptInt+'%') and @Interface is not null) or (DeptInt is null and @Interface is null) or (DeptInt=@Interface))
set @adname_is=(
	select AdName 
	from [dbo].[Wfl_UsersInterfaceDepts] u
	where u.[DeptId]=@DeptFrom and u.AdName like @CloseUser)

declare @idGplrDept  int;
declare @idGomlDept  int;
declare @idOtrDept   int;
declare @idTODept    int;
declare @idDMVDept   int;
declare @countTaskUSP int;
declare @countTaskORKP int;
declare @MsgText nvarchar(2048)
declare @subjText nvarchar(256)
set @subjText='МЛ '+cast(@NumML as nvarchar)+' - ДМВ выполнено'
set @idGomlDept = (select cast(Value as int) from Wfl_WorkflowSettings where code = 'PrimaryRouteSheetProcessor')
set @idOtrDept = (select cast(Value as int) from Wfl_WorkflowSettings where code = 'FinalRouteSheetValidator')
set @idGplrDept = (select id from Wfl_Depts d where d.DeptName='ГПЛР')
set @idTODept = (select id from Wfl_Depts d where d.DeptName='ТО')
set @idDMVDept = (select id from Wfl_Depts d where d.DeptName='ДМВ');
PRINT '2='+cast(@DeptFrom as varchar(10))
if  @adname_is is null
    begin
    exec add_user @CloseUser, @Interface  
    end

BEGIN TRY
	BEGIN TRANSACTION 
		-- закрыто
		PRINT 'update...'
		update wfl_tasks set  EndDate=@close_date, Report=@Report, TaskResult=1, UserDo=@CloseUser where Id=@TaskId and DepartmentIdTo=@DeptFrom

		if @@ROWCOUNT>0
		begin			
			exec [dbo].[CloseTaskSupport] @TaskId, @Interface, @CloseUser, @Report
			-- если Управление, закрывающее задание, - ОТР - обновить дату сдачи МЛ (List2Nav.Sdan)
					
			if (@DeptFrom=@idOtrDept)
			begin
		
				update List2Nav set Sdan=@close_date, MestoNah=MestoNah+', M'+replace(convert(nvarchar, @close_date, 4), '.', '') where NumML=@NumML
			end
						
			-- если управление, закрывшее задание ДМВ, и нет больше открытых заданий в ДМВ и есть открытые задания в УСП, отправляем почту Боеву (пока разработчикам)
			if (@DeptFrom=@idDMVDept) 
			begin
						
				set @countTaskUSP=(select count(*) from wfl_tasks where NumML=@NumML and DepartmentIdTo=@idTODept and EndDate is null)
				set @countTaskORKP=(select count(*) from wfl_tasks where NumML=@NumML and DepartmentIdTo=@idDMVDept and EndDate is null)
						
				if (@countTaskORKP=0)
				begin
						
					-- если больше нет заданий в ДМВ - размораживаем лист
					update dbo.Wfl_RouteSheetFreezings set StopDate=Getdate(), UnfreezeDepartmentId=@DeptFrom, UnfreezeUser=@CloseUser 
						where RSNumber=@NumML and StopDate is null and TaskId in (select id from wfl_tasks where NumMl=@NumMl and DepartmentIdTo=@idDMVDept) 
									
					-- если есть открытые задания в ТО(УСП) - отправляем почту
					if (@countTaskUSP>0)
					begin
						set @MsgText='По МЛ '+cast(@NumML as nvarchar)+' работы ДМВ завершены '+CONVERT(varchar(10), GetDate(), 104)+' '+CONVERT(varchar(10), GetDate(), 108)
						exec [dbo].[wfl_sendMail] 'NNKulishov@akado-telecom.ru; ASErashov@akado-telecom.ru;', @SubjText, @MsgText
									
					end
				end 
			end
		end
              
		-- отменить все подзадания, которые не были приняты в работу
		declare @parentId int		
		set @parentId=(select ParentId from wfl_tasks where Id=@TaskId) 
		declare Cur_taskD CURSOR FOR select id from get_childtask(@TaskId) order by Level desc
		OPEN Cur_taskD
		FETCH NEXT FROM Cur_taskD into @t_id
		WHILE @@FETCH_STATUS = 0 
		begin
			
		   -- set @parentId=(select ParentId from wfl_tasks where Id=@t_id) 
			update wfl_tasks set  EndDate=@close_date, Report='Инициатор закрыл основное задание', TaskResult=0, UserDo=@CloseUser where Id=@t_id and GetTaskUser is null and GetTaskDate is null
		--	update wfl_tasks set ParentId=@parentId where Id=@t_id and GetTaskUser is not null and GetTaskDate is not null
			exec [dbo].[CancelTaskSupport] @t_id, @Interface, @CloseUser, 'Инициатор закрыл основное задание'


			FETCH NEXT FROM Cur_taskD into @t_id
		end
		CLOSE Cur_taskD;
		deallocate Cur_taskD 

		

	    declare CurtaskD CURSOR FOR select i.id from (select id from [dbo].[Wfl_Tasks] where ParentId= @TaskId) as i
		OPEN CurtaskD
		FETCH NEXT FROM CurtaskD into @c_id
		WHILE @@FETCH_STATUS = 0 
		begin
			PRINT 'cancel task-'+cast(@c_id as varchar)
		   -- set @parentId=(select ParentId from wfl_tasks where Id=@t_id) 
			
			update wfl_tasks set ParentId=@parentId where Id=@c_id and GetTaskUser is not null and GetTaskDate is not null
			
			FETCH NEXT FROM CurtaskD into @c_id
		end
		CLOSE CurtaskD;
		deallocate CurtaskD 

		--курсор для проверки текущего задания (если оно закрылось, и  (DeptFrom='ГОМЛ', и  DeptTo!='ГПЛР') 
		--                                      или задание выдано из ОТР и это не ТО, т.е. задание в ОУ)
		PRINT 'select DepartmentIdFrom from Wfl_Tasks where Id='+cast(@TaskId as varchar(50))+' and (('+cast(@DeptFrom as varchar(50))+'!='+cast(@idGplrDept as varchar(50))+' and DepartmentIdFrom='+cast(@idGomlDept as varchar(50))+') or ('+cast(@DeptFrom as varchar(50))+'!='+cast(@idTODept as varchar(50))+' and DepartmentIdFrom='+cast(@idOtrDept as varchar(50))+')) and TaskResult=1'
					
		declare cur_taskC cursor for select /*DeptFrom*/DepartmentIdFrom from Wfl_Tasks 
			where Id=@TaskId and ((@DeptFrom!=@idGplrDept and DepartmentIdFrom=@idGomlDept) or (@DeptFrom!=@idTODept and DepartmentIdFrom=@idOtrDept) or (@DeptFrom!=@idGplrDept and DepartmentIdFrom=0)) 
				and TaskResult=1
		OPEN cur_taskC

		FETCH NEXT FROM cur_taskC INTO @DeptFrom
					
			PRINT 'update'+CAST (@DeptFrom AS NVARCHAR(30))+' '+CAST (@idDMVDept AS NVARCHAR(30))+' '+CAST (@@FETCH_STATUS AS NVARCHAR(30))
		WHILE @@FETCH_STATUS = 0
		BEGIN
			if (@DeptFrom=@idDMVDept)
				-- если задание выдано в ДМВ то закрываем его
				update List2Nav set Sdan=@close_date, MestoNah=MestoNah+', M'+replace(convert(nvarchar, @close_date, 4), '.', '') where NumML=@NumML
			else
			-- если задание выдано в управление отличное от ДМВ, заполняем  Sdan_TS и Probl
			begin
				-- обновить дату закрытия ТС в МЛ - если задание было выдано из ГОМЛ (т.е. управление является ОУ)
				print 'update List2Nav set Sdan_TS='+convert(varchar, @close_date, 121)+', Probl = ''сдано '' + Probl where NumML='+cast(@NumML as varchar(50))
				update List2Nav set Sdan_TS=@close_date, Probl = 'сдано ' + Probl where NumML=@NumML
				-- Закрыть родительское задание в ГОМЛ
				update wfl_tasks set EndDate=@close_date, UserDo=@CloseUser, TaskResult=1 where Id=(select ParentId from wfl_tasks where Id=@TaskId) and MainTaskForStep=1
				-- выдать задание в ОТР
							
				declare @NameOTRDept varchar(50)
				-- Если задание выдано не из ОТР, то формируем задание в ОТР
				if (select DepartmentIdFrom from wfl_tasks where Id=@TaskId)!=@idOtrDept and (select ParentId from wfl_tasks where Id=@TaskId) is null
				begin
				   
					PRINT 'create new task to OTR'
					set @NameOtrDept=(select DeptName from wfl_Depts where id=(select value from Wfl_WorkflowSettings where Code='FinalRouteSheetValidator'))
					exec [dbo].[create_task] @NumML, @Interface, @CloseUser, 'Сдано ОУ' , @NameOTRDept, 1
				end  
			end       
			FETCH NEXT FROM cur_taskC INTO @DeptFrom
		END 
		CLOSE cur_taskC;
		DEALLOCATE cur_taskC;
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



