




CREATE PROCEDURE [dbo].[createTaskSupport](@task_id int, @NumML int, @Interface varchar(500), @UserFrom nvarchar(100),
                                 @TaskComment nvarchar(4000), @DeptTo nvarchar(20), @TaskType int)
as
SET NOCOUNT ON;
declare @p_id int;
declare @p_tasktype int;
declare @parent_id int;
declare @parent_tasktype int;
declare @DeptFrom int, @DeptFromName nvarchar(100);
declare @DeptToId int;
declare @adname_is varchar(32);
declare @StepTask int;
declare @changeDate datetime;
declare @interfaceDepartment nvarchar(100)
declare @idPrimaryDepartment int;
declare @idGplrDepartment int;

set @idPrimaryDepartment = (select value from Wfl_Settings where Code='PrimaryRouteSheetProcessor');
set @StepTask=null
select @DeptFrom=Id, @DeptFromName=DeptName from Wfl_Depts where (replace(@Interface,' ','') like  '%[_]'+Wfl_Depts.DeptInt+'%' and @Interface is not null) or (DeptInt is null and @Interface is null)
set @idGplrDepartment=(select id from Wfl_Depts d where d.DeptName='ГПЛР')
set @DeptToId=(select Id from wfl_Depts where DeptName=@DeptTo)
set @adname_is=(
	select AdName 
	from [dbo].[Wfl_UsersInterfaceDepts] u
	where u.[DeptId]=@DeptFrom and u.AdName like @UserFrom)
PRINT '1='+cast(@task_id as varchar(20))+', '+@DeptFromName+'(id='+cast(@DeptFrom as varchar(50))+'), '+cast(@adname_is as varchar(50)); 
--if  @adname_is is null
--    begin
--    exec add_user @UserFrom, @Interface  
--    end

 if (@DeptToId=@idPrimaryDepartment) 
   set @StepTask=1 -- GOML
 if (@DeptToId=(select value from Wfl_Settings where Code='FinalRouteSheetValidator'))
   set @StepTask=3 --OTR
 if (1=(select CanBeRouteSheetResponsible from wfl_Depts where id=@DeptToId) and @DeptFrom=(select value from Wfl_Settings where Code='PrimaryRouteSheetProcessor'))
   set @StepTask=2 -- from GOML to OU


