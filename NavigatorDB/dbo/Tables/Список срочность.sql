CREATE TABLE [dbo].[Список срочность] (
    [Srochnost] NVARCHAR (50)    NULL,
    [rowguid]   UNIQUEIDENTIFIER CONSTRAINT [DF__Список ср__rowgu__27C3E46E] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_2066106401]
    ON [dbo].[Список срочность]([rowguid] ASC);

