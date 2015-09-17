CREATE TABLE [dbo].[ML_EquipType] (
    [ID]          INT             IDENTITY (1, 1) NOT NULL,
    [NumML]       INT             NOT NULL,
    [UnitId]      INT             NOT NULL,
    [Okonchanie]  NVARCHAR (25)   NULL,
    [Equipment]   NVARCHAR (255)  NULL,
    [SerialNum]   NVARCHAR (255)  NULL,
    [Kol_vo]      INT             NULL,
    [Cost]        DECIMAL (19, 2) NULL,
    [CostOne]     DECIMAL (19, 2) NULL,
    [Designation] NVARCHAR (500)  NULL,
    [State]       NVARCHAR (50)   NULL,
    [SetupId]     INT             NULL,
    [SetupValue]  NVARCHAR (255)  NULL,
    CONSTRAINT [PK_ML_EquipType] PRIMARY KEY CLUSTERED ([ID] ASC)
);

