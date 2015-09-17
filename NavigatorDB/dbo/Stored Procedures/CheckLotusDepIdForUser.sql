



CREATE PROCEDURE [dbo].[CheckLotusDepIdForUser]
	@adName nvarchar(32),
	@SkipCheckExistense bit = 0 -- пропуск проверки наличия данных. Параметр для обновления полученных ранее данных.
AS
	if @SkipCheckExistense = 1 or not exists (select u.DeptIdFromLotus from Wfl_Users u where u.AdName=@adName and u.DeptIdFromLotus is not null)
	begin
		-- в таблице пользователей нет информации о подразделении из лотуса - надо получить и сохранить
		declare @query nvarchar(max)
		declare @surName varchar(100), @name varchar(100), @patr varchar(100)
		declare @lotusDepId varchar(32) -- Id подразделения из лотуса 
		set @query='select cast(a.Surname COLLATE Cyrillic_General_CI_AS as varchar(100)),
					cast(a.Name COLLATE Cyrillic_General_CI_AS as varchar(100)),
					cast(a.Patronymic COLLATE Cyrillic_General_CI_AS as varchar(100)),
					cast(a.Dad COLLATE Cyrillic_General_CI_AS as varchar(32))
					from openrowset
					(''SQLNCLI'',''DRIVER={SQL Server};SERVER=serv-sql;UID=LotServiceReader;PWD=LotusDomino; CODEPAGE=1251'',''select  cast(Surname as nvarchar(100)) as Surname, cast(Name as nvarchar(100)) as Name, cast(Patronymic as nvarchar(100)) as Patronymic, cast(Dad as nvarchar(32)) as Dad from Pers where ADname like '''''+@adname+''''''') as a'
		declare @LotusData table (surname varchar(100), name varchar(100), patronymic varchar(100), Dad varchar(32))
		insert into @LotusData exec(@query)
		declare Cursor_user cursor for select * from @LotusData
		OPEN Cursor_user
		FETCH NEXT FROM Cursor_user into @surName, @name, @patr, @lotusDepId
		WHILE @@FETCH_STATUS = 0 
		BEGIN 
			PRINT 'Lotus data: '+@surName+', '+@name+', '+@patr+', '+@lotusDepId; 
			BEGIN TRY
				declare @queryForParent nvarchar(max)
				if (not exists (select d.Id from Wfl_Depts d where d.LotusDocId=@lotusDepId)) and @lotusDepId is not null
				begin
					set @queryForParent='select 
					cast(d.[Dad_1] COLLATE Cyrillic_General_CI_AS as varchar(32)),
					cast(d.[Dad_2] COLLATE Cyrillic_General_CI_AS as varchar(32)),
					cast(d.[Dad_3] COLLATE Cyrillic_General_CI_AS as varchar(32)),
					cast(d.[Dad_4] COLLATE Cyrillic_General_CI_AS as varchar(32)),
					cast(d.[Dad_5] COLLATE Cyrillic_General_CI_AS as varchar(32)),
					cast(d.[Dad_6] COLLATE Cyrillic_General_CI_AS as varchar(32)),
					cast(d.[Dad_7] COLLATE Cyrillic_General_CI_AS as varchar(32))
					from openrowset
					(''SQLNCLI'',''DRIVER={SQL Server};SERVER=serv-sql;UID=LotServiceReader;PWD=LotusDomino; CODEPAGE=1251'',''select  
					cast(Dad_1 as nvarchar(32)) as Dad_1,
					cast(Dad_2 as nvarchar(32)) as Dad_2,
					cast(Dad_3 as nvarchar(32)) as Dad_3,
					cast(Dad_4 as nvarchar(32)) as Dad_4,
					cast(Dad_5 as nvarchar(32)) as Dad_5,
					cast(Dad_6 as nvarchar(32)) as Dad_6,
					cast(Dad_7 as nvarchar(32)) as Dad_7
					from Dept where DocId= '''''+@lotusDepId+''''''') as d'
					declare @LotusParents table (Dad_1 varchar(32),Dad_2 varchar(32),Dad_3 varchar(32),Dad_4 varchar(32),Dad_5 varchar(32),Dad_6 varchar(32),Dad_7 varchar(32))
					insert into @LotusParents exec(@queryForParent)
					set @lotusDepId = (select Dad_7 from @LotusParents)
					if @lotusDepId is null or not exists (select d.Id from Wfl_Depts d where d.LotusDocId=@lotusDepId)
					begin
						set @lotusDepId = (select Dad_6 from @LotusParents)
						if @lotusDepId is null or not exists (select d.Id from Wfl_Depts d where d.LotusDocId=@lotusDepId)
						begin
							set @lotusDepId = (select Dad_5 from @LotusParents)
							if @lotusDepId is null or not exists (select d.Id from Wfl_Depts d where d.LotusDocId=@lotusDepId)
							begin
								set @lotusDepId = (select Dad_4 from @LotusParents)
								if @lotusDepId is null or not exists (select d.Id from Wfl_Depts d where d.LotusDocId=@lotusDepId)
								begin
									set @lotusDepId = (select Dad_3 from @LotusParents)
									if @lotusDepId is null or not exists (select d.Id from Wfl_Depts d where d.LotusDocId=@lotusDepId)
									begin
										set @lotusDepId = (select Dad_2 from @LotusParents)
										if @lotusDepId is null or not exists (select d.Id from Wfl_Depts d where d.LotusDocId=@lotusDepId)
											set @lotusDepId = (select Dad_1 from @LotusParents)
									end
								end
							end
						end
					end
				end
				BEGIN TRANSACTION 
					if exists(select AdName from Wfl_Users where AdName=@adName)
						update wfl_users set 
							DeptIdFromLotus = (select d.Id from Wfl_Depts d where d.LotusDocId=@lotusDepId),
							SurName = @surName,
							Name = @Name,
							Patronymic = @patr
						where wfl_users.AdName=@adName
					else
						insert into wfl_users(AdName, Dept, SurName, Name, Patronymic, DeptIdFromLotus)
						select @adname, d.Id, @surName, @name, @patr, d.Id from Wfl_Depts d where d.LotusDocId=@lotusDepId
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
			FETCH NEXT FROM Cursor_user into @surName, @name, @patr, @lotusDepId
		END
		CLOSE Cursor_user;
		DEALLOCATE Cursor_user;
	end
RETURN 0



