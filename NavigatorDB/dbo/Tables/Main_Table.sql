CREATE TABLE [dbo].[Main_Table] (
    [NomerKanala]      NVARCHAR (50)    NOT NULL,
    [NoML_Vkl]         NVARCHAR (50)    NULL,
    [Zakazchik]        NVARCHAR (255)   NULL,
    [AdresA]           NVARCHAR (255)   NULL,
    [AdresB]           NVARCHAR (255)   NULL,
    [D_puska]          NVARCHAR (50)    NULL,
    [D_otkl]           NVARCHAR (50)    NULL,
    [NoML_Vykl]        NVARCHAR (25)    NULL,
    [PrivA]            NVARCHAR (255)   NULL,
    [PrivB]            NVARCHAR (255)   NULL,
    [NameLink]         NVARCHAR (50)    NULL,
    [NoKanE]           INT              NULL,
    [Skorost]          REAL             CONSTRAINT [DF__Main_Tabl__Skoro__0BC6C43E] DEFAULT ((0)) NULL,
    [Prim]             NVARCHAR (255)   NULL,
    [NoKanS]           INT              NULL,
    [NoKanF]           INT              NULL,
    [NoKanT]           INT              NULL,
    [NoKanY]           INT              NULL,
    [NoKanK]           INT              NULL,
    [Vid]              NVARCHAR (150)   NULL,
    [Kont1]            NTEXT            NULL,
    [Kont2]            NTEXT            NULL,
    [Port]             NVARCHAR (50)    NULL,
    [Status_Kanala]    NVARCHAR (50)    NULL,
    [Status_zakaz]     NVARCHAR (50)    NULL,
    [spl1]             NVARCHAR (255)   NULL,
    [spl2]             NVARCHAR (255)   NULL,
    [Astahov1]         NVARCHAR (250)   NULL,
    [Astahov2]         NVARCHAR (250)   NULL,
    [res1]             NVARCHAR (250)   NULL,
    [res2]             NVARCHAR (250)   NULL,
    [rowguid]          UNIQUEIDENTIFIER CONSTRAINT [DF__Main_Tabl__rowgu__536D5C82] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [NumberML]         INT              NULL,
    [timeSlotQuantity] INT              NULL,
    [signB1]           BIT              NULL,
    [signB2]           BIT              NULL,
    [signB3]           BIT              NULL,
    [signI1]           INT              NULL,
    [signI2]           INT              NULL,
    [signI3]           INT              NULL,
    [signC1]           CHAR (10)        NULL,
    [signC2]           CHAR (10)        NULL,
    [signC3]           CHAR (10)        NULL,
    [signD1]           DATETIME         NULL,
    [signD2]           DATETIME         NULL,
    [signD3]           DATETIME         NULL,
    [NoKanN]           INT              NULL,
    [NoKanL]           INT              NULL,
    [NoKanFe]          INT              NULL,
    [timestamp]        ROWVERSION       NOT NULL,
    [AdresA_Old]       NVARCHAR (255)   NULL,
    [AdresB_Old]       NVARCHAR (255)   NULL,
    [ChangeAddr]       NVARCHAR (128)   NULL,
    [NoKanR]           INT              NULL,
    [BridgeId]         INT              NULL,
    [Marking]          NVARCHAR (255)   NULL,
    [BridgeId_B]       INT              NULL,
    [Marking_B]        NVARCHAR (255)   NULL,
    [PortVlan]         NVARCHAR (255)   NULL,
    [Vlan]             NVARCHAR (255)   NULL,
    [spec_project]     NVARCHAR (50)    NULL,
    CONSTRAINT [aaaaaMain_Table_PK] PRIMARY KEY NONCLUSTERED ([NomerKanala] ASC)
);


GO
CREATE CLUSTERED INDEX [_dta_index_Main_Table_c_7_187147712__K12D]
    ON [dbo].[Main_Table]([NoKanE] DESC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_181575685]
    ON [dbo].[Main_Table]([rowguid] ASC);


GO
CREATE NONCLUSTERED INDEX [<AddrAB>]
    ON [dbo].[Main_Table]([NomerKanala] ASC)
    INCLUDE([AdresA], [AdresB]);


GO
CREATE TRIGGER [T_Main_Table_UTrig] ON dbo.Main_Table FOR UPDATE AS
SET NOCOUNT ON
/* * КАСКАДНЫЕ ОБНОВЛЕНИЯ В 'Arhiv' */
IF UPDATE(NomerKanala)
    BEGIN
       UPDATE Arhiv
       SET Arhiv.NomerKanala = inserted.NomerKanala
       FROM Arhiv, deleted, inserted
       WHERE deleted.NomerKanala = Arhiv.NomerKanala
    END

/* * КАСКАДНЫЕ ОБНОВЛЕНИЯ В 'GGG' */
IF UPDATE(NomerKanala)
    BEGIN
       UPDATE GGG
       SET GGG.Kanala = inserted.NomerKanala
       FROM GGG, deleted, inserted
       WHERE deleted.NomerKanala = GGG.Kanala
    END
SET NOCOUNT OFF

GO
DISABLE TRIGGER [dbo].[T_Main_Table_UTrig]
    ON [dbo].[Main_Table];


GO
CREATE TRIGGER [dbo].[T_Main_Table_DTrig] ON [dbo].[Main_Table] FOR DELETE AS
SET NOCOUNT ON
/* * КАСКАДНЫЕ УДАЛЕНИЯ В 'Arhiv' */
DELETE Arhiv FROM deleted, Arhiv WHERE deleted.NomerKanala = Arhiv.NomerKanala

/* * КАСКАДНЫЕ УДАЛЕНИЯ В 'GGG' */
--DELETE GGG FROM deleted, GGG WHERE deleted.NomerKanala = GGG.Kanala
SET NOCOUNT OFF

GO
DISABLE TRIGGER [dbo].[T_Main_Table_DTrig]
    ON [dbo].[Main_Table];

