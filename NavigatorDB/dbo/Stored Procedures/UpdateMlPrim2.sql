
CREATE	PROCEDURE [dbo].[UpdateMlPrim2]
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
	@ACTIVE_NETTERM_NUM	int
AS
BEGIN TRAN

SET XACT_ABORT ON

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

SET XACT_ABORT OFF

COMMIT TRAN;
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
