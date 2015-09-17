CREATE TABLE [dbo].[ML_Notices] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [NumML]       INT            NOT NULL,
    [NumMLOV]     NVARCHAR (50)  NULL,
    [UzelOV]      NVARCHAR (50)  NULL,
    [NumOV]       NVARCHAR (50)  NULL,
    [AdresOV]     NVARCHAR (255) NULL,
    [ZakazchikOV] NVARCHAR (255) NULL,
    [NumUsl]      NVARCHAR (100) NULL,
    CONSTRAINT [PK_ML_Notices] PRIMARY KEY CLUSTERED ([ID] ASC)
);

