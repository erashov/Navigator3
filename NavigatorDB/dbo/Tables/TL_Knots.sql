CREATE TABLE [dbo].[TL_Knots] (
    [id]                 INT            IDENTITY (1, 1) NOT NULL,
    [NumMl]              INT            NOT NULL,
    [Okonchanie]         NVARCHAR (25)  NOT NULL,
    [Uzel_priv]          NVARCHAR (255) NULL,
    [Skorost_potoka]     NVARCHAR (100) NULL,
    [Uzel_naznach]       NVARCHAR (255) NULL,
    [Styk_porta]         NVARCHAR (255) NULL,
    [NumKanala]          NVARCHAR (100) NULL,
    [Abonent_Okonchanie] NVARCHAR (255) NULL,
    [Marshrutizator]     NVARCHAR (100) NULL,
    [Transp_Uzel]        NVARCHAR (255) NULL,
    [Oborud_Tel]         NVARCHAR (MAX) NULL,
    [Uzel_ATS]           NVARCHAR (255) NULL,
    [CodeBC]             NVARCHAR (128) NULL,
    [NumUslQ]            NVARCHAR (255) NULL,
    [NumVlan]            NVARCHAR (128) NULL,
    [OnAccessNode]       NVARCHAR (128) NULL,
    [Prim]               NVARCHAR (255) NULL
);

