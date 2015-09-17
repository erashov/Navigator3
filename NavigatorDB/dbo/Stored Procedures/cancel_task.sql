 --411141, 'USHTU%[0-9][0-9].mdb', 'ASErashov', '', 710
CREATE PROCEDURE [dbo].[cancel_task](@NumML int, @Interface varchar(500), @CancelUser varchar(100),
                                 @CancelReason varchar(4000), @TaskId int)
as
SET NOCOUNT ON;
declare @t_id int;
declare @InterfaceDepartmentId int; 
declare @adname_is varchar(32);
declare @idDMVDept int;
declare @idTODept int;
declare @countTaskUSP int;
declare @countTaskORKP int;
declare @MsgText  nvarchar(2048)
declare @subjText nvarchar(256)
set @subjText='МЛ '+cast(@NumML as nvarchar)+' - ДМВ отмена'
set @idDMVDept = (select id from Wfl_Depts d where d.DeptName='ДМВ');--12
set @idTODept = (select id from Wfl_Depts d where d.DeptName='ТО');--11
set @InterfaceDepartmentId=(select id from Wfl_Depts where ((replace(@Interface,' ','') like  '%[_]'+Wfl_Depts.DeptInt+'%' or @Interface  like  '%[ ]'+Wfl_Depts.DeptInt+'%') and @Interface is not null) or (DeptInt is null and @Interface is null) or (DeptInt=@Interface))
set @adname_is=(
	select AdName 
	from [dbo].[Wfl_UsersInterfaceDepts] u
	where u.[DeptId]=@InterfaceDepartmentId and u.AdName like @CancelUser)
PRINT '2='+cast(@InterfaceDepartmentId as varchar(10))
--if  @adname_is is null
--    begin
--   -- exec add_user @CancelUser, @Interface  
--    end

