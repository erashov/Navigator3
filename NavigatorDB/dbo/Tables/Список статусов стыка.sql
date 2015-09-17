CREATE TABLE [dbo].[Список статусов стыка] (
    [Status styk] NVARCHAR (50)    NULL,
    [rowguid]     UNIQUEIDENTIFIER CONSTRAINT [DF__Список ст__rowgu__1C5231C2] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_14623095]
    ON [dbo].[Список статусов стыка]([rowguid] ASC);

