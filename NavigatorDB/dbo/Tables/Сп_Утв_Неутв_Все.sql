CREATE TABLE [dbo].[Сп_Утв_Неутв_Все] (
    [utv]     NVARCHAR (50)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Сп_Утв_Не__rowgu__3EA749C6] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1698105090]
    ON [dbo].[Сп_Утв_Неутв_Все]([rowguid] ASC);

