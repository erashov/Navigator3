CREATE TABLE [dbo].[List2Nav] (
    [NumML]                 INT              CONSTRAINT [DF__List2Nav__NumML__412EB0B6] DEFAULT ((0)) NOT NULL,
    [Zakazhcik]             NVARCHAR (255)   NULL,
    [Usluga]                NVARCHAR (50)    NULL,
    [AdresA]                NVARCHAR (255)   NULL,
    [PrivA]                 NVARCHAR (50)    NULL,
    [AdresB]                NVARCHAR (255)   NULL,
    [PrivB]                 NVARCHAR (50)    NULL,
    [Otvetstv]              NVARCHAR (50)    NULL,
    [USP]                   NVARCHAR (50)    NULL,
    [E]                     NVARCHAR (50)    NULL,
    [S]                     NVARCHAR (50)    NULL,
    [V]                     NVARCHAR (50)    NULL,
    [T]                     NVARCHAR (50)    NULL,
    [P]                     NVARCHAR (50)    NULL,
    [I]                     NVARCHAR (50)    NULL,
    [R]                     NVARCHAR (50)    NULL,
    [SpecOb]                NVARCHAR (50)    NULL,
    [Sdan]                  DATETIME         NULL,
    [Probl]                 NVARCHAR (255)   NULL,
    [D_USP]                 DATETIME         NULL,
    [D_E]                   NVARCHAR (50)    NULL,
    [D_S]                   NVARCHAR (50)    NULL,
    [D_V]                   NVARCHAR (50)    NULL,
    [D_T]                   NVARCHAR (50)    NULL,
    [D_P]                   NVARCHAR (50)    NULL,
    [D_I]                   NVARCHAR (50)    NULL,
    [D_R]                   NVARCHAR (50)    NULL,
    [D_SpecOb]              NVARCHAR (50)    NULL,
    [utverzh]               DATETIME         NULL,
    [Srochnost]             NVARCHAR (50)    NULL,
    [Prim]                  NVARCHAR (255)   NULL,
    [DUP]                   DATETIME         NULL,
    [CSVA]                  NVARCHAR (50)    NULL,
    [CSVB]                  NVARCHAR (50)    NULL,
    [DCSV]                  DATETIME         NULL,
    [UDA]                   NVARCHAR (50)    NULL,
    [UDB]                   NVARCHAR (50)    NULL,
    [DKNV]                  DATETIME         NULL,
    [NMR]                   BIT              CONSTRAINT [DF__List2Nav__NMR__4222D4EF] DEFAULT ((0)) NULL,
    [DNMR]                  DATETIME         NULL,
    [ULKS]                  DATETIME         NULL,
    [OSS]                   DATETIME         NULL,
    [Problema1]             NVARCHAR (255)   NULL,
    [IDO]                   DATETIME         NULL,
    [NRUSP]                 BIT              CONSTRAINT [DF__List2Nav__NRUSP__4316F928] DEFAULT ((0)) NULL,
    [NRUSP1]                BIT              CONSTRAINT [DF__List2Nav__NRUSP1__440B1D61] DEFAULT ((0)) NULL,
    [D_USP1]                DATETIME         NULL,
    [MestoNah]              NVARCHAR (100)   NULL,
    [ProblML]               NVARCHAR (50)    NULL,
    [a]                     NVARCHAR (50)    NULL,
    [b]                     DATETIME         NULL,
    [c]                     DATETIME         NULL,
    [f1]                    NVARCHAR (50)    NULL,
    [Probl_Data]            NVARCHAR (50)    NULL,
    [G_A]                   BIT              CONSTRAINT [DF__List2Nav__G_A__45F365D3] DEFAULT ((0)) NULL,
    [G_B]                   BIT              CONSTRAINT [DF__List2Nav__G_B__46E78A0C] DEFAULT ((0)) NULL,
    [Data_Sost_A]           DATETIME         NULL,
    [Data_Sost_B]           DATETIME         NULL,
    [Data_Vypt_A]           DATETIME         NULL,
    [Data_Vypt_B]           DATETIME         NULL,
    [Ivanov_Gulka]          BIT              CONSTRAINT [DF__List2Nav__Ivanov__47DBAE45] DEFAULT ((0)) NULL,
    [NRUPK]                 BIT              CONSTRAINT [DF__List2Nav__NRUPK__48CFD27E] DEFAULT ((0)) NULL,
    [NRUPK1]                BIT              CONSTRAINT [DF__List2Nav__NRUPK1__49C3F6B7] DEFAULT ((0)) NULL,
    [D_UPK]                 DATETIME         NULL,
    [D_UPK1]                DATETIME         NULL,
    [data_UPK]              DATETIME         NULL,
    [data_UPK1]             DATETIME         NULL,
    [gul_erm]               BIT              CONSTRAINT [DF__List2Nav__gul_er__4AB81AF0] DEFAULT ((0)) NULL,
    [res1]                  NVARCHAR (250)   NULL,
    [ido1]                  NVARCHAR (250)   NULL,
    [ido2]                  NVARCHAR (250)   NULL,
    [GG_ULKS]               BIT              CONSTRAINT [DF__List2Nav__GG_ULK__4BAC3F29] DEFAULT ((0)) NULL,
    [GG_Data]               DATETIME         NULL,
    [GG_Comment]            NVARCHAR (250)   NULL,
    [GG_IDO]                BIT              CONSTRAINT [DF__List2Nav__GG_IDO__4CA06362] DEFAULT ((0)) NULL,
    [rowguid]               UNIQUEIDENTIFIER CONSTRAINT [DF__List2Nav__rowgui__6497E884] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [signB1]                BIT              CONSTRAINT [DF_List2Nav_signB1] DEFAULT ((0)) NULL,
    [signB2]                BIT              CONSTRAINT [DF_List2Nav_signB2] DEFAULT ((0)) NULL,
    [signB3]                BIT              CONSTRAINT [DF_List2Nav_signB3] DEFAULT ((0)) NULL,
    [signI1]                INT              NULL,
    [signI2]                INT              NULL,
    [signI3]                INT              NULL,
    [signC1]                CHAR (100)       NULL,
    [signC2]                CHAR (1024)      NULL,
    [signC3]                CHAR (500)       NULL,
    [signD1]                DATETIME         NULL,
    [signD2]                DATETIME         NULL,
    [signD3]                DATETIME         NULL,
    [statusML]              INT              NULL,
    [equpments]             TEXT             NULL,
    [taskFOConnection]      DATETIME         NULL,
    [reportFOConnection]    DATETIME         NULL,
    [N_eto_StA]             INT              CONSTRAINT [DF_List2Nav_N_eto_StA] DEFAULT ((0)) NULL,
    [N_eto_StB]             INT              CONSTRAINT [DF_List2Nav_N_eto_StB] DEFAULT ((0)) NULL,
    [res1_d]                NUMERIC (18, 2)  NULL,
    [res2_d]                NUMERIC (18)     NULL,
    [Q]                     NVARCHAR (50)    NULL,
    [D_Q]                   NVARCHAR (50)    NULL,
    [Sdan_TS]               DATETIME         NULL,
    [NR_UVK]                BIT              CONSTRAINT [DF_List2Nav_NR_UVK] DEFAULT ((0)) NULL,
    [D_UVK]                 DATETIME         NULL,
    [NR_USHTU]              BIT              CONSTRAINT [DF_List2Nav_NR_USHTU] DEFAULT ((0)) NULL,
    [D_USHTU]               DATETIME         NULL,
    [NR_USHTU_TF]           BIT              CONSTRAINT [DF_List2Nav_NR_USHTU_TF] DEFAULT ((0)) NULL,
    [D_USHTU_TF]            DATETIME         NULL,
    [LS_TU_num]             INT              NULL,
    [ETO_num]               INT              NULL,
    [NR_UIIAS]              BIT              CONSTRAINT [DF_List2Nav_NR_UIIAS] DEFAULT ((0)) NULL,
    [D_UIIAS]               DATETIME         NULL,
    [N]                     NVARCHAR (50)    NULL,
    [D_N]                   NVARCHAR (50)    NULL,
    [D_USHTU_Sost]          DATETIME         NULL,
    [D_UIIAS_Sost]          DATETIME         NULL,
    [D_USHTU_TF_Sost]       DATETIME         NULL,
    [L]                     NVARCHAR (50)    NULL,
    [D_L]                   NVARCHAR (50)    NULL,
    [fe]                    NVARCHAR (50)    NULL,
    [D_fe]                  NVARCHAR (50)    NULL,
    [NDogov]                NVARCHAR (255)   NULL,
    [NTelef]                NVARCHAR (2048)  NULL,
    [project_manager]       NVARCHAR (30)    NULL,
    [SpecProject]           NVARCHAR (128)   NULL,
    [PortMMTSNum]           VARCHAR (96)     NULL,
    [delivEquipment]        BIT              CONSTRAINT [DF_List2Nav_delivEquipment] DEFAULT ((0)) NULL,
    [CMT_USHTU_TF]          NVARCHAR (128)   NULL,
    [NR_Region]             BIT              CONSTRAINT [DF_List2Nav_NR_Region] DEFAULT ((0)) NULL,
    [D_Region]              DATETIME         NULL,
    [D_Region_Sost]         DATETIME         NULL,
    [CR]                    NVARCHAR (50)    NULL,
    [D_CR]                  NVARCHAR (50)    NULL,
    [Sroch_USHTU]           BIT              CONSTRAINT [DF_List2Nav_Sroch_USHTU] DEFAULT ((0)) NULL,
    [D_Priv]                DATETIME         NULL,
    [Skorost]               NVARCHAR (30)    NULL,
    [Styk_A]                NVARCHAR (32)    NULL,
    [Styk_B]                NVARCHAR (32)    NULL,
    [Dop_A]                 NVARCHAR (512)   NULL,
    [Dop_B]                 NVARCHAR (512)   NULL,
    [SZ_Date]               DATETIME         NULL,
    [Sroch_SZ]              NVARCHAR (250)   NULL,
    [ChangeAddr]            NVARCHAR (128)   NULL,
    [AdresB_Old]            NVARCHAR (255)   NULL,
    [AdresA_Old]            NVARCHAR (255)   NULL,
    [QC]                    NVARCHAR (50)    NULL,
    [D_QC]                  NVARCHAR (50)    NULL,
    [Line_PrivA]            NVARCHAR (50)    NULL,
    [ContractSO]            NVARCHAR (255)   NULL,
    [OrderNumSO]            NVARCHAR (255)   NULL,
    [SONum]                 NVARCHAR (50)    NULL,
    [DateSONum]             DATETIME         NULL,
    [Operator]              NVARCHAR (128)   NULL,
    [RemoveShleifSO]        DATETIME         NULL,
    [IdMLGroup]             INT              NULL,
    [MLGroupMembers]        NVARCHAR (255)   NULL,
    [IsFreezeMLGroupMember] BIT              NULL,
    [StartDateOPKR]         DATETIME         NULL,
    [EndDateOPKR]           DATETIME         NULL,
    [ReturnedFromUSP]       BIT              NULL,
    [BridgeId]              INT              NULL,
    [Marking]               NVARCHAR (255)   NULL,
    [BridgeId_B]            INT              NULL,
    [Marking_B]             NVARCHAR (255)   NULL,
    [FactDateUSP_A]         DATETIME         NULL,
    [FactDateUSP_B]         DATETIME         NULL,
    [Klient]                NVARCHAR (15)    NULL,
    [signD4]                DATETIME         NULL,
    [signC4]                CHAR (1024)      NULL,
    [signI4]                INT              NULL,
    [test_res_a]            NVARCHAR (500)   NULL,
    [test_date_a]           DATETIME         NULL,
    [test_res_b]            NVARCHAR (500)   NULL,
    [test_date_b]           DATETIME         NULL,
    [HasTasks]              BIT              DEFAULT ((0)) NOT NULL,
    CONSTRAINT [pk_list2nav] PRIMARY KEY CLUSTERED ([NumML] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Index_NumML]
    ON [dbo].[List2Nav]([NumML] ASC) WITH (PAD_INDEX = ON, IGNORE_DUP_KEY = ON);


GO
CREATE NONCLUSTERED INDEX [Index_Prob_Num]
    ON [dbo].[List2Nav]([ProblML] ASC, [NumML] ASC)
    INCLUDE([Usluga], [P], [D_USHTU_TF_Sost]);


GO
CREATE NONCLUSTERED INDEX [Index_Usluga]
    ON [dbo].[List2Nav]([ProblML] ASC, [NumML] ASC)
    INCLUDE([Usluga], [D_USP], [NRUSP], [NRUSP1], [D_USP1], [b], [c]);


GO
CREATE NONCLUSTERED INDEX [Index_ProblML]
    ON [dbo].[List2Nav]([ProblML] ASC, [NumML] ASC)
    INCLUDE([Zakazhcik], [Usluga], [Otvetstv], [c]);


GO
CREATE NONCLUSTERED INDEX [Index_PN]
    ON [dbo].[List2Nav]([ProblML] ASC, [NumML] ASC)
    INCLUDE([Zakazhcik], [Usluga], [AdresA], [PrivA], [AdresB], [PrivB], [Otvetstv], [USP], [E], [S], [V], [T], [P], [I], [R], [SpecOb], [Sdan], [Probl], [D_USP], [D_E], [D_S], [D_V], [D_T], [D_P], [D_I], [D_R], [D_SpecOb], [utverzh], [Srochnost], [Prim], [DUP], [DCSV], [UDA], [UDB], [NMR], [OSS], [IDO], [NRUSP], [NRUSP1], [D_USP1], [MestoNah], [b], [c], [f1], [Probl_Data], [G_A], [G_B], [Data_Sost_A], [Data_Sost_B], [Data_Vypt_A], [Data_Vypt_B], [Ivanov_Gulka], [NRUPK], [D_UPK], [signB1], [signI1], [signC3], [signD1], [signD2], [taskFOConnection], [res1_d], [Sdan_TS], [D_UVK], [fe], [D_fe], [SpecProject], [Sroch_SZ]);


GO
CREATE NONCLUSTERED INDEX [Index_Zakazhcik]
    ON [dbo].[List2Nav]([ProblML] ASC, [NumML] ASC)
    INCLUDE([Zakazhcik], [Usluga], [AdresA], [PrivA], [AdresB], [PrivB], [Otvetstv], [USP], [E], [S], [V], [T], [P], [I], [R], [SpecOb], [Sdan], [Probl], [D_USP], [D_E], [D_S], [D_V], [D_T], [D_P], [D_I], [D_R], [D_SpecOb], [utverzh], [Srochnost], [Prim], [DUP], [UDA], [UDB], [IDO], [NRUSP], [NRUSP1], [D_USP1], [MestoNah], [b], [c], [Probl_Data], [G_A], [G_B], [Data_Sost_A], [Data_Sost_B], [Data_Vypt_A], [Data_Vypt_B], [NRUPK], [NRUPK1], [D_UPK], [D_UPK1], [data_UPK], [data_UPK1], [signB1], [signB3], [signD1], [signD2], [signD3], [Q], [D_Q], [Sdan_TS], [NR_USHTU], [D_USHTU], [NR_USHTU_TF], [D_USHTU_TF], [D_UIIAS], [D_USHTU_Sost], [D_UIIAS_Sost], [D_USHTU_TF_Sost], [Skorost], [Styk_A], [Styk_B], [Sroch_SZ], [QC], [D_QC]);


GO
CREATE NONCLUSTERED INDEX [Index_Z]
    ON [dbo].[List2Nav]([ProblML] ASC, [NumML] ASC)
    INCLUDE([Zakazhcik], [Usluga], [AdresA], [PrivA], [AdresB], [PrivB], [Otvetstv], [USP], [E], [S], [V], [T], [P], [I], [R], [SpecOb], [Sdan], [Probl], [D_USP], [D_E], [D_S], [D_V], [D_T], [D_P], [D_I], [D_R], [D_SpecOb], [utverzh], [Srochnost], [Prim], [DUP], [DCSV], [UDA], [UDB], [OSS], [IDO], [NRUSP], [NRUSP1], [D_USP1], [MestoNah], [b], [c], [Probl_Data], [G_A], [G_B], [Data_Sost_A], [Data_Sost_B], [Data_Vypt_A], [Data_Vypt_B], [NRUPK], [NRUPK1], [D_UPK], [D_UPK1], [data_UPK], [data_UPK1], [signB1], [signB3], [signC2], [signC3], [signD1], [signD2], [signD3], [taskFOConnection], [Q], [D_Q], [Sdan_TS], [D_UVK], [NR_USHTU], [D_USHTU], [NR_USHTU_TF], [D_USHTU_TF], [D_UIIAS], [D_USHTU_Sost], [D_UIIAS_Sost], [D_USHTU_TF_Sost], [SpecProject], [CMT_USHTU_TF], [NR_Region], [D_Region], [D_Region_Sost], [CR], [D_CR], [Sroch_USHTU], [Skorost], [Styk_A], [Styk_B], [Dop_A], [Dop_B], [Sroch_SZ], [Line_PrivA]);


GO
CREATE NONCLUSTERED INDEX [Index_Sdan]
    ON [dbo].[List2Nav]([Sdan] ASC, [ProblML] ASC, [NumML] ASC, [Usluga] ASC);


GO
CREATE NONCLUSTERED INDEX [Index_SN]
    ON [dbo].[List2Nav]([Sdan] ASC, [NumML] ASC)
    INCLUDE([Zakazhcik], [SpecOb], [Probl]);


GO
CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
    ON [dbo].[List2Nav]([ProblML] ASC, [NumML] ASC)
    INCLUDE([Zakazhcik], [Usluga], [AdresA], [PrivA], [AdresB], [PrivB], [Otvetstv], [USP], [E], [S], [V], [T], [P], [I], [R], [SpecOb], [Sdan], [Probl], [D_USP], [D_E], [D_S], [D_V], [D_T], [D_P], [D_I], [D_R], [D_SpecOb], [utverzh], [Srochnost], [Prim], [DUP], [DCSV], [UDA], [UDB], [NMR], [OSS], [IDO], [NRUSP], [NRUSP1], [D_USP1], [MestoNah], [b], [c], [f1], [Probl_Data], [G_A], [G_B], [Data_Sost_A], [Data_Sost_B], [Data_Vypt_A], [Data_Vypt_B], [Ivanov_Gulka], [NRUPK], [D_UPK], [signB1], [signI1], [signD1], [signD2], [taskFOConnection], [res1_d], [Sdan_TS], [D_UVK], [fe], [D_fe], [SpecProject], [delivEquipment], [Sroch_SZ], [FactDateUSP_A], [FactDateUSP_B]);


GO
CREATE NONCLUSTERED INDEX [<123>]
    ON [dbo].[List2Nav]([Sdan] ASC, [DUP] ASC, [IDO] ASC, [ProblML] ASC, [taskFOConnection] ASC, [NumML] ASC, [Usluga] ASC);


GO
CREATE STATISTICS [_dta_stat_943342425_6_53]
    ON [dbo].[List2Nav]([AdresB], [ProblML]);


GO
CREATE STATISTICS [_dta_stat_943342425_4_53]
    ON [dbo].[List2Nav]([AdresA], [ProblML]);


GO
CREATE STATISTICS [_dta_stat_943342425_87_1]
    ON [dbo].[List2Nav]([signB3], [NumML]);


GO
CREATE STATISTICS [_dta_stat_943342425_1_53_10]
    ON [dbo].[List2Nav]([NumML], [ProblML], [E]);


GO
CREATE STATISTICS [_dta_stat_943342425_1_53_80]
    ON [dbo].[List2Nav]([NumML], [ProblML], [GG_ULKS]);


GO
CREATE STATISTICS [_dta_stat_943342425_4_1_18]
    ON [dbo].[List2Nav]([AdresA], [NumML], [Sdan]);


GO
CREATE STATISTICS [_dta_stat_943342425_1_2_3]
    ON [dbo].[List2Nav]([NumML], [Zakazhcik], [Usluga]);


GO
CREATE STATISTICS [_dta_stat_943342425_1_53_17]
    ON [dbo].[List2Nav]([NumML], [ProblML], [SpecOb]);


GO
CREATE STATISTICS [_dta_stat_943342425_62_1_3]
    ON [dbo].[List2Nav]([G_A], [NumML], [Usluga]);


GO
CREATE STATISTICS [_dta_stat_943342425_1_53_12]
    ON [dbo].[List2Nav]([NumML], [ProblML], [V]);


GO
CREATE STATISTICS [_dta_stat_943342425_6_1_53]
    ON [dbo].[List2Nav]([AdresB], [NumML], [ProblML]);


GO
CREATE STATISTICS [_dta_stat_943342425_1_53_29]
    ON [dbo].[List2Nav]([NumML], [ProblML], [utverzh]);


GO
CREATE STATISTICS [_dta_stat_943342425_4_1_53]
    ON [dbo].[List2Nav]([AdresA], [NumML], [ProblML]);


GO
CREATE STATISTICS [_dta_stat_943342425_4_1_3]
    ON [dbo].[List2Nav]([AdresA], [NumML], [Usluga]);


GO
CREATE STATISTICS [_dta_stat_943342425_29_53_1_10]
    ON [dbo].[List2Nav]([utverzh], [ProblML], [NumML], [E]);


GO
CREATE STATISTICS [_dta_stat_943342425_14_1_53_13]
    ON [dbo].[List2Nav]([P], [NumML], [ProblML], [T]);


GO
CREATE STATISTICS [_dta_stat_943342425_1_53_4_3]
    ON [dbo].[List2Nav]([NumML], [ProblML], [AdresA], [Usluga]);


GO
CREATE STATISTICS [_dta_stat_943342425_3_1_32_47]
    ON [dbo].[List2Nav]([Usluga], [NumML], [DUP], [IDO]);


GO
CREATE STATISTICS [_dta_stat_943342425_13_1_10_11]
    ON [dbo].[List2Nav]([T], [NumML], [E], [S]);


GO
CREATE STATISTICS [_dta_stat_943342425_1_3_53_29]
    ON [dbo].[List2Nav]([NumML], [Usluga], [ProblML], [utverzh]);


GO
CREATE STATISTICS [_dta_stat_943342425_1_18_53_19]
    ON [dbo].[List2Nav]([NumML], [Sdan], [ProblML], [Probl]);


GO
CREATE STATISTICS [_dta_stat_943342425_3_1_53_62]
    ON [dbo].[List2Nav]([Usluga], [NumML], [ProblML], [G_A]);


GO
CREATE STATISTICS [_dta_stat_943342425_1_18_107_53]
    ON [dbo].[List2Nav]([NumML], [Sdan], [Sdan_TS], [ProblML]);


GO
CREATE STATISTICS [_dta_stat_943342425_6_1_3_53]
    ON [dbo].[List2Nav]([AdresB], [NumML], [Usluga], [ProblML]);


GO
CREATE STATISTICS [_dta_stat_943342425_53_1_4_18]
    ON [dbo].[List2Nav]([ProblML], [NumML], [AdresA], [Sdan]);


GO
CREATE STATISTICS [_dta_stat_943342425_63_1_3_53]
    ON [dbo].[List2Nav]([G_B], [NumML], [Usluga], [ProblML]);


GO
CREATE STATISTICS [_dta_stat_943342425_49_1_53_3_48]
    ON [dbo].[List2Nav]([NRUSP1], [NumML], [ProblML], [Usluga], [NRUSP]);


GO
CREATE STATISTICS [_dta_stat_943342425_3_1_18_107_53]
    ON [dbo].[List2Nav]([Usluga], [NumML], [Sdan], [Sdan_TS], [ProblML]);


GO
CREATE STATISTICS [_dta_stat_943342425_11_1_53_13_10]
    ON [dbo].[List2Nav]([S], [NumML], [ProblML], [T], [E]);


GO
CREATE STATISTICS [_dta_stat_943342425_48_1_53_3_36]
    ON [dbo].[List2Nav]([NRUSP], [NumML], [ProblML], [Usluga], [UDA]);


GO
CREATE STATISTICS [_dta_stat_943342425_14_1_10_11_12]
    ON [dbo].[List2Nav]([P], [NumML], [E], [S], [V]);


GO
CREATE STATISTICS [_dta_stat_943342425_64_53_1_3_4]
    ON [dbo].[List2Nav]([Data_Sost_A], [ProblML], [NumML], [Usluga], [AdresA]);


GO
CREATE STATISTICS [_dta_stat_943342425_14_1_13_10_11]
    ON [dbo].[List2Nav]([P], [NumML], [T], [E], [S]);


GO
CREATE STATISTICS [_dta_stat_943342425_6_1_18_53_3]
    ON [dbo].[List2Nav]([AdresB], [NumML], [Sdan], [ProblML], [Usluga]);


GO
CREATE STATISTICS [_dta_stat_943342425_1_18_3_53_75]
    ON [dbo].[List2Nav]([NumML], [Sdan], [Usluga], [ProblML], [gul_erm]);


GO
CREATE STATISTICS [_dta_stat_943342425_53_1_18_3_32]
    ON [dbo].[List2Nav]([ProblML], [NumML], [Sdan], [Usluga], [DUP]);


GO
CREATE STATISTICS [_dta_stat_943342425_15_1_53_13_10_14]
    ON [dbo].[List2Nav]([I], [NumML], [ProblML], [T], [E], [P]);


GO
CREATE STATISTICS [_dta_stat_943342425_53_1_63_62_3_67]
    ON [dbo].[List2Nav]([ProblML], [NumML], [G_B], [G_A], [Usluga], [Data_Vypt_B]);


GO
CREATE STATISTICS [_dta_stat_943342425_15_1_13_10_14_11]
    ON [dbo].[List2Nav]([I], [NumML], [T], [E], [P], [S]);


GO
CREATE STATISTICS [_dta_stat_943342425_53_1_3_29_5_7]
    ON [dbo].[List2Nav]([ProblML], [NumML], [Usluga], [utverzh], [PrivA], [PrivB]);


GO
CREATE STATISTICS [_dta_stat_943342425_20_1_53_3_36_37]
    ON [dbo].[List2Nav]([D_USP], [NumML], [ProblML], [Usluga], [UDA], [UDB]);


GO
CREATE STATISTICS [_dta_stat_943342425_1_53_49_48_50_20]
    ON [dbo].[List2Nav]([NumML], [ProblML], [NRUSP1], [NRUSP], [D_USP1], [D_USP]);


GO
CREATE STATISTICS [_dta_stat_943342425_67_1_3_53_62_66]
    ON [dbo].[List2Nav]([Data_Vypt_B], [NumML], [Usluga], [ProblML], [G_A], [Data_Vypt_A]);


GO
CREATE STATISTICS [_dta_stat_943342425_66_1_18_3_53_75]
    ON [dbo].[List2Nav]([Data_Vypt_A], [NumML], [Sdan], [Usluga], [ProblML], [gul_erm]);


GO
CREATE STATISTICS [_dta_stat_943342425_50_1_53_3_48_20]
    ON [dbo].[List2Nav]([D_USP1], [NumML], [ProblML], [Usluga], [NRUSP], [D_USP]);


GO
CREATE STATISTICS [_dta_stat_943342425_16_1_10_11_12_13]
    ON [dbo].[List2Nav]([R], [NumML], [E], [S], [V], [T]);


GO
CREATE STATISTICS [_dta_stat_943342425_15_1_10_11_12_13]
    ON [dbo].[List2Nav]([I], [NumML], [E], [S], [V], [T]);


GO
CREATE STATISTICS [_dta_stat_943342425_1_32_47_18_3_53]
    ON [dbo].[List2Nav]([NumML], [DUP], [IDO], [Sdan], [Usluga], [ProblML]);


GO
CREATE STATISTICS [_dta_stat_943342425_12_1_53_13_10_14_11]
    ON [dbo].[List2Nav]([V], [NumML], [ProblML], [T], [E], [P], [S]);


GO
CREATE STATISTICS [_dta_stat_943342425_16_1_13_10_14_11_15]
    ON [dbo].[List2Nav]([R], [NumML], [T], [E], [P], [S], [I]);


GO
CREATE STATISTICS [_dta_stat_943342425_3_1_53_48_20_49_50]
    ON [dbo].[List2Nav]([Usluga], [NumML], [ProblML], [NRUSP], [D_USP], [NRUSP1], [D_USP1]);


GO
CREATE STATISTICS [_dta_stat_943342425_49_1_53_3_36_37_48]
    ON [dbo].[List2Nav]([NRUSP1], [NumML], [ProblML], [Usluga], [UDA], [UDB], [NRUSP]);


GO
CREATE STATISTICS [_dta_stat_943342425_62_1_18_3_53_75_66]
    ON [dbo].[List2Nav]([G_A], [NumML], [Sdan], [Usluga], [ProblML], [gul_erm], [Data_Vypt_A]);


GO
CREATE STATISTICS [_dta_stat_943342425_66_1_3_53_62_63_67]
    ON [dbo].[List2Nav]([Data_Vypt_A], [NumML], [Usluga], [ProblML], [G_A], [G_B], [Data_Vypt_B]);


GO
CREATE STATISTICS [_dta_stat_943342425_16_1_53_13_10_14_11_15]
    ON [dbo].[List2Nav]([R], [NumML], [ProblML], [T], [E], [P], [S], [I]);


GO
CREATE STATISTICS [_dta_stat_943342425_17_1_10_11_12_13_14_15]
    ON [dbo].[List2Nav]([SpecOb], [NumML], [E], [S], [V], [T], [P], [I]);


GO
CREATE STATISTICS [_dta_stat_943342425_11_1_10_12_13_14_15_16]
    ON [dbo].[List2Nav]([S], [NumML], [E], [V], [T], [P], [I], [R]);


GO
CREATE STATISTICS [_dta_stat_943342425_53_1_49_48_50_20_3_36]
    ON [dbo].[List2Nav]([ProblML], [NumML], [NRUSP1], [NRUSP], [D_USP1], [D_USP], [Usluga], [UDA]);


GO
CREATE STATISTICS [_dta_stat_943342425_67_1_18_3_53_75_62_66]
    ON [dbo].[List2Nav]([Data_Vypt_B], [NumML], [Sdan], [Usluga], [ProblML], [gul_erm], [G_A], [Data_Vypt_A]);


GO
CREATE STATISTICS [_dta_stat_943342425_1_53_63_62_18_3_67_66]
    ON [dbo].[List2Nav]([NumML], [ProblML], [G_B], [G_A], [Sdan], [Usluga], [Data_Vypt_B], [Data_Vypt_A]);


GO
CREATE STATISTICS [_dta_stat_943342425_50_1_53_3_36_37_48_20]
    ON [dbo].[List2Nav]([D_USP1], [NumML], [ProblML], [Usluga], [UDA], [UDB], [NRUSP], [D_USP]);


GO
CREATE STATISTICS [_dta_stat_943342425_1_53_13_10_14_11_15_12_16]
    ON [dbo].[List2Nav]([NumML], [ProblML], [T], [E], [P], [S], [I], [V], [R]);


GO
CREATE STATISTICS [_dta_stat_943342425_64_53_1_62_63_75_18_3_66]
    ON [dbo].[List2Nav]([Data_Sost_A], [ProblML], [NumML], [G_A], [G_B], [gul_erm], [Sdan], [Usluga], [Data_Vypt_A]);


GO
CREATE STATISTICS [_dta_stat_943342425_10_11_12_13_14_15_16_17_1]
    ON [dbo].[List2Nav]([E], [S], [V], [T], [P], [I], [R], [SpecOb], [NumML]);


GO
CREATE STATISTICS [_dta_stat_943342425_53_1_12_16_10_13_14_11_17]
    ON [dbo].[List2Nav]([ProblML], [NumML], [V], [R], [E], [T], [P], [S], [SpecOb]);


GO
CREATE STATISTICS [_dta_stat_943342425_17_1_53_13_10_14_11_15_12]
    ON [dbo].[List2Nav]([SpecOb], [NumML], [ProblML], [T], [E], [P], [S], [I], [V]);


GO
CREATE STATISTICS [_dta_stat_943342425_1_53_3_36_37_48_20_49_50]
    ON [dbo].[List2Nav]([NumML], [ProblML], [Usluga], [UDA], [UDB], [NRUSP], [D_USP], [NRUSP1], [D_USP1]);


GO
CREATE STATISTICS [_dta_stat_943342425_63_1_18_3_53_75_62_66_67_64]
    ON [dbo].[List2Nav]([G_B], [NumML], [Sdan], [Usluga], [ProblML], [gul_erm], [G_A], [Data_Vypt_A], [Data_Vypt_B], [Data_Sost_A]);


GO



CREATE trigger [dbo].[OnInsertList2Nav_to_ServiceML] on [Navigator_test_dev].[dbo].[List2Nav] after insert
as
DECLARE @numML_insert int
DECLARE my_Cursor CURSOR FOR SELECT distinct NumML FROM INSERTED 
OPEN my_Cursor
FETCH NEXT FROM my_Cursor into @numML_insert
WHILE @@FETCH_STATUS = 0 and (@numML_insert >0)
BEGIN ;
  --PRINT 'Inserting '+ cast(@numML_insert as varchar(32));
  
 insert into ServiceML (ID, TheServiceId, NavigatorId, NumML, sCode, NumServ, SpecobA, SpecobB, NumChA, NumChB)
 select ROW_NUMBER() over(ORDER BY t.NumML ASC) as id, 
 t.TheServiceId, t.NavigatorId, t.NumML, t.sCode, t.NumServ, 
       case when lower(isnull(t.specob, t.NumCh)) like '% %' 
            then replace(replace(lower(left(replace(isnull(t.specob, t.NumCh), ',', ' '), charindex (' ', replace(isnull(t.specob, t.NumCh), ',', ' '))-1)),'x', ''), 'х', '')  
			when isnull(t.specob, t.NumCh) like '%x%'
			then replace(replace(lower(left (isnull(t.specob, t.NumCh), charindex ('x', isnull(t.specob, t.NumCh)))),'x', ''), 'х', '')
			when lower(isnull(t.specob, t.NumChAct)) like '%,%'
			then lower(left(isnull(t.specob, t.NumCh), charindex (',', isnull(t.specob, t.NumCh))-1))
			else cast (lower(isnull(t.specob, t.NumCh)) as  nvarchar (50)) end as SpecobA, 
       case when lower(isnull(t.specob, t.NumCh)) like '% %' 
            then  replace(replace(ltrim(rtrim(lower(right(replace(isnull(t.specob, t.NumCh), ',', ' '), len(ltrim(rtrim(replace(isnull(t.specob, t.NumCh), ',', ' ')))) - charindex (' ', replace(replace(ltrim(rtrim(isnull(t.specob, t.NumCh))),'x', ''), 'х', '')))))),'x', ''), 'х', '')
			when isnull(t.specob, t.NumCh) like '%x%' then  replace(replace(ltrim(rtrim(lower(right(isnull(t.specob, t.NumCh), len(ltrim(rtrim(isnull(t.specob, t.NumCh))))- charindex ('x', ltrim(rtrim(isnull(t.specob, t.NumCh)))))))),'x', ''), 'х', '')
			when lower(isnull(t.specob, t.NumCh)) like '%,%'
            then lower(right(isnull(t.specob, t.NumCh), len(ltrim(rtrim(isnull(t.specob, t.NumCh)))) - charindex (',', ltrim(rtrim(isnull(t.specob, t.NumCh))))))
			else null end as SpecobB,
       case when lower(isnull(t.specob, t.NumChAct)) like '% %' 
            then lower(left(replace(isnull(t.specob, t.NumChAct), ',', ' '), charindex (' ', replace(isnull(t.specob, t.NumChAct), ',', ' '))-1))
			when lower(isnull(t.specob, t.NumChAct)) like '%x%' or  lower(isnull(t.specob, t.NumChAct)) like '%х%'
            then lower(left(replace(isnull(t.specob, t.NumChAct), 'х', 'x'), charindex ('x', replace(isnull(t.specob, t.NumChAct), 'х', 'x'))))
            when lower(isnull(t.specob, t.NumChAct)) like '%,%'
            then lower(left(isnull(t.specob, t.NumChAct), charindex (',', isnull(t.specob, t.NumChAct))-1))
			else cast (lower(isnull(t.specob, t.NumChAct)) as  nvarchar (50)) end as NumChA, 
       case when   lower(isnull(t.specob, t.NumChAct)) like '% %' 
            then lower(right(replace(isnull(t.specob, t.NumChAct), ',', ' '), len(ltrim(rtrim(replace(isnull(t.specob, t.NumChAct), ',', ' ')))) - charindex (' ', replace(ltrim(rtrim(isnull(t.specob, t.NumChAct))), ',', ' '))))
			when lower(isnull(t.specob, t.NumChAct)) like '%,%'
            then lower(right(isnull(t.specob, t.NumChAct), len(ltrim(rtrim(isnull(t.specob, t.NumChAct)))) - charindex (',', ltrim(rtrim(isnull(t.specob, t.NumChAct))))))
			when (lower(isnull(t.specob, t.NumChAct)) like '%x%' or  lower(isnull(t.specob, t.NumChAct)) like '%х%') and len(ltrim(rtrim(isnull(t.specob, t.NumChAct))))!=charindex ('x', replace(isnull(t.specob, t.NumChAct), 'х', 'x'))
            then lower(right(replace(isnull(t.specob, t.NumChAct), 'х', 'x'),  len(ltrim(rtrim(isnull(t.specob, t.NumChAct)))) - charindex ('x', replace(ltrim(rtrim(isnull(t.specob, t.NumChAct))), 'х', 'x')) ))
            else null end as NumChB  			       
	   from
       (
       select 
       s.Id as TheServiceId, 
       s.NavigatorId as NavigatorId, 
       nl.NumML as NumML, 
       lower(s.sCode) as sCode, 
       isnull(replace(replace(rtrim(ltrim(case 
				when lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' 
				then cast (isnull(lower(p), lower(i)) as varchar(50))
				when lower(nl.[Usluga]) not like '%b%' and lower(nl.[Usluga]) not like '%a%' and lower(nl.[Usluga]) not like '%p%' and 
				lower(nl.[Usluga]) not like '%i%' and lower(nl.[Usluga]) not like '%g%'  and lower(nl.[Usluga]) not like '%nф%' and lower(nl.[Usluga]) like '%e%' 
				then cast (lower(e) as varchar (50))
				when lower(nl.[Usluga]) not like '%b%' and lower(nl.[Usluga]) not like '%a%' and lower(nl.[Usluga]) not like '%p%'  and 
				lower(nl.[Usluga]) not like '%i%' and lower(nl.[Usluga]) not like '%g%'  and lower(nl.[Usluga]) not like '%nф%' and lower(nl.[Usluga]) like '%s%' 
				then cast (lower(s) as varchar (50))
				when lower(nl.[Usluga]) not like '%b%' and lower(nl.[Usluga]) not like '%a%' and lower(nl.[Usluga]) not like '%p%' and lower(nl.[Usluga]) not like '%g%' and 
				(lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(i) as varchar (50))
				when lower(nl.[Usluga]) like '%l%' 
				then cast (lower(l) as varchar (50))
				when lower(nl.[Usluga]) like '%v%' 
				then cast (lower(v) as varchar (50))
				when lower(nl.[Usluga]) like '%p%' 
				then cast (lower(p) as varchar (50))
				when lower(nl.[Usluga]) like '%t%' 
				then cast (lower(t) as varchar (50))                        
				when lower(nl.[Usluga]) like '%k%' 
				then cast (lower(specob) as varchar (50))
				when lower(nl.[Usluga]) like '%nф%' 
				then cast (lower(n) as varchar (50))
				when lower(nl.[Usluga]) like '%o%' 
				then cast (lower(t) as varchar (50))
				when lower(nl.[Usluga]) like '%s%' 
				then cast (lower(s) as varchar (50))
				when lower(nl.[Usluga]) like '%e%' 
				then cast (lower(e) as varchar (50))
				else 'not' end)), 'x', ''), 'х', ''), 'not') as NumServ,
				 
				isnull(replace(replace(replace(rtrim(ltrim(case 
				when lower(nl.[Usluga]) like '%v%' 
				then cast (lower(p) as varchar (50))
				when lower(nl.[Usluga]) like '%t%' 
				then cast (lower(t) as varchar (50))                        
				when lower(nl.[Usluga]) like '%k%' 
				then cast (lower(specob) as varchar (50))
				when lower(nl.[Usluga]) like '%s%' 
				then cast (lower(s) as varchar (50))
				when lower(nl.[Usluga]) like '%e%' 
				then cast (lower(e) as varchar (50))
				when isnull(fe, '')!='' and lower(nl.[Usluga]) like '%ф%'
				then cast (lower(fe) as varchar (50))
				when isnull(t, '')!='' and lower(nl.[Usluga]) like '%ф%' 
				then cast (lower(t) as varchar (50))
				when isnull(e, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(e) as varchar (50))
				when isnull(s, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(s) as varchar (50))
				when isnull(t, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(t) as varchar (50))
				when lower(nl.[Usluga]) like '%o%' 
				then cast (lower(t) as varchar (50))
				when isnull(e, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(e) as varchar(50))
				when isnull(s, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(s) as varchar(50))
				when isnull(t, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(t) as varchar(50))
				when isnull(specob, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(specob) as varchar(50))
				else '' end)), '.',' '), '-', ' '), '…', ' '),'') as NumChAct,
				
				isnull(replace(replace(replace(replace(replace(rtrim(ltrim(case 
				when lower(nl.[Usluga]) like '%v%' 
				then cast (lower(p) as varchar (50))
				when lower(nl.[Usluga]) like '%t%' 
				then cast (lower(t) as varchar (50))                        
				when lower(nl.[Usluga]) like '%k%' 
				then cast (lower(specob) as varchar (50))
				when lower(nl.[Usluga]) like '%s%' 
				then cast (lower(s) as varchar (50))
				when lower(nl.[Usluga]) like '%e%' 
				then cast (lower(e) as varchar (50))
				when isnull(fe, '')!='' and lower(nl.[Usluga]) like '%ф%'
				then cast (lower(fe) as varchar (50))
				when isnull(t, '')!='' and lower(nl.[Usluga]) like '%ф%' 
				then cast (lower(t) as varchar (50))
				when isnull(e, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(e) as varchar (50))
				when isnull(s, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(s) as varchar (50))
				when isnull(t, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(t) as varchar (50))
				when lower(nl.[Usluga]) like '%o%' 
				then cast (lower(t) as varchar (50))
				when isnull(e, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(e) as varchar(50))
				when isnull(s, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(s) as varchar(50))
				when isnull(t, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(t) as varchar(50))
				when isnull(specob, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(specob) as varchar(50))
				else '' end)), 'x', ''), 'х', ''), '.',' '), '-', ' '), '…', ' '), '') as NumCh,
				
				specob		
           from List2Nav nl
           left join 
           (select * from openrowset
            ('SQLNCLI','DRIVER={SQL Server};SERVER=serv-sql;UID=ManItEx;PWD=cancer',
             'select  *  from Navigator_test.dbo.comflow_info')a)s
              on nl.NumML=s.NumML                                                 
           ) t
           WHERE t.NumML = @numML_insert;
 FETCH NEXT FROM my_Cursor into @numML_insert;
 END ;

CLOSE my_Cursor ;
DEALLOCATE my_Cursor;









GO



CREATE trigger [dbo].[OnUpdateList2Nav_to_ServiceML] on [Navigator_test_dev].[dbo].[List2Nav] after update
as
DECLARE @numML_insert int
DECLARE my_Cursor CURSOR FOR SELECT distinct NumML FROM INSERTED 
OPEN my_Cursor
FETCH NEXT FROM my_Cursor into @numML_insert
WHILE @@FETCH_STATUS = 0 and (@numML_insert >0)
BEGIN ;
  --PRINT 'Updating '+ cast(@numML_insert as varchar(32));
  if (update(specob)  or update(p) or update(e) or update(s) or update(v) or update(i) or update(fe) or update(t) or update(n))
  begin 
  update ServiceML 
   set NumServ=t.NumServ,
       SpecobA = (case when lower(isnull(t.specob, t.NumCh)) like '% %' 
                       then replace(replace(lower(left(replace(isnull(t.specob, t.NumCh), ',', ' '), charindex (' ', replace(isnull(t.specob, t.NumCh), ',', ' '))-1)),'x', ''), 'х', '')  
		               when isnull(t.specob, t.NumCh) like '%x%' 
		               then replace(replace(lower(left (isnull(t.specob, t.NumCh), charindex ('x', isnull(t.specob, t.NumCh)))),'x', ''), 'х', '')
		               when lower(isnull(t.specob, t.NumChAct)) like '%,%'
			           then lower(left(isnull(t.specob, t.NumCh), charindex (',', isnull(t.specob, t.NumCh))-1))
			           else cast (lower(isnull(t.specob, t.NumCh)) as  nvarchar (50)) end), 
       SpecobB = (case when lower(isnull(t.specob, t.NumCh)) like '% %' 
                       then  replace(replace(ltrim(rtrim(lower(right(replace(isnull(t.specob, t.NumCh), ',', ' '), len(ltrim(rtrim(replace(isnull(t.specob, t.NumCh), ',', ' ')))) - charindex (' ', replace(replace(ltrim(rtrim(isnull(t.specob, t.NumCh))),'x', ''), 'х', '')))))),'x', ''), 'х', '')
			           when isnull(t.specob, t.NumCh) like '%x%' 
			           then  replace(replace(ltrim(rtrim(lower(right(isnull(t.specob, t.NumCh), len(ltrim(rtrim(isnull(t.specob, t.NumCh))))- charindex ('x', ltrim(rtrim(isnull(t.specob, t.NumCh)))))))),'x', ''), 'х', '')
			           when lower(isnull(t.specob, t.NumCh)) like '%,%'
                       then lower(right(isnull(t.specob, t.NumCh), len(ltrim(rtrim(isnull(t.specob, t.NumCh)))) - charindex (',', ltrim(rtrim(isnull(t.specob, t.NumCh))))))
			           else null end),
       NumChA=(case when lower(isnull(t.specob, t.NumChAct)) like '% %' 
                    then lower(left(replace(isnull(t.specob, t.NumChAct), ',', ' '), charindex (' ', replace(isnull(t.specob, t.NumChAct), ',', ' '))-1))
		        	when lower(isnull(t.specob, t.NumChAct)) like '%x%' or  lower(isnull(t.specob, t.NumChAct)) like '%х%'
                    then lower(left(replace(isnull(t.specob, t.NumChAct), 'х', 'x'), charindex ('x', replace(isnull(t.specob, t.NumChAct), 'х', 'x'))))
                    when lower(isnull(t.specob, t.NumChAct)) like '%,%'
                    then lower(left(isnull(t.specob, t.NumChAct), charindex (',', isnull(t.specob, t.NumChAct))-1))
		        	else cast (lower(isnull(t.specob, t.NumChAct)) as  nvarchar (50)) end), 
       NumChB=(case when   lower(isnull(t.specob, t.NumChAct)) like '% %' 
                    then lower(right(replace(isnull(t.specob, t.NumChAct), ',', ' '), len(ltrim(rtrim(replace(isnull(t.specob, t.NumChAct), ',', ' ')))) - charindex (' ', replace(ltrim(rtrim(isnull(t.specob, t.NumChAct))), ',', ' '))))
			        when lower(isnull(t.specob, t.NumChAct)) like '%,%'
                    then lower(right(isnull(t.specob, t.NumChAct), len(ltrim(rtrim(isnull(t.specob, t.NumChAct)))) - charindex (',', ltrim(rtrim(isnull(t.specob, t.NumChAct))))))
		        	when (lower(isnull(t.specob, t.NumChAct)) like '%x%' or  lower(isnull(t.specob, t.NumChAct)) like '%х%') and len(ltrim(rtrim(isnull(t.specob, t.NumChAct))))!=charindex ('x', replace(isnull(t.specob, t.NumChAct), 'х', 'x'))
                    then lower(right(replace(isnull(t.specob, t.NumChAct), 'х', 'x'),  len(ltrim(rtrim(isnull(t.specob, t.NumChAct)))) - charindex ('x', replace(ltrim(rtrim(isnull(t.specob, t.NumChAct))), 'х', 'x')) ))
                    else null end)

       
	   from
       (
       select 
       s.Id as TheServiceId, 
       s.NavigatorId as NavigatorId, 
       nl.NumML as NumML, 
       lower(s.sCode) as sCode, 
                isnull(replace(replace(rtrim(ltrim(case 
				when lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' 
				then cast (isnull(lower(p), lower(i)) as varchar(50))
				when lower(nl.[Usluga]) not like '%b%' and lower(nl.[Usluga]) not like '%a%' and lower(nl.[Usluga]) not like '%p%' and 
				lower(nl.[Usluga]) not like '%i%' and lower(nl.[Usluga]) not like '%g%'  and lower(nl.[Usluga]) not like '%nф%' and lower(nl.[Usluga]) like '%e%' 
				then cast (lower(e) as varchar (50))
				when lower(nl.[Usluga]) not like '%b%' and lower(nl.[Usluga]) not like '%a%' and lower(nl.[Usluga]) not like '%p%'  and 
				lower(nl.[Usluga]) not like '%i%' and lower(nl.[Usluga]) not like '%g%'  and lower(nl.[Usluga]) not like '%nф%' and lower(nl.[Usluga]) like '%s%' 
				then cast (lower(s) as varchar (50))
				when lower(nl.[Usluga]) not like '%b%' and lower(nl.[Usluga]) not like '%a%' and lower(nl.[Usluga]) not like '%p%' and lower(nl.[Usluga]) not like '%g%' and 
				(lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(i) as varchar (50))
				when lower(nl.[Usluga]) like '%l%' 
				then cast (lower(l) as varchar (50))
				when lower(nl.[Usluga]) like '%v%' 
				then cast (lower(v) as varchar (50))
				when lower(nl.[Usluga]) like '%p%' 
				then cast (lower(p) as varchar (50))
				when lower(nl.[Usluga]) like '%t%' 
				then cast (lower(t) as varchar (50))                        
				when lower(nl.[Usluga]) like '%k%' 
				then cast (lower(specob) as varchar (50))
				when lower(nl.[Usluga]) like '%nф%' 
				then cast (lower(n) as varchar (50))
				when lower(nl.[Usluga]) like '%o%' 
				then cast (lower(t) as varchar (50))
				when lower(nl.[Usluga]) like '%s%' 
				then cast (lower(s) as varchar (50))
				when lower(nl.[Usluga]) like '%e%' 
				then cast (lower(e) as varchar (50))
				else 'not' end)), 'x', ''), 'х', ''), 'not') as NumServ,
				 
				isnull(replace(replace(replace(rtrim(ltrim(case 
				when lower(nl.[Usluga]) like '%v%' 
				then cast (lower(p) as varchar (50))
				when lower(nl.[Usluga]) like '%t%' 
				then cast (lower(t) as varchar (50))                        
				when lower(nl.[Usluga]) like '%k%' 
				then cast (lower(specob) as varchar (50))
				when lower(nl.[Usluga]) like '%s%' 
				then cast (lower(s) as varchar (50))
				when lower(nl.[Usluga]) like '%e%' 
				then cast (lower(e) as varchar (50))
				when isnull(fe, '')!='' and lower(nl.[Usluga]) like '%ф%'
				then cast (lower(fe) as varchar (50))
				when isnull(t, '')!='' and lower(nl.[Usluga]) like '%ф%' 
				then cast (lower(t) as varchar (50))
				when isnull(e, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(e) as varchar (50))
				when isnull(s, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(s) as varchar (50))
				when isnull(t, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(t) as varchar (50))
				when lower(nl.[Usluga]) like '%o%' 
				then cast (lower(t) as varchar (50))
				when isnull(e, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(e) as varchar(50))
				when isnull(s, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(s) as varchar(50))
				when isnull(t, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(t) as varchar(50))
				when isnull(specob, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(specob) as varchar(50))
				else '' end)), '.',' '), '-', ' '), '…', ' '),'') as NumChAct,
				
				isnull(replace(replace(replace(replace(replace(rtrim(ltrim(case 
				when lower(nl.[Usluga]) like '%v%' 
				then cast (lower(p) as varchar (50))
				when lower(nl.[Usluga]) like '%t%' 
				then cast (lower(t) as varchar (50))                        
				when lower(nl.[Usluga]) like '%k%' 
				then cast (lower(specob) as varchar (50))
				when lower(nl.[Usluga]) like '%s%' 
				then cast (lower(s) as varchar (50))
				when lower(nl.[Usluga]) like '%e%' 
				then cast (lower(e) as varchar (50))
				when isnull(fe, '')!='' and lower(nl.[Usluga]) like '%ф%'
				then cast (lower(fe) as varchar (50))
				when isnull(t, '')!='' and lower(nl.[Usluga]) like '%ф%' 
				then cast (lower(t) as varchar (50))
				when isnull(e, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(e) as varchar (50))
				when isnull(s, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(s) as varchar (50))
				when isnull(t, '')!='' and lower(nl.[Usluga]) like '%p%' 
				then cast (lower(t) as varchar (50))
				when lower(nl.[Usluga]) like '%o%' 
				then cast (lower(t) as varchar (50))
				when isnull(e, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(e) as varchar(50))
				when isnull(s, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(s) as varchar(50))
				when isnull(t, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(t) as varchar(50))
				when isnull(specob, '')!='' and (lower(nl.[Usluga]) like '%b%' or lower(nl.[Usluga]) like '%a%' or lower(nl.[Usluga]) like '%g%' or lower(nl.[Usluga]) like '%i%' or lower(nl.usluga) like '%h%')
				then cast (lower(specob) as varchar(50))
				else '' end)), 'x', ''), 'х', ''), '.',' '), '-', ' '), '…', ' '), '') as NumCh,
				specob		
           from inserted nl
           left join 
           (select * from openrowset
            ('SQLNCLI','DRIVER={SQL Server};SERVER=serv-sql;UID=ManItEx;PWD=cancer',
             'select  *  from Navigator_test.dbo.comflow_info')a)s
              on nl.NumML=s.NumML 
           ) t, ServiceML
           WHERE t.NumML=ServiceML.NumML and t.NumML = @numML_insert;
           end;
 FETCH NEXT FROM my_Cursor into @numML_insert;
 END ;

CLOSE my_Cursor ;
DEALLOCATE my_Cursor;










GO
CREATE TRIGGER [dbo].[InsertList2NavToWfl_Task]
   ON  [dbo].[List2Nav]
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	 DECLARE @NumMl INT;
	--INSERT INTO [Wfl_Tasks] 
	--(
	-- id, NumML, ParentId, DepartmentIdFrom, UserFrom, StartDate, TaskComment, DepartmentIdTo, TaskType, MainTaskForStep
	--)
select @NumMl= NumMl from inserted;
EXEC create_task @NumML,null, 'Comflow', 'from_Comflow_to_gpz', 'ГФЗ', 1
--EXEC create_task @NumML,null, 'Comflow', 'from_Comflow_to_goml', 'ГОМЛ', 1
--EXEC create_task @NumML,'Navigator_UDU_2008_2.mdb', '', 'from_goml_to_gpz', 'ОШУГПЗ', 1
END




GO
CREATE TRIGGER T_List2Nav_UTrig ON dbo.List2Nav FOR UPDATE AS
SET NOCOUNT ON
/* * КАСКАДНЫЕ ОБНОВЛЕНИЯ В 'Folomkin_Data' */
IF UPDATE(NumML)
    BEGIN
       UPDATE Folomkin_Data
       SET Folomkin_Data.NumML = inserted.NumML
       FROM Folomkin_Data, deleted, inserted
       WHERE deleted.NumML = Folomkin_Data.NumML
    END

/* * КАСКАДНЫЕ ОБНОВЛЕНИЯ В 'Gul_ULKS' */
IF UPDATE(NumML)
    BEGIN
       UPDATE Gul_ULKS
       SET Gul_ULKS.NumML = inserted.NumML
       FROM Gul_ULKS, deleted, inserted
       WHERE deleted.NumML = Gul_ULKS.NumML
    END

/* * КАСКАДНЫЕ ОБНОВЛЕНИЯ В 'History' */
IF UPDATE(NumML)
    BEGIN
       UPDATE History
       SET History.NumML = inserted.NumML
       FROM History, deleted, inserted
       WHERE deleted.NumML = History.NumML
    END

/* * КАСКАДНЫЕ ОБНОВЛЕНИЯ В 'IDO' */
IF UPDATE(NumML)
    BEGIN
       UPDATE IDO
       SET IDO.NumML = inserted.NumML
       FROM IDO, deleted, inserted
       WHERE deleted.NumML = IDO.NumML
    END

/* * КАСКАДНЫЕ ОБНОВЛЕНИЯ В 'Oborudovanie' */
IF UPDATE(NumML)
    BEGIN
       UPDATE Oborudovanie
       SET Oborudovanie.NumML = inserted.NumML
       FROM Oborudovanie, deleted, inserted
       WHERE deleted.NumML = Oborudovanie.NumML
    END

/* * КАСКАДНЫЕ ОБНОВЛЕНИЯ В 'ots' */
IF UPDATE(NumML)
    BEGIN
       UPDATE ots
       SET ots.numl = inserted.NumML
       FROM ots, deleted, inserted
       WHERE deleted.NumML = ots.numl
    END

/* * КАСКАДНЫЕ ОБНОВЛЕНИЯ В 'UKTv' */
IF UPDATE(NumML)
    BEGIN
       UPDATE UKTv
       SET UKTv.NumML = inserted.NumML
       FROM UKTv, deleted, inserted
       WHERE deleted.NumML = UKTv.NumML
    END

/* * КАСКАДНЫЕ ОБНОВЛЕНИЯ В 'ULKS' */
IF UPDATE(NumML)
    BEGIN
       UPDATE ULKS
       SET ULKS.NumML = inserted.NumML
       FROM ULKS, deleted, inserted
       WHERE deleted.NumML = ULKS.NumML
    END

/* * КАСКАДНЫЕ ОБНОВЛЕНИЯ В 'UPK' */
IF UPDATE(NumML)
    BEGIN
       UPDATE UPK
       SET UPK.NumML = inserted.NumML
       FROM UPK, deleted, inserted
       WHERE deleted.NumML = UPK.NumML
    END

/* * КАСКАДНЫЕ ОБНОВЛЕНИЯ В 'USHKm' */
IF UPDATE(NumML)
    BEGIN
       UPDATE USHKm
       SET USHKm.NumML = inserted.NumML
       FROM USHKm, deleted, inserted
       WHERE deleted.NumML = USHKm.NumML
    END

/* * КАСКАДНЫЕ ОБНОВЛЕНИЯ В 'USHKn' */
IF UPDATE(NumML)
    BEGIN
       UPDATE USHKn
       SET USHKn.NumML = inserted.NumML
       FROM USHKn, deleted, inserted
       WHERE deleted.NumML = USHKn.NumML
    END

/* * КАСКАДНЫЕ ОБНОВЛЕНИЯ В 'USP' */
IF UPDATE(NumML)
    BEGIN
       UPDATE USP
       SET USP.NumML = inserted.NumML
       FROM USP, deleted, inserted
       WHERE deleted.NumML = USP.NumML
    END

/* * КАСКАДНЫЕ ОБНОВЛЕНИЯ В 'UUK' */
IF UPDATE(NumML)
    BEGIN
       UPDATE UUK
       SET UUK.NumML = inserted.NumML
       FROM UUK, deleted, inserted
       WHERE deleted.NumML = UUK.NumML
    END

/* * КАСКАДНЫЕ ОБНОВЛЕНИЯ В 'Zapas' */
IF UPDATE(NumML)
    BEGIN
       UPDATE Zapas
       SET Zapas.NumML = inserted.NumML
       FROM Zapas, deleted, inserted
       WHERE deleted.NumML = Zapas.NumML
    END

GO
DISABLE TRIGGER [dbo].[T_List2Nav_UTrig]
    ON [dbo].[List2Nav];


GO
CREATE TRIGGER T_List2Nav_DTrig ON dbo.List2Nav FOR DELETE AS
SET NOCOUNT ON
/* * КАСКАДНЫЕ УДАЛЕНИЯ В 'Folomkin_Data' */
DELETE Folomkin_Data FROM deleted, Folomkin_Data WHERE deleted.NumML = Folomkin_Data.NumML

/* * КАСКАДНЫЕ УДАЛЕНИЯ В 'Gul_ULKS' */
DELETE Gul_ULKS FROM deleted, Gul_ULKS WHERE deleted.NumML = Gul_ULKS.NumML

/* * КАСКАДНЫЕ УДАЛЕНИЯ В 'History' */
DELETE History FROM deleted, History WHERE deleted.NumML = History.NumML

/* * КАСКАДНЫЕ УДАЛЕНИЯ В 'IDO' */
DELETE IDO FROM deleted, IDO WHERE deleted.NumML = IDO.NumML

/* * КАСКАДНЫЕ УДАЛЕНИЯ В 'Oborudovanie' */
DELETE Oborudovanie FROM deleted, Oborudovanie WHERE deleted.NumML = Oborudovanie.NumML

/* * КАСКАДНЫЕ УДАЛЕНИЯ В 'ots' */
DELETE ots FROM deleted, ots WHERE deleted.NumML = ots.numl

/* * КАСКАДНЫЕ УДАЛЕНИЯ В 'UKTv' */
DELETE UKTv FROM deleted, UKTv WHERE deleted.NumML = UKTv.NumML

/* * КАСКАДНЫЕ УДАЛЕНИЯ В 'ULKS' */
DELETE ULKS FROM deleted, ULKS WHERE deleted.NumML = ULKS.NumML

/* * КАСКАДНЫЕ УДАЛЕНИЯ В 'UPK' */
DELETE UPK FROM deleted, UPK WHERE deleted.NumML = UPK.NumML

/* * КАСКАДНЫЕ УДАЛЕНИЯ В 'USHKm' */
DELETE USHKm FROM deleted, USHKm WHERE deleted.NumML = USHKm.NumML

/* * КАСКАДНЫЕ УДАЛЕНИЯ В 'USHKn' */
DELETE USHKn FROM deleted, USHKn WHERE deleted.NumML = USHKn.NumML

/* * КАСКАДНЫЕ УДАЛЕНИЯ В 'USP' */
DELETE USP FROM deleted, USP WHERE deleted.NumML = USP.NumML

/* * КАСКАДНЫЕ УДАЛЕНИЯ В 'UUK' */
DELETE UUK FROM deleted, UUK WHERE deleted.NumML = UUK.NumML

/* * КАСКАДНЫЕ УДАЛЕНИЯ В 'Zapas' */
DELETE Zapas FROM deleted, Zapas WHERE deleted.NumML = Zapas.NumML

GO
DISABLE TRIGGER [dbo].[T_List2Nav_DTrig]
    ON [dbo].[List2Nav];


GO
CREATE TRIGGER [OnInsertList2Nav_MLHistory]
   ON  dbo.List2Nav 
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
		@NumML, 3, getdate(), getdate()
	)
