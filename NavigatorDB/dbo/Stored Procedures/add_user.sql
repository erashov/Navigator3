



CREATE PROCEDURE [dbo].[add_user](@adname  varchar(32), @interface varchar(100))
as
SET NOCOUNT ON;
declare @Dept int;
declare @s varchar(100) 
declare @n varchar(100)  
declare @p varchar(100)  
declare @fio table (surname varchar(100), name varchar(100), patronymic varchar(100))
declare @query  nvarchar(4000)
set @Dept=(select id from Wfl_Depts where ((replace(@Interface,' ','') like  '%[_]'+Wfl_Depts.DeptInt+'%' or @Interface  like  '%[ ]'+Wfl_Depts.DeptInt+'%') and @Interface is not null) or (DeptInt is null and @Interface is null) or (DeptInt=@Interface))--(select Id from Wfl_Depts where replace(@interface,' ','') like  '%[_]'+Wfl_Depts.DeptInt+'%')
if @Dept is not null
begin
	exec [dbo].[CheckLotusDepIdForUser] @adname, 1
	BEGIN TRY
		BEGIN TRANSACTION 
			if @Dept is not null
			begin
				insert into [dbo].[Wfl_UsersInterfaceDepts] ([AdName], [DeptId])
				values (@adname, @Dept)
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
end
