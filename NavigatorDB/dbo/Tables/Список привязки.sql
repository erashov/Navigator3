CREATE TABLE [dbo].[Список привязки] (
    [Priv]    NVARCHAR (50)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Список пр__rowgu__3335971A] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_1906105831]
    ON [dbo].[Список привязки]([rowguid] ASC);

