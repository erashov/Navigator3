CREATE TABLE [dbo].[Список пре_услуг] (
    [Pre_Usluga] NVARCHAR (50)    NULL,
    [rowguid]    UNIQUEIDENTIFIER CONSTRAINT [DF__Список пр__rowgu__38EE7070] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_206623779]
    ON [dbo].[Список пре_услуг]([rowguid] ASC);

