




/*
	Процедура для автоматического формирования маршрутных листов из ComFlow в Navigator_test
*/
CREATE PROCEDURE [dbo].[MLinsFromComFlow] 
	@ServId int,
	@Usluga nvarchar(125) = NULL,
	@aStageId int = NULL out
AS
SET NOCOUNT ON

IF (@ServId IS NULL) OR (@ServId  <= 0)
	RETURN 0
-- Объявим переменные для выходных параметров хранимки ComFlow, которая заполнит их атрибутами будущего МЛ
DECLARE @Pre_Usluga nvarchar(25) 
--DECLARE @Usluga nvarchar(36)  
DECLARE @Nom_Kan nvarchar(50)  
DECLARE @Zakazchik nvarchar(254)  
DECLARE @Manager nvarchar(30)  
DECLARE @Project_Manager nvarchar(30)  
DECLARE @Telefon nvarchar(11)  
DECLARE @Osnovanie nvarchar(254)  
DECLARE @Kontakt_Ob nvarchar(254) 
DECLARE @Skorost nvarchar(15) 
DECLARE @Kol_vo_kan nvarchar(50)  
DECLARE @Klient nvarchar(15) 
DECLARE @Srochnost nvarchar(21) 
DECLARE @Styk_A nvarchar(32) 
DECLARE @Styk_A1 nvarchar(15)  
DECLARE @Status_StykA nvarchar(15)  
DECLARE @Line_PrivA nvarchar(25)  
DECLARE @Adres_A nvarchar(254)  
DECLARE @Kontakt_A nvarchar(254)  
DECLARE @Dop_A nvarchar(254)  
DECLARE @Styk_B nvarchar(32)  
DECLARE @Styk_B1 nvarchar(15)  
DECLARE @Status_StykB nvarchar(15)  
DECLARE @Line_PrivB nvarchar(6)  
DECLARE @Adres_B nvarchar(254)  
DECLARE @Kontakt_B nvarchar(254)  
DECLARE @Dop_B nvarchar(254)  
DECLARE @Utverzh_M datetime  
DECLARE @Utverzh_B datetime  
DECLARE @Pr_ULKS bit  
DECLARE @Pr_USP bit  
DECLARE @Pr_UUK bit  
DECLARE @Pr_UPK bit  
DECLARE @Pr_USHKm bit  
DECLARE @Pr_USHKn bit  
DECLARE @Kodir_Usl nvarchar(10)  
DECLARE @Pr_Obr bit  
DECLARE @town1 nvarchar(150)  
DECLARE @Street1 nvarchar(150)  
DECLARE @Dom1 nvarchar(10)  
DECLARE @Str1 nvarchar(120)   
DECLARE @Kor1 nvarchar(120)  
DECLARE @flow1 nvarchar(150)  
DECLARE @romm1 nvarchar(150)  
DECLARE @town2 nvarchar(150)  
DECLARE @Street2 nvarchar(150)  
DECLARE @Dom2 nvarchar(10)  
DECLARE @Str2 nvarchar(120)  
DECLARE @Kor2 nvarchar(120)  
DECLARE @flow2 nvarchar(150)  
DECLARE @romm2 nvarchar(150) 
DECLARE @signI3 int
DECLARE @QoS nvarchar(25)  
DECLARE @ParamStyk1 nvarchar(25)  
DECLARE @ParamStyk2 nvarchar(25) 
DECLARE @SpecProject nvarchar(128) 
DECLARE @NumETO1 int
DECLARE @NumETO2 int
DECLARE @SignD2 datetime
DECLARE @SignC3 varchar(100)
-- перемычки ММТС
DECLARE @Marking varchar(255)
DECLARE @Marking_B varchar(255)
DECLARE @BridgeId_B int
DECLARE @BridgeId int
---
DECLARE @room_BC1 varchar(255)
DECLARE @room_BC2 varchar(255)
-- Получим необходимые данные со SWAN
DECLARE @ret int
EXEC @ret = ComFlow.dbo.Navigator_testGetMLinfo @ServId,@aStageID, 
	@Pre_Usluga out, @Usluga out, @Nom_Kan out, @Zakazchik out, @Manager out, @Telefon out, 
	@Osnovanie out, @Kontakt_Ob out, @Skorost out, @Kol_vo_kan out, @Klient out, @Srochnost out,
	@Styk_A out, @Styk_A1 out, @Status_StykA out, @Line_PrivA out, @Adres_A out, @Kontakt_A out, @Dop_A out,  
	@Styk_B out, @Styk_B1 out, @Status_StykB out, @Line_PrivB out, @Adres_B out, @Kontakt_B out, @Dop_B out,  
	@Utverzh_M out, @Utverzh_B out, @Pr_ULKS out, @Pr_USP out, @Pr_UUK out, @Pr_UPK out, @Pr_USHKm out, @Pr_USHKn out, @Kodir_Usl out, @Pr_Obr out, 
	@town1 out, @Street1 out, @Dom1 out, @Str1 out, @Kor1 out, @flow1 out, @romm1 out, 
	@town2 out, @Street2 out, @Dom2 out, @Str2 out, @Kor2 out, @flow2 out, @romm2 out,
	@signI3 out,
	-- Добавлено Козаченко 6.6.2007
	@QoS out, @ParamStyk1 out, @ParamStyk2 out,@NumETO1 out,@NumETO2 out,@Project_Manager out,@SpecProject out,@SignD2 out,@SignC3 out,	
	-- перемычки ММТС
	@Marking out, @Marking_B out, @BridgeId_B out, @BridgeId out,
	----
	null,
	@room_BC1 out,@room_BC2 out
	

