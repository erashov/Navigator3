
CREATE	PROCEDURE [dbo].[makeList2NavfromOsnova]
	@NumML			int
AS
SET XACT_ABORT ON

BEGIN TRAN

  DECLARE
	@Pre_Usluga		nvarchar (25),
	@Usluga			nvarchar (36),
	@Zakazchik		nvarchar (255),
	@Manager		nvarchar (30),
	@Skorost		nvarchar (15),
	@Srochnost		nvarchar (21),
	@Styk_A			nvarchar (20),
	@Styk_B			nvarchar (20),
	@town1			nvarchar (150),
	@Street1		nvarchar (150),
	@Dom1			nvarchar (10),
	@Str1			nvarchar (120),
	@Kor1			nvarchar (120),
	@flow1			nvarchar (150),
	@romm1			nvarchar (150),
	@town2			nvarchar (150),
	@Street2		nvarchar (150),
	@Dom2			nvarchar (10),
	@Str2			nvarchar (120),
	@Kor2			nvarchar (120),
	@flow2			nvarchar (150),
	@romm2			nvarchar (150),
	@Kodir_Usl		nvarchar (10),
	@QoS			nvarchar (25)

  SELECT
	@Pre_Usluga = Pre_Usluga,
	@Usluga = Usluga,
	@Zakazchik = Zakazchik,
	@Manager = Manager,
	@Skorost = Skorost,
	@Srochnost = Srochnost,
	@Styk_A		= Styk_A,
	@Styk_B		= Styk_B,
	@town1		= town1,
	@Street1	= Street1,
	@Dom1		= Dom1,
	@Str1		= Str1,
	@Kor1		= Kor1,
	@flow1		= flow1,
	@romm1		= romm1,
	@town2		= town2,
	@Street2	= Street2,
	@Dom2		= Dom2,
	@Str2		= Str2,
	@Kor2		= Kor2,
	@flow2		= flow2,
	@romm2		= romm2,
	@Kodir_Usl	= Kodir_Usl,
	@QoS		= QoS
  FROM Osnova
  WHERE NumML = @NumML


  DECLARE @L2N_AdresA		nvarchar(255)
  DECLARE @L2N_AdresB		nvarchar(255)
  DECLARE @L2N_Usluga		nvarchar(50)
  DECLARE @L2N_Srochnost	nvarchar(50)
  DECLARE @L2N_Prim			nvarchar(255)


  DECLARE
	@p_town1	nvarchar (150),
	@p_town2	nvarchar (150)

  IF LOWER(@town1) = 'москва'
	SET @p_town1 = ''
  ELSE
	SET @p_town1 = @town1

  IF LOWER(@town2) = 'москва'
	SET @p_town2 = ''
  ELSE
	SET @p_town2 = @town2

  
  SET @L2N_AdresA = dbo.MakeAddress(@p_town1,	@Street1, @Dom1, @Str1,	@Kor1, @flow1, @romm1)
  SET @L2N_AdresB = dbo.MakeAddress(@p_town2,	@Street2, @Dom2, @Str2,	@Kor2, @flow2, @romm2)

