







CREATE PROCEDURE [dbo].[create_task](@NumML int, @Interface varchar(500), @UserFrom varchar(100),
                                 @TaskComment varchar(4000), @DeptTo varchar(20), @TaskType int)
as
SET NOCOUNT ON;
declare @p_id int;
declare @p_tasktype int;
declare @parent_id int;
declare @parent_tasktype int;
declare @DeptFrom int;
declare @DeptToId int;
declare @adname_is varchar(32);
declare @task_id int;
declare @StepTask int;
declare @idPrimaryDepartment int;
declare @idFinalDepartment int;
declare @idDept int;
declare @idGroupFrom int;
declare @idGroupTo int;
declare @groupCount int;

set @StepTask=null
set @task_id=(select isnull(max(id),0)+1 from wfl_tasks)
set @DeptFrom=(select Id from Wfl_Depts where ((replace(@Interface,' ','') like  '%[_]'+Wfl_Depts.DeptInt+'%' or @Interface like '%[ ]'+Wfl_Depts.DeptInt+'%') and @Interface is not null) or (DeptInt is null and @Interface is null) or (DeptInt=@Interface))
set @DeptToId=(select Id from wfl_Depts where DeptName=@DeptTo)

set @idGroupFrom=(SELECT DISTINCT TOP 1 com.GroupID FROM CompatibilityML com where com.NumML=@NumML and DeptID=@DeptFrom)
set @idGroupTo=(SELECT MAX(GroupID)+1 FROM CompatibilityML)
set @groupCount=(SELECT COUNT(NumML) FROM CompatibilityML where GroupID=@idGroupFrom  and DeptID=@DeptFrom)

set @adname_is=(
	select AdName 
	from [dbo].[Wfl_UsersInterfaceDepts] u
	where u.[DeptId]=@DeptFrom and u.AdName like @UserFrom)
PRINT '1='+cast(@task_id as varchar(20))+', '+cast(@DeptFrom as varchar(50))+', '+cast(@adname_is as varchar(50)); 
DECLARE my_Cursor_id CURSOR FOR select id, TaskType from Wfl_Tasks where NumML=@NumML and DepartmentIdTo=@DeptFrom and EndDate is null
OPEN my_Cursor_id
FETCH NEXT FROM my_Cursor_id into @p_id, @p_tasktype
set @parent_id=@p_id
PRINT '1='+cast(@parent_id as varchar(50))+', '+cast(@p_id as varchar(50))+', '+cast(@p_tasktype as varchar(50)); 
  
WHILE @@FETCH_STATUS = 0 
begin
	if @p_tasktype=@TaskType
		set @parent_id=@p_id
	
	PRINT '3='+cast(@parent_id as varchar(50))+', '+cast(@p_id as varchar(50))+', '+cast(@p_tasktype as varchar(50)); 
	FETCH NEXT FROM my_Cursor_id into @p_id, @p_tasktype
end
CLOSE my_Cursor_id ;
DEALLOCATE my_Cursor_id;

set @idPrimaryDepartment = (select value from Wfl_WorkflowSettings where Code='PrimaryRouteSheetProcessor');
set @idFinalDepartment=(select value from Wfl_WorkflowSettings where Code='FinalRouteSheetValidator');

if (@DeptToId=@idPrimaryDepartment) 
	set @StepTask=1 -- GOML

if (@DeptToId=@idFinalDepartment)
begin
	set @StepTask=3 --OTR
	set @parent_id=(select max(Id) from Wfl_Tasks where NumML=@NumML and EndDate is not null and TaskResult=1 and MainTaskForStep=2)
end

if (1=(select CanBeRouteSheetResponsible from wfl_Depts where id=@DeptToId) and @DeptFrom=@idPrimaryDepartment)
	set @StepTask=2 -- from GOML to OU

	----
if (2=(select idDept=id from wfl_Depts where id=@DeptToId))
	set @StepTask=2 

if @StepTask is not null and exists (select top 1 NumML from Wfl_Tasks where NumML=@NumML and MainTaskForStep >= @StepTask)
	
begin
	declare @ErrorExistingTask nvarchar(255)

	set @ErrorExistingTask =''-- N'По МЛ ' + @NumML + N' уже были созданы задания'
			
	RAISERROR(@ErrorExistingTask, 0, 0)
end


--if  @adname_is is null
--begin
	--exec add_user @UserFrom, @Interface  
--end