BEGIN TRY
	BEGIN TRANSACTION 
		-- отменено из выдавшего подразделения (отметка подзадания - На Отмену)
		update wfl_tasks set  CancelDate=Getdate(), CancelUser=@CancelUser, CancelReason=@CancelReason where Id=@TaskId and DepartmentIdTo!=@InterfaceDepartmentId --DeptTo!=@InterfaceDepartmentId
			-- если подзадание не принято в работу (закрытие подзадания TaskResult=0) 
		update wfl_tasks set  EndDate=Getdate(), Report='Отменено инициатором', TaskResult=0, UserDo=@CancelUser 
			where Id=@TaskId 
				and DepartmentIdTo!=@InterfaceDepartmentId
				and GetTaskUser is null 
				and GetTaskDate is null
	
		if @@ROWCOUNT>0
		begin
			-- Если инициатором отменяется задание в ДМВ, которое еще не бало принято в работу
			if ((select DepartmentIdTo from wfl_tasks where id=@TaskId)=@idDMVDept)
			begin
				set @countTaskUSP=(select count(*) from wfl_tasks where NumML=@NumML and DepartmentIdTo=@idTODept and EndDate is null)
				set @countTaskORKP=(select count(*) from wfl_tasks where NumML=@NumML and DepartmentIdTo=@idDMVDept and EndDate is null)
				if (@countTaskORKP=0)
				begin
					-- если больше нет заданий в ДМВ - размораживаем лист
					update dbo.Wfl_RouteSheetFreezings set StopDate=Getdate(), UnfreezeDepartmentId=@InterfaceDepartmentId, UnfreezeUser=@CancelUser 
						where RSNumber=@NumML and StopDate is null and TaskId in (select id from wfl_tasks where NumMl=@NumMl and DepartmentIdTo=@idDMVDept) 
					-- если есть открытые задания в ТО(УСП) - отправляем почту
					if (@countTaskUSP>0)
					begin
						set @MsgText='По МЛ '+cast(@NumML as nvarchar)+' работы ДМВ отменены инициатором '+CONVERT(varchar(10),GetDate(), 104)+' '+CONVERT(varchar(10),GetDate(), 108)
						exec [dbo].[wfl_sendMail] 'NNKulishov@akado-telecom.ru; ASErashov@akado-telecom.ru', @SubjText, @MsgText
					end
				end     
			end
			-- Обработка List2Nav, ML_History при отмене задания  
			exec [dbo].[CancelTaskSupport] @TaskId, @Interface, @CancelUser, @CancelReason	
		end
		
		-- отметка заданий выданных из подзадания и ... (На Отмену) и закрытие тех заданий, который не были приняты в работу (TaskResult=0)
		declare Cur_task CURSOR FOR select id from get_childtask(@TaskId) order by Level desc
		OPEN Cur_task
		FETCH NEXT FROM Cur_task into @t_id
		WHILE @@FETCH_STATUS = 0 
		begin
			update wfl_tasks set  CancelDate=Getdate(), CancelUser=@CancelUser, CancelReason=@CancelReason where Id=@t_id and CancelDate is null
			-- если подзадание не принято в работу (закрытие подзадания TaskResult=0) 
			update wfl_tasks set  EndDate=Getdate(), Report='Отменено инициатором', TaskResult=0, UserDo=@CancelUser where Id=@t_id and GetTaskUser is null and GetTaskDate is null
                     
			if @@ROWCOUNT>0
			begin
				-- Если отменяется инициирующее задание и подзадание в ДМВ еще не бало принято в работу
				if ((select DepartmentIdTo from wfl_tasks where id=@t_id)=@idDMVDept)
				begin
					set @countTaskUSP=(select count(*) from wfl_tasks where NumML=@NumML and DepartmentIdTo=@idTODept and EndDate is null)
					set @countTaskORKP=(select count(*) from wfl_tasks where NumML=@NumML and DepartmentIdTo=@idDMVDept and EndDate is null)
					if (@countTaskORKP=0)
					begin
						-- если больше нет заданий в ДМВ - размораживаем лист
						update dbo.Wfl_RouteSheetFreezings set StopDate=Getdate(), UnfreezeDepartmentId=@InterfaceDepartmentId, UnfreezeUser=@CancelUser 
								where RSNumber=@NumML and StopDate is null and TaskId in (select id from wfl_tasks where NumMl=@NumMl and DepartmentIdTo=@idDMVDept) 
						-- если есть открытые задания в ТО(УСП) - отправляем почту
						if (@countTaskUSP>0)
						begin
							set @MsgText='По МЛ '+cast(@NumML as nvarchar)+' работы ДМВ отменены инициатором '+CONVERT(varchar(10),GetDate(), 104)+' '+CONVERT(varchar(10),GetDate(), 108)
							exec [dbo].[wfl_sendMail] 'NNKulishov@akado-telecom.ru; ASErashov@akado-telecom.ru;', @SubjText, @MsgText
						end
					end 
				end   
				-- Обработка List2Nav, ML_History при отмене задания 
				exec [dbo].[CancelTaskSupport] @t_id, @Interface, @CancelUser, 'Инициатор отменил основное задание'
			end
			FETCH NEXT FROM Cur_task into @t_id
		end
		CLOSE Cur_task;
		-- отменено исполнителем
		update wfl_tasks set EndDate=Getdate(), Report=@CancelReason, TaskResult=0, UserDo=@CancelUser where Id=@TaskId and DepartmentIdTo=@InterfaceDepartmentId
   
		if @@ROWCOUNT>0
		begin
			-- если управление, отменившее задание ДМВ, и нет больше открытых заданий в ДМВ и есть открытые задания в УСП, отправляем почту Боеву (пока разработчикам) и нет б
			if (@InterfaceDepartmentId=@idDMVDept) 
			begin
				set @countTaskORKP=(select count(*) from wfl_tasks where NumML=@NumML and DepartmentIdTo=@idDMVDept and EndDate is null)
				if (@countTaskORKP=0)
				begin
					-- если больше нет заданий в ДМВ - размораживаем лист
					update dbo.Wfl_RouteSheetFreezings set StopDate=Getdate(), UnfreezeDepartmentId=@InterfaceDepartmentId, UnfreezeUser=@CancelUser 
						where RSNumber=@NumML and StopDate is null and TaskId in (select id from wfl_tasks where NumMl=@NumMl and DepartmentIdTo=@idDMVDept) 
					-- если есть открытые задания в ТО(УСП) - отправляем почту
					set @countTaskUSP=(select count(*) from wfl_tasks where NumML=@NumML and DepartmentIdTo=@idTODept and EndDate is null)
					if (@countTaskUSP>0)
					begin
						set @MsgText='По МЛ '+cast(@NumML as nvarchar)+' работы ДМВ отменены исполнителем '+CONVERT(varchar(10),GetDate(), 104)+' '+CONVERT(varchar(10),GetDate(), 108)
						exec [dbo].[wfl_sendMail] 'NNKulishov@akado-telecom.ru; ASErashov@akado-telecom.ru;', @SubjText, @MsgText
					end
				end 
			end
			-- Обработка List2Nav, ML_History при отмене задания  
			exec [dbo].[CancelTaskSupport] @TaskId, @Interface, @CancelUser, @CancelReason  
		end
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


