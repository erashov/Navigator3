﻿CREATE TABLE [dbo].[NS] (
    [NomerKanala] NVARCHAR (50)    NOT NULL,
    [NS]          NVARCHAR (50)    NULL,
    [rowguid]     UNIQUEIDENTIFIER CONSTRAINT [DF__NS__rowguid__47FBA9D6] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    CONSTRAINT [aaaaaNS_PK] PRIMARY KEY NONCLUSTERED ([NomerKanala] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_117575457]
    ON [dbo].[NS]([rowguid] ASC);
