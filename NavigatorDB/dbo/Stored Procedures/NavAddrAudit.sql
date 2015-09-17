CREATE PROCEDURE NavAddrAudit
	@State int -- 0-выключить; 1-включить 
AS
SET NOCOUNT ON

DECLARE @TabExist int
DECLARE @TrigExist int
-- Проверить наличие таблицы
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE name = 'NavChangeList' AND type = 'U')
	SELECT @TabExist = 1
ELSE
	SELECT @TabExist = 0
-- Проверить наличие триггера
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE name = 'trig_OsnovaAddrChange' AND type = 'TR')
	SELECT @TrigExist = 1
ELSE
	SELECT @TrigExist = 0


IF @State = 1 -- включаем аудит
	BEGIN
	--Если нет таблицы отслеживания изменений, - создать её
	IF @TabExist = 0
		BEGIN
		CREATE TABLE dbo.NavChangeList (
			_Id int IDENTITY PRIMARY KEY,
			_DateLog datetime DEFAULT GETDATE(),
			_UserId int default USER_ID(),
			NumML int NOT NULL,
			Adres_A varchar (255) COLLATE Cyrillic_General_CI_AS NULL,
			Adres_B varchar (255) COLLATE Cyrillic_General_CI_AS NULL,
			town1 varchar (150) COLLATE Cyrillic_General_CI_AS NULL,
			Street1 varchar (150) COLLATE Cyrillic_General_CI_AS NULL,
			Dom1 varchar (10) COLLATE Cyrillic_General_CI_AS NULL,
			Str1 varchar (120) COLLATE Cyrillic_General_CI_AS NULL,
			Kor1 varchar (120) COLLATE Cyrillic_General_CI_AS NULL,
			flow1 varchar (150) COLLATE Cyrillic_General_CI_AS NULL,
			romm1 varchar (150) COLLATE Cyrillic_General_CI_AS NULL,
			town2 varchar (150) COLLATE Cyrillic_General_CI_AS NULL,
			Street2 varchar (150) COLLATE Cyrillic_General_CI_AS NULL,
			Dom2 varchar (10) COLLATE Cyrillic_General_CI_AS NULL,
			Str2 varchar (120) COLLATE Cyrillic_General_CI_AS NULL,
			Kor2 varchar (120) COLLATE Cyrillic_General_CI_AS NULL,
			flow2 varchar (150) COLLATE Cyrillic_General_CI_AS NULL,
			romm2 varchar (150) COLLATE Cyrillic_General_CI_AS NULL
		)
		END
	--Навесить триггер на целевую таблицу
	IF @TrigExist = 0
		BEGIN
		EXEC (N'CREATE TRIGGER trig_OsnovaAddrChange ON dbo.Osnova 
		FOR UPDATE 
		AS 
		SET NOCOUNT ON 
		IF 
			UPDATE(Adres_A) OR 
			UPDATE(Adres_B) OR 
			UPDATE(town1) OR 
			UPDATE(Street1) OR 
			UPDATE(Dom1) OR 
			UPDATE(Str1) OR 
			UPDATE(Kor1) OR 
			UPDATE(flow1) OR 
			UPDATE(romm1) OR 
			UPDATE(town2) OR 
			UPDATE(Street2) OR 
			UPDATE(Dom2) OR 
			UPDATE(Str2) OR 
			UPDATE(Kor2) OR 
			UPDATE(flow2) OR 
			UPDATE(romm2) 
			INSERT INTO NavChangeList (NumML,Adres_A,Adres_B,town1,Street1,Dom1,Str1,Kor1,flow1,romm1,town2,Street2,Dom2,Str2,Kor2,flow2,romm2) 
			SELECT NumML,Adres_A,Adres_B,town1,Street1,Dom1,Str1,Kor1,flow1,romm1,town2,Street2,Dom2,Str2,Kor2,flow2,romm2 FROM inserted')
		END
	END
ELSE	--отрубить аудит
	--Удалить триггер с целевой таблицы
	IF @TrigExist = 1
		DROP TRIGGER trig_OsnovaAddrChange
	--Если есть таблица отслеживания изменений, - удалить её
	IF @TabExist = 1
		DROP TABLE dbo.NavChangeList