BEGIN TRY
	-- Получение русского наименования выдавшего подразделения в том виде, в котором оно прописывается в ML_History
	if @DeptFromName = 'ОШУГПЗ' or @DeptFromName='ОШУГПУ'
		set @interfaceDepartment='УШТУ'
	else if @DeptFromName = 'ОТУ'
		set @interfaceDepartment = 'УТУ'
	else if @DeptFromName = 'ОТС(Е)'
		set @interfaceDepartment = 'ОТС'
	else if @DeptFromName='ОСП'
		set @interfaceDepartment = 'УИИАС'
	else if @DeptFromName='ТО'
		set @interfaceDepartment='УСП'
	else if @DeptFromName='ОТС(S)'
		set @interfaceDepartment='УВК'
	else if @DeptFromName='ОТвУ'
		set @interfaceDepartment='УКТВ'
	else if @DeptFromName='ОЦОД'
		set @interfaceDepartment='УИИАС'
	else if @DeptFromName='ОТР'
		set @interfaceDepartment='ОКТР'
	BEGIN TRANSACTION 
	set @changeDate = GETDATE()

	-- Для заданий выданных из ГОМЛ в ГПЛР при принятии в работу задания ОУ - родителем становится задание в ОУ
	declare @Dept varchar(50)
	set @Dept=(select DepartmentIdFrom from wfl_tasks where id=@parent_id)
	print @Dept

	if @DeptToId <> @idPrimaryDepartment
	begin
		update dbo.List2Nav set HasTasks = 1 where NumML=@NumML
	end

	-- Для поддержки существующих форм и отчётов надо обновить все те поля, к-рые обновляются из access'овских форм
	declare @place nvarchar(1024)
	declare @newDepartmentName nvarchar(100)
	set @newDepartmentName = ''
	if @DeptTo = 'ОШУГПЗ'
	begin
		PRINT 'update List2Nav set NR_USHTU = 1, D_USHTU_Sost = @changeDate, D_USHTU = null where NumML=@NumML'
		update List2Nav set NR_USHTU = 1, D_USHTU_Sost = @changeDate, D_USHTU = null where NumML=@NumML
		set @newDepartmentName = 'УШТУ'
		if @Interface like '%UIIAS[_][0-9]%' or @Interface like '%UIIAS_H%'
		begin
			PRINT 'insert into ML_History (NumML, Step, startTime, department, comment) VALUES (@NumML, 7, @changeDate, @newDepartmentName, @interfaceDepartment);'
			insert into ML_History (NumML, Step, startTime, department, comment) VALUES (@NumML, 7, @changeDate, @newDepartmentName, @interfaceDepartment);
		end
	end
	else if @DeptTo='ОШУГПУ'
	begin
		PRINT 'update List2Nav set NR_USHTU_TF = 1, D_USHTU_TF_Sost = @changeDate, D_USHTU_TF = null where NumML=@NumML'
		update List2Nav set NR_USHTU_TF = 1, D_USHTU_TF_Sost = @changeDate, D_USHTU_TF = null where NumML=@NumML
	end
	else if @DeptTo='ГПЛР'
	begin
		set @newDepartmentName = 'УЛКС'
		if @DeptFrom != @idPrimaryDepartment
		begin
			if @TaskType=1
			begin
				PRINT 'update List2Nav set G_A=1, Data_Sost_A=@changeDate, Data_Vypt_A=null where NumML=@NumML'
				update List2Nav set G_A=1, Data_Sost_A=@changeDate, Data_Vypt_A=null where NumML=@NumML
			end
			else
			begin
				PRINT 'update List2Nav set G_B=1, Data_Sost_B=@changeDate, Data_Vypt_B=null where NumML=@NumML'
				update List2Nav set G_B=1, Data_Sost_B=@changeDate, Data_Vypt_B=null where NumML=@NumML
			end
		end

		if @Interface like '%USHTU%' or @Interface like '%MTK%' or @Interface like '%[_]IAS[_]%' or @Interface like '%UCTV%' or @Interface like '%UIIAS[_][0-9]%' or @Interface like '%USP%'
		begin
			PRINT 'insert into ML_History (NumML, Step, startTime, department, NetTerm_num) VALUES (@NumML, 6, @changeDate, @interfaceDepartment, @TaskType);'
			insert into ML_History (NumML, Step, startTime, department, NetTerm_num) VALUES (@NumML, 6, @changeDate, @interfaceDepartment, @TaskType);
		end
	end
	else if @DeptTo='ТО'
	begin
		set @newDepartmentName = 'УСП'
		if @TaskType=1
		begin
			PRINT 'update List2Nav set NRUSP=1, c=@changeDate, D_USP=null where NumML=@NumML'
			update List2Nav set NRUSP=1, c=@changeDate, D_USP=null where NumML=@NumML
		end
		else
		begin
			PRINT 'update List2Nav set NRUSP1=1, b=@changeDate, D_USP1=null where NumML=@NumML'
			update List2Nav set NRUSP1=1, b=@changeDate, D_USP1=null where NumML=@NumML
		end
		if @Interface like '%USHTU%' or @Interface like '%MTK%' or @Interface like '%[_]IAS[_]%' or @Interface like '%UCTV%' or @Interface like '%UIIAS[_][0-9]%'
		begin
			PRINT 'insert into ML_History (NumML, Step, startTime, department, comment, NetTerm_num) VALUES (@NumML, 7, @changeDate, ''УСП'', @interfaceDepartment, @TaskType);'
			insert into ML_History (NumML, Step, startTime, department, comment, NetTerm_num) VALUES (@NumML, 7, @changeDate, 'УСП', @interfaceDepartment, @TaskType);
		end
	end
	else if @DeptTo='ОЦОД'
	begin
		set @newDepartmentName = 'УИИАС'
		PRINT 'update List2Nav set signB3=1, D_UIIAS_Sost=@changeDate, D_UIIAS=null where NumML=@NumML'
		update List2Nav set signB3=1, D_UIIAS_Sost=@changeDate, D_UIIAS=null where NumML=@NumML
		if @Interface like '%USHTU%' or @Interface like '%[_]IAS[_]%'
		begin
		    PRINT 'insert into ML_History (NumML, Step, startTime, department, comment) VALUES (@NumML, 7, @changeDate, ''УИИАС'', @interfaceDepartment);'
			insert into ML_History (NumML, Step, startTime, department, comment) VALUES (@NumML, 7, @changeDate, 'УИИАС', @interfaceDepartment);
		end
	end
	else if @DeptTo='ОСП'
		set @newDepartmentName = 'УИИАС'
	else if @DeptTo='ДМВ'
	begin
		PRINT 'EXECUTE [dbo].ProcessCreateOrkpTask @task_id, @NumML, @Interface, @TaskComment, @DeptTo'
		EXECUTE [dbo].ProcessCreateOrkpTask @task_id, @NumML, @Interface, @TaskComment, @DeptTo
	end
	else if @DeptTo='ОТС(S)'
		set @newDepartmentName='УВК'
	else if @DeptTo='ОТвУ'
		set @newDepartmentName='УКТв'
	else if @DeptTo='ОТУ'
		set @newDepartmentName='УТУ'
    -- Задание в ОТР(ОКТР)
	else if @DeptTo='ОТР'
	begin
	    print 'insert into ML_History (NumML, Step, startTime, department) VALUES (@NumML, 11, @changeDate, ''ОКТР'')'
		insert into ML_History (NumML, Step, startTime, department) VALUES (@NumML, 11, @changeDate, @interfaceDepartment)
	end	

	if @DeptFrom = @idPrimaryDepartment and @newDepartmentName != ''
	begin
		-- Эмуляция метода Nazh
		set @place = (select case when [MestoNah] is not null and LEN([MestoNah]) > 0 then [MestoNah] + ', ' else '' end from List2Nav where NumML=@NumML)
		set @place = @place + @newDepartmentName + replace(convert(nvarchar, @changeDate, 4), '.', '');
		declare @idoDate datetime;

		if @newDepartmentName != 'УЛКС' and not exists (select * from Wfl_Tasks where NumML=@NumML and DepartmentIdTo=@idGplrDepartment and EndDate is null)
			set @idoDate=convert(datetime, convert(varchar, @changeDate, 112), 112)
		else
			set @idoDate=null

		PRINT 'update List2Nav set MestoNah = '''+@place+''', ProblML = null, IDO='+(case when @idoDate is null then 'NULL' else convert(varchar, @idoDate, 104) end)+' where NumML=@NumML'
		update List2Nav set 
			MestoNah = @place,
			ProblML = null,
			IDO=@idoDate
		where NumML=@NumML
		
		-- Эмуляция метода send2Dept
		declare @status int, @currentEndTime datetime
		--
		-- Эмуляция getMLStatus
		declare ResponsibleHistory CURSOR READ_ONLY FOR select EndTime from ML_History where NumML=@NumML and Step=4
		open ResponsibleHistory
		if @@CURSOR_ROWS =0
			set @status=1
		else
		begin
			set @status=3
			fetch next from ResponsibleHistory into @currentEndTime
			while @@FETCH_STATUS = 0
			begin
				if @currentEndTime is null
				begin
					set @status=2
					break
				end
				fetch next from ResponsibleHistory into @currentEndTime
			end
		end
		close ResponsibleHistory
		deallocate ResponsibleHistory
		-- Конец эмуляции getMLStatus

		if @newDepartmentName != 'УЛКС'
		begin
			if @status=2
			begin
			    PRINT 'update ML_History set EndTime = GETDATE(), Comment = ''МЛ был перенаправлен подразделению '' + '+@newDepartmentName+' where NumML=@NumML and Step=4 and EndTime is null'
				update ML_History set 
					EndTime = GETDATE(),
					Comment = 'МЛ был перенаправлен подразделению ' + @newDepartmentName
				where NumML=@NumML and Step=4 and EndTime is null
			end
			else if @status=3
			begin
				PRINT 'update List2Nav set Sdan_TS = null where NumML=@NumML'
				update List2Nav set Sdan_TS = null where NumML=@NumML
			end
			
			print '@changeDate = '+convert(nvarchar, @changeDate, 113)
			PRINT 'update List2Nav set DKNV = @changeDate where NumML=@NumML'
			update List2Nav set DKNV = @changeDate where NumML=@NumML
            
			PRINT 'insert into ML_History (NumML, Step, department, StartTime) values (@NumML, 4, @newDepartmentName, @changeDate)'
			insert into ML_History (NumML, Step, department, StartTime) values (@NumML, 4, @newDepartmentName, @changeDate)
            
			PRINT 'update ML_History set EndTime = @changeDate where NumML=@NumML and Step=2 and EndTime is null'
			update ML_History set EndTime = @changeDate where NumML=@NumML and Step=2 and EndTime is null

			--Если последнее выданное из ГОМЛ в это же подразделение задание имеет непустую дату возврата, значит это отмена возврата
			if (select top 1 ReturnDate from Wfl_Tasks where NumML=@NumML and DepartmentIdFrom = @DeptFrom and DepartmentIdTo=@DeptToId and Id !=@task_id order by StartDate desc) is not null
			begin
				update List2Nav set signD3=null, signC2='<Возврат отклонен ГОМЛ по причине: ' + @TaskComment + '> '+signC2 where NumML = @NumML;
			end
		end
		else
		begin
		    PRINT 'update List2Nav set DUP=null, GG_Data=null, GG_ULKS=0 where NumML=@NumML'
			update List2Nav set
				DUP=null,
				GG_Data=null,
				GG_ULKS=0
			where NumML=@NumML
             /*
			--if @status=1
			--begin
			--	declare @service nvarchar(50)
			--	set @service = (select usluga from List2Nav where NumML=@NumML)
			--	if @service Like '%P%' Or @service Like '%B%' Or @service Like '%I%' Or @service Like '%G%' Or @service Like '%V%' Or @service Like '%A%' Or @service Like '%VPN%' Or @service Like '%KW%' And @service Like 'Q%'
			--		set @newDepartmentName='УШТУ'
			--	else if @service = 'E' Or @service = 'S'
			--		set @newDepartmentName='УВК'
			--	else if @service Like '%Q%'
			--		set @newDepartmentName='УИИАС'
			--	else if @service Like '%K%' Or @service = 'KV'
			--		set @newDepartmentName='УВК'
			--	else
			--		set @newDepartmentName='УСП'
			--	insert into ML_History (NumML, Step, department, StartTime) values (@NumML, 4, @newDepartmentName, @changeDate)
			--end
			*/
			PRINT 'update List2Nav set DKNV = @changeDate where NumML=@NumML'
			update List2Nav set DKNV = @changeDate where NumML=@NumML
			PRINT 'insert into ML_History (NumML, Step, department, StartTime, NetTerm_num) values (@NumML, 5, ''УЛКС'', @changeDate, @TaskType)'
			insert into ML_History (NumML, Step, department, StartTime, NetTerm_num) values (@NumML, 5, 'УЛКС', @changeDate, @TaskType)
		end
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