END

GO
DISABLE TRIGGER [dbo].[OnInsertList2Nav_MLHistory]
    ON [dbo].[List2Nav];


GO
CREATE TRIGGER [OnUpdateList2Nav]
   ON  dbo.List2Nav
   AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	INSERT INTO List2NavLog 
	(
		sqlCommand,	NumMl,	Zakazhcik,	Usluga,	AdresA,	PrivA,	AdresB,	PrivB,	Otvetstv,
		USP,	E,	S,	V,	T,	P,	I,	R,	SpecOb,	Sdan,	Probl,	D_USP,	D_E,	D_S,
		D_V,	D_T,	D_P,	D_I,	D_R,	D_SpecOb,	utverzh,	Srochnost,	Prim,
		DUP,	CSVA,	CSVB,	DCSV,	UDA,	UDB,	DUD,	KNVA,	KNVB,	DKNV,	NMR,
		DNMR,	ULKS,	OSS,	Problema1,	IDO,	NRUSP,	NRUSP1,	D_USP1,	ForErr,	MestoNah,
		ProblML,	a,	b,	c,	e1,	f1,	klient,	Probl_Data,	NumSr,	G_A,	G_B,
		Data_Sost_A,	Data_Sost_B,	Data_Vypt_A,	Data_Vypt_B,	Ivanov_Gulka,	NRUPK,
		NRUPK1,	D_UPK,	D_UPK1,	data_UPK,	data_UPK1,	gul_erm,	res1,	res2,	ido1,
		ido2,	GG_ULKS,	GG_Data,	GG_Comment,	GG_IDO,	rowguid,
		signB1,	signB2,	signB3,	signI1,	signI2,	signI3,	signC1,	signC2,	signC3,	signD1,	signD2,	signD3,
		statusML,	taskFOConnection,	reportFOConnection,	N_eto_StA,	N_eto_StB
	)
