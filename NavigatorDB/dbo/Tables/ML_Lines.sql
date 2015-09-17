CREATE TABLE [dbo].[ML_Lines] (
    [NumMl]          INT            NOT NULL,
    [Line_type]      NVARCHAR (25)  NOT NULL,
    [Adres_ULSS]     NVARCHAR (255) NULL,
    [Markirovka]     NVARCHAR (100) NULL,
    [Uzlovaya_stanc] NVARCHAR (255) NULL,
    [BindingSite]    NVARCHAR (255) NULL,
    [TransitNode]    NVARCHAR (255) NULL,
    [Prim]           NVARCHAR (500) NULL,
    PRIMARY KEY NONCLUSTERED ([NumMl] ASC, [Line_type] ASC)
);

