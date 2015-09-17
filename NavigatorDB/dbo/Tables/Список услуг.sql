CREATE TABLE [dbo].[Список услуг] (
    [Usluga]  NVARCHAR (50)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Список ус__rowgu__0B27A5C0] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_158623608]
    ON [dbo].[Список услуг]([rowguid] ASC);