select 'update' as sqlCommand,	NumMl,	Zakazhcik,	Usluga,	AdresA,	PrivA,	AdresB,	PrivB,	Otvetstv,
		USP,	E,	S,	V,	T,	P,	I,	R,	SpecOb,	Sdan,	Probl,	D_USP,	D_E,	D_S,
		D_V,	D_T,	D_P,	D_I,	D_R,	D_SpecOb,	utverzh,	Srochnost,	Prim,
		DUP,	CSVA,	CSVB,	DCSV,	UDA,	UDB,	DUD,	KNVA,	KNVB,	DKNV,	NMR,
		DNMR,	ULKS,	OSS,	Problema1,	IDO,	NRUSP,	NRUSP1,	D_USP1,	ForErr,	MestoNah,
		ProblML,	a,	b,	c,	e1,	f1,	klient,	Probl_Data,	NumSr,	G_A,	G_B,
		Data_Sost_A,	Data_Sost_B,	Data_Vypt_A,	Data_Vypt_B,	Ivanov_Gulka,	NRUPK,
		NRUPK1,	D_UPK,	D_UPK1,	data_UPK,	data_UPK1,	gul_erm,	res1,	res2,	ido1,
		ido2,	GG_ULKS,	GG_Data,	GG_Comment,	GG_IDO,	rowguid,
		signB1,	signB2,	signB3,	signI1,	signI2,	signI3,	signC1,	signC2,	signC3,	signD1,	signD2,	signD3,
		statusML,	taskFOConnection,	reportFOConnection,	N_eto_StA,	N_eto_StB
