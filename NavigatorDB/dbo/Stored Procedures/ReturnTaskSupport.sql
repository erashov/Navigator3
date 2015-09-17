

CREATE PROCEDURE [dbo].[ReturnTaskSupport]
@TaskId int, 
@Interface nvarchar(500), 
@UserNTName nvarchar(100),
@ReturnReason int, 
@ReturnComment nvarchar(4000)
AS
BEGIN
declare @NumML int
declare @taskType int
declare @interfaceDepartment nvarchar(100)
declare @InterfaceDepartmentId int
declare @InterfaceDepartmentName nvarchar(100)
declare @returnTypeName nvarchar(100)
declare @returnDate datetime;
declare @DepartmentFromId int
declare @idPrimaryDepartment int;
declare @taskStart datetime
declare @DepartmentToName nvarchar(100)
declare @DepartmentToLNName nvarchar(100)
declare @pattern nvarchar(500);

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

print N'Called [ReturnTaskSupport]. Parameters: @TaskId=' + cast(@TaskId as nvarchar)+N', @Interface='''+@Interface+N''', @UserNTName = '''+@UserNTName+N''', @ReturnReason='+cast(@ReturnReason as nvarchar)+N', '+char(13)+'@ReturnComment='''+@ReturnComment+''''

BEGIN TRY
	select @InterfaceDepartmentId=Id, @InterfaceDepartmentName=DeptName 
		from Wfl_Depts 
		where (replace(@Interface,' ','') like  '%[_]'+Wfl_Depts.DeptInt+'%' and @Interface is not null) or (DeptInt is null and @Interface is null)
	select @NumML=t.NumML, @taskType = t.TaskType, @DepartmentToName = d.DeptName, @DepartmentFromId = t.DepartmentIdFrom, @taskStart=t.StartDate 
		from Wfl_Tasks t 
		left join Wfl_Depts d on t.DepartmentIdTo=d.Id 
		where t.Id = @TaskId
	set @idPrimaryDepartment = (select value from Wfl_Settings where Code='PrimaryRouteSheetProcessor');
	-- Получение русского наименования выдавшего подразделения в том виде, в котором оно прописывается в ML_History
	if @InterfaceDepartmentName = 'ОШУГПЗ' or @InterfaceDepartmentName='ОШУГПУ'
		set @interfaceDepartment='УШТУ'
	else if @InterfaceDepartmentName = 'ОТУ'-- IAS
		set @interfaceDepartment = 'ТЛФ'
	else if @InterfaceDepartmentName = 'ОТС(Е)' --SPISOK_E1
		set @interfaceDepartment = 'УТУВК'
	else if @InterfaceDepartmentName='ОСП' -- UIIAS
		set @interfaceDepartment = 'УИИАС'
	else if @InterfaceDepartmentName='ОЦОД' -- UIIAS_H
		set @interfaceDepartment='УИИАС'
	else if @InterfaceDepartmentName='ОТС(S)' -- MTK
		set @interfaceDepartment='УТУиВК'
	else if @InterfaceDepartmentName='ОТвУ' -- UCTV
		set @interfaceDepartment='УКТВ'
	else if @InterfaceDepartmentName='ГОМЛ'
		set @interfaceDepartment='УДУ'
	else if @InterfaceDepartmentName='ДМВ'
		set @interfaceDepartment = 'ОРКП'
	else if @InterfaceDepartmentName='ГПЛР'
		set @interfaceDepartment='УЛКС'
	else
		set @interfaceDepartment=@InterfaceDepartmentName

	-- Получаем наименование исполнителя для List2Nav (в частности, Mestonah)
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

	set @returnDate = GETDATE()
	BEGIN TRAN
		if @InterfaceDepartmentId = @idPrimaryDepartment
		begin
			--set @returnTypeName=(select ReturnReasonObr.name from ReturnReasonObr where ReturnReasonObr.ID = @ReturnReason)
			update Osnova set
				signC2=@ReturnComment,
				signI2=@ReturnReason,
				signB2=1
			where NumML=@NumML;
		
			update List2Nav set ProblML=N'<Лист был возвращён в УРК ' + CONVERT(nvarchar, @returnDate, 104) + N' ' + CONVERT(nvarchar, @returnDate, 108) + N'>'
				where NumML=@NumML and Zakazhcik is not null;

			declare @Utverzh_B datetime
			set @Utverzh_B=(select Osnova.Utverzh_B from Osnova where NumML=@NumML)
			insert into TableReturnHistory(numberML, returnType, returnText, dateConfirmML, returnSign) 
				values (@NumML, @ReturnReason, @ReturnComment, @Utverzh_B, 1);

			insert into ML_History(NumML, Step, startTime, comment) values (@NumML, 10, @returnDate, @ReturnComment + N' ' +cast(@ReturnReason as nvarchar));
		end
		else -- Если возвращает не из ГОМЛ
		begin
			set @returnTypeName=(select ReturnReasonIsp.name from ReturnReasonIsp where ReturnReasonIsp.ID = @ReturnReason)
			set @pattern = N'<Возврат '+ @interfaceDepartment + N' ' + @returnTypeName + N'> ' + @ReturnComment
			if @InterfaceDepartmentName='ДМВ'
			begin
				declare @service nvarchar(50)
				set @service = (select List2Nav.Usluga from List2Nav where List2Nav.NumML = @NumML)
				if @service like '%A%' or @service like '%B%' or @service like '%G%' or @service like '%P%' or @service like '%I%'
				begin
					set @interfaceDepartment=N'ДМВ';
					set @pattern = N'<Возврат '+ @interfaceDepartment + N' ' + @returnTypeName + N'> ' + @ReturnComment;
					update List2Nav set
						signC4 = @pattern,
						signI4 = @ReturnReason,
						signD4 = @returnDate
					where NumML=@NumML;
				end
				else
				begin
					update List2Nav set
						signC2=@pattern,
						signI2=@ReturnReason,
						signD3=@returnDate
					where NumML=@NumML;
				end
			end
			else if @InterfaceDepartmentName='ОСП'
			begin
				set @pattern=@ReturnComment
				update List2Nav set
					signC2=@pattern + N' '+ltrim(rtrim(signC2)),
					signD3=@returnDate
				where NumML=@NumML;
			end
			else
			begin
				update List2Nav set
					signC2=@pattern,
					signI2=@ReturnReason,
					signD3=@returnDate
				where NumML=@NumML;
			end

			insert into ML_History(NumML, Step, startTime, comment, department) values (@NumML, 9, @returnDate, @pattern, @interfaceDepartment);
		end
		
		if @DepartmentFromId=@idPrimaryDepartment and @DepartmentToLNName is not null
		begin
			declare @place nvarchar(1024), @index int
			set @place=(select [MestoNah] from List2Nav where NumML=@NumML)
			if @place is not null
			begin
				-- Т.к. на одно подразделение м.б. более одного задания, искать лучше конкретное - выданное в заданную дату
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
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Поддержка существующих интерфейсов при возврате задания. Модифицирует таблицы List2Nav и ML_History.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'ReturnTaskSupport';

