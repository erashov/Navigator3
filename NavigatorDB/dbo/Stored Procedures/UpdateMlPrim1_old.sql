
CREATE	PROCEDURE [dbo].[UpdateMlPrim1_old]
	@NumML			int,
	@Pre_Usluga		nvarchar (25),
	@Usluga			nvarchar (36),
	@Nom_Kan		nvarchar (50),
	@Zakazchik		nvarchar (255),
	@Manager		nvarchar (30),
	@Telefon		nvarchar (11),
	@Osnovanie		nvarchar (255),
	@Kontakt_Ob		nvarchar (255),
	@Skorost		nvarchar (15),
	@Kol_vo_kan		nvarchar (50),
	@Klient			nvarchar (15),
	@Srochnost		nvarchar (21),
	@Styk_A			nvarchar (20),
	@Styk_A1		nvarchar (15),
	@Status_StykA	nvarchar (15),
	@Line_PrivA		nvarchar (6),
	@Adres_A		nvarchar (255),
	@Kontakt_A		nvarchar (255),
	@Dop_A			nvarchar (255),
	@Styk_B			nvarchar (20),
	@Styk_B1		nvarchar (15),
	@Status_StykB	nvarchar (15),
	@Line_PrivB		nvarchar (6),
	@Adres_B		nvarchar (255),
	@Kontakt_B		nvarchar (255),
	@Dop_B			nvarchar (255),
	@Utverzh_M		datetime,
	@Utverzh_B		datetime,
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
	@QoS			nvarchar (25),
	@ParamStyk1		nvarchar (25),
	@ParamStyk2		nvarchar (25),

	@AdresA			nvarchar (255),
	@AdresB			nvarchar (255),

	@CLIENT			nvarchar (255),
	@CUST			nvarchar (255),
	@RESP			nvarchar (255),
	@N1_OPERATOR		bit,
	@N1_OPERATOR_NAME	nvarchar (255),
	@N1_OWN			nvarchar (50),
	@N1_ADDINFO		nvarchar (4000),
	@N1_PORT		nvarchar (100),
	@N2_OPERATOR		bit,
	@N2_OPERATOR_NAME	nvarchar (255),
	@N2_OWN			nvarchar (50),
	@N2_ADDINFO		nvarchar (4000),
	@N2_PORT		nvarchar (100),
	@ETO_NUM		nvarchar (100),
	@N1_OLD_CONTACT		nvarchar (255),
	@N2_OLD_CONTACT		nvarchar (255),
	@VPN			bit,
	@ADSL_PHONES		nvarchar (255),
	@PHONE_OWNER		nvarchar (255),
	@MGTS_PHONE		nvarchar (50),
	@CHAN_TYPE 		nvarchar (50),
	@IP_ADDRESSES		nvarchar (255),
	@RENT_DATE 		nvarchar (100),
	@CONN_TYPE 		nvarchar (50),

	@CID			nvarchar (100),
	@ACTIVE_NETTERM_NUM	int,
	@CHANNELS		nvarchar (255),
	@FROM_CITY		nvarchar (150),
	@FROM_STREET	nvarchar (150),
	@FROM_HOUSE		nvarchar (10),
	@FROM_CORP		nvarchar (120),
	@FROM_BLD		nvarchar (120),
	@FROM_OWN		nvarchar (120),
	@FROM_FLOOR		nvarchar (120),
	@FROM_ROOM		nvarchar (120),
	@FROM_ADDRESS	nvarchar (120),

	@CONTRACTOR		nvarchar (120),
	@BUILDING_LIST	nvarchar (50)
AS
SET XACT_ABORT ON