from inserted;
END

GO
DISABLE TRIGGER [dbo].[OnUpdateList2Nav]
    ON [dbo].[List2Nav];


GO
CREATE TRIGGER OnInsertList2Nav
   ON  dbo.List2Nav
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	INSERT INTO List2NavLog 
	(
		sqlCommand,	NumMl,	Zakazhcik,	Usluga,	AdresA,	PrivA,	AdresB,	PrivB,	Otvetstv,
		USP,	E,	S,	V,	T,	P,	I,	R,	SpecOb,	Sdan,	Probl,	D_USP,	D_E,	D_S,
		D_V,	D_T,	D_P,	D_I,	D_R,	D_SpecOb,	utverzh,	Srochnost,	Prim,
		DUP,	CSVA,	CSVB,	DCSV,	UDA,	UDB,	DUD,	KNVA,	KNVB,	DKNV,	NMR,
		DNMR,	ULKS,	OSS,	Problema1,	IDO,	NRUSP,	NRUSP1,	D_USP1,	ForErr,	MestoNah,
		ProblML,	a,	b,	c,	e1,	f1,	klient,	Probl_Data,	NumSr,	G_A,	G_B,
		Data_Sost_A,	Data_Sost_B,	Data_Vypt_A,	Data_Vypt_B,	Ivanov_Gulka,	NRUPK,
		NRUPK1,	D_UPK,	D_UPK1,	data_UPK,	data_UPK1,	gul_erm,	res1,	res2,	ido1,
		ido2,	GG_ULKS,	GG_Data,	GG_Comment,	GG_IDO,	rowguid,
		signB1,	signB2,	signB3,	signI1,	signI2,	signI3,	signC1,	signC2,	signC3,	signD1,	signD2,	signD3,
		statusML,	taskFOConnection,	reportFOConnection,	N_eto_StA,	N_eto_StB
	)
