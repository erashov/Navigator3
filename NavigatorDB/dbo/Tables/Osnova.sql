CREATE TABLE [dbo].[Osnova] (
    [NumML]           INT              IDENTITY (1, 1) NOT NULL,
    [Pre_Usluga]      NVARCHAR (25)    NULL,
    [Usluga]          NVARCHAR (125)   NULL,
    [Nom_Kan]         NVARCHAR (50)    NULL,
    [Zakazchik]       NVARCHAR (255)   NULL,
    [Manager]         NVARCHAR (30)    NULL,
    [Telefon]         NVARCHAR (11)    NULL,
    [Osnovanie]       NVARCHAR (255)   NULL,
    [Kontakt_Ob]      NVARCHAR (255)   NULL,
    [Skorost]         NVARCHAR (30)    NULL,
    [Kol_vo_kan]      NVARCHAR (50)    NULL,
    [Klient]          NVARCHAR (15)    NULL,
    [Srochnost]       NVARCHAR (21)    NULL,
    [Styk_A]          NVARCHAR (32)    NULL,
    [Styk_A1]         NVARCHAR (15)    NULL,
    [Status_StykA]    NVARCHAR (15)    NULL,
    [Line_PrivA]      NVARCHAR (50)    NULL,
    [Adres_A]         NVARCHAR (255)   NULL,
    [Kontakt_A]       NVARCHAR (255)   NULL,
    [Dop_A]           NVARCHAR (512)   NULL,
    [Styk_B]          NVARCHAR (32)    NULL,
    [Styk_B1]         NVARCHAR (15)    NULL,
    [Status_StykB]    NVARCHAR (15)    NULL,
    [Line_PrivB]      NVARCHAR (6)     NULL,
    [Adres_B]         NVARCHAR (255)   NULL,
    [Kontakt_B]       NVARCHAR (255)   NULL,
    [Dop_B]           NVARCHAR (512)   NULL,
    [Utverzh_M]       DATETIME         NULL,
    [Utverzh_B]       DATETIME         NULL,
    [Pr_ULKS]         BIT              CONSTRAINT [DF__Osnova__Pr_ULKS__690797E6] DEFAULT ((0)) NULL,
    [Pr_USP]          BIT              CONSTRAINT [DF__Osnova__Pr_USP__69FBBC1F] DEFAULT ((0)) NULL,
    [Pr_UUK]          BIT              CONSTRAINT [DF__Osnova__Pr_UUK__6AEFE058] DEFAULT ((0)) NULL,
    [Pr_UPK]          BIT              CONSTRAINT [DF__Osnova__Pr_UPK__6BE40491] DEFAULT ((0)) NULL,
    [Pr_USHKm]        BIT              CONSTRAINT [DF__Osnova__Pr_USHKm__6CD828CA] DEFAULT ((0)) NULL,
    [Pr_USHKn]        BIT              CONSTRAINT [DF__Osnova__Pr_USHKn__6DCC4D03] DEFAULT ((0)) NULL,
    [Kodir_Usl]       NVARCHAR (10)    NULL,
    [Pr_Obr]          BIT              CONSTRAINT [DF__Osnova__Pr_Obr__6EC0713C] DEFAULT ((1)) NULL,
    [town1]           NVARCHAR (150)   NULL,
    [Street1]         NVARCHAR (150)   NULL,
    [Dom1]            NVARCHAR (10)    NULL,
    [Str1]            NVARCHAR (120)   NULL,
    [Kor1]            NVARCHAR (120)   NULL,
    [flow1]           NVARCHAR (150)   NULL,
    [romm1]           NVARCHAR (150)   NULL,
    [town2]           NVARCHAR (150)   NULL,
    [Street2]         NVARCHAR (150)   NULL,
    [Dom2]            NVARCHAR (10)    NULL,
    [Str2]            NVARCHAR (120)   NULL,
    [Kor2]            NVARCHAR (120)   NULL,
    [flow2]           NVARCHAR (150)   NULL,
    [romm2]           NVARCHAR (150)   NULL,
    [Otv_k_utv]       NVARCHAR (250)   NULL,
    [rowguid]         UNIQUEIDENTIFIER CONSTRAINT [DF__Osnova__rowguid__4242D080] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [dateConfirmAct]  DATETIME         NULL,
    [dateLotusAct]    DATETIME         NULL,
    [numberLotusAct]  INT              NULL,
    [signB1]          BIT              NULL,
    [signB2]          BIT              NULL,
    [signB3]          BIT              NULL,
    [signI1]          INT              NULL,
    [signI2]          INT              NULL,
    [signI3]          INT              NULL,
    [signC1]          CHAR (100)       NULL,
    [signC2]          CHAR (1024)      NULL,
    [signC3]          CHAR (100)       NULL,
    [signD1]          DATETIME         NULL,
    [signD2]          DATETIME         NULL,
    [signD3]          DATETIME         NULL,
    [N_eto_StA]       INT              CONSTRAINT [DF_Osnova_N_eto_StA] DEFAULT ((0)) NULL,
    [N_eto_StB]       INT              CONSTRAINT [DF_Osnova_N_eto_StB] DEFAULT ((0)) NULL,
    [ParamStyk1]      NVARCHAR (25)    NULL,
    [ParamStyk2]      NVARCHAR (25)    NULL,
    [QoS]             NVARCHAR (25)    NULL,
    [List2TS]         DATETIME         NULL,
    [ETO_num]         INT              NULL,
    [LS_TU_num]       INT              NULL,
    [project_manager] NVARCHAR (30)    NULL,
    [SpecProject]     NVARCHAR (128)   NULL,
    [Adres_A_old]     NVARCHAR (255)   NULL,
    [Adres_B_old]     NVARCHAR (255)   NULL,
    [ChangeAddr]      NVARCHAR (128)   NULL,
    [AdresA_Old]      NVARCHAR (255)   NULL,
    [AdresB_Old]      NVARCHAR (255)   NULL,
    [BridgeId]        INT              NULL,
    [Marking]         NVARCHAR (255)   NULL,
    [BridgeId_B]      INT              NULL,
    [Marking_B]       NVARCHAR (255)   NULL,
    [call_back]       INT              NULL,
    [room_BC1]        NVARCHAR (255)   NULL,
    [room_BC2]        NVARCHAR (255)   NULL,
    CONSTRAINT [PK_Osnova] PRIMARY KEY CLUSTERED ([NumML] ASC)
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_Osnova_7_36911203__K1_2_3_5_6_18_25_29_77]
    ON [dbo].[Osnova]([NumML] ASC)
    INCLUDE([Pre_Usluga], [Usluga], [Zakazchik], [Manager], [Adres_A], [Adres_B], [Utverzh_B], [project_manager]);


