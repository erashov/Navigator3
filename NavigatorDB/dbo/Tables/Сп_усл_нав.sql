CREATE TABLE [dbo].[Сп_усл_нав] (
    [Usluga]  NVARCHAR (50)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Сп_усл_на__rowgu__4460231C] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1650104919]
    ON [dbo].[Сп_усл_нав]([rowguid] ASC);

