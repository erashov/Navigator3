CREATE TABLE [dbo].[Spisok_Nachal] (
    [n]       NVARCHAR (200)   NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Spisok_Na__rowgu__035179CE] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1490104349]
    ON [dbo].[Spisok_Nachal]([rowguid] ASC);