GO
CREATE UNIQUE NONCLUSTERED INDEX [NUMML]
    ON [dbo].[Osnova]([NumML] ASC);


GO
CREATE NONCLUSTERED INDEX [_dta_index_Osnova_7_36911203__K78_1_2]
    ON [dbo].[Osnova]([SpecProject] ASC)
    INCLUDE([NumML], [Pre_Usluga]);


GO
CREATE NONCLUSTERED INDEX [_dta_index_Osnova_7_36911203__K29]
    ON [dbo].[Osnova]([Utverzh_B] ASC);


GO
CREATE NONCLUSTERED INDEX [Index_Pre_Usluga>]
    ON [dbo].[Osnova]([Pre_Usluga] ASC, [Usluga] ASC)
    INCLUDE([NumML], [Zakazchik], [Kontakt_Ob], [Adres_A], [Kontakt_A], [Adres_B], [Kontakt_B], [town1], [Street1], [Dom1], [Str1], [Kor1], [flow1], [romm1], [town2], [Street2], [Dom2], [Str2], [Kor2], [flow2], [romm2]);


GO
CREATE NONCLUSTERED INDEX [<DD>]
    ON [dbo].[Osnova]([Utverzh_M] ASC)
    INCLUDE([Dop_A], [Dop_B]);


GO
CREATE TRIGGER trig_OsnovaAddrChange ON dbo.Osnova 
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
			SELECT NumML,Adres_A,Adres_B,town1,Street1,Dom1,Str1,Kor1,flow1,romm1,town2,Street2,Dom2,Str2,Kor2,flow2,romm2 FROM inserted

GO
DISABLE TRIGGER [dbo].[trig_OsnovaAddrChange]
    ON [dbo].[Osnova];


GO
CREATE TRIGGER [OnInsertOsnova_MLHistory]
   ON  dbo.Osnova 
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @NumML int;
	select @NumML = NumML from inserted;

	INSERT INTO ML_History 
	(
		NumML, Step, StartTime, EndTime
	)
	VALUES
	(
		@NumML, 1, getdate(), getdate()
	)

	INSERT INTO ML_History 
	(
		NumML, Step, StartTime
	)
	VALUES
	(
		@NumML, 2, getdate()
	)
END

GO
DISABLE TRIGGER [dbo].[OnInsertOsnova_MLHistory]
    ON [dbo].[Osnova];