IF (@ret=0)
-- Создадим МЛ в БД "Навигатор" на основе данных, полученных из ComFlow
INSERT INTO osnova(Pre_Usluga, 
	Usluga, Nom_Kan, Zakazchik, 
	Manager, Telefon, Osnovanie, 
	Kontakt_Ob, 
	Skorost, Kol_vo_kan, Klient, Srochnost, 
	Styk_A, Styk_A1, Status_StykA, Line_PrivA, Adres_A, Kontakt_A, Dop_A, 
	Styk_B, Styk_B1, Status_StykB, Line_PrivB, Adres_B, Kontakt_B, Dop_B, 
	Utverzh_M, Utverzh_B, Pr_ULKS, Pr_USP, Pr_UUK, 
	Pr_UPK, Pr_USHKm, Pr_USHKn, Kodir_Usl, Pr_Obr, 
	town1, Street1, Dom1, Str1, 
	Kor1, flow1, romm1, 
	town2, Street2, Dom2, Str2, 
	Kor2, flow2, romm2,
	signI3,
	-- Добавлено Козаченко 6.6.2007
	QoS, ParamStyk1, ParamStyk2,Project_manager,SpecProject,n_ETO_stA,n_ETO_stB,SignD2,SignC3,
	--перемычки ММТС
	Marking, Marking_B, BridgeId_B, BridgeId,
	---
	room_BC1,room_BC2
)
VALUES(
	@Pre_Usluga, @Usluga, @Nom_Kan, @Zakazchik, @Manager, @Telefon, 
	@Osnovanie, @Kontakt_Ob, @Skorost, @Kol_vo_kan, @Klient, @Srochnost,
	@Styk_A, @Styk_A1, @Status_StykA, @Line_PrivA, @Adres_A, @Kontakt_A, @Dop_A,  
	@Styk_B, @Styk_B1, @Status_StykB, @Line_PrivB, @Adres_B, @Kontakt_B, @Dop_B,  
	@Utverzh_M, @Utverzh_B, @Pr_ULKS, @Pr_USP, @Pr_UUK, @Pr_UPK, @Pr_USHKm, @Pr_USHKn, @Kodir_Usl, @Pr_Obr, 
	@town1, @Street1, @Dom1, @Str1, @Kor1, @flow1, @romm1, 
	@town2, @Street2, @Dom2, @Str2, @Kor2, @flow2, @romm2,
	@signI3,
	-- Добавлено Козаченко 6.6.2007
	@QoS, @ParamStyk1, @ParamStyk2,@Project_manager,@SpecProject,@NumETO1,@NumETO2,@SignD2,@SignC3,
	--перемычки ММТС
	@Marking, @Marking_B, @BridgeId_B, @BridgeId,
	--
	@room_BC1,@room_BC2)
