/*Процедура для создания МЛ на отмену. Вызывается со SWAN. 
Входной параметр @NumMLRefuse - номер МЛ, который необходимо отменить
Действия :
Создается копия к  (МЛ с номером @NumMLRefuse), в поле Dop_A нового МЛ записывается фраза "Для отмены МЛ № @NumMLRefuse",
 тип МЛ (Новая, прекращение) исправляется на противоположный
Возвращает номер нового МЛ
*/

CREATE PROCEDURE [dbo].[MLRefuseIns] @NumMLRefuse int,@Utverzh_B datetime =NULL
AS
if (select sdan from List2Nav where NumML=@NumMLRefuse) is not null 
RAISERROR ('МЛ уже сдан!', 16, 1) WITH NOWAIT
declare @NumML int

--создаем копию отменяемого МЛ в OSNOVA
INSERT INTO [Osnova]
([Pre_Usluga], [Usluga], [Nom_Kan], 
[Zakazchik], [Manager], [Telefon], [Osnovanie],
[Kontakt_Ob], [Skorost], [Kol_vo_kan], [Klient],
[Srochnost], [Styk_A], [Styk_A1], [Status_StykA], 
[Line_PrivA], [Adres_A], [Kontakt_A], [Dop_A], [Styk_B], 
[Styk_B1], [Status_StykB], [Line_PrivB], [Adres_B], [Kontakt_B],
[Dop_B], [Utverzh_M], [Utverzh_B], [Pr_ULKS], [Pr_USP],
[Pr_UUK], [Pr_UPK], [Pr_USHKm], [Pr_USHKn], [Kodir_Usl], 
[Pr_Obr], [town1], [Street1], [Dom1], [Str1], [Kor1], [flow1], 
[romm1], [town2], [Street2], [Dom2], [Str2], [Kor2], [flow2], 
[romm2], [Otv_k_utv], [dateConfirmAct], [dateLotusAct],
[numberLotusAct], [signB1], [signB2], [signB3], [signI1], 
[signI2], [signI3], [signC1], [signC2], [signC3], [signD1],
[signD2], [signD3],[room_BC1],[room_BC2])
SELECT case when Pre_Usluga='Новая услуга' then 'Прекращение услуги'  else  'Новая услуга' end , --Pre_Usluga
 [Usluga], [Nom_Kan], 
[Zakazchik], [Manager], [Telefon], [Osnovanie],
[Kontakt_Ob], [Skorost], [Kol_vo_kan], [Klient],
[Srochnost], [Styk_A], [Styk_A1], [Status_StykA], 
[Line_PrivA], [Adres_A], [Kontakt_A], 
'Для отмены МЛ № '+LTrim(Str(@NumMLRefuse)), --Dop_A
[Styk_B], 
[Styk_B1], [Status_StykB], [Line_PrivB], [Adres_B], [Kontakt_B],
[Dop_B],
getdate(),-- [Utverzh_M]
@Utverzh_B, -- [Utverzh_B],
 [Pr_ULKS], [Pr_USP],
[Pr_UUK], [Pr_UPK], [Pr_USHKm], [Pr_USHKn], [Kodir_Usl], 
[Pr_Obr], [town1], [Street1], [Dom1], [Str1], [Kor1], [flow1], 
[romm1], [town2], [Street2], [Dom2], [Str2], [Kor2], [flow2], 
[romm2], [Otv_k_utv], [dateConfirmAct], [dateLotusAct],
[numberLotusAct], [signB1], [signB2], [signB3], [signI1], 
[signI2], [signI3], [signC1], [signC2], [signC3], [signD1],
[signD2], [signD3],[room_BC1],[room_BC2]
FROM [Osnova] where NumML=@NumMLRefuse

SET @NumML=ISNULL(SCOPE_IDENTITY(), 0)

IF (@@ERROR <>0) OR (@NumML = 0)
	begin	
	RAISERROR ('Невозможно создать МЛ. Обратитесь к администратору.', 16, 2) WITH NOWAIT
	RETURN -1
	end

-- №МЛ вернем в ComFlow для установления связи
RETURN @NumML