select 'insert' as sqlCommand,	NumMl,	Zakazhcik,	Usluga,	AdresA,	PrivA,	AdresB,	PrivB,	Otvetstv,
		USP,	E,	S,	V,	T,	P,	I,	R,	SpecOb,	Sdan,	Probl,	D_USP,	D_E,	D_S,
		D_V,	D_T,	D_P,	D_I,	D_R,	D_SpecOb,	utverzh,	Srochnost,	Prim,
		DUP,	CSVA,	CSVB,	DCSV,	UDA,	UDB,	DUD,	KNVA,	KNVB,	DKNV,	NMR,
		DNMR,	ULKS,	OSS,	Problema1,	IDO,	NRUSP,	NRUSP1,	D_USP1,	ForErr,	MestoNah,
		ProblML,	a,	b,	c,	e1,	f1,	klient,	Probl_Data,	NumSr,	G_A,	G_B,
		Data_Sost_A,	Data_Sost_B,	Data_Vypt_A,	Data_Vypt_B,	Ivanov_Gulka,	NRUPK,
		NRUPK1,	D_UPK,	D_UPK1,	data_UPK,	data_UPK1,	gul_erm,	res1,	res2,	ido1,
		ido2,	GG_ULKS,	GG_Data,	GG_Comment,	GG_IDO,	rowguid,
		signB1,	signB2,	signB3,	signI1,	signI2,	signI3,	signC1,	signC2,	signC3,	signD1,	signD2,	signD3,
		statusML,	taskFOConnection,	reportFOConnection,	N_eto_StA,	N_eto_StB from inserted;
