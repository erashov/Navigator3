CREATE PROCEDURE [dbo].[ProcessCancelOrkpTask](@task_id int, @NumML int, @Interface varchar(500), @DeptTo nvarchar(100))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @reason nvarchar(512), @interfaceDepartment nvarchar(100), @fullReason nvarchar(512);
	declare @DeptFrom nvarchar(50);
	declare @DeptToId int;
	declare @changeDate datetime;

	begin try
		set @DeptFrom=(select [DeptName] from Wfl_Depts where (replace(@Interface,' ','') like  '%[_]'+Wfl_Depts.DeptInt+'%' and @Interface is not null) or (DeptInt is null and @Interface is null))
		set @DeptToId=(select Id from wfl_Depts where DeptName=@DeptTo)
		set @changeDate = GETDATE()

		-- Получение русского наименования выдавшего подразделения в том виде, в котором оно прописывается в поле signC3
		if @DeptFrom = 'ОШУГПЗ' or @DeptFrom='ОШУГПУ'
			set @interfaceDepartment='УШТУ'
		else if @DeptFrom = 'ОТУ'
			set @interfaceDepartment = 'ИАС'
		else if @DeptFrom = 'ОТС(Е)'
			set @interfaceDepartment = 'ОТС'
		else if @DeptFrom='ОСП'
			set @interfaceDepartment = 'УИИАС'
		else if @DeptFrom='ТО'
			set @interfaceDepartment='УСП'
		----------------------------------------------------------
		set @reason = '<Заморозка> ' + @interfaceDepartment + '. Выполнение работ ОРКП'
		set @fullReason = (select signC3 from List2Nav where NumML=@NumML)
		if @fullReason is not null and len(@fullReason)>0
		begin
			declare @startIndex1 int, @startIndex2 int
			declare @head nvarchar(512), @trail nvarchar(512)
			set @startIndex1 = charindex(@reason, @fullReason)
			if @startIndex1 > 0
			begin
				set @startIndex2 = charindex('<', @fullReason, @startIndex1)
				set @head = LEFT(@fullReason, @startIndex1 - 1)
				if @startIndex2 > 0
					set @trail = substring(@fullReason, @startIndex2, len(@fullReason) - @startIndex2 + 1)
				else
					set @trail = ''
				-- если найдено вхождение нужного шаблона, вырезаем его до следующего "<"
				set @fullReason = @head + @trail
			end
		end

		begin tran
		-- Если нет других незакрытых "замораживающих" задач, надо "разморозить" МЛ
		if (select count(*) from Wfl_Tasks where NumML=@NumML and DepartmentIdTo=@DeptToId and EndDate is null and Id != @task_id) = 0
		begin
			print 'update List2Nav set DCSV=null,D_UVK=null,signB1=0,signD1=null,signD2=null,signC3=''' + @fullReason + ''''
			update List2Nav set 
				DCSV = null,
				D_UVK = null,
				signB1 = 0,
				signD1 = null,
				signD2 = null,
				signC3 = @fullReason
			where NumML=@NumML
		end

		print 'update ML_History set endTime = GETDATE() where NumML=@NumML and Step=8 and department=@interfaceDepartment and EndTime is null'
		update ML_History set endTime = GETDATE() where NumML=@NumML and Step=8 and department=@interfaceDepartment and EndTime is null
		commit
	end try
	begin catch
	  -- Determine if an error occurred.
	  if @@TRANCOUNT > 0
		 rollback

	  -- Return the error information.
	  declare @ErrorMessage nvarchar(4000),  @ErrorSeverity int;
	  select @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY();
	  raiserror(@ErrorMessage, @ErrorSeverity, 1);

	end catch;

END
