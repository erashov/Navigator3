



CREATE PROCEDURE [dbo].[CloseTaskSupport]
@TaskId int, 
@Interface nvarchar(500), 
@CancelUser nvarchar(100),
@CancelReason nvarchar(max)
AS
BEGIN
declare @NumML int
declare @DepartmentToName nvarchar(100)
declare @InterfaceDepartmentId int, @InterfaceDepartmentName nvarchar(100)
declare @taskType int, @isMainTask int
declare @interfaceDepartment nvarchar(100)
declare @DepartmentFromId int
declare @departmentFromName nvarchar(100)
declare @idPrimaryDepartment int;

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

print 'Called [CloseTaskSupport]. Parameters: @TaskId' + cast(@TaskId as nvarchar)+', @Interface='''+@Interface+''', @CancelUser = '''+@CancelUser+''', @CancelReason='''+@CancelReason+''''

BEGIN TRY
	select @InterfaceDepartmentId=Id, @InterfaceDepartmentName=DeptName from Wfl_Depts where (replace(@Interface,' ','') like  '%[_]'+Wfl_Depts.DeptInt+'%' and @Interface is not null) or (DeptInt is null and @Interface is null)
	select @NumML=t.NumML, @taskType = t.TaskType, @isMainTask=t.MainTaskForStep, @DepartmentToName = dTo.DeptName, @departmentFromName=dFrom.DeptName, @DepartmentFromId = t.DepartmentIdFrom
		from Wfl_Tasks t 
		left join Wfl_Depts dTo on t.DepartmentIdTo=dTo.Id 
		left join Wfl_Depts dFrom on t.DepartmentIdFrom=dFrom.Id
		where t.Id = @TaskId
	set @idPrimaryDepartment = (select value from Wfl_WorkflowSettings where Code='PrimaryRouteSheetProcessor');
	-- Получение русского наименования выдавшего подразделения в том виде, в котором оно прописывается в ML_History
	if @InterfaceDepartmentName = 'ОШУГПЗ' or @InterfaceDepartmentName='ОШУГПУ'
		set @interfaceDepartment='УШТУ'
	else if @InterfaceDepartmentName = 'ОТУ' -- IAS
		set @interfaceDepartment = 'УТУ'
	else if @InterfaceDepartmentName = 'ОТС(Е)' -- SPISOK_E1
		set @interfaceDepartment = 'УТУВК'
	else if @InterfaceDepartmentName='ОСП'
		set @interfaceDepartment = 'УИИАС'
	else if @InterfaceDepartmentName='ТО'
		set @interfaceDepartment='УСП'
	else if @InterfaceDepartmentName='ОТС(S)' -- MTK
		set @interfaceDepartment='УВК'
	else if @InterfaceDepartmentName='ОТвУ' -- UCTV
		set @interfaceDepartment='УКТВ'
	else if @InterfaceDepartmentName='ОЦОД'
		set @interfaceDepartment='УИИАС'
	else if @InterfaceDepartmentName='ДМВ'
		set @interfaceDepartment='ДМВ'
		
	declare @closeDate datetime;
	set @closeDate = GETDATE()
	BEGIN TRAN
		if @interfaceDepartment='ДМВ'
		begin
			print 'ДМВ: update List2Nav set D_UVK={'+convert(varchar, @closeDate, 121)+'}'
			update List2Nav set D_UVK=@closeDate where NumML=@NumML
			--if (select List2Nav.Usluga from List2Nav where NumML=@NumML) in ('SR', 'SRG', 'SRN', 'XSR', 'XSRG', 'XSRN', 'USR', 'USRG', 'USRN', 'XUSR', 'XUSRG', 'XUSRN')
			--выставить List2Nav.Sdan=Now

			declare @department nvarchar(100)
			set @department=(select top 1 ML_History.department 
				from ML_History 
				where NumML=@NumML and EndTime is null and Step=8 and department in ('УШТУ', 'ИАС', 'УСП', 'УИИАС') and Comment='Выполнение работ ОРКП'
				order by id desc)
			if @department is not null
			begin
				print 'ДМВ: update List2Nav set signB1=0, signD2={'+convert(varchar, @closeDate, 121)+'}'
				update List2Nav set signB1=0, signD2=@closeDate where NumML=@NumML;
				print 'ДМВ: update ML_History set EndTime={'+convert(varchar, @closeDate, 121)+'} where NumML=@NumML and Step=8 and EndTime is null and department='''+@department+''''
				update ML_History set EndTime=@closeDate where NumML=@NumML and Step=8 and EndTime is null and department=@department;
			end
		end

		if @isMainTask=2
		begin
			--update List2Nav set
			--	Sdan_TS = @closeDate,
			--	Probl = RTRIM('сдано '+isnull(Probl, '')) 
			--where NumML=@NumML;

			if (select List2Nav.signB1 from List2Nav where NumML=@NumML)=1
			begin
				print 'MainTaskForStep=2 & signB1=1. update List2Nav set signB1=0, signD2={'+convert(varchar, @closeDate, 121)+'}'
				update List2Nav set signB1=0, signD2=@closeDate where NumML=@NumML;
				if @interfaceDepartment in ('УТУ', 'УКТВ')
				begin
					print 'MainTaskForStep=2 & signB1=1. update ML_History set EndTime={'+convert(varchar, @closeDate, 121)+'} where NumML=@NumML and Step=8 and EndTime is null and department=iif(@interfaceDepartment = ''УТУ'', ''ИАС'', @interfaceDepartment);'
					update ML_History set EndTime=@closeDate where NumML=@NumML and Step=8 and EndTime is null and department=(case when @interfaceDepartment = N'УТУ' then N'ИАС' else @interfaceDepartment end);
				end
				else
				begin
					print 'MainTaskForStep=2 & signB1=1. update ML_History set EndTime={'+convert(varchar, @closeDate, 121)+'} where NumML=@NumML and Step=8 and EndTime is null;'
					update ML_History set EndTime=@closeDate where NumML=@NumML and Step=8 and EndTime is null;
				end
			end

			print 'MainTaskForStep=2. update ML_History set EndTime={'+convert(varchar, @closeDate, 121)+'} where NumML=@NumML and Step=8 and EndTime is null;'
			update ML_History set EndTime=@closeDate where NumML=@NumML and Step=4 and department=@interfaceDepartment and EndTime is null
			--insert into ML_History (NumML, Step, startTime, department) values(@NumML, 11, @closeDate, 'ОКТР')
		end
		if @InterfaceDepartmentName in ('ОСП', 'ОЦОД')
		begin
			print 'ОСП/ОЦОД. Set D_UIIAS and finish ML_History row for Step=7 and department='''+@interfaceDepartment+''''
			update List2Nav set D_UIIAS=@closeDate where NumML=@NumML;
			update ML_History set EndTime=@closeDate where NumML=@NumML and Step=7 and department=@interfaceDepartment and EndTime is null;
		end
		else if @InterfaceDepartmentName = 'ГПЛР'
		begin
			if @DepartmentFromId != @idPrimaryDepartment
			begin
				print 'ГПЛР. set Data_Vypt_A/Data_Vypt_B'
				if @taskType = 1
					update List2Nav set Data_Vypt_A=@closeDate where NumML=@NumML
				else
					update List2Nav set Data_Vypt_B=@closeDate where NumML=@NumML
			end

			-- Если не осталось других задач на ГПЛР и есть задачи на ОУ, выставляем дату IDO
			if not exists (select top 1 * from Wfl_Tasks where NumML=@NumML and DepartmentIdTo = @InterfaceDepartmentId and id != @TaskId and EndDate is null) and exists(select top 1 * from Wfl_Tasks where NumML=@NumML and MainTaskForStep=2 and EndDate is null)
			begin
				print 'set IDO={'+convert(varchar, @closeDate, 121)+'}'
				update List2Nav set IDO=@closeDate where NumML=@NumML
			end
			print 'ГПЛР. update ML_History set EndTime={'+convert(varchar, @closeDate, 121)+'} where NumML=@NumML and Step=6 and EndTime is null and NetTerm_num=@taskType'
			update ML_History set EndTime=@closeDate where NumML=@NumML and Step=6 and EndTime is null and NetTerm_num=@taskType
		end
		else if @InterfaceDepartmentName='ОШУГПУ'
		begin
			print 'ОШУГПУ. Update List2Nav.D_USHTU_TF'
			update List2Nav set D_USHTU_TF=@closeDate where NumML=@NumML
		end
		else if @InterfaceDepartmentName='ОШУГПЗ'
		begin
			print 'ОШУГПЗ. Update List2Nav.D_USHTU and finish ML_History row for Step=7 and department='''+@interfaceDepartment+''''
			update List2Nav set D_USHTU=@closeDate where NumML=@NumML
			update ML_History set EndTime=@closeDate where NumML=@NumML and Step=7 and department=@interfaceDepartment and EndTime is null;
			if @isMainTask=2
			begin
				print 'ОШУГПЗ. update List2Nav set Sroch_USHTU=0'
				update List2Nav set Sroch_USHTU=0 where NumML=@NumML
			end
		end
		else if @InterfaceDepartmentName='ТО'
		begin
			print 'ТО. update List2Nav set D_USP/D_USP1={'+convert(varchar, @closeDate, 121)+'}, FactDateUSP_A/FactDateUSP_B={'+convert(varchar, @closeDate, 121)+'}'
			if @taskType=1
				update List2Nav set D_USP=@closeDate, FactDateUSP_A=@closeDate where NumML=@NumML
			else
				update List2Nav set D_USP1=@closeDate, FactDateUSP_B=@closeDate where NumML=@NumML
			print 'ТО. update ML_History set EndTime={'+convert(varchar, @closeDate, 121)+'} where NumML=@NumML and Step=7 and department='''+@interfaceDepartment+''' and EndTime is null and NetTerm_num='+cast(@taskType as varchar)
			update ML_History set EndTime=@closeDate where NumML=@NumML and Step=7 and department=@interfaceDepartment and EndTime is null and NetTerm_num=@taskType
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
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Поддержка существующих интерфейсов при завершении задания. Модифицирует таблицы List2Nav и ML_History.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'CloseTaskSupport';