END

GO
DISABLE TRIGGER [dbo].[OnInsertList2Nav]
    ON [dbo].[List2Nav];


GO
CREATE TRIGGER dbo.onDeleteList2Nav
   ON  dbo.List2Nav
   AFTER DELETE
AS 
BEGIN
	SET NOCOUNT ON;
	INSERT INTO List2NavLog 
	(
		sqlCommand,	NumMl,	Zakazhcik,	Usluga,	AdresA,	PrivA,	AdresB,	PrivB,	Otvetstv,
		USP,	E,	S,	V,	T,	P,	I,	R,	SpecOb,	Sdan,	Probl,	D_USP,	D_E,	D_S,
		D_V,	D_T,	D_P,	D_I,	D_R,	D_SpecOb,	utverzh,	Srochnost,	Prim,
		DUP,	CSVA,	CSVB,	DCSV,	UDA,	UDB,	DUD,	KNVA,	KNVB,	DKNV,	NMR,
		DNMR,	ULKS,	OSS,	Problema1,	IDO,	NRUSP,	NRUSP1,	D_USP1,	ForErr,	MestoNah,
		ProblML,	a,	b,	c,	e1,	f1,	klient,	Probl_Data,	NumSr,	G_A,	G_B,
		Data_Sost_A,	Data_Sost_B,	Data_Vypt_A,	Data_Vypt_B,	Ivanov_Gulka,	NRUPK,
		NRUPK1,	D_UPK,	D_UPK1,	data_UPK,	data_UPK1,	gul_erm,	res1,	res2,	ido1,
		ido2,	GG_ULKS,	GG_Data,	GG_Comment,	GG_IDO,	rowguid,
		signB1,	signB2,	signB3,	signI1,	signI2,	signI3,	signC1,	signC2,	signC3,	signD1,	signD2,	signD3,
		statusML,	taskFOConnection,	reportFOConnection,	N_eto_StA,	N_eto_StB
	)
