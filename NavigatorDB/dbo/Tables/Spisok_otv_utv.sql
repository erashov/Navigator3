CREATE TABLE [dbo].[Spisok_otv_utv] (
    [Sp_otv]  NVARCHAR (250)   NOT NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Spisok_ot__rowgu__7D98A078] DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    CONSTRAINT [aaaaaSpisok_otv_utv_PK] PRIMARY KEY NONCLUSTERED ([Sp_otv] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1538104520]
    ON [dbo].[Spisok_otv_utv]([rowguid] ASC);

