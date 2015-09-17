


/*
	Процедура для обновления инофрмации в маршрутном листе из ComFlow в Navigator_test
*/
CREATE PROCEDURE [dbo].[MLUpdFromComFlow] 
	@NumML int
AS
SET NOCOUNT ON

declare @ServId int,@aStageID int

select @ServID = TheServiceID,@aStageId = astageID from
comflow.dbo.Navigator_test_NumML
where NumML = @NumML

IF (@ServId IS NULL) OR (@ServId  <= 0)
	RETURN 0
-- Объявим переменные для выходных параметров хранимки ComFlow, которая заполнит их атрибутами  МЛ
DECLARE @Pre_Usluga nvarchar(25) 
DECLARE @Usluga nvarchar(36)  
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
	@QoS out, @ParamStyk1 out, @ParamStyk2 out,@NumETO1 out,@NumETO2 out,@Project_Manager out,@SpecProject out,@SignD2 out,@SignC3 out,	
	@Marking out, @Marking_B out, @BridgeId_B out, @BridgeId out
	


update osnova
set
	Nom_Kan = @Nom_Kan,
	Zakazchik = @Zakazchik,
	Kontakt_Ob = @Kontakt_Ob,
	Skorost = @Skorost,
	Styk_A = @Styk_A, 
	Styk_A1 = @Styk_A1,
	Status_StykA = @Status_StykA, 
	Line_PrivA = @Line_PrivA, 
	Adres_A = @Adres_A, 
	Kontakt_A = @Kontakt_A,
	Dop_A = @Dop_A,  
	Styk_B = @Styk_B,
	Styk_B1 = @Styk_B1,
	Status_StykB = @Status_StykB,
	Line_PrivB = @Line_PrivB,
	Adres_B = @Adres_B,
	Kontakt_B =@Kontakt_B,
	Dop_B = @Dop_B,  
	town1 = @town1, Street1 = @Street1, Dom1 = @Dom1, Str1 = @Str1, Kor1 = @Kor1, flow1 = @flow1, romm1 = @romm1, 
	town2 = @town2, Street2 = @Street2, Dom2 = @Dom2, Str2 =@Str2, Kor2 = @Kor2, flow2 = @flow2, romm2 = @romm2,
	QoS = @QoS, 
	ParamStyk1 = @ParamStyk1, 
	ParamStyk2 = @ParamStyk2
WHERE NumML = @NUMML and utverzh_b is null









GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MLUpdFromComFlow] TO [ManItEx]
    AS [dbo];