select 'delete' as sqlCommand, 	NumMl,	Zakazhcik,	Usluga,	AdresA,	PrivA,	AdresB,	PrivB,	Otvetstv,
		USP,	E,	S,	V,	T,	P,	I,	R,	SpecOb,	Sdan,	Probl,	D_USP,	D_E,	D_S,
		D_V,	D_T,	D_P,	D_I,	D_R,	D_SpecOb,	utverzh,	Srochnost,	Prim,
		DUP,	CSVA,	CSVB,	DCSV,	UDA,	UDB,	DUD,	KNVA,	KNVB,	DKNV,	NMR,
		DNMR,	ULKS,	OSS,	Problema1,	IDO,	NRUSP,	NRUSP1,	D_USP1,	ForErr,	MestoNah,
		ProblML,	a,	b,	c,	e1,	f1,	klient,	Probl_Data,	NumSr,	G_A,	G_B,
		Data_Sost_A,	Data_Sost_B,	Data_Vypt_A,	Data_Vypt_B,	Ivanov_Gulka,	NRUPK,
		NRUPK1,	D_UPK,	D_UPK1,	data_UPK,	data_UPK1,	gul_erm,	res1,	res2,	ido1,
		ido2,	GG_ULKS,	GG_Data,	GG_Comment,	GG_IDO,	rowguid,
		signB1,	signB2,	signB3,	signI1,	signI2,	signI3,	signC1,	signC2,	signC3,	signD1,	signD2,	signD3,
		statusML,	taskFOConnection,	reportFOConnection,	N_eto_StA,	N_eto_StB
from deleted;

END

GO
DISABLE TRIGGER [dbo].[onDeleteList2Nav]
    ON [dbo].[List2Nav];