BEGIN TRY
	BEGIN TRANSACTION 


		insert into wfl_tasks( id, NumML, ParentId, DepartmentIdFrom, UserFrom, StartDate, TaskComment, DepartmentIdTo, TaskType, MainTaskForStep)
		values (@task_id, @NumML, @parent_id, @DeptFrom, @UserFrom, Getdate(),@TaskComment, @DeptToId, @TaskType, @StepTask)

		if  @NumML>0
			begin
				DECLARE @userEmail VARCHAR(1000) 
						
				SELECT @userEmail = COALESCE(@userEmail + '; ', ' ') +email FROM [dbo].[Wfl_Users] where dept=@DeptToId		
						
				DECLARE @url VARCHAR(1000) select @url=REPLACE(REPLACE('<div>Вашему подразделению направлено задание по маршрутному листу '+CONVERT(nvarchar(20), @NumML)+'</div><div><a href="http://192.168.60.42/Navigator_web/TasksIssuance.aspx?CardNum=@NUMML&IF=DeptInt&log=">Открыть задание</a></div><br/><div>С уважением,</div><div><a href="http://192.168.60.42/NavigatorRouteSheets/SelectorsForm.aspx">Навигатор 2</a></div>', '@NUMML', @NumML),'DeptInt',DeptInt)
				FROM [Navigator_test_dev].[dbo].[Wfl_Depts] where Id=@DeptToId
							
				DECLARE @titel VARCHAR(1000)
				set @titel='Навигатор 2.  Вам направлено задание по '+CONVERT(nvarchar(20), @NumML)+'('+(select DeptName FROM [Navigator_test_dev].[dbo].[Wfl_Depts] where Id=@DeptToId)+')'
				--exec [dbo].[wfl_sendMail] @userEmail, @titel, @url

			end
				

		--if(@DeptToId=2)
		--  INSERT INTO CompatibilityML(GroupID,NumML,CreateDate,UserCreate,DeptID)
		--			   SELECT DISTINCT unio.unionId,unio.numMl, GETDATE(),'Comflow',2 FROM [ComFlow].[dbo].[UnionML] unio inner join [ComFlow].[dbo].[UnionML] un on un.unionId=unio.unionId
		--			left join CompatibilityML comp on comp.GroupID<> unio.unionId
		--			where un.numML=@NumML and comp.GroupID<>un.unionId and un.numML<>comp.NumML 
			      
					--select @idGroupTo, NumML, GETDATE(), @UserFrom, @DeptToId FROM CompatibilityML Where (GroupID=@idGroupFrom and DeptID=@DeptFrom)


		print 'update .....'
		-- При выдаче подзадания - выдающее задание принимается в работу, если это еще не так 
		update wfl_tasks set getTaskDate=GetDate(), getTaskUser=@UserFrom where id=@parent_id and getTaskDate is null

		-- Для заданий выданных из ГОМЛ в ГПЛР при принятии в работу задания ОУ - родителем становится задание в ОУ
		declare @DeptFromId varchar(50)
		set @DeptFromId=(select DepartmentIdFrom from wfl_tasks where id=@parent_id)
		print @DeptFromId
		if (@DeptFromId=@idPrimaryDepartment and @DeptToId=@idFinalDepartment)
		begin
				print 'update ?--'+cast(@parent_id as varchar(50))+'--'+cast(@DeptFromId as varchar(50))+'--'+cast(@idPrimaryDepartment as varchar(50))+'--'+cast(@DeptToId as varchar(50))+'--'+cast(@idFinalDepartment as varchar(50))+'--'
				 update wfl_tasks set 
				ParentId=@parent_id--, DepartmentIdFrom=@DeptFrom
				from wfl_tasks join wfl_depts on wfl_depts.id=wfl_tasks.DepartmentIdTo 
				where wfl_tasks.ParentId=(select ParentId from wfl_tasks where id=@parent_id)  
					and wfl_tasks.DepartmentIdFrom=@idPrimaryDepartment
					and wfl_depts.CanBeRouteSheetResponsible is null 
					and wfl_tasks.EndDate is null
		end
					
		-- Если задание выдано из ОТР в ОУ - затирает дату сдачи Sdan_TS и в поле Probl удаляем слово "сдано"	
		if @idFinalDepartment=@DeptFrom 
			and @DeptToId=(select DepartmentIdFrom from wfl_tasks where id=(select max(id) from wfl_tasks where NumML=@NumML and MainTaskForStep=3))
		begin
			update List2Nav set Sdan_TS=null, Probl=case when charindex('сдано', Probl)>0 
														then SUBSTRING ( Probl, 0, charindex('сдано', Probl)-1)+ SUBSTRING ( Probl,(charindex('сдано', Probl)+5),len(Probl) )	
														else Probl end 
			where NumML=@NumML
		end
	         if(@idGroupFrom is not null)
			 begin
			        INSERT INTO CompatibilityML(GroupID,NumML,CreateDate,UserCreate,DeptID)
		select @idGroupTo, NumML, GETDATE(), @UserFrom, @DeptToId FROM CompatibilityML Where (GroupID=@idGroupFrom and DeptID=@DeptFrom)

			 end                                       
		-- Если задание выдано в ДМВ - морозим МЛ
		if (@DeptTo='ДМВ')
		begin
			if ((select count(*) from dbo.Wfl_Tasks where NumML=@NumML and DepartmentIdTo=@DeptToId and EndDate is null)=1 and (select count(*) from dbo.Wfl_RouteSheetFreezings where RSNumber=@NumML and StopDate is null)=0)
			begin 
				print 'insert into dbo.Wfl_RouteSheetFreezings (RSNumber, StartDate, FreezeDepartmentId, FreezeReason, Comment, FreezeUser, TaskId) 
							values ('+cast(@NumML as varchar)+', GetDate(), '+cast(@DeptFrom as varchar)+', 16, ''Задание в ДМВ'', '+@UserFrom+', '+cast(@task_id as varchar)+') '
				insert into dbo.Wfl_RouteSheetFreezings (RSNumber, StartDate, FreezeDepartmentId, FreezeReason, Comment, FreezeUser, TaskId) 
				values (@NumML, GetDate(), @DeptFrom, 16, 'Задание в ДМВ', @UserFrom, @task_id) 
			end                                                            
		end
       
		-- Отражение изменений в List2Nav и ML_History
		exec dbo.createTaskSupport @task_id, @NumML, @Interface, @UserFrom, @TaskComment, @DeptTo, @TaskType
	
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



