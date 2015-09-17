CREATE TABLE [dbo].[USHKn] (
    [NumML]             INT              CONSTRAINT [DF__USHKn__NumML__02084FDA] DEFAULT (0) NULL,
    [Gulka]             BIT              CONSTRAINT [DF__USHKn__Gulka__02FC7413] DEFAULT (0) NULL,
    [Gulka_Data]        DATETIME         NULL,
    [Text_Zadanie]      NVARCHAR (250)   NULL,
    [Gulka_Data_Otchet] DATETIME         NULL,
    [Text_Otchet]       NVARCHAR (250)   NULL,
    [Problema]          NVARCHAR (250)   NULL,
    [Primechanie]       NVARCHAR (250)   NULL,
    [Nomer_Kanala]      NVARCHAR (50)    NULL,
    [rowguid]           UNIQUEIDENTIFIER CONSTRAINT [DF__USHKn__rowguid__0CA5D9DE] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_18099105]
    ON [dbo].[USHKn]([rowguid] ASC);