ELSE
BEGIN
	DECLARE @Msg varchar(256)
	SET @Msg = 'Недостаточно данных о клиенте для создания маршрутного листа.'+CHAR(13)+CHAR(10)+ 'Не указан менеджер, ответственный за данного клиента или в заявке, содержащей услугу, не укзан клиент.'
	RAISERROR (@Msg, 16, 1) WITH NOWAIT
	RETURN -1
END
-- №МЛ вернем в ComFlow для установления связи

declare 
	@numML int,
	@ins bit,
	@AddressA nvarchar(1158) ,
	@AddressB nvarchar(1158) ,
	@ChNumA nvarchar(10) ,
	@ChNumB nvarchar(10), 
	@JointA nvarchar(50),
	@JointB nvarchar(50),
	@JointStatusA nvarchar(20),
	@JointStatusB nvarchar(20),
	@JointParamA nvarchar(20),
	@JointParamB nvarchar(20),
	@LineA nvarchar(10),
	@LineB nvarchar(10),
	@ChannelInfoA nvarchar(10),
	@ChannelInfoB nvarchar(10),
	@EquipmentA nvarchar(255),
	@EquipmentB nvarchar(255),
	@OperatorA nvarchar(128),
	@OperatorB nvarchar(128),
	@JointIdA int,
	@JointIdB int,
	@SOChSkorostA nvarchar(64),
	@SOChSkorostB nvarchar(64),
	@SOChInterfaceA nvarchar(50),
	@SOChInterfaceB nvarchar(50),
	@DMVManagerA nvarchar(70),
	@DMVManagerB nvarchar(70)

set @numML = SCOPE_IDENTITY()
exec Comflow.dbo.[Navigator_testGetJoint] @ServId, @ins out, @AddressA out,@AddressB out , @CHNumA out, @ChnumB out,
 @JointA out, @JointB out, @JointStatusA out, @JointStatusB out, @JointParamA out, @JointParamB out, @LineA out, @LineB out, @ChannelInfoA out, 
@ChannelInfoB out, @EquipmentA out, @EquipmentB out, @OperatorA out, @OperatorB out, @JointIdA out, @JointIdB out, @SOChSkorostA out, 
@SOChSkorostB out, @SOChInterfaceA out, @SOChInterfaceB out, @DMVManagerA out, @DMVManagerB out

--SELECT *FROM [Navigator_test].[dbo].[JointInfo]

if (@ins = 1)
begin
	insert into JointInfo(numML, AdressA,AdressB,ChNumA,ChNumB,
JointA, JointB, JointStatusA, JointStatusB, JointParamA, JointParamB, LineA, LineB, ChannelInfoA, ChannelInfoB, EqiupmentA, EqiupmentB, OperatorA, OperatorB, JointIdA, JointIdB, SOChSkorostA, SOChSkorostB, SOChInterfaceA,
SOChInterfaceB, DMVManagerA, DMVManagerB) select @numML, @AddressA, @AddressB, @ChNumA, @ChNumB,
		@JointA, @JointB, @JointStatusA, @JointStatusB, @JointParamA, @JointParamB, @LineA, @LineB, @ChannelInfoA, @ChannelInfoB,
		@EquipmentA, @EquipmentB, @OperatorA, @OperatorB, @JointIdA, @JointIdB, @SOChSkorostA, @SOChSkorostB, @SOChInterfaceA,
		@SOChInterfaceB, @DMVManagerA, @DMVManagerB
end

RETURN ISNULL(@NumML,0)




