




CREATE PROCEDURE [dbo].[CancelTaskSupport]
@TaskId int, 
@Interface nvarchar(500), 
@CancelUser nvarchar(100),
@CancelReason nvarchar(max)
AS
BEGIN
declare @NumML int
declare @DepartmentToId int
declare @DepartmentToName nvarchar(100)
declare @DepartmentFromId int
declare @InterfaceDepartmentId int, @InterfaceDepartmentName nvarchar(100)
declare @taskType int
declare @interfaceDepartment nvarchar(100)
declare @idPrimaryDepartment int;
declare @DepartmentToLNName nvarchar(100)
declare @taskStart datetime, @acceptedDate dateTime

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

print 'Called [CancelTaskSupport]. Parameters: @TaskId' + cast(@TaskId as nvarchar)+', @Interface='''+@Interface+''', @CancelUser = '''+@CancelUser+''', @CancelReason='''+@CancelReason+''''

BEGIN TRY
	select @InterfaceDepartmentId=Id, @InterfaceDepartmentName=DeptName 
		from Wfl_Depts 
		where (replace(@Interface,' ','') like  '%[_]'+Wfl_Depts.DeptInt+'%' and @Interface is not null) or (DeptInt is null and @Interface is null)
	select @NumML=t.NumML, @taskType = t.TaskType, @DepartmentToName = d.DeptName, @DepartmentToId=t.DepartmentIdTo, @DepartmentFromId = t.DepartmentIdFrom, @taskStart=t.StartDate, @acceptedDate=t.GetTaskDate
		from Wfl_Tasks t 
		left join Wfl_Depts d on t.DepartmentIdTo=d.Id 
		where t.Id = @TaskId
	set @idPrimaryDepartment = (select value from Wfl_Settings where Code='PrimaryRouteSheetProcessor');
	-- Получение русского наименования выдавшего подразделения в том виде, в котором оно прописывается в ML_History
	if @InterfaceDepartmentName = 'ОШУГПЗ' or @InterfaceDepartmentName='ОШУГПУ'
		set @interfaceDepartment='УШТУ'
	else if @InterfaceDepartmentName = 'ОТУ'
		set @interfaceDepartment = 'УТУ'
	else if @InterfaceDepartmentName = 'ОТС(Е)'
		set @interfaceDepartment = 'ОТС'
	else if @InterfaceDepartmentName='ОСП'
		set @interfaceDepartment = 'УИИАС'
	else if @InterfaceDepartmentName='ТО'
		set @interfaceDepartment='УСП'
	else if @InterfaceDepartmentName='ОТС(S)'
		set @interfaceDepartment='УВК'
	else if @InterfaceDepartmentName='ОТвУ'
		set @interfaceDepartment='УКТВ'
	else if @InterfaceDepartmentName='ОЦОД'
		set @interfaceDepartment='УИИАС'

	if @DepartmentToName='ОШУГПЗ'
		set @DepartmentToLNName='УШТУ'
	else if @DepartmentToName='ГПЛР'
		set @DepartmentToLNName='УЛКС'
	else if @DepartmentToName='ТО'
		set @DepartmentToLNName='УСП'
	else if @DepartmentToName='ОЦОД' or @DepartmentToName='ОСП'
		set @DepartmentToLNName='УИИАС'
	else if @DepartmentToName='ОТС(S)'
		set @DepartmentToLNName='УВК'
	else if @DepartmentToName='ОТвУ'
		set @DepartmentToLNName='УКТв'
	else if @DepartmentToName='ОТУ'
		set @DepartmentToLNName='УТУ'

	BEGIN TRAN
		if @DepartmentToName='ГПЛР'
		begin
			if @DepartmentFromId != @idPrimaryDepartment
			begin
				if @acceptedDate is null and @DepartmentFromId = @InterfaceDepartmentId
				begin
					print 'update list2nav set g_a/g_b=0, data_sost_a/b=null, data_vypt_a/b=null where NumML='+cast(@NumML as nvarchar)+'. @taskType='+cast(@taskType as nvarchar)
					if @taskType=1
						update List2Nav set G_A = 0, Data_Sost_A=null, Data_Vypt_A=null where NumML=@NumML
					else
						update List2Nav set G_B = 0, Data_Sost_B=null, Data_Vypt_B=null where NumML=@NumML
				end
				else
				begin
					print 'update list2nav set data_vypt_a/b=GETDATE() where NumML='+cast(@NumML as nvarchar)+'. @taskType='+cast(@taskType as nvarchar)
					if @taskType=1
						update List2Nav set Data_Vypt_A=GETDATE() where NumML=@NumML
					else
						update List2Nav set Data_Vypt_B=GETDATE() where NumML=@NumML
				end
			end

			if @Interface like '%MTK%' or @Interface like '%[_]IAS[_]%' or @Interface like '%UCTV%' or @Interface like '%USHTU%'
			begin
				print 'update ML_History set endTime=GETDATE(), comment = ''Отменено '' + @interfaceDepartment, canceled=1 where NumML=@NumML and Step=6 and department=@interfaceDepartment and EndTime is null and NetTerm_num=@taskType'
				update ML_History set endTime=GETDATE(), comment = 'Отменено ' + @interfaceDepartment, canceled=1
					where NumML=@NumML and Step=6 and department=@interfaceDepartment and EndTime is null and NetTerm_num=@taskType
			end

			if @Interface like '%UIIAS[_][0-9]%' or @Interface like '%USP%'
			begin
				print 'update ML_History set endTime=GETDATE() where NumML=@NumML and Step=6 and department=@interfaceDepartment and EndTime is null'
				update ML_History set endTime=GETDATE()
					where NumML=@NumML and Step=6 and department=@interfaceDepartment and EndTime is null
			end

			if not exists (select top 1 * from Wfl_Tasks where NumML=@NumML and DepartmentIdTo = @DepartmentToId and id != @TaskId and EndDate is null) and exists(select * from Wfl_Tasks where NumML=@NumML and MainTaskForStep=2)
			begin
				print 'Set IDO date because ГПЛР task(s) is canceled and main task exist (NumML='+cast(@NumML as nvarchar)+')'
				update List2Nav set IDO=convert(datetime, convert(varchar, GETDATE(), 112), 112) where NumML=@NumML
			end
		end
		else if @DepartmentToName='ТО'
		begin
			if @acceptedDate is null and @DepartmentFromId = @InterfaceDepartmentId
			begin
				print 'update list2nav set NRUSP/NRUSP1=0, с/b=null, D_USP/D_USP1=null where NumML='+cast(@NumML as nvarchar)+'. @taskType='+cast(@taskType as nvarchar)
				if @taskType=1
					update List2Nav set NRUSP=0, c=null, D_USP=null where NumML=@NumML
				else
					update List2Nav set NRUSP1=0, b=null, D_USP1=null where NumML=@NumML
			end
			else
			begin
				print 'update list2nav set NRUSP/NRUSP1=0, с/b=null, D_USP/D_USP1=null where NumML='+cast(@NumML as nvarchar)+'. @taskType='+cast(@taskType as nvarchar)
				if @taskType=1
					update List2Nav set NRUSP=0, c=null, D_USP=null where NumML=@NumML
				else
					update List2Nav set NRUSP1=0, b=null, D_USP1=null where NumML=@NumML
			end

			if @Interface like '%MTK%' or @Interface like '%[_]IAS[_]%' or @Interface like '%UCTV%' or @Interface like '%USHTU%'
			begin
				print 'update ML_History set endTime=GETDATE(), comment = ''Отменено '' + @interfaceDepartment, canceled=1 where NumML=@NumML and Step=7 and department=''УСП'' and EndTime is null and NetTerm_num=@taskType and Comment=@interfaceDepartment'
				update ML_History set endTime=GETDATE(), comment = 'Отменено ' + @interfaceDepartment, canceled=1
					where NumML=@NumML and Step=7 and department='УСП' and EndTime is null and NetTerm_num=@taskType and Comment=@interfaceDepartment
			end
			if @Interface like '%UIIAS[_][0-9]%' or @Interface like '%USP%'
			begin
				print 'update ML_History set endTime=GETDATE(), comment = ''Отменено '' + @interfaceDepartment
					where NumML=@NumML and Step=7 and department=''УСП'' and EndTime is null and Comment=@interfaceDepartment'
				update ML_History set endTime=GETDATE(), comment = 'Отменено ' + @interfaceDepartment
					where NumML=@NumML and Step=7 and department='УСП' and EndTime is null and Comment=@interfaceDepartment
			end
		end
		else if @DepartmentToName='ОЦОД'
		begin
			if @acceptedDate is null and @DepartmentFromId = @InterfaceDepartmentId
			begin
				print 'update List2Nav set signB3=0, D_UIIAS_Sost=null, D_UIIAS=null where NumML=@NumML'
				update List2Nav set signB3=0, D_UIIAS_Sost=null, D_UIIAS=null where NumML=@NumML
			end
			else
			begin
				print 'update List2Nav set D_UIIAS=GETDATE() where NumML=@NumML'
				update List2Nav set D_UIIAS=GETDATE() where NumML=@NumML
			end
			if @Interface like '%[_]IAS[_]%' or @Interface like '%USHTU%'
			begin
				print 'update ML_History set endTime=GETDATE(), comment = ''Отменено '' + @interfaceDepartment, canceled=1
					where NumML=@NumML and Step=7 and department=''УИИАС'' and EndTime is null and Comment=@interfaceDepartment and NetTerm_num=@taskType'
				update ML_History set endTime=GETDATE(), comment = 'Отменено ' + @interfaceDepartment, canceled=1
					where NumML=@NumML and Step=7 and department='УИИАС' and EndTime is null and Comment=@interfaceDepartment and NetTerm_num=@taskType
			end
		end
		else if @DepartmentToName='ОШУГПЗ'
		begin
			if @acceptedDate is null and @DepartmentFromId = @InterfaceDepartmentId
			begin
				print 'update List2Nav set NR_USHTU=0, D_USHTU_Sost=null, D_USHTU=null where NumML=@NumML'
				update List2Nav set NR_USHTU=0, D_USHTU_Sost=null, D_USHTU=null where NumML=@NumML
			end
			else
			begin
				print 'update List2Nav set D_USHTU=GETDATE() where NumML=@NumML'
				update List2Nav set D_USHTU=GETDATE() where NumML=@NumML
			end
			if @Interface like '%UIIAS[_][0-9]%'
			begin
				print 'ML_History set endTime=GETDATE(), comment = ''Отменено '' + @interfaceDepartment
					where NumML=@NumML and Step=7 and department=''УШТУ'' and EndTime is null and Comment=@interfaceDepartment'
				update ML_History set endTime=GETDATE(), comment = 'Отменено ' + @interfaceDepartment
					where NumML=@NumML and Step=7 and department='УШТУ' and EndTime is null and Comment=@interfaceDepartment
			end
		end
		else if @DepartmentToName='ОШУГПУ'
		begin
			if @acceptedDate is null and @DepartmentFromId = @InterfaceDepartmentId
			begin
				print 'ОШУГПУ. Clear List2Nav.NR_USHTU_TF, D_USHTU_TF_Sost and D_USHTU_TF'
				update List2Nav set NR_USHTU_TF=0, D_USHTU_TF_Sost=null, D_USHTU_TF=null where NumML=@NumML
			end
			else
			begin
				print 'ОШУГПУ. Set List2Nav.D_USHTU_TF'
				update List2Nav set D_USHTU_TF=GETDATE() where NumML=@NumML
			end
		end
		else if @DepartmentToName='ДМВ'
		begin
			print 'exec ProcessCancelOrkpTask @TaskId, @NumML, @Interface, @DepartmentToName'
			exec ProcessCancelOrkpTask @TaskId, @NumML, @Interface, @DepartmentToName
		end

		if @DepartmentFromId=@idPrimaryDepartment and @DepartmentToLNName is not null
		begin
			declare @place nvarchar(1024), @index int
			set @place=(select [MestoNah] from List2Nav where NumML=@NumML)
			if @place is not null
			begin
				-- Т.к. на одно подразделение м.б. более одного задания, искать лучше конкретное - выданное в заданную дату
				declare @pattern nvarchar(100)
				set @pattern=@DepartmentToLNName+replace(convert(nvarchar, @taskStart, 4), '.', '')

				if @place like @pattern
					set @place = null
				else
				begin
					set @index = PATINDEX(@pattern+', %', @place)
					if @index>0
						set @place=SUBSTRING(@place, len(@DepartmentToLNName)+9, len(@place))
					else
					begin
						set @index=PATINDEX('%, '+@pattern, @place)
						if @index>0
							set @place=LEFT(@place, @index-1)
						else
						begin
							set @index=PATINDEX('%, '+@pattern+', %', @place)
							if @index > 0
								set @place=LEFT(@place, @index-1) + SUBSTRING(@place, @index + len(@DepartmentToLNName)+8, len(@place))
						end
					end
				end
				update List2Nav set MestoNah=@place where NumML=@NumML
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
END

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Поддержка существующих интерфейсов при отмене задания. Модифицирует таблицы List2Nav и ML_History.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'CancelTaskSupport';