BEGIN TRAN

  EXEC UpdateMlPrim
	@NumML,
	@Pre_Usluga,
	@Usluga,
	@Nom_Kan,
	@Zakazchik,
	@Manager,
	@Telefon,
	@Osnovanie,
	@Kontakt_Ob,
	@Skorost,
	@Kol_vo_kan,
	@Klient,
	@Srochnost,
	@Styk_A,
	@Styk_A1,
	@Status_StykA,
	@Line_PrivA,
	@Adres_A,
	@Kontakt_A,
	@Dop_A,
	@Styk_B,
	@Styk_B1,
	@Status_StykB,
	@Line_PrivB,
	@Adres_B,
	@Kontakt_B,
	@Dop_B,
	@Utverzh_M,
	@Utverzh_B,
	@town1,
	@Street1,
	@Dom1,
	@Str1,
	@Kor1,
	@flow1,
	@romm1,
	@town2,
	@Street2,
	@Dom2,
	@Str2,
	@Kor2,
	@flow2,
	@romm2,
	@QoS,
	@ParamStyk1,
	@ParamStyk2,

	@CLIENT,
	@CUST,
	@RESP,
	@N1_OPERATOR,
	@N1_OPERATOR_NAME,
	@N1_OWN,
	@N1_ADDINFO,
	@N1_PORT,
	@N2_OPERATOR,
	@N2_OPERATOR_NAME,
	@N2_OWN,
	@N2_ADDINFO,
	@N2_PORT,
	@ETO_NUM,
	@N1_OLD_CONTACT,
	@N2_OLD_CONTACT,
	@VPN,
	@ADSL_PHONES,
	@PHONE_OWNER,
	@MGTS_PHONE,
	@CHAN_TYPE,
	@IP_ADDRESSES,
	@RENT_DATE,
	@CONN_TYPE,

	@CID,
	@ACTIVE_NETTERM_NUM

COMMIT TRAN

BEGIN TRAN

  if not Exists(select * from UltTaskSubcontrInfo where CID=@CID)
  BEGIN
	INSERT INTO UltTaskSubcontrInfo
	VALUES
	(
		@CID,
		@NumML,
		@ACTIVE_NETTERM_NUM,
		@CHANNELS,
		@FROM_CITY,
		@FROM_STREET,
		@FROM_HOUSE,
		@FROM_CORP,
		@FROM_BLD,
		@FROM_OWN,
		@FROM_FLOOR,
		@FROM_ROOM
	)
  END
  ELSE
  BEGIN
	UPDATE UltTaskSubcontrInfo
	SET
		NumML			= @NumML,
		ACTIVE_NETTERM_NUM	= @ACTIVE_NETTERM_NUM,
		CHANNELS		= @CHANNELS,
		FROM_CITY		= @FROM_CITY,
		FROM_STREET		= @FROM_STREET,
		FROM_HOUSE		= @FROM_HOUSE,
		FROM_CORP		= @FROM_CORP,
		FROM_BLD		= @FROM_BLD,
		FROM_OWN		= @FROM_OWN,
		FROM_FLOOR		= @FROM_FLOOR,
		FROM_ROOM		= @FROM_ROOM
	WHERE CID = @CID
  END

  DECLARE @L2N_AdresA		nvarchar(255)
  DECLARE @L2N_AdresB		nvarchar(255)
  DECLARE @L2N_Usluga		nvarchar(50)
  DECLARE @L2N_Srochnost	nvarchar(50)
  DECLARE @L2N_Prim		nvarchar(255)

  IF @AdresA = ''
    SET @L2N_AdresA = NULL
  ELSE
    SET @L2N_AdresA = @AdresA

  IF @AdresB = ''
    SET @L2N_AdresB = NULL
  ELSE
    SET @L2N_AdresB = @AdresB

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
  IF @Usluga = 'Телематика' OR @Usluga = 'Размещение оборудования и прочие услуги ЦД'
    SET @L2N_Usluga = @L2N_Usluga + 'H'
  ELSE
  IF @Usluga = 'Виртуальный ВК Ethernet'
    SET @L2N_Usluga = @L2N_Usluga + 'G'
  ELSE
  IF @Usluga = 'Установка оборудования'
    SET @L2N_Usluga = @L2N_Usluga + 'OG'
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

  IF @L2N_Usluga = ''
    SET @L2N_Usluga = 'UNKNOWN'

  SET @L2N_Prim = 'ПРИМ '
  IF @BUILDING_LIST IS NULL OR @BUILDING_LIST=''
    SET @L2N_Prim = @L2N_Prim + '"' + @CONTRACTOR + '" ' + @FROM_ADDRESS
  ELSE
    SET @L2N_Prim = @L2N_Prim + 'ЛС №' + @BUILDING_LIST

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
	@Srochnost,
	@L2N_Prim,
	newid()
  )
/*
  BEGIN
	IF @@TRANCOUNT>0 
	   ROLLBACK TRAN
   	RAISERROR ('Обнаружен повторяющийся CID - %s', 16, 1, @CID)
  END

  IF @@ERROR=0 
  BEGIN
	IF @@TRANCOUNT>0 
	  COMMIT TRAN
  END ELSE 
  BEGIN
	IF @@TRANCOUNT>0
	  ROLLBACK TRAN
  END
*/
COMMIT TRAN

SET XACT_ABORT OFF