/*
  IF @AdresA = ''
    SET @L2N_AdresA = NULL
  ELSE
    SET @L2N_AdresA = @AdresA

  IF @AdresB = ''
    SET @L2N_AdresB = NULL
  ELSE
    SET @L2N_AdresB = @AdresB
*/
  SET @L2N_Usluga = ''

  IF @Pre_Usluga = 'Модернизация услуги'
    SET @L2N_Usluga = 'M'
  ELSE
  IF @Pre_Usluga = 'Прекращение услуги'
    SET @L2N_Usluga = 'X'

  IF @Usluga = 'Выделенный канал 100Mb/s'
    SET @L2N_Usluga = @L2N_Usluga + 'A'
  ELSE
  IF @Usluga = 'Выделенный канал 155 Mb/s'
    SET @L2N_Usluga = @L2N_Usluga + 'R'
  ELSE
  IF @Usluga = 'Порт сети передачи данных 155 Mb/s'
    SET @L2N_Usluga = @L2N_Usluga + 'PA'
  ELSE
  IF @Usluga = 'Выделенный канал 155 Mb/s'
    SET @L2N_Usluga = @L2N_Usluga + 'R'
  ELSE
  IF @Usluga = 'Выделенный канал на темных волокнах'
    SET @L2N_Usluga = @L2N_Usluga + 'T'
  ELSE
  IF @Usluga = 'Телевидение'
    SET @L2N_Usluga = @L2N_Usluga + 'K'
  ELSE
  IF @Usluga = 'Телематика'
    SET @L2N_Usluga = @L2N_Usluga + 'H'
  ELSE
  IF @Usluga = 'Виртуальный канал'
    SET @L2N_Usluga = @L2N_Usluga + 'V'
  ELSE
  IF @Usluga = 'Выделенный канал'
    IF @Skorost = '2048 кбит/с'
      SET @L2N_Usluga = @L2N_Usluga + 'E'
    ELSE
    IF @Skorost IS NOT NULL AND @Skorost<>''
      SET @L2N_Usluga = @L2N_Usluga + 'S'
  ELSE
  IF @Usluga = 'Порт сети Интернет'
    IF @Skorost = '2048 кбит/с'
      SET @L2N_Usluga = @L2N_Usluga + 'IE'
    ELSE
      SET @L2N_Usluga = @L2N_Usluga + 'IS'
  IF @Usluga = 'Порт сети передачи данных'
    IF @Skorost = '2048 кбит/с'
      SET @L2N_Usluga = @L2N_Usluga + 'PE'
    ELSE
    IF @Skorost = '155 Мбит/с'
      SET @L2N_Usluga = @L2N_Usluga + 'PA'
    ELSE
      SET @L2N_Usluga = @L2N_Usluga + 'PS'

  IF @Srochnost = 'СТАНДАРТ (до 10 дней)'
    SET @L2N_Srochnost = '10'
  ELSE
  IF @Srochnost = 'СРОЧНО (до 5 дней)'
    SET @L2N_Srochnost = '5'

  IF @Styk_A = 'Ethernet 100Мбит/с'
      SET @L2N_Usluga = @L2N_Usluga + 'F'

  IF @Styk_A = 'Виртуальный канал в интернет'
      SET @L2N_Usluga = @L2N_Usluga + 'VI'

  IF @L2N_Usluga = ''
    SET @L2N_Usluga = 'UNKNOWN'

  IF @Usluga like 'виртуальный в%'
  BEGIN
    SET @L2N_Usluga = 'G'
    IF @QoS IS NOT NULL AND @QoS <> ''
      IF @QoS LIKE '0%'
        SET @L2N_Usluga = 'GФ'
      ELSE
      IF @QoS LIKE '1%' OR @QoS LIKE '2%' OR @QoS LIKE '3%'
        SET @L2N_Usluga = 'GФW'
  END

/*
  SET @L2N_Prim = 'ПРИМ '
  IF @BUILDING_LIST IS NULL OR @BUILDING_LIST=''
    SET @L2N_Prim = @L2N_Prim + '"' + @CONTRACTOR + '" ' + @FROM_ADDRESS
  ELSE
    SET @L2N_Prim = @L2N_Prim + 'ЛС №' + @BUILDING_LIST
*/
  INSERT INTO List2Nav
  (
	NumMl,
	Otvetstv,
	Zakazhcik,
	AdresA,
	AdresB,
	Utverzh,
	Usluga,
	IDO,
	Srochnost,
	Prim,
	rowguid
  )
  VALUES(	
	@NumML,
	@Manager,
	@Zakazchik,
	@L2N_AdresA,
	@L2N_AdresB,
	convert(datetime, convert(char(50), getdate(), 120), 120),
	@L2N_Usluga,
	convert(datetime, convert(char(50), getdate(), 112), 112),
	@L2N_Srochnost,
	@L2N_Prim,
	newid()
  )
  COMMIT TRAN

SET XACT_ABORT OFF
