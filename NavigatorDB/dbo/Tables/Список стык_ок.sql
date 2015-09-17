CREATE TABLE [dbo].[Список стык_ок] (
    [Styk]    NVARCHAR (50)    NULL,
    [rowguid] UNIQUEIDENTIFIER CONSTRAINT [DF__Список ст__rowgu__1699586C] DEFAULT (newid()) ROWGUIDCOL NOT NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [index_62623266]
    ON [dbo].[Список стык_ок]([rowguid] ASC);

