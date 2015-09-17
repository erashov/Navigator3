CREATE TABLE [dbo].[ML_EquipResponsible] (
    [NumML]       INT            NOT NULL,
    [UnitId]      INT            NOT NULL,
    [Responsible] NVARCHAR (255) NULL,
    [Kanal_priv]  NVARCHAR (255) NULL,
    [Data_poluch] NVARCHAR (23)  NULL,
    [Data_vypoln] NVARCHAR (23)  NULL,
    PRIMARY KEY NONCLUSTERED ([NumML] ASC, [UnitId] ASC)
);

