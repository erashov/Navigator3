-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.[ProcessCreateOrkpTask] (@task_id int, @NumML int, @Interface varchar(500), @TaskComment nvarchar(4000), @DeptTo nvarchar(20))
	
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
		if @fullReason is null
			set @fullReason = rtrim(@reason + ' Первично ' + @TaskComment)
		else
		begin
			declare @startIndex1 int, @startIndex2 int
			declare @head nvarchar(512), @trail nvarchar(512)
			set @startIndex1 = CHARINDEX(@reason, @fullReason)
			if @startIndex1 > 0
			begin
				set @startIndex2 = CHARINDEX('<', @fullReason, @startIndex1)
				set @head = LEFT(@fullReason, @startIndex1 - 1)
				if @startIndex2 > 0
					set @trail = SUBSTRING(@fullReason, @startIndex2, len(@fullReason) - @startIndex2 + 1)
				else
					set @trail = ''
				-- если найдено вхождение нужного шаблона, вырезаем его до следующего "<"
				set @fullReason = @head + @trail
			end
			set @fullReason =  rtrim(@reason + ' Первично ' + @TaskComment + ' ' + @fullReason)
		end

		begin tran
		-- Если нет других незакрытых "замораживающих" задач, надо выставить дату заморозки
		if (select count(*) from Wfl_Tasks where NumML=@NumML and DepartmentIdTo=@DeptToId and EndDate is null and Id != @task_id) = 0
			update List2Nav set 
				DCSV = @changeDate,
				D_UVK = null,
				signB1 = 1,
				signD1 = @changeDate,
				signD2 = null,
				signC3 = @fullReason
			where NumML=@NumML
		else
		-- иначе выставляем дату заморозки только если она не была выставлена раньше
			update List2Nav set 
				DCSV = @changeDate,
				D_UVK = null,
				signB1 = 1,
				signD1 = isnull(signD1, @changeDate),
				signD2 = null,
				signC3 = @fullReason
			where NumML=@NumML

		insert into ML_History (NumML, Step, startTime, comment, department,commentary) 
			values (@NumML, 8, @changeDate, 'Выполнение работ ОРКП', @interfaceDepartment, rtrim('Первично ' + @TaskComment ))
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
end